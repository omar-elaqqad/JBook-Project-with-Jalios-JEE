<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Book SmartPhone display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%
  Book pub = (Book) getPublicationParameter("id");
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<div id="pub-default" data-role="page" class="pub-page pub-default">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <% if (Util.notEmpty(pub.getAbstract())) { %>
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
        <dl>
          <%-- Description ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(Book.class, "description", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getDescription(userLang)) %>'>
            <jalios:wysiwyg><%= pub.getDescription(userLang) %></jalios:wysiwyg>            
            </jalios:if>
          </dd>
          <%-- Image ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(Book.class, "image", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "image") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getImage()) %>'>
            <img src='<%= Util.encodeUrl(pub.getImage()) %>' alt='' />
            </jalios:if>
          </dd>
          <%-- Isbn ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(Book.class, "isbn", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "isbn") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getIsbn()) %>'>
            <%= pub.getIsbn() %>
            </jalios:if>
          </dd>
        </dl>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <% } %>
      
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>
    
    <a data-role="none" class="ui-btn" href="<%= pub.getDisplayUrl(userLocale) %>?<%= SmartPhonePortalPolicyFilter.FORCE_NO_SMARTPHONE_SESSION_ATTR %>" data-ajax="false"><%= glp("jcmsplugin.smartphone.action.see-publication") %></a>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .content --%>
</div><%-- EOF #pub-default --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 2pUuZg80H4UyUF4IGPcoQA== --%>