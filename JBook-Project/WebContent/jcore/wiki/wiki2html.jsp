<%--
  @Summary: JSP used in a iframe window to provide wiki preview of the content
            of the textarea referenced by 'targetInputId' field.
            Parameter 'targetInputId' is *required*.
            - targetInputId is the DOM element ID of the opener in which to retrieve the content to edit//update

--%><%@ page contentType="text/html; charset=UTF-8"%><%
  request.setAttribute("zone", "InternalUI");
  
  // Very important : always check CSRF token as ANY wiki (thus html) can be sent and previewed
  request.setAttribute("CheckCSRF", Boolean.TRUE);
  response.addHeader("X-XSS-Protection", "0");
  
  // Kill switch
  if (!channel.getBooleanProperty("channel.security.wiki-preview-enabled", true)) {
    return;
  }

%><%@ include file='/jcore/doInitPage.jspf' %><%

  String targetInputId = getChooserParameter("targetInputId");
  if (Util.isEmpty(targetInputId)) {
    throw new IllegalArgumentException("Parameter 'targetInputId' is required");
  }

  request.setAttribute("com.jalios.jcms.WIKI_PREVIEW", Boolean.TRUE); 
  String wiki = getUntrustedStringParameter("wiki", null); // ENCODE !!

  boolean workaroundIEiframeCrash = channel.getBooleanProperty("workaround.ie-iframe-crash", true) && jcmsContext.getBrowser().isIE();
  if (workaroundIEiframeCrash) {
    request.setAttribute("css-at-bottom", Boolean.TRUE);
  }
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<%-- STEP : On first load, retrieve the wiki from the parent and immediately self submit to send Wiki on server side --%>
<% if (!getBooleanParameter("preview", false)) {%>
<form name="previewForm" id="previewForm" method="post" action="jcore/wiki/wiki2html.jsp" style="display: none;">
 <textarea id="wikiPreviewTextarea" name="wiki"></textarea>
 <% if (HttpUtil.isCSRFEnabled()) { %>
  <input type="hidden" name="csrftoken" value="<%= HttpUtil.getCSRFToken(request) %>" />
 <% } %>
  <input type="hidden" name="targetInputId" value="<%= targetInputId %>" />
  <input type="hidden" name="preview" value="true" />
</form>
<jalios:javascript>
!function ($) {

  var updateContent = function(wiki) {
    var previewForm = $('#previewForm');
    var textarea = $('#wikiPreviewTextarea');
    // refresh only when the content has changed
    if (wiki == textarea.value) {
      return;
    }
    textarea.val(wiki);
    previewForm.submit();
  }

  updateContent(parent.jQuery('#<%= targetInputId %>').val());
 
}(window.jQuery);

</jalios:javascript>
<% } %> 
  

<%-- STEP 2. On second load, displayed the Wiki through server side mecanism with proper preview --%>
<% if (Util.notEmpty(wiki)) { %>
<jalios:wiki><%= JcmsUtil.escapeHtml(wiki) %></jalios:wiki>
<% } %>
<%

if (workaroundIEiframeCrash) {
  jcmsContext.getJavaScriptSet().remove("js/lib/elementQuery.js");
}

%>
<%@ include file='/jcore/doEmptyFooter.jspf' %>