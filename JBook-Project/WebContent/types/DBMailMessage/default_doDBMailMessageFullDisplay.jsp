<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: DBMailMessage display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% DBMailMessage obj = (DBMailMessage)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay DBMailMessage <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field from textfieldEditor  <%= Util.isEmpty(obj.getFrom()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "from", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "from") %>>
            <% if (Util.notEmpty(obj.getFrom())) { %>
            <%= obj.getFrom() %>
            <% } %>
    </td>
  </tr>
  <tr class="field to textfieldEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "to", userLang) %></td>
    <td class='field-data' >
        <% if (Util.notEmpty(obj.getTo())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" collection="<%= obj.getTo() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field cc textfieldEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "cc", userLang) %></td>
    <td class='field-data' >
        <% if (Util.notEmpty(obj.getCc())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" collection="<%= obj.getCc() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field bcc textfieldEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "bcc", userLang) %></td>
    <td class='field-data' >
        <% if (Util.notEmpty(obj.getBcc())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" collection="<%= obj.getBcc() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field replyTo textfieldEditor  <%= Util.isEmpty(obj.getReplyTo()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "replyTo", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "replyTo") %>>
            <% if (Util.notEmpty(obj.getReplyTo())) { %>
            <%= obj.getReplyTo() %>
            <% } %>
    </td>
  </tr>
  <tr class="field fromMember memberEditor  <%= Util.isEmpty(obj.getFromMember()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "fromMember", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getFromMember() != null) { %>
            <jalios:link data='<%= obj.getFromMember() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field toMember memberEditor  <%= Util.isEmpty(obj.getToMember()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "toMember", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getToMember())) { %>
            <ol>
              <jalios:foreach name="itData" type="Member" collection="<%= obj.getToMember() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field ccMember memberEditor  <%= Util.isEmpty(obj.getCcMember()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "ccMember", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getCcMember())) { %>
            <ol>
              <jalios:foreach name="itData" type="Member" collection="<%= obj.getCcMember() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field bccMember memberEditor  <%= Util.isEmpty(obj.getBccMember()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "bccMember", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getBccMember())) { %>
            <ol>
              <jalios:foreach name="itData" type="Member" collection="<%= obj.getBccMember() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field replyToMember memberEditor  <%= Util.isEmpty(obj.getReplyToMember()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "replyToMember", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getReplyToMember() != null) { %>
            <jalios:link data='<%= obj.getReplyToMember() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field contentText textareaEditor  <%= Util.isEmpty(obj.getContentText()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "contentText", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "contentText") %>>
            <% if (Util.notEmpty(obj.getContentText())) { %>
            <%= obj.getContentText() %>
            <% } %>
    </td>
  </tr>
  <tr class="field contentHtml wysiwygEditor  <%= Util.isEmpty(obj.getContentHtml()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "contentHtml", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "contentHtml") %>>
            <% if (Util.notEmpty(obj.getContentHtml())) { %>
            <jalios:wysiwyg data='<%= obj %>' field='contentHtml'><%= obj.getContentHtml() %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field attachements linkEditor  <%= Util.isEmpty(obj.getAttachements()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "attachements", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getAttachements())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.FileDocument" collection="<%= obj.getAttachements() %>">
              <% if (itData != null && itData.canBeReadBy(loggedMember)) { %>
              <li>
              <jalios:link data='<%= itData %>' params='details=true' ><jalios:fileicon doc='<%= itData %>' /></jalios:link>
              <jalios:link data='<%= itData %>'/>
              - <jalios:filesize doc='<%= itData %>'/>
              <jalios:pdf doc='<%= itData %>' />
              </li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field sentDate dateEditor  <%= Util.isEmpty(obj.getSentDate()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "sentDate", userLang) %></td>
    <td class='field-data' >
            <%  if (obj.getSentDate() != null) { %>
            <jalios:date date='<%= obj.getSentDate() %>' format='<%= "short" %>'/>
            <jalios:time date='<%= obj.getSentDate() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field receivedDate dateEditor  <%= Util.isEmpty(obj.getReceivedDate()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "receivedDate", userLang) %></td>
    <td class='field-data' >
            <%  if (obj.getReceivedDate() != null) { %>
            <jalios:date date='<%= obj.getReceivedDate() %>' format='<%= "short" %>'/>
            <jalios:time date='<%= obj.getReceivedDate() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field priority intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "priority", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getPriority()) %>
    </td>
  </tr>
  <tr class="field account textfieldEditor  <%= Util.isEmpty(obj.getAccount()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "account", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "account") %>>
            <% if (Util.notEmpty(obj.getAccount())) { %>
            <%= obj.getAccount() %>
            <% } %>
    </td>
  </tr>
  <tr class="field inReplyTo textfieldEditor  <%= Util.isEmpty(obj.getInReplyTo()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "inReplyTo", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "inReplyTo") %>>
            <% if (Util.notEmpty(obj.getInReplyTo())) { %>
            <%= obj.getInReplyTo() %>
            <% } %>
    </td>
  </tr>
  <tr class="field references textfieldEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "references", userLang) %></td>
    <td class='field-data' >
        <% if (Util.notEmpty(obj.getReferences())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" collection="<%= obj.getReferences() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field messageId textfieldEditor  <%= Util.isEmpty(obj.getMessageId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "messageId", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "messageId") %>>
            <% if (Util.notEmpty(obj.getMessageId())) { %>
            <%= obj.getMessageId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field thread textfieldEditor  <%= Util.isEmpty(obj.getThread()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBMailMessage.class, "thread", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "thread") %>>
            <% if (Util.notEmpty(obj.getThread())) { %>
            <%= obj.getThread() %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- JFGPb5il+4Tln3Vh3Oz2zA== --%>