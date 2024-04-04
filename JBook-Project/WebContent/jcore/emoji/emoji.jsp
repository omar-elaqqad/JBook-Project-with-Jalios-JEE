<%@ include file='/jcore/doInitPage.jspf' %><% 

jcmsContext.addCSSHeader("css/jalios/core/jalios-emoji-picker.css");
jcmsContext.addJavaScript("js/jalios/core/jalios-emoji-picker.js");

%><%@ include file='/jcore/doEmptyHeader.jspf' %><%!
  String unQuoteJsString(String str) {
    return Util.getString(str, "").trim().replaceAll("^[\"'](.*)[\"']$", "$1");
  }
%><% 

// Refine parameters 
final String search = getUntrustedStringParameter("search", "");
final String skinToneModifierHex = getStringEnumParameter("skinTone", "", "", "1f3fb", "1f3fc", "1f3fd", "1f3fe", "1f3ff");
final String skinToneModifierName = Util.isEmpty(skinToneModifierHex) ? "" : glp("emojis." + skinToneModifierHex + ".name");

// Twemoji configuration 
final String twemojiBase = unQuoteJsString(Util.getString(channel.getProperty("js.twemoji.base", ""), channel.getBooleanProperty("js.twemoji.use-cdn", true) ? "https://twemoji.maxcdn.com/2/" : "js/lib/twemoji/"));
final String twemojiSize = unQuoteJsString(Util.getString(channel.getProperty("js.twemoji.size", ""), "72x72"));
final String twemojiExt = unQuoteJsString(Util.getString(channel.getProperty("js.twemoji.ext", ""), ".png"));

// Categories (id) of emojis
final String[] emojiCategoriesId = channel.getProperty("emojis.categories", "").split("\\s");


// Page loading Performance adjustement : 
// Number of image which are directly referenced, the others will be loaded afterward in JS
// 63 is the number of emojis displayed on one page
int loadedImages = channel.getIntegerProperty("emojis.loaded-images-nbr", 63);

