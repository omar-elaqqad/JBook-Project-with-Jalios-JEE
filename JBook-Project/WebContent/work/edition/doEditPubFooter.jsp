<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@page import="com.jalios.jcms.handler.EditPublicationHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

EditPublicationHandler formHandler = (EditPublicationHandler) request.getAttribute("formHandler");
if (Util.toBoolean(request.getAttribute("jcms.edit.footer.display"),true)) {

Publication pub           = formHandler.getPublication();
String typeLabel          = formHandler.getTypeLabel();
boolean popupEdition      = formHandler.isPopupEdition();
boolean partialEdition    = formHandler.isPartialFieldEdition();
boolean contentTabOnly    = formHandler.isContentTabOnly();
%>
  <jalios:include target="EDIT_PUB_MAINTAB_FOOTER" />
  </div><%-- End 'tab-single-pane' OR 'tab-page' from doEditPubHeader.jspf --%>
<% if (!popupEdition || !(partialEdition || contentTabOnly)) { %> 
  <%-- COMMON PUBLICATION ATTRIBUTES ----------------------------------------- --%> 
  <%@ include file='/work/doEditCommonPubAttribute.jspf' %>
  
  <%-- *** PLUGINS ***************************** --%>
  <jalios:include target="EDIT_PUB_FOOTER" />
</div><%-- End 'tab-pane[id="mainTab"]' from doEditPubHeader.jspf --%>
<% } else { %>
  <jalios:foreach collection='<%= formHandler.getHiddenCatSet((Set)request.getAttribute("removedCatSet")) %>' name='itCat' type='Category'>
  <input type='hidden' name='cids' value='<%= itCat.getId() %>'>
  </jalios:foreach>
  <% if (pub != null && pub.getWorkspace() != null) { %> 
  <input type='hidden' name='ws' value='<%= JcmsUtil.getId(pub.getWorkspace()) %>'>
  <% } %>
<% } %>

  <%-- HIDDEN ----------------------------------------- --%> 
  <% if (pub != null) { %> 
  <input type='hidden' name='id' value='<%= formHandler.getId() %>' />
  <% } %>
  <% if (isLogged && HttpUtil.isCSRFEnabled()) { %>
  <input type="hidden" name="csrftoken" value="<%= HttpUtil.getCSRFToken(request) %>" />
  <% } %>
  <input type="hidden" name="showAllTabs" value="<%= formHandler.getShowAllTabs() %>" />
  <input type="hidden" name="showContentTabOnly" value="<%= formHandler.getShowContentTabOnly() %>" />
  <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>' />
  <input type='hidden' name='redirectOnClosePopup' value='<%= formHandler.getRedirectOnClosePopup() %>' />
  <input type="hidden" name="doNotStore" value='<%= formHandler.getDoNotStore() %>' />
  <input type='hidden' name='action' value='true' />
  <input type="hidden" name="anchor" />
  <input type="hidden" name="opItem" />
  <input type="hidden" name="itemPos" />

<% if (popupEdition) { %>
  <input type="hidden" name="popupEdition" value="true" />
<% } %>
<% for(Iterator it = formHandler.getEditFieldSet().iterator(); it.hasNext();) { %>
  <input type="hidden" name="editField" value="<%= it.next() %>" />
<% } %>

  <%-- For fake FileDocument contribution, not absolutely needed here, but convenient for dev purpose, see javadoc EditFileDocumentHandler.setUseFakeFile() --%>
  <% if (hasParameter("useFakeFile")) { %><input type="hidden" name="useFakeFile" value='<%= getBooleanParameter("useFakeFile", false) %>' /><% } %>
  <% if (hasParameter("fakeExtension")) { %><input type="hidden" name="fakeExtension" value='<%= getAlphaNumParameter("fakeExtension", "") %>' /><% } %>

</form>

<%-- JAVASCRIPT ----------------------------------- --%>

<jalios:javascript>
function doEditPubOnLoad() {

  // Activate unload message
  initUnloadMessage();

 <% if (formHandler.isTabForced() ) { %>
  setSelectedTab("edit-topbar", <%= formHandler.getOpenTab() %>);
 <% } %>
 
  <% if (Util.notEmpty(formHandler.getAnchor()) ) { %>
  window.location = window.location + '#<%= encodeForJavaScript(formHandler.getAnchor()) %>'
  <% } %>
}
doEditPubOnLoad();
</jalios:javascript>

<% if ( popupEdition) { %></div><%-- <div id="popupEdition">--%><% } %>
<% if (!popupEdition) { %>
<%@ include file='/work/doWorkFooter.jspf' %>
<% } else { %>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
<% } %>
<% } %>