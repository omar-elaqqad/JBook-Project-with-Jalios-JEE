<%--
  @Summary: Guest Account Photo's anchor target
  @since: csp-6.0
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

// Read member from doMemberPhoto.jsp
Member photoMember = (Member) request.getAttribute("member-photo.member");

// Or read member from ESN template
photoMember = photoMember != null ? photoMember : (Member) request.getAttribute("jcmsplugin.esn.member");

if (photoMember == null) {
  return;
}

if (Util.toBoolean(request.getAttribute("showGuestIcon"),true)) { 
  boolean isGuest = GuestAccountManager.getInstance().isGuestAccount(photoMember);
  if (isGuest) {
    List<String> classes = new ArrayList<String>(); 
    classes.add("photo-icon-bottom-left"); 
    String label = glp("jcmsplugin.collaborativespace.lbl.profile.guest");
    %>
    <jalios:icon css='<%= "guest-icon " + Util.join(classes, " ") %>' src='jcmsplugin-collaborativespace-guest-photo-icon' title='<%= encodeForHTMLAttribute(label) %>' /><%
  }
} %>