<%--
  @Summary: Deletes the given CSInvitation
  @since: csp-6.5
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %>

<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.EditCSInvitationHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="loggedMember" value='<%= loggedMember %>'/><%
  %><jsp:setProperty name="formHandler" property="opDelete" value='true'/><%
%></jsp:useBean>
<%
// Delete + redirect
formHandler.validate();
%>
