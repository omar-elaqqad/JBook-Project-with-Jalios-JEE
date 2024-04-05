<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: MicroBlogging display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% MicroBlogging obj = (MicroBlogging)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay MicroBlogging <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field text textareaEditor abstract <%= Util.isEmpty(obj.getText()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MicroBlogging.class, "text", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "text") %>>
            <% if (Util.notEmpty(obj.getText())) { %>
            <jalios:wiki><%= obj.getText() %></jalios:wiki>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 81vfKrR0IUV3g2USeS6HiQ== --%>