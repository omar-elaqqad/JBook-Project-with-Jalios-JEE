<%@page import="java.awt.image.BufferedImage"%>
<%@ include file="/front/card/data/doInitCardData.jspf" %>
<%@page import="com.jalios.jcms.jnews.PreviewPubDisplay"%><%
Publication pub = (Publication) data;
Boolean enableDropdown = (Boolean) request.getAttribute("enableDropdown");
boolean isSmallItem = Boolean.TRUE.equals((Boolean) request.getAttribute("isSmallItem"));
BufferedImage img = (BufferedImage) request.getAttribute("imageItem");
boolean isFileDocument = Boolean.TRUE.equals((Boolean) request.getAttribute("isFileDocument"));
boolean isBigImage = Boolean.TRUE.equals((Boolean) request.getAttribute("isBigImage"));
String pubAbstract = pub.getAbstract(userLang);
%>
<jalios:card css='<%= css + " card-publication" %>' dataAttribute="<%= dataAttribute %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <% 
    if (Util.notEmpty(enableDropdown) && enableDropdown.booleanValue()) { 
      %><div class="dropdown-big-item"><jalios:include jsp="/front/card/data/layout/jnews/doDropdownMenuIcons.jsp" /></div><% 
    } 
  %>
  <a class="nounderline-jnews" href="<%= link %>">
    <div class="item height-item-jnews">             
      <% if (isSmallItem && HtmlUtil.html2text(pub.getTitle()).length() >= PreviewPubDisplay.LENGTHBIGTITLE) { %>          
        <jalios:cardBlock>
          <% String cssTitle = ""; %>  
          <div class='<%="card-title "+cssTitle%>'><%=pub.getTitle(userLang, true)%></div>
        </jalios:cardBlock>
        <% 
          String gradient = "";
          if (HtmlUtil.html2text(pubAbstract).length() > PreviewPubDisplay.LENGTHLINEABSTRACTFOURPUBSPERROWMODEL1) { 
            gradient = "gradient-jnews";
          }
        %>
        <jalios:cardBlock css='<%="abstract-publication "+gradient%>'>
          <jalios:if predicate='<%= Util.notEmpty(pubAbstract)%>' >
            <%@ include file="/front/card/data/layout/jnews/doPublicationAbstract.jspf"  %>
          </jalios:if>
        </jalios:cardBlock>
        <jalios:cardBlock css="footer-publication" mode="<%= CardBlockMode.FOOTER %>">
          <%@ include file="/front/card/data/layout/jnews/doPublicationFooter.jspf"  %> 
        </jalios:cardBlock>
      <% } else { %>
        <jalios:if predicate='<%= Util.notEmpty(pub.getDataImage(userLang, true)) && (img != null || isFileDocument)  && isBigImage %>' >
          <jalios:cardImage src="<%= pub.getDataImage(userLang, true) %>" />  
          <% 
            String cssTitle = ""; 
            String cssCardBlock = "";
            cssCardBlock = "title-publication";
          %>  
          <jalios:cardBlock css='<%= cssCardBlock %>'>
            <div class='<%="card-title "+cssTitle%>'><%=pub.getTitle(userLang, true)%></div>
          </jalios:cardBlock>
          <jalios:cardBlock css="add-abstract abstract-publication">
            <jalios:if predicate='<%= Util.notEmpty(pubAbstract)%>' >
              <%@ include file="/front/card/data/layout/jnews/doPublicationAbstract.jspf"  %>
            </jalios:if>
          </jalios:cardBlock>                       
        </jalios:if>
        <jalios:if predicate='<%= Util.isEmpty(pub.getDataImage(userLang, true)) || !isBigImage %>' >
          <% String cssTitle = ""; %>
          <jalios:cardBlock>
            <div class='<%="card-title "+cssTitle%>'><%=pub.getTitle(userLang, true)%></div>
          </jalios:cardBlock>
          <jalios:cardBlock css="abstract-publication">
            <jalios:if predicate='<%= Util.notEmpty(pubAbstract)%>' >
              <%@ include file="/front/card/data/layout/jnews/doPublicationAbstract.jspf"  %>
            </jalios:if>
          </jalios:cardBlock>
        </jalios:if>
        <jalios:cardBlock css="footer-publication" mode="<%= CardBlockMode.FOOTER %>">
          <%@ include file="/front/card/data/layout/jnews/doPublicationFooter.jspf"  %>
        </jalios:cardBlock>
      <% } %>  
    </div>
  </a>  
  <%= getIncludeString("CARD_BOTTOM", "") %>          
</jalios:card>