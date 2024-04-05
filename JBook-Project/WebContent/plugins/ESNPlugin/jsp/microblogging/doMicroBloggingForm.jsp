<%@page import="com.jalios.jcmsplugin.esn.activity.MemberActivityHandler"%>
<%@page import="com.jalios.jcms.upload.UploadManager"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityMicroBloggingHandler"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityWallManager"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.MemberActivityMode"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %><%  
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/microblogging.css");
String uniqueId = ServletUtil.generateUniqueDOMId(request,"microblogging");
MicroBloggingManager bloggingManager = MicroBloggingManager.getInstance();
PortletMemberActivity box = (PortletMemberActivity) request.getAttribute("jcmsplugin.esn.activity.box");
request.setAttribute("jcmsplugin.esn.activity.has-validated", false);

%>

<jsp:useBean id='microBlogHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.ActivityMicroBloggingHandler'>
  <jsp:setProperty name='microBlogHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='microBlogHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='microBlogHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='microBlogHandler' property='*' />
</jsp:useBean>
<%

if (box == null) {
  box = microBlogHandler.getAvailableBox();
}

if (box == null) {
  return;
}

boolean isCardTemplate = request.getAttribute("jcmsplugin.esn.activity.is-card-template") != null ? Util.toBoolean(request.getAttribute("jcmsplugin.esn.activity.is-card-template"), false) : getBooleanParameter("isCardTemplate", false);
String formUrl = isCardTemplate ? "types/PortletMemberActivity/doPortletMemberActivityFullDisplayCards.jsp" : "types/PortletMemberActivity/doPortletMemberActivityFullDisplay.jsp";

String filters = (String) box.getFieldValue(jcmsContext, "filters");  
boolean isMicrobloggingOnly = MemberActivityHandler.isMicroBloggingOnly(filters);

String uniquePortletId = Util.getString(request.getAttribute("jcmsplugin.virtualdesktop.service-id"), box.getId());

request.setAttribute(ActivityMicroBloggingHandler.BOX_REQUEST_ATTR, box);

boolean isWorkspaceMode = "currentWS".equals(box.getActivityMode());

ActivityWallManager wallManager = ActivityWallManager.getInstance();

boolean isMessageMode = microBlogHandler.getMicrobloggingMode().equals("message") || isMicrobloggingOnly;
boolean isWebPageMode = !isMicrobloggingOnly && microBlogHandler.getMicrobloggingMode().equals("webpage");
boolean isDocumentMode = !isMicrobloggingOnly && microBlogHandler.getMicrobloggingMode().equals("document");

String formItemJspPath = microBlogHandler.getFormItemJspPath();
Set<String> formItemHandlerJspPath = microBlogHandler.getFormItemHandlerJspPathSet();
%>
<% if (Util.notEmpty(formItemHandlerJspPath)) { %>
  <% for (String itPath : formItemHandlerJspPath) { %>
    <jalios:include jsp="<%= itPath %>" />
  <% } %>
<% } %>
<% 
  boolean hasValidated = Util.toBoolean(request.getAttribute("jcmsplugin.esn.activity.has-validated"), false);

  if (hasValidated) {
    isMessageMode = true;
    isDocumentMode = false;
    microBlogHandler.setMicrobloggingMode("message");
  }
