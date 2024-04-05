<%@page import="org.json.JSONObject"%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%--
--%><%@page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler"%><%--
--%><%@ page import="com.jalios.jcms.vote.*" %><%-- 
--%><%
  Publication pub = getPublicationParameter("id");
  FileDocument document = (FileDocument) getPublicationParameter("id");
%>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<%
  String filename = document.getFilename();
  String pdfFilename = filename + ".pdf";
  File pdfFile = new File(channel.getRealPath(pdfFilename));
  
  long duration = smartPhoneManager.getAuthkeyFileDocumentDuration();
  String urlWithAuthKey = AuthKeyAuthenticationHandler.getInstance().getUrlWithAddedAuthKeyParam(filename, loggedMember, duration, false);

  String extension =  ((FileDocument) pub).getExtension(filename);  
  JSONObject documentInfo = new JSONObject();
  documentInfo.put("title", pub.getTitle(userLang)+"."+extension);
  documentInfo.put("contentType", ((FileDocument) pub).getContentType());

%>
<div id="pub-filedocument" data-role="page" class="pub-page pub-filedocument">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <%-- PREVIEW --%>
      <% if ((document.isVideo() || document.isImage()) && Util.toBoolean(request.getAttribute("fileDocumentPreview"),true) && pub instanceof FileDocument){ %>
        <div class="preview">
         <jalios:media fileDoc="<%= (FileDocument)pub %>" template="smartphonedefault"/>
        </div>
      <% } %>    
    
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <div class="card-item card-item-body pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
        <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= document.getDescription(userLang) %></jalios:wiki>
        <div class="pub-filedocument-file-details text-info">
        <jalios:fileicon doc='<%= (FileDocument) pub %>' /> <%= ((FileDocument) pub).getTypeInfo(userLang) %> 
        (<%--
         --%><jalios:filesize doc='<%= (FileDocument) pub %>'/><%--
         --%><% if (((FileDocument) pub).isImage()) { %> &middot; <%= ((FileDocument) pub).getDimensions() %><% } %><%--
         --%><% if (((FileDocument) pub).isAudio()) { %> &middot; <jalios:duration time='<%= ((FileDocument) pub).getDuration() %>'/><% } %><%--
         --%>)
        </div>
        
        <% if (!document.isVideo() && !document.isImage() && Util.toBoolean(request.getAttribute("fileDocumentPreview"),true) && pub instanceof FileDocument){ %>
          <div class="preview-body">
            <jalios:media fileDoc="<%= (FileDocument)pub %>" template="smartphonedefault"/>
          </div>
        <% } %>    
        <% if(document.isRemote()) { %>
          <a class="pub-download-button jmobile-download-action btn-primary" data-jalios-document-info="<%= encodeForHTMLAttribute(documentInfo.toString()) %>" data-role="button" data-ajax="false" href="<%= document.getDownloadUrl() %>"><%= glp("ui.com.btn.access-doc") %></a>
        <% } else { %> 
          <a class="pub-download-button jmobile-download-action btn-primary" data-jalios-document-info="<%= encodeForHTMLAttribute(documentInfo.toString()) %>" data-role="button" data-ajax="false" href="<%= urlWithAuthKey %>"><%= glp("ui.com.btn.download") %></a>
          <%  if (pdfFile.exists()) {  %>
            <a class="pub-download-button jmobile-download-action btn-primary" data-jalios-document-info="<%=  encodeForHTMLAttribute(documentInfo.toString()) %>" data-role="button" data-ajax="false" href="<%= urlWithAuthKey %>"><%= glp("ui.com.btn.download.pdf") %></a>
          <%  }  %>
        <%  } %>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />  
  </div><%-- EOF .pub-content --%>
</div><%-- EOF #pub-filedocument --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>