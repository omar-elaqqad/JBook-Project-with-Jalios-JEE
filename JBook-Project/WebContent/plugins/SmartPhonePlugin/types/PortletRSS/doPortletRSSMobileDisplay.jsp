<%@page import="generated.PortletRSS"%>
<%@page import="com.jalios.jcms.rss.RssTracker"%>
<%@page import="com.jalios.jcms.wysiwyg.WysiwygManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %>

<%
  PortletRSS box = (PortletRSS) portlet;
  RssManager rssManager = RssManager.getInstance();
  String rssSource = (String) box.getFieldValue(jcmsContext, "source"); // box.getSource()
  int rssMaxItems = box.getIntFieldValue(jcmsContext, "maxItems"); // box.getMaxItems()
  String rssId = box.getId() + Util.buildID(rssSource);
  boolean isTrackingEnabled = box.getBooleanFieldValue(jcmsContext, "trackingEnabled");
  Set<RssEventListener> listeners = rssManager.getDefaultListeners();
  if (isTrackingEnabled) {
    listeners.add(rssManager.getRssTrackerListener());
  }
%>
<%@ page import="com.jalios.jcms.rss.RssManager" %>
<jalios:rss id="<%= rssId %>" name="rssChannel" source='<%= rssSource %>'
            ufreq='<%= box.getRefresh() / 60 %>' eventListeners="<%= listeners %>" />
<%
  if (rssChannel == null) {
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
<div class="portlet-rss" data-jalios-rss-sourceid="<%= rssSourceId %>">
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
<ul class="item-box">
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
    String rssItemTitle = ""; 
    String rssItemDescription = "";

    if(rssItem != null) {
      rssItemTitle = rssItem.getTitle(); 
      rssItemDescription = rssItem.getDescription();
      
      if (channel.getBooleanProperty("channel.security.clean-rss", true)) {
        final Map<String,Object> titleHtmlCleaningCtxMap = new HashMap<String,Object>();
        titleHtmlCleaningCtxMap.put("PortletRSS", Boolean.TRUE);
        titleHtmlCleaningCtxMap.put("RssChannel", rssChannel);
        titleHtmlCleaningCtxMap.put("RssItem", rssItem);
        titleHtmlCleaningCtxMap.put(WysiwygManager.CLEANHTML_CTXT_FIELDNAME, "title");
        
        final Map<String,Object> descrHtmlCleaningCtxMap = Util.getHashMap(titleHtmlCleaningCtxMap);
        descrHtmlCleaningCtxMap.put(WysiwygManager.CLEANHTML_CTXT_FIELDNAME, "description");
      
        rssItemTitle = WysiwygManager.cleanHtml(rssItemTitle, titleHtmlCleaningCtxMap);
        rssItemDescription = WysiwygManager.cleanHtml(rssItemDescription, descrHtmlCleaningCtxMap);
      }
    }
  %>
  <li>
   <jalios:include target="PORTLET_RSS_ITEM_1"/>
   <div data-jalios-rss-descriptionid="<%= htmlItemId %>" data-jalios-rss-itemid="<%= itemId %>" data-jalios-rss-sourceid="<%= rssSourceId %>" class="rss-meta <%= isRead ? "readRssItem" : "" %> <%= isArticleRead ? "readArticleRssItem" : "" %>">
       <%-- Item Description link --%>
       <jalios:include target="PORTLET_RSS_ITEM_2" />
       <% if (showItemDesc) { %>
        <a href="#" class="pull-right rss-toggle" onclick="return false;"><jalios:icon src='expand-down' alt='expand'  /></a>
       <% } %>
            <% Date itemDate = itemPubDate; %>
            <%@ include file="/jcore/doItemBoxDate.jspf" %>
       <%-- Item Link --%>
        <a href='<%= rssItem.getLink() %>' class='<%="RssItemLink "+(loggedMember == null ? "" : "track")%>' rel="external">
          <%= rssItemTitle %>
        </a>
    </div>
	  <%-- Item hidden Description --%>
	  <% if (showItemDesc) { %>
	   <div id='<%= htmlItemId %>' class="RssItemDescription hide">
	     <%= rssItemDescription %>
	   </div>
	  <% } %>   
    <jalios:include target="PORTLET_RSS_ITEM_3"/>
  </li>
 </jalios:foreach>
 </ul>
</div>