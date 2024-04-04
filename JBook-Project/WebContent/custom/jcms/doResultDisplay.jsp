<%--
  @Summary: Common result display page
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  // Improvement JCMS-2476 : Take into account the "jcms.resource.default-template.query" resource if it is specified
  String currentTemplateUsage = jcmsContext.getTemplateUsage();
  String defaultQueryTemplate = channel.getProperty("jcms.resource.default-template.query", "");
  if (TypeTemplateEntry.USAGE_DISPLAY_QUERY.equals(currentTemplateUsage) &&
      Util.notEmpty(defaultQueryTemplate) && !"custom/jcms/doResultDisplay.jsp".equals(defaultQueryTemplate)) {
    %><jsp:include page='<%= "/" + defaultQueryTemplate %>' flush="true" /><%
    return;
  }

  Publication obj = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  if (obj == null){
    obj = (Publication) request.getAttribute("PortalElement");
  }
%>
<jalios:cardData data="<%= obj %>" template="result-display" />