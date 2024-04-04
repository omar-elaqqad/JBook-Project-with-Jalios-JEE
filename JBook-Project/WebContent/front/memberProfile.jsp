<%--
  @Summary: Member profile 
  @Category: Work Area / Member
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%><%
%><%@ page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

boolean emptyHeader = getBooleanParameter("emptyheader", false);
boolean adminArea = getBooleanParameter("adminArea", false);
Member member = getMemberParameter("id");
if (member == null) {
  member = loggedMember;
}
boolean isDBAccount = member instanceof DBMember;

  if (emptyHeader) { 
    %><%@ include file='/jcore/doEmptyHeader.jspf' %><%
    %><div class="WorkArea front-memberProfile"><%
  } else { 
    if (!adminArea) { 
      %><%@ include file='/work/doWorkHeader.jspf' %><% 
    } else { 
      %><%@ include file='/admin/doAdminHeader.jspf' %><%
    }
  }
%>
<div class="page-header">
  <h1 class="boTitle icon iconMember <% if (isDBAccount) { %>DBMember<% } %>"><% /* %>Profile of ...<% */ %><%= glp("ui.work.prof.title", "<a href='"+member.getDisplayUrl(userLocale)+"'>" + member.getFullName() + "</a>") %></h1>
</div>
<%@ include file='/jcore/doMessageBox.jspf' %>
<script>
function logout() {
  <% if (emptyHeader) { %>
  opener.location="<%= contextPath %>/<%= ResourceHelper.getLogout() %>"; 
  close();
  <% } else { %>
  location="<%= contextPath %>/<%= ResourceHelper.getLogout() %>"; 
  <% } %>
}
</script>
<jalios:include jsp="front/memberProfileInner.jsp" />
<%
  if (emptyHeader) { 
    %><%@ include file='/jcore/doEmptyFooter.jspf' %><%
  } else { 
    if (!adminArea) { 
      %><%@ include file='/work/doWorkFooter.jspf' %><% 
    } else { 
      %><%@ include file='/admin/doAdminFooter.jspf' %><%
    }
  }
%>