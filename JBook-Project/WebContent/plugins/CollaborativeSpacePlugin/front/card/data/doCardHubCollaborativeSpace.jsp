<%@page import="com.jalios.jcmsplugin.collaborativespace.CSHelper"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%
CollaborativeSpace pub = (CollaborativeSpace) data;

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-card.css");
jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);

CSManager csMgr = CSManager.getInstance();
if (Util.isEmpty(cardImage)) {
  cardImage = csMgr.getDataImage(pub, userLang);
}

css = (Util.notEmpty(css) ? css.trim() + " " : "") + "card-publication card-collaborativespace";
String accessPolicy = pub.getAccessPolicy();
boolean showAccessPolicy = /* Skip broken case */ Util.notEmpty(accessPolicy) && /* Only if private */ CSHelper.isPrivate(pub) && /* and does not belong */ (!isLogged || !loggedMember.belongsToWorkspace(pub.getWorkspace())) ;
if (showAccessPolicy) {
  css += " access-" + accessPolicy;
}
if (isLogged) {
  boolean belongsTo = loggedMember.belongsToWorkspace(pub.getWorkspace());
  css += belongsTo ? " cs-is-attendee" : " cs-is-not-attendee";
}

String customCategories = getIncludeString("CARD_CS_CATEGORIES", "");
int memberCount = csMgr.getAllMemberCount(pub.getWorkspace());

if (Util.isEmpty(customCategories)) {
  // Ask for no link render
  request.setAttribute("category-list-no-link", Boolean.TRUE);
}

String spaceDescription = pub.getAbstractAsText(userLocale);
boolean hasAbstract = Util.notEmpty(spaceDescription);
boolean showCardBack = hasAbstract;
if (showCardBack) {
  css += " has-back-card";
}
dataAttribute.addData("jalios-data-workspace-id", pub.getWorkspace().getId());
%>

<jalios:card css="<%= css %>" link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <jalios:cardFront>
    <%= getIncludeString("CARD_TOP", "") %>
    <% if (showAccessPolicy) { %>
    <span class="access-policy-icon" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.create.info.access." + accessPolicy)) %>">
      <jalios:icon src='jcmsplugin-collaborativespace-access-private' />
    </span>
    <% } %>
    <jalios:cardImage src="<%= cardImage %>">
      <%-- Prevent thumbnail of header image --%>
      <jalios:buffer name="thumbnailWidth">1999</jalios:buffer>
    </jalios:cardImage>
    <jalios:cardBlock css="card-cs-title">
      <div class="card-title card-publication-title" id="cs-card-<%= pub.getWorkspace().getId() %>" data-jalios-truncate='{ "value" : 2 }'>
        <%= pub.getTitle(userLang, true) %>
      </div>
    </jalios:cardBlock>
    <jalios:cardBlock css="card-attendees">
      <%= glp("jcmsplugin.collaborativespace.lbl.profile.member-count", memberCount) %>
    </jalios:cardBlock>
    <jalios:cardBlock css="card-block-footer-default" mode="<%= CardBlockMode.FOOTER %>"><%
      if (Util.notEmpty(customCategories)) {
        %><%= customCategories %><%
      } else {
        // Default category list
        Set<Category> typologies = csMgr.getTypologies(pub, loggedMember);
        if (Util.notEmpty(typologies)) {
          Category[] categories = typologies.toArray(new Category[]{});
          %>
          <div class="typologies">
            <%@ include file="/custom/jcms/doCategoryList.jspf" %>
          </div>
        <% } %>
      <% } %>
      <% if (showCardBack) { %>
        <jalios:cardFlipper css="pull-right btn btn-link" />
      <% } %>
    </jalios:cardBlock>
    <%= getIncludeString("CARD_BOTTOM", "") %>
  </jalios:cardFront>

  <jalios:cardBack css='<%= !showCardBack ? "hide" : "" %>'>
    <% if (showCardBack) { %>
      <jalios:cardBlock css="card-cs-title">
        <div class="card-title card-publication-title" data-jalios-truncate='{ "value" : 2 }'>
          <%= pub.getTitle(userLang, true) %>
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