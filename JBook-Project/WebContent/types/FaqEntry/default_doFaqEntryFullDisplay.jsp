<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: FaqEntry display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% FaqEntry obj = (FaqEntry)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay FaqEntry <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field answer textareaEditor abstract <%= Util.isEmpty(obj.getAnswer(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(FaqEntry.class, "answer", userLang) %><jalios:edit pub='<%= obj %>' fields='answer'/></td>
    <td class='field-data' <%= gfla(obj, "answer") %>>
            <% if (Util.notEmpty(obj.getAnswer(userLang))) { %>
            <jalios:wiki><%= obj.getAnswer(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field faq linkEditor  <%= Util.isEmpty(obj.getFaq()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(FaqEntry.class, "faq", userLang) %><jalios:edit pub='<%= obj %>' fields='faq'/></td>
    <td class='field-data' >
            <% if (obj.getFaq() != null && obj.getFaq().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getFaq() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field order intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(FaqEntry.class, "order", userLang) %><jalios:edit pub='<%= obj %>' fields='order'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getOrder()) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Z5WhAo+jNypuCmugu5J/4w== --%>