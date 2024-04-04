<%@ include file='/jcore/doInitPage.jspf'%><%-- 
--%><%@ include file='/jcore/portal/doPortletParams.jspf'%><%-- 
--%><%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%
  PortalJspCollection box = (PortalJspCollection) portlet;
  ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
  
%><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%><%

  ServletUtil.restoreAttribute(pageContext , "ShowChildPortalElement");
  jcmsContext.addCSSHeader("css/homepage.css");
  
%>
<div class="homepage">

  <%-- BODY --%>
  <div class="homepage-body">
    <div class="container-fluid">
      <%-- SELECTION --%>
      <div class="homepage-body-selection">
        <%= getPortlet(bufferMap,"selection") %>
      </div>
    </div>
  </div>
  
  <%-- FOOTER --%>
  <div class="homepage-footer">
    <a href="https://www.jalios.com/">Jalios</a>
    &middot; <a href="https://community.jalios.com/">Jalios Community</a>
    &middot; <a href="https://twitter.com/Jalios"><jalios:icon alt="Twitter" src="glyph: icomoon-twitter" /></a>
    &middot; <a href="https://fr.linkedin.com/company/jalios"><jalios:icon alt="Linkedin" src="glyph: icomoon-linkedin" /></a>
    &middot; <a href="https://fr-fr.facebook.com/pages/Jalios/247043108786021"><jalios:icon alt="Facebook" src="glyph: icomoon-facebook2" /></a>
  </div>

</div>
