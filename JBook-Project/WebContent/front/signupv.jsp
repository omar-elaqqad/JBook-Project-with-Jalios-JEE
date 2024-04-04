<%--
  @Summary: Sign-up validation message
  @Deprecated: False
  @Customizable: True
  @Requestable: True
  @Summary: Sign-up validation
  @Category: Sign-up
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

// Super kludge workaround for security behavior of doHeader.jspf which redirect without any *password* parameter : 
// when JSP is accessed directly, store the password1 param value in session, 
// wait for redirection to be performed by doHeader.jspf,
// then read back the value from session attribute (or param), remove from session
String password1 = null;
if (!jcmsContext.isInFrontOffice()) {
  session.setAttribute("password1", getUntrustedStringParameter("password1", ""));
} else {
  password1 = getUntrustedStringParameter("password1", (String) session.getAttribute("password1"));
  session.removeAttribute("password1");
}

%><%@ include file='/jcore/doHeader.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
 String redirect = ServletUtil.getBaseUrl(request) + ResourceHelper.getSignUpV(); 
  %><jsp:setProperty name="formHandler" property="redirect" value="<%= redirect %>"/><%
  %><jsp:setProperty name="formHandler" property="opConfirmSignup" value='<%= "true" %>'/><%
  %><jsp:setProperty name="formHandler" property="anonymousOpOnly" value="true"/><%
  %><jsp:setProperty name="formHandler" property="password1" value="<%= password1 %>"/><%
%></jsp:useBean><%

 if (formHandler.validate()) {
   return;
 }
 request.setAttribute("title", glp("ui.fo.sign-up.confirmation"));
 
%>
<br />
<%@ include file='/jcore/doMessageBox.jspf' %>

<jalios:if predicate='<%= formHandler.getShowCharter() %>'>
  <form method='post' action='<%= channel.getSecuredBaseUrl(request) %><%= JcmsUtil.getDisplayUrl() %>' >
  <center>
  <table class='layout charter'>
    <tr>
      <td class="well">
      <%= glp("msg.sign-up.charter", channel.getName()) %>
      </td>
    </tr>
  </table><br />
  <input type='hidden' name='mid' value='<%= encodeForHTMLAttribute(getDataIdParameter("mid")) %>' />
  <input type='hidden' name='jsp' value='<%= ResourceHelper.getSignUpV() %>' />
  <input type='hidden' name='password1' value='<%= encodeForHTMLAttribute(Util.getString(password1, "")) %>' />
  <input type='hidden' name='signupKey' value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("signupKey", "")) %>' />
  <input type='submit' class="btn btn-primary" name='charterAccepted' value='<%= encodeForHTMLAttribute(glp("ui.fo.sign-up.charter-accept")) %>' />
  <input type='submit' class="btn btn-default" name='charterRefused' value='<%= encodeForHTMLAttribute(glp("ui.fo.sign-up.charter-decline")) %>' />
  </center>
  </form>
</jalios:if>
<br />
<%@ include file='/jcore/doFooter.jspf' %>