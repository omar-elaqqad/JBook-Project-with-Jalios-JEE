<%--
  Alert migration: set Alert's workspace based on the Alert's Data.
 --%><%@page import="com.jalios.jcms.alert.*"%><%
%><%@page import="java.lang.reflect.Field"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/doEmptyHeader.jspf" %><%

if (!isLogged || !loggedMember.isAdmin()) {
  sendForbidden(request, response);
  return;
}

logger.debug("updateAlert : get dataset ");
TreeSet<Alert> alertSet = channel.getDataSet(Alert.class);
logger.info("updateAlert : dataset size :"+alertSet.size());

int i=0;
int k=0;

Map<String, Object> contextMap = new HashMap<String, Object>();
contextMap.put(DataController.CTXT_IS_BATCH_OPERATION, Boolean.TRUE);

Field wsField = Alert.class.getDeclaredField("workspace");
boolean fieldAccess = wsField.isAccessible();
if (!fieldAccess) {
  logger.debug("Not accessible");
  wsField.setAccessible(true);
}
logger.debug("accessible? " + wsField.isAccessible());

for (Alert alert : alertSet) {
  k++;
  if(logger.isDebugEnabled()) { logger.debug("#"+k+" - alert "+alert.getId()+" - data "+ alert.getDataId()); }
  if (k % 1000 == 0) {
     logger.info("#"+k+" - "+i+" updated");
   }

  Data data = alert.getData();
  boolean isPub = data instanceof Publication;
  if (!isPub) {
    if(logger.isDebugEnabled()) { logger.debug("#"+k+" - not a pub : "+JcmsUtil.dataToString(data)); }
    continue;
  }
  Publication targetPub = (Publication)data;

  Object realWS = wsField.get(alert);
  if (realWS != null) {
    logger.debug("#"+k+" real workspace already set : " + realWS);
    continue;
  } else {
    logger.debug("#"+k+" real workspace not set");    
  }
  
  if (targetPub.getWorkspace() == null) {
    //shouldn't occur, default workspace should be provided at least
    logger.warn("#"+k+" targetPub workspace not set too (?!)");
  } else {
    if(logger.isDebugEnabled()) { logger.debug("#"+k+" targetPub workspace "+targetPub.getWorkspace().getId()); }
    i++;
    Alert update = (Alert) alert.getUpdateInstance();
    // Set the workspace
    update.setWorkspaceId(targetPub.getWorkspace().getId());
    ControllerStatus status = update.checkAndPerformUpdate(loggedMember, contextMap);
    if (status.isOK()) {
      logger.info("" + i + ". FIX alert ws for ("+alert.getId()+")");
    } else {
      logger.warn("" + i + ". Could not update alert's ws for ("+alert.getId()+"): " + status.getMessage(userLang));
    }
    if (i % 100 == 0) {
      logger.info("#"+k+" - commit - "+i+" updated");
      HibernateUtil.commitTransaction();
      HibernateUtil.beginTransaction();
    }
  }
}//end for
if (i % 100 != 0) {
  logger.info("#"+k+" - commit - "+i+" updated");
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}
if (!fieldAccess) {
  logger.debug("Revert field to Not accessible");
  wsField.setAccessible(false);
}
logger.info("updateAlert : "+i+" Alerts updated");
%>updated <%= i %> alerts on <%= alertSet.size() %>.
<%@ include file='/jcore/doEmptyFooter.jspf' %>