%>
<div class="emoji-picker">
  
  <div class="emoji-category-column">
    <% 
        for (String catId : emojiCategoriesId) {
          final String catTitle = glp("emojis.categories." + catId);
          
    %>
       <a href="<%= ServletUtil.getUrl(request) %>#emoji-cat-<%= catId %>" class="category-link category-<%= catId %>" 
          title="<%= encodeForHTMLAttribute(catTitle) %>" <% if( "recent".equals(catId)){%>style="visibility: hidden;"<%} %>></a>
    <%  } %>
  </div>
  
  <div class="emoji-main-column">
    <form action="jcore/emoji/emoji.jsp" method="get">
      <div class="emoji-search">
        <input type="search" name="search" class="form-control" value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("search", "")) %>"
               placeholder="<%= glp("emojis.search-placeholder") %>"/>
      </div>
      <div class="emoji-categories">
        <% 
        for (String catId : emojiCategoriesId) {
          
          final String catTitle = glp("emojis.categories." + catId);
          final String[] emojiHexStrings = channel.getProperty("emojis.categories." + catId, "").split("\\s");
          %>
          <div class="emoji-category" data-emoji-category="<%= catId %>" <% if (Util.isEmpty(emojiHexStrings, true)) {%>style="display:none;"<%} %>>
          <a id="emoji-cat-<%= catId %>"></a>
          <h1><%= catTitle %></h1>
          <%
            for (String emojiHexString : emojiHexStrings) { 
              if (Util.isEmpty(emojiHexString)) {
                continue;
              }
              // Interpret original hex string
              boolean hasVariant = emojiHexString.contains("=");
              boolean supportSkinToneModifier = emojiHexString.contains("*");
              
              // Cleanup and 
              emojiHexString = emojiHexString.replaceAll("[=\\*]", ""); 

              // Retrieve Labels and keywored (must use emoji hex string before skin tone)
              String emojiName = glp("emojis." + emojiHexString + ".name");
              String emojiKeywords = glp("emojis." + emojiHexString + ".keywords");
              
              // Apply skin tone if any
              if (supportSkinToneModifier && Util.notEmpty(skinToneModifierHex)) {
                emojiHexString = emojiHexString.replaceFirst("(?:-fe0f)?(?=-200d-)|(?:-fe0f)?$", "-" + skinToneModifierHex);
              }
             
              // Build emoji codepoint
              final StringBuilder emojiSb = new StringBuilder();
              for (String subItem : emojiHexString.split("-")) {
                emojiSb.append(Character.toChars(Integer.decode("0x"+subItem)));
              }
              final String emoji = emojiSb.toString();
              
              final boolean matchSearch = Util.isEmpty(search) || emojiName.contains(search) || emojiKeywords.contains(search);
              final boolean loadImage = matchSearch && loadedImages-- > 0;
              final String imageURL = twemojiBase + twemojiSize + "/" + emojiHexString + twemojiExt;
              %><button title="<%= encodeForHTMLAttribute(emojiName) %> <%= supportSkinToneModifier ? encodeForHTMLAttribute(skinToneModifierName) : "" %>" 
                        data-emoji-keywords="<%= encodeForHTMLAttribute(emojiKeywords) %>"
                        data-emoji-codepoints="<%= emoji %>"
                        <% if (!matchSearch) {%>style="display:none;"<%} %>>
              <img class="emoji" alt="<%= emoji %>"
                   src="<%= loadImage ? imageURL : "s.gif" %>" <% if (!loadImage) { %>data-emoji-src="<%= imageURL %>" <% } %> />
              </button> <%
            }
          %>
          </div>
          <%  
        }
        %>
      </div>
      <div class="emoji-skin-tone">
        <label class="no-skin-tone <% if (skinToneModifierHex.equals(""))      { %>active<% } %>" title="<%= glp("emojis.skin-tone.none") %>"> <input type="radio" name="skinTone" value=""      <% if (skinToneModifierHex.equals(""))      { %>checked="checked"<% } %>/></label> 
        <label class="light        <% if (skinToneModifierHex.equals("1f3fb")) { %>active<% } %>" title="<%= glp("emojis.skin-tone.1f3fb") %>"> <input type="radio" name="skinTone" value="1f3fb" <% if (skinToneModifierHex.equals("1f3fb")) { %>checked="checked"<% } %>/></label>  
        <label class="medium-light <% if (skinToneModifierHex.equals("1f3fc")) { %>active<% } %>" title="<%= glp("emojis.skin-tone.1f3fc") %>"> <input type="radio" name="skinTone" value="1f3fc" <% if (skinToneModifierHex.equals("1f3fc")) { %>checked="checked"<% } %>/></label>  
        <label class="medium       <% if (skinToneModifierHex.equals("1f3fd")) { %>active<% } %>" title="<%= glp("emojis.skin-tone.1f3fd") %>"> <input type="radio" name="skinTone" value="1f3fd" <% if (skinToneModifierHex.equals("1f3fd")) { %>checked="checked"<% } %>/></label>  
        <label class="medium-dark  <% if (skinToneModifierHex.equals("1f3fe")) { %>active<% } %>" title="<%= glp("emojis.skin-tone.1f3fe") %>"> <input type="radio" name="skinTone" value="1f3fe" <% if (skinToneModifierHex.equals("1f3fe")) { %>checked="checked"<% } %>/></label>  
        <label class="dark         <% if (skinToneModifierHex.equals("1f3ff")) { %>active<% } %>" title="<%= glp("emojis.skin-tone.1f3ff") %>"> <input type="radio" name="skinTone" value="1f3ff" <% if (skinToneModifierHex.equals("1f3ff")) { %>checked="checked"<% } %>/></label>   
      </div>
    </form>
  </div>
  
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>