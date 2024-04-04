<%@page import="com.jalios.jcms.taglib.list.ListItemTag.LinkTarget"%>
<%@page import="com.jalios.jcms.rss.RssTracker"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%
  PortletRSS box = (PortletRSS) portlet;
  RssManager rssManager = RssManager.getInstance();
  String rssSource = (String) box.getFieldValue(jcmsContext, "source"); // box.getSource()
  int rssMaxItems = box.getIntFieldValue(jcmsContext, "maxItems"); // box.getMaxItems()
  String rssId = box.getId() + RssChannel.generateID(rssSource, 256);  
  boolean isTrackingEnabled = box.getBooleanFieldValue(jcmsContext, "trackingEnabled");
  Set<RssEventListener> listeners = rssManager.getDefaultListeners();
  if (isTrackingEnabled) {
    listeners.add(rssManager.getRssTrackerListener());
  }
  
  jcmsContext.addCSSHeader ("css/jalios/ux/jalios-rss.css");
  jcmsContext.addJavaScript("js/jalios/ux/jalios-rss.js"); 
%>
<%@ page import="com.jalios.jcms.rss.RssManager" %>
<jalios:rss id="<%= rssId %>" name="rssChannel" source='<%= rssSource %>'
            ufreq='<%= box.getRefresh() / 60 %>' eventListeners="<%= listeners %>" />
<%
  if (rssChannel == null) {
    //request.setAttribute("ShowPortalElement",Boolean.FALSE);
    out.println(glp("ui.portlet-rss.invalid-feed"));
    return;
  }
  String rssSourceId = rssChannel.getId();

  String linkTarget = box.getOpenLinksInNewWindow() ? "target='_blank'" : "";

  // Refresh
  boolean showRefreshBtn = (jcmsContext.isEditIcon() && isAdmin) ? true : false;
  
  boolean showImage = box.getShowImage() && Util.notEmpty(rssChannel.getImageUrl());
  boolean showTitle = box.getShowTitle();
  boolean showDescription = box.getShowDescription() && Util.notEmpty(rssChannel.getDescription());
  boolean showWebMastersEmail = box.getShowWebMastersEmail() && Util.notEmpty(rssChannel.getWebMaster());
  
  boolean showRSSInfo = showImage || showTitle || showDescription || showWebMastersEmail;
  
  String refreshURL = ServletUtil.getUrlWithUpdatedParam(request, "rss." + rssId + ".refresh", "true");
%>
<div class="portlet-rss <%= isLogged ? "js-track" : "" %>" data-jalios-rss-sourceid="<%= rssSourceId %>">
<% if (showRSSInfo) { %>
<div class='RssInfo'>
 <%-- Image --%>
 <% if (showImage) { %>
  <a class='RssLogo' href='<%= rssChannel.getImageLink() %>' <%=linkTarget %>>
   <jalios:icon src='<%= rssChannel.getImageUrl() %>'  alt='<%=rssChannel.getImageTitle()%>'  />
  </a>
 <% } %>

 <%-- Title --%>
 <% if (showTitle) { %>
  <% if (Util.notEmpty(rssChannel.getLink())) { %>
   <a class='RssTitle' href='<%= rssChannel.getLink() %>' <%= linkTarget %>>
    <%= rssChannel.getTitle() %>
   </a>
  <% } else { %>
   <div class='RssTitle'><%= rssChannel.getTitle() %></div>
  <% } %>
 <% } %>

 <%-- Description --%>
 <% if (showDescription) { %>
  <div class='RssDescription'><%= rssChannel.getDescription() %></div>
 <% } %>
 
 <%-- WebMastersEmail --%>
 <% if (showWebMastersEmail) { %>
  <a class='RssWebMaster' href='mailto:<%= rssChannel.getWebMaster() %>'><%= rssChannel.getWebMaster() %></a>
 <% } %>
 
</div>
<% } %>

<%
RssManager manager = RssManager.getInstance();
Set<RssTracker> trackersSet = manager.getSessionRssTrackerSet(loggedMember);
%>
<jalios:list>
 <jalios:foreach collection='<%= RssManager.getSortItemList(rssChannel.getItemList(), box.getSortAttribute()) %>'
                 type='com.jalios.util.RssItem' name='rssItem' max='<%= rssMaxItems %>'
                 skip='<%= box.getSkipFirstItems() %>'>

  
  <%
    boolean showItemDesc = box.getShowItemsDescription() && Util.notEmpty(rssItem.getDescription()) && (rssItem.getDescription().length() < 5000);
    String htmlItemId = Util.buildID("rss" + itCounter + "_" + rssId + "_" + rssItem.getGuid());
    String itemId = Util.buildID(rssItem.getGuid());
    Date itemPubDate = rssItem.getParsedPubDate();
    RssTracker tracker = RssManager.getInstance().isRead(loggedMember, rssSource, itemId, trackersSet);        
    boolean isRead = isTrackingEnabled && tracker != null;
    boolean isArticleRead = isTrackingEnabled && tracker != null && tracker.isArticleRead();
    String itemCss = isRead ? "readRssItem" : "";
    itemCss += isArticleRead ? "readArticleRssItem" : "";
    itemCss += " rss-meta has-action";
    DataAttribute dataAttribute = new DataAttribute();
    dataAttribute.addData("data-jalios-rss-sourceid", rssSourceId);
    dataAttribute.addData("data-jalios-rss-itemid", itemId);
    dataAttribute.addData("data-jalios-rss-descriptionid", htmlItemId);
    String rssItemLink = "types/PortletRSS/gotoRssPage.jsp?channelSource=" + encodeForURL(rssSourceId) + "&amp;itemId=" + encodeForURL(itemId) + "&amp;url=" + encodeForURL(rssItem.getLink());
  %><%@ include file="rssItemClean.jspf" %>
  <jalios:listItem text="<%= rssItemTitle %>" linkTarget="<%= box.getOpenLinksInNewWindow() ? LinkTarget.BLANK : null %>" linkCss='<%="RssItemLink "+(loggedMember == null ? "" : "track")%>' link="<%= rssItemLink %>" dataAttribute="<%= dataAttribute %>" css="<%= itemCss %>" >
    <jalios:buffer name='LIST_ITEM_META'>
      <% Date itemDate = itemPubDate; %>
			<%@ include file="/front/list/doListItemCustomDate.jspf" %>
		</jalios:buffer>
    <% if (showItemDesc) { %>
	    <jalios:buffer name='LIST_ITEM_ACTIONS'>
        <div class="dropdown itemlist-item-actions">
			    <a role="button" tabindex="0" class="btn btn-sm btn-default rss-toggle rss-item-description-toggled">
            <jalios:icon src='expand-down' alt='ui.portlet-rss.show-description'  />
            <span><%= glp("ui.portlet-rss.show-description") %></span>
          </a>
          <a role="button" tabindex="0" class="btn btn-sm btn-default rss-toggle rss-item-description-toggled hide" >
            <jalios:icon src='expand-up' alt='ui.portlet-rss.hide-description'  />
            <span><%= glp("ui.portlet-rss.hide-description") %></span>
          </a>
			  </div>
			</jalios:buffer>
    <% } %>
  </jalios:listItem>
  <% if (showItemDesc) { %>
		<div id='<%= htmlItemId %>' class="RssItemDescription rss-item-description-toggled hide">
	    <%= rssItemDescription %>
	  </div>
  <% } %>
 </jalios:foreach>
</jalios:list>
</div>

<div class="item-box-footer">
  <a class="ajax-refresh ajax-action" href='<%= refreshURL %>' ><%= glp("ui.com.btn.refresh") %></a>
</div>