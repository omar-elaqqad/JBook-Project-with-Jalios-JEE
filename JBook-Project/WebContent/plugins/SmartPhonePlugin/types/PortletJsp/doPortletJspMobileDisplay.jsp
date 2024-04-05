<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><% 

PortletJsp box = (PortletJsp) portlet; %><% 
{
  String  jspUri       = "/" + box.getJsp();
  boolean jspNull      = box.getJsp() == null;
  boolean jspNotExists = Util.toBoolean(channel.getProperty("channel.dev-mode.enabled"), true) && !(new File(channel.getRealPath(jspUri)).exists());
  
  if (jspNull || jspNotExists) {
    String errorStr = "No JSP found (Path: "+(box.getJsp()!=null ? channel.getRealPath(jspUri) : "null")+" )";
    logger.warn(errorStr);
    out.println(glp("ui.com.msg.portlet.exception", box.getId(), errorStr));
    return;
  }
  try {
%><jsp:include page='<%= jspUri %>' flush='true'></jsp:include><% 
  }
  catch (Throwable ex) {
    PortalManager.printPortletException(out, ex, box, logger);
  } 
}
%>

