<%--
  Recommendation migration: set Recommendation's workspace based on the Recommended Data.
 --%><%@page import="com.jalios.jcms.recommendation.Recommendation"%><%--
 --%><%@page import="com.jalios.jcms.alert.*"%><%
%><%@page import="java.lang.reflect.Field"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/doEmptyHeader.jspf" %><%

if (!isLogged || !loggedMember.isAdmin()) {
  sendForbidden(request, response);
  return;
}

logger.debug("updateReco : get dataset ");
TreeSet<Recommendation> dataSet = channel.getDataSet(Recommendation.class);
logger.info("updateReco : dataset size :"+dataSet.size());

int i=0;
int k=0;

Map<String, Object> contextMap = new HashMap<String, Object>();
contextMap.put(DataController.CTXT_IS_BATCH_OPERATION, Boolean.TRUE);

Field wsField = Recommendation.class.getDeclaredField("workspace");
boolean fieldAccess = wsField.isAccessible();
if (!fieldAccess) {
  logger.debug("Not accessible");
  wsField.setAccessible(true);
}
logger.debug("accessible? " + wsField.isAccessible());

for (Recommendation reco : dataSet) {
  k++;
  if(logger.isDebugEnabled()) { logger.debug("#"+k+" - reco "+reco.getId()+" - data "+ reco.getDataId()); }
  if (k % 1000 == 0) {
     logger.info("#"+k+" - "+i+" updated");
   }

  Data data = reco.getData();
  boolean isPub = data instanceof Publication;
  if (!isPub) {
    if(logger.isDebugEnabled()) { logger.debug("#"+k+" - not a pub : "+JcmsUtil.dataToString(data)); }
    continue;
  }
  Publication targetPub = (Publication)data;

  Object realWS = wsField.get(reco);
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
    Recommendation update = (Recommendation) reco.getUpdateInstance();
    // Set the workspace
    update.setWorkspaceId(targetPub.getWorkspace().getId());
    ControllerStatus status = update.checkAndPerformUpdate(loggedMember, contextMap);
    if (status.isOK()) {
      logger.info("" + i + ". FIX recommendation ws for ("+reco.getId()+")");
    } else {
      logger.warn("" + i + ". Could not update recommendation's ws for ("+reco.getId()+"): " + status.getMessage(userLang));
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
logger.info("updateReco : "+i+" Recommendation updated");
%>updated <%= i %> recommendations on <%= dataSet.size() %>.
<%@ include file='/jcore/doEmptyFooter.jspf' %>