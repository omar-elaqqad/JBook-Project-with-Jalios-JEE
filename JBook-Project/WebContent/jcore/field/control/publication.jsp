<%@page import="com.jalios.jcms.taglib.settings.helper.PublicationControlHelper"%>
<%@page import="com.jalios.jcms.upload.UploadManager"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
PublicationControlHelper pch = new PublicationControlHelper(loggedMember, userLang, workspace, request);
if(pch.isFileInputAdded()) {
  %><jalios:buffer name="extraControlInput">
    <jalios:control settings='<%= pch.getFileSettings() %>' />

    <% if((cptField + 1) >= cptMax) { // Add input hidden to prevent problem when we remove files %>
    <% setIncludeString("FIELD_APPEND", "<input type=\"hidden\" name=\"" + HttpUtil.encodeForHTMLAttribute(pch.getFieldName()) + "\" value=\"\" class=\"form-control-hidden\" />"); %>
    <% } %>
  </jalios:buffer><%
  pch.includeLocalObject("CONTROL_APPEND", extraControlInput);
}
if(pch.isDropdownAdded()) {
  boolean isDisabled = pch.isFieldDisabled();
  String disabledBtn = isDisabled ? " disabled='disabled'" : "";
  String disabledLnk = isDisabled ? " disabled" : "";
  %><jalios:buffer name="dropdownButton">
    <button type="button" title="<%= encodeForHTMLAttribute(glp("widget.publication.open-menu")) %>" class='btn btn-default btn-ctxmenu dropdown-toggle' data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"<%= disabledBtn %>>
      <jalios:icon src="chevron-down" alt='<%= glp("widget.publication.open-menu") %>' />
    </button>
    <ul class='<%= "dropdown-menu" + (pch.isMenuRight() ? " dropdown-menu-right" : "") %>'>
      <%= pch.getListItems() %><%-- Display the item list to add a new Publication or edit the current Publication --%>
    </ul>
  </jalios:buffer><%
  includeLocalObject("APPEND_BTN_ACTION", dropdownButton);
  // addOption(BasicSettings.HIDE_CLEAR_BUTTON, Util.notEmpty(pub));
  addOption(BasicSettings.CLEAR_BUTTON, false);
}
%><%@ include file="/jcore/field/control/doData.jspf" %>