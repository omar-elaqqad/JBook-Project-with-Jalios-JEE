<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: SmartPhonePortal SmartPhone display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%
  SmartPhonePortal pub = (SmartPhonePortal) getPublicationParameter("id");
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
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "description", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getDescription(userLang)) %>'>
            <jalios:wysiwyg><%= pub.getDescription(userLang) %></jalios:wysiwyg>            
            </jalios:if>
          </dd>
          <%-- Structure ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "structure", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "structure") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getStructure()) %>'>
            <%= pub.getStructure() %>
            </jalios:if>
          </dd>
          <%-- Portlets ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "portlets", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% if (Util.notEmpty(pub.getPortlets())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.portlet.PortalElement" array="<%= pub.getPortlets() %>">
              <jalios:if predicate='<%= itData != null && itData.canBeReadBy(loggedMember) %>'>
              <li>
              <jalios:link data='<%= itData %>'/>
              </li>
              </jalios:if>
              </jalios:foreach>
            </ol>
            <% } %>
          </dd>
          <%-- DisplayScrollToTop ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "displayScrollToTop", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <%= pub.getDisplayScrollToTopLabel(userLang) %>
          </dd>
          <%-- PageTitle ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "pageTitle", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "pageTitle") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getPageTitle(userLang)) %>'>
            <%= pub.getPageTitle(userLang) %>
            </jalios:if>
          </dd>
          <%-- Image ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "image", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "image") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getImage()) %>'>
            <%= pub.getImage() %>
            </jalios:if>
          </dd>
          <%-- Css ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "css", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "css") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getCss()) %>'>
            <%= pub.getCss() %>
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
%><%-- PN0k1Q5GQhvYznA1bP911w== --%>