<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletJBook SmartPhone display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%
  PortletJBook pub = (PortletJBook) getPublicationParameter("id");
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
          <%-- RefineWorkspace ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "refineWorkspace", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <%= pub.getRefineWorkspaceLabel(userLang) %>
          </dd>
          <%-- TopicRoot ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "topicRoot", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% if (Util.notEmpty(pub.getTopicRoot(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= pub.getTopicRoot(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("$channel.root-category"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
          </dd>
          <%-- Description ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "description", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getDescription(userLang)) %>'>
            <jalios:wiki><%= pub.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
          </dd>
          <%-- PortletImage ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "portletImage", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "portletImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getPortletImage(userLang)) %>'>
            <img src='<%= Util.encodeUrl(pub.getPortletImage(userLang)) %>' alt='' />
            </jalios:if>
          </dd>
          <%-- CacheType ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "cacheType", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "cacheType") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getCacheType()) %>'>
            <%= pub.getCacheTypeLabel(pub.getCacheType(), userLang) %>
            </jalios:if>
          </dd>
          <%-- CacheSensibility ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "cacheSensibility", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "cacheSensibility") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getCacheSensibility()) %>'>
            <%= pub.getCacheSensibilityLabel(pub.getCacheSensibility(), userLang) %>
            </jalios:if>
          </dd>
          <%-- InvalidClass ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "invalidClass", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "invalidClass") %>>
            <% if (Util.notEmpty(pub.getInvalidClass())) { %>
              <ol>
                <jalios:foreach name="itString" type="String" array="<%= pub.getInvalidClass() %>">
                  <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
                    <li>
                      <%= pub.getInvalidClassLabel(itString, userLang) %>
                    </li>
                  </jalios:if>
                </jalios:foreach>
              </ol>
            <% } %>
          </dd>
          <%-- InvalidTime ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "invalidTime", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <jalios:duration time='<%= pub.getInvalidTime() * 1000L %>'/>
          </dd>
          <%-- DisplayCSS ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "displayCSS", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "displayCSS") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getDisplayCSS()) %>'>
            <%= pub.getDisplayCSSLabel(pub.getDisplayCSS(), userLang) %>
            </jalios:if>
          </dd>
          <%-- Width ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "width", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "width") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getWidth()) %>'>
            <%= pub.getWidth() %>
            </jalios:if>
          </dd>
          <%-- InsetLeft ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "insetLeft", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(pub.getInsetLeft()) %>px
          </dd>
          <%-- InsetRight ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "insetRight", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(pub.getInsetRight()) %>px
          </dd>
          <%-- InsetTop ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "insetTop", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(pub.getInsetTop()) %>px
          </dd>
          <%-- InsetBottom ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "insetBottom", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(pub.getInsetBottom()) %>px
          </dd>
          <%-- CellPadding ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "cellPadding", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(pub.getCellPadding()) %>px
          </dd>
          <%-- AlignH ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "alignH", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "alignH") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getAlignH()) %>'>
            <%= pub.getAlignHLabel(pub.getAlignH(), userLang) %>
            </jalios:if>
          </dd>
          <%-- AlignV ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "alignV", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "alignV") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getAlignV()) %>'>
            <%= pub.getAlignVLabel(pub.getAlignV(), userLang) %>
            </jalios:if>
          </dd>
          <%-- AlignTable ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "alignTable", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "alignTable") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getAlignTable()) %>'>
            <%= pub.getAlignTableLabel(pub.getAlignTable(), userLang) %>
            </jalios:if>
          </dd>
          <%-- Border ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "border", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(pub.getBorder()) %>px
          </dd>
          <%-- BorderColor ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "borderColor", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "borderColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getBorderColor()) %>'>
            <%= pub.getBorderColor() %>
            </jalios:if>
          </dd>
          <%-- BackColor ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "backColor", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "backColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getBackColor()) %>'>
            <%= pub.getBackColor() %>
            </jalios:if>
          </dd>
          <%-- BackImage ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "backImage", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "backImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getBackImage()) %>'>
            <img src='<%= Util.encodeUrl(pub.getBackImage()) %>' alt='' />
            </jalios:if>
          </dd>
          <%-- DisplayTitle ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "displayTitle", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "displayTitle") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getDisplayTitle(userLang)) %>'>
            <%= pub.getDisplayTitle(userLang) %>
            </jalios:if>
          </dd>
          <%-- Skins ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skins", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skins") %>>
            <% if (Util.notEmpty(pub.getSkins())) { %>
              <ol>
                <jalios:foreach name="itString" type="String" array="<%= pub.getSkins() %>">
                  <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
                    <li>
                      <%= itString %>
                    </li>
                  </jalios:if>
                </jalios:foreach>
              </ol>
            <% } %>
          </dd>
          <%-- SkinCSS ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinCSS", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinCSS") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinCSS()) %>'>
            <%= pub.getSkinCSSLabel(pub.getSkinCSS(), userLang) %>
            </jalios:if>
          </dd>
          <%-- PopupState ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "popupState", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "popupState") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getPopupState()) %>'>
            <%= pub.getPopupStateLabel(pub.getPopupState(), userLang) %>
            </jalios:if>
          </dd>
          <%-- ExpandState ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "expandState", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "expandState") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getExpandState()) %>'>
            <%= pub.getExpandStateLabel(pub.getExpandState(), userLang) %>
            </jalios:if>
          </dd>
          <%-- BehaviorCopy ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "behaviorCopy", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "behaviorCopy") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getBehaviorCopy()) %>'>
            <%= pub.getBehaviorCopyLabel(pub.getBehaviorCopy(), userLang) %>
            </jalios:if>
          </dd>
          <%-- OriginalPortlet ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "originalPortlet", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" >
            <jalios:if predicate='<%= pub.getOriginalPortlet() != null && pub.getOriginalPortlet().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= pub.getOriginalPortlet() %>'/>
            </jalios:if>
          </dd>
          <%-- Condition ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "condition", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "condition") %>>
            <% if (Util.notEmpty(pub.getCondition())) { %>
              <ol>
                <jalios:foreach name="itString" type="String" array="<%= pub.getCondition() %>">
                  <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
                    <li>
                      <%= pub.getConditionLabel(itString, userLang) %>
                    </li>
                  </jalios:if>
                </jalios:foreach>
              </ol>
            <% } %>
          </dd>
          <%-- CssId ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "cssId", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "cssId") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getCssId()) %>'>
            <%= pub.getCssId() %>
            </jalios:if>
          </dd>
          <%-- CssClasses ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "cssClasses", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "cssClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getCssClasses()) %>'>
            <%= pub.getCssClasses() %>
            </jalios:if>
          </dd>
          <%-- SkinClasses ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinClasses", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinClasses()) %>'>
            <%= pub.getSkinClasses() %>
            </jalios:if>
          </dd>
          <%-- SkinFooter ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinFooter", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinFooter") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinFooter(userLang)) %>'>
            <jalios:wysiwyg><%= pub.getSkinFooter(userLang) %></jalios:wysiwyg>            
            </jalios:if>
          </dd>
          <%-- SkinHeaderIcon ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinHeaderIcon", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinHeaderIcon") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinHeaderIcon()) %>'>
            <%= pub.getSkinHeaderIcon() %>
            </jalios:if>
          </dd>
          <%-- SkinHeaderIconColor ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinHeaderIconColor", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinHeaderIconColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinHeaderIconColor()) %>'>
            <%= pub.getSkinHeaderIconColor() %>
            </jalios:if>
          </dd>
          <%-- SkinFooterButtonLabel ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinFooterButtonLabel", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinFooterButtonLabel") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinFooterButtonLabel(userLang)) %>'>
            <%= pub.getSkinFooterButtonLabel(userLang) %>
            </jalios:if>
          </dd>
          <%-- SkinFooterButtonLink ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinFooterButtonLink", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinFooterButtonLink") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinFooterButtonLink()) %>'>
            <a href='<%= pub.getSkinFooterButtonLink() %>' ><%= pub.getSkinFooterButtonLink()%></a>
            </jalios:if>
          </dd>
          <%-- SkinFooterButtonAlign ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinFooterButtonAlign", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinFooterButtonAlign") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinFooterButtonAlign()) %>'>
            <%= pub.getSkinFooterButtonAlignLabel(pub.getSkinFooterButtonAlign(), userLang) %>
            </jalios:if>
          </dd>
          <%-- SkinHeaderButtonLabel ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinHeaderButtonLabel", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinHeaderButtonLabel") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinHeaderButtonLabel(userLang)) %>'>
            <%= pub.getSkinHeaderButtonLabel(userLang) %>
            </jalios:if>
          </dd>
          <%-- SkinHeaderButtonLink ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinHeaderButtonLink", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinHeaderButtonLink") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinHeaderButtonLink()) %>'>
            <a href='<%= pub.getSkinHeaderButtonLink() %>' ><%= pub.getSkinHeaderButtonLink()%></a>
            </jalios:if>
          </dd>
          <%-- SkinHeaderSubText ------------------------------------------------------------ --%>
          <dt class="smartphone-fulldisplay-key"><%= channel.getTypeFieldLabel(PortletJBook.class, "skinHeaderSubText", userLang) %></dt>
          <dd class="smartphone-fulldisplay-value" <%= gfla(pub, "skinHeaderSubText") %>>
            <jalios:if predicate='<%= Util.notEmpty(pub.getSkinHeaderSubText(userLang)) %>'>
            <%= pub.getSkinHeaderSubText(userLang) %>
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
%><%-- ZLpeIhUmZ1vZFhjuiI9o1g== --%>