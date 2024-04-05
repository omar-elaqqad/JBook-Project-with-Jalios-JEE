<%@page import="com.jalios.jcmsplugin.collaborativespace.CSHelper"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-card.css");
jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);

CSManager csMgr = CSManager.getInstance();
if (Util.isEmpty(cardImage) && !pub.getWorkspace().isCollaborativeSpace()) {
  cardImage = "plugins/CollaborativeSpacePlugin/images/card/ws-preview.png";
}

css = (Util.notEmpty(css) ? css.trim() + " " : "") + "card-publication card-collaborativespace";

if (isLogged) {
  boolean belongsTo = loggedMember.belongsToWorkspace(pub.getWorkspace());
  css += belongsTo ? " is-attendee" : " is-not-attendee";
}

int memberCount = csMgr.getAllMemberCount(pub.getWorkspace());

String spaceDescription = pub.getAbstractAsText(userLocale);
boolean hasAbstract = Util.notEmpty(spaceDescription);
boolean showCardBack = hasAbstract;
if (showCardBack) {
  css += " has-back-card";
}

String cardTitle = pub.getWorkspace().getTitle(userLang);

// Add workspace identifier to handle reorder (drap/drop) of favorite workspaces.
dataAttribute.addData("jalios-data-workspace-id", pub.getWorkspace().getId());
%>

<jalios:card css="<%= css %>" link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <jalios:cardFront>
    <%= getIncludeString("CARD_TOP", "") %>
    <jalios:cardImage src="<%= cardImage %>">
      <%-- Prevent thumbnail of header image --%>
      <jalios:buffer name="thumbnailWidth">1999</jalios:buffer>
    </jalios:cardImage>
    <jalios:cardBlock css="card-cs-title">
      <div class="card-title card-publication-title" id="<%= pub.getId() %>" data-jalios-truncate='{ "value" : 2 }'>
        <%= cardTitle %>
      </div>
    </jalios:cardBlock>
    <jalios:cardBlock css="card-attendees">
      <%= glp("jcmsplugin.collaborativespace.lbl.profile.member-count", memberCount) %>
    </jalios:cardBlock>
    <jalios:cardBlock css="card-block-footer-default" mode="<%= CardBlockMode.FOOTER %>">
      <% if (showCardBack) { %>
        <jalios:cardFlipper css="pull-right btn btn-link" />
      <% } %>
    </jalios:cardBlock>
    <%= getIncludeString("CARD_BOTTOM", "") %>
  </jalios:cardFront>

  <%-- CSP-704: always produce the back card --%>
  <%-- but check for its content --%>
  <jalios:cardBack>
    <% if (showCardBack) { %>
      <jalios:cardBlock css="card-cs-title">
        <div class="card-title card-publication-title" data-jalios-truncate='{ "value" : 2 }'>
          <%= cardTitle %>
        </div>
      </jalios:cardBlock>
      <jalios:cardBlock css="cs-abstract">
        <jalios:scrollbar dataAttribute='<%= new DataAttribute().addData("data-suppress-scroll-x", true) %>'>
          <%= encodeForHTML(spaceDescription) %>
        </jalios:scrollbar>
      </jalios:cardBlock>
      <jalios:cardBlock css="card-block-footer-default" mode="<%= CardBlockMode.FOOTER %>">
        <span class="clickable btn btn-default btn-sm display-cs-btn-link" data-jalios-url="<%= encodeForHTMLAttribute(pub.getDisplayUrl(userLocale)) %>">
          <%= glp("ui.com.lbl.show") %>
        </span>
        <jalios:cardFlipper css="pull-right btn btn-link" />
      </jalios:cardBlock>
    <% } %>
  </jalios:cardBack>
</jalios:card>