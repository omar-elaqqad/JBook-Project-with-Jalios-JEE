<%@ include file="/jcore/doInitPage.jspf" %><jalios:include target="TOOLTIP_CARD" targetContext="empty" /><%
  
  if (!channel.getBooleanProperty(UIComponentsConstants.TTCARD_ENABLED_PROP, false)){
    return;
  }
  
  String ttId = getAlphaNumParameter("ttId", null);
  if (ttId == null) {
    return;
  }
  
  String[] ttContext = Util.split(getUntrustedStringParameter("ttContext", ""), "|");
  // Custom tooltip card
  String ttTemplate = "";
  
  if (Arrays.asList(ttContext).contains("tt-lock")) {
    ttTemplate = "jcore/tooltip/ttPublicationLock.jsp";
  } else {
    ttTemplate = TTCardManager.getInstance().getTTCardCustomTemplate(ttId);
  }
  
  // Working with data
  Data data = channel.getData(ttId);  
  if (data != null && Util.isEmpty(ttTemplate)){
    request.setAttribute("ttData",data);
    ttTemplate = TTCardManager.getInstance().getTTCardTemplate(data);
  }
  
  // Exit if empty
  if (Util.isEmpty(ttTemplate)){
    return;
  }
  
  // Include template
%><jsp:include page='<%= "/"+ttTemplate %>' flush="true" />
<%@ include file='/jcore/doAjaxFooter.jspf' %>