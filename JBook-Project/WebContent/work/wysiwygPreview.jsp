<%--
  @Summary: JSP used in a iframe window to provide wysiwyg preview of the content
            of the textarea referenced by 'targetInputId' field.
            Parameter 'targetInputId' is *required*.
            - targetInputId is the DOM element ID of the opener in which to retrieve the content to edit//update
            The wysiwygParams parameter is optionnal (default is to use "all")

--%>
<%@page import="com.jalios.jcms.wysiwyg.WysiwygManager"%>
<%@ page contentType="text/html; charset=UTF-8"%><%

  request.setAttribute("zone", "InternalUI");
  
  // Very important : always check CSRF token as ANY html can be sent and previewed
  request.setAttribute("CheckCSRF", Boolean.TRUE);
  response.addHeader("X-XSS-Protection", "0");
  response.addHeader("X-Frame-Options", "SAMEORIGIN");
  
  // Kill switch
  if (!channel.getBooleanProperty("channel.security.wysiwyg-preview-enabled", true)) {
    return;
  }
  
%><%@ include file='/jcore/doInitPage.jspf' %><%

  String targetInputId = getChooserParameter("targetInputId");
  if (Util.isEmpty(targetInputId)) {
    throw new IllegalArgumentException("Parameter 'targetInputId' is required");
  }
  
  String html = getUntrustedStringParameter("html", null);
  html = WysiwygManager.cleanHtml(html, WysiwygManager.getCleanHtmlContextMap(null, "wysiwyg-preview"));

  jcmsContext.addBodyAttributes("style", "background-color: #FFFFFF;");
  request.setAttribute("RegiserAjaxContext","false");
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
%>

<%-- STEP : On first load, retrieve the HTML from the parent and immediately self submit to send HTML on server side --%>
<% if (!getBooleanParameter("preview", false)) {%>
<form name="previewForm" id="previewForm" method="post" action="work/wysiwygPreview.jsp" style="display: none;">
 <textarea id="wysiwygPreviewTextarea" name="html"></textarea>
 <% if (HttpUtil.isCSRFEnabled()) { %>
  <input type="hidden" name="csrftoken" value="<%= HttpUtil.getCSRFToken(request) %>" />
 <% } %>
  <input type="hidden" name="targetInputId" value="<%= targetInputId %>" />
  <input type="hidden" name="preview" value="true" />
</form>
<jalios:javascript>
!function ($) {

  var updateContent = function(html) {
    var previewForm = $('#previewForm');
    var textarea = $('#wysiwygPreviewTextarea');
    // refresh only when the content has changed
    if (html == textarea.value) {
      return;
    }
    textarea.val(html);
    previewForm.submit();
  }

  updateContent(parent.jQuery('#<%= targetInputId %>').val());
 
}(window.jQuery);

</jalios:javascript>
<% } %>

<%-- STEP 2. On second load, displayed the HTML through server side mecanism with proper preview --%>
<% if (Util.notEmpty(html)) { %>
<jalios:wysiwyg><%= html %></jalios:wysiwyg>
<% } %>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