%>
<div class="microblogging-form-ajax-wrapper ajax-refresh-div"  data-jalios-ajax-refresh-url="plugins/ESNPlugin/jsp/microblogging/doMicroBloggingForm.jsp">
  <div class="microblogging-form-wrapper <%= uniqueId %>" data-jalios-microblogging-box-id="<%= box.getId() %>">
    <% 
      if (!hasValidated && (hasParameter("opUpload") || hasParameter("opMicroBlog")) && microBlogHandler.validate()){
        HibernateUtil.commitTransaction();
        HibernateUtil.beginTransaction();   
        hasValidated = true;
      }
    %>
    <% if (!isMicrobloggingOnly) { %>
      <ul class="nav nav-tabs">
        <li <%= isMessageMode ? "class=\"active\"" : "" %>>
          <a class="microblogging-form-tab" onclick="return false;" href="#" data-jalios-ajax-refresh="nohistory noscroll" data-jalios-action="ajax-refresh" data-jalios-options='{ "params" : { "microbloggingMode" : "message", "box" : "<%= box.getId() %>"}}'><%= glp("jcmsplugin.esn.activity.form-tab.microblogging") %></a>
        </li>
    <%--     <li <%= isDocumentMode ? "class=\"active\"" : "" %>><a href="#" data-jalios-ajax-refresh="nohistory noscroll" data-jalios-action="ajax-refresh" data-jalios-options='{ "params" : { "microbloggingMode" : "document", "box" : "<%= box.getId() %>" }}'><%= glp("jcmsplugin.esn.activity.form-tab.document") %></a></li>     --%>
        <%= microBlogHandler.getIncludedTabsHtml(userLang) %>
      </ul>
    <% } %>
    <form class="microblogging-form jalios-dirty-form-control form-horizontal" action="<%= formUrl %>" method="post" accept-charset="UTF-8"  enctype="multipart/form-data">
      <% if(!isWebPageMode){ %>
      <%@ include file="/jcore/doMessageBox.jspf" %>
      <% } %>
      <% if (Util.notEmpty(formItemJspPath) && !hasValidated) { %>
        <jalios:include jsp="<%= formItemJspPath %>" />
      <% } else if (isMessageMode) { %>
        <div class="media">
          <jalios:memberphoto link="false" css="noTooltipCard pull-left" member="<%= loggedMember %>" size="<%= PhotoSize.TINY %>" />
          <div class="media-body">
            <div class="microblogging-form-toggler hide">
              <jalios:field name="microbloggingText" css="br" resource="field-light">
                <jalios:control settings='<%= new WikiAreaSettings() %>' />
              </jalios:field>
              <div class="buttons text-right">
                <input type="hidden" name="title" value="<%= encodeForHTMLAttribute(JcmsUtil.unescapeHtml(loggedMember.getFriendlyName()) +" - "+ new Date())  %>" />
                <input type="hidden" name="opMicroBlog" value="true" />
                <input type="hidden" name="portletId" value="<%= box.getId() %>" />
                <input type="hidden" name="microBloggingWorkspace" value="<%= box.getActivityMode().equals("currentWS") ? workspace.getId() : null  %>" />
                <button type="submit" data-jalios-target-position="closest" data-jalios-target=".PortletMemberActivity.ID_<%= uniquePortletId %>" data-jalios-action="ajax-refresh" class="btn-primary btn" name="opCreateMicroBlogging" value="true" ><%= glp("ui.com.btn.publish") %></button>
              </div>
            </div>
            <a href="#" onclick="return false;" data-jalios-target=".<%= uniqueId %> .microblogging-form-toggler" data-jalios-action="toggle:hide" class="microblogging-form-start btn btn-default microblogging-form-toggler"><%= glp("jcmsplugin.esn.microblogging.microblogging-prompt") %></a>   
          </div>
        </div>
      <% } else if (isDocumentMode) { %>
  <%--       <%@ include file='/plugins/ESNPlugin/jsp/microblogging/doMicroBloggingForm_document.jspf' %> --%>
      <% } %>  
      <jalios:include target="ESN_MICROBLOGGING_FORM_CONTENT" />
      <input type="hidden" name="microbloggingMode" value="<%= microBlogHandler.getMicrobloggingMode() %>" />
      <input type="hidden" name="box" value="<%= box.getId() %>" />
      <input type="hidden" name="boxId" value="<%= box.getId() %>" />
      <input type="hidden" name="isCardTemplate" value="<%= isCardTemplate %>" />
    </form>
  </div>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>