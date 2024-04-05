<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: MemberProfile display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% MemberProfile obj = (MemberProfile)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay MemberProfile <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field introduction textareaEditor abstract <%= Util.isEmpty(obj.getIntroduction()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberProfile.class, "introduction", userLang) %><jalios:edit pub='<%= obj %>' fields='introduction'/></td>
    <td class='field-data' <%= gfla(obj, "introduction") %>>
            <% if (Util.notEmpty(obj.getIntroduction())) { %>
            <jalios:wiki><%= obj.getIntroduction() %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field interest textfieldEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberProfile.class, "interest", userLang) %><jalios:edit pub='<%= obj %>' fields='interest'/></td>
    <td class='field-data' >
        <% if (Util.notEmpty(obj.getInterest())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" collection="<%= obj.getInterest() %>">
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
  <tr class="field dateOfBirth dateEditor  <%= Util.isEmpty(obj.getDateOfBirth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberProfile.class, "dateOfBirth", userLang) %><jalios:edit pub='<%= obj %>' fields='dateOfBirth'/></td>
    <td class='field-data' >
            <%  if (obj.getDateOfBirth() != null) { %>
            <jalios:date date='<%= obj.getDateOfBirth() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field dateOfArrival dateEditor  <%= Util.isEmpty(obj.getDateOfArrival()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberProfile.class, "dateOfArrival", userLang) %><jalios:edit pub='<%= obj %>' fields='dateOfArrival'/></td>
    <td class='field-data' >
            <%  if (obj.getDateOfArrival() != null) { %>
            <jalios:date date='<%= obj.getDateOfArrival() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 725MlFzevjAihbtWf0ZNzQ== --%>