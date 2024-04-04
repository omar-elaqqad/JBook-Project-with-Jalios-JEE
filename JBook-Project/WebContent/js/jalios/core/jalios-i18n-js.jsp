<%-- 
 Output I18N strings (all I18N properties prefixed with 'js.') in a JavaScript format. 
 - Cached on both client and server side using the same properties used by css/js packer.
 - Loaded by jalios-i18n.js
 @since jcms-8.0.0 / JCMS-3328
--%><%@ page import="com.jalios.jcms.wysiwyg.WysiwygUtils" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

  // Cache for 10 days by default or use expiration delay specified on properties (on both server and client side)
  final long CACHE_TIMEOUT = channel.getLongProperty("channel.packer.cache-expiration", 10) * 24 * 60; // convert days in minutes
  
  // A. Parameters
  String lang = getAlphaNumParameter("lang", userLang);
  if (!channel.getLocalizedLanguageList().contains(lang)) {
    lang = channel.getLanguage();
  }
      
  // B. Write Headers
  response.setContentType("text/javascript; charset=UTF-8");
  response.setDateHeader("Expires", System.currentTimeMillis() + (CACHE_TIMEOUT * 1000 * 60));
  
  // C. Setup cache id (from queryString)
  final String cacheId = "js_I18N_" + lang;
%><jalios:cache id='<%= cacheId %>' timeout='<%= CACHE_TIMEOUT %>' 
                trim='<%= true %>' refresh='<%= false %>'>
var I18N = {
  
  lang : "<%= encodeForJavaScript(lang) %>",
  'lang.tinymce' : "<%= encodeForJavaScript(WysiwygUtils.getWysiwygMatchedLanguage(lang)) %>",
  'lang.datepicker' : "<%= encodeForJavaScript(channel.getProperty("datepicker.languagekey-mapping." + lang, lang)) %>",
  
  glp : function(prop) {
    var msg  = I18N[prop];
    if (!msg){ return prop; }
    
    for (var i = 1 ; i < arguments.length ; i++){
      msg = msg.replace('{'+(i-1)+'}',arguments[i]);
    }
    
    return msg;
  },
<%
  // JCMS-4798 : Fallback on available language (first with default site language) when a localized message could not be found in the current language
  // Build a collection of all languages from which we will find I18Ned "js.*" properties,
  // allows us to find any "js.*" properties declared in other localized languages that may not have been declared for current language
  final LinkedHashSet<String> checkedLanguages = new LinkedHashSet<String>();
  checkedLanguages.add(lang); // first check in the current user language
  checkedLanguages.add(channel.getLanguage()); // then check the default site language
  checkedLanguages.addAll(channel.getLocalizedLanguageList()); // otherwise check any localized JCMS language
  
  // Keep track all I18N "js." properties ton include them once only 
  final HashSet<String> handledProperties = new HashSet<String>(); 

  for (String currentlang : checkedLanguages) {
    final String javascriptI18NstringsPrefix = currentlang + ".js.";
    Map<String,String> properties = channel.getSortedProperties(javascriptI18NstringsPrefix);
    for (Map.Entry<String,String> entry : properties.entrySet()) {
      final String propertyName = entry.getKey().substring(javascriptI18NstringsPrefix.length());
      final String propertyValue = entry.getValue(); 
      if (handledProperties.contains(propertyName)) {
        continue;
      }
      handledProperties.add(propertyName); %>
    '<%= encodeForJavaScript(propertyName) %>': "<%= encodeForJavaScript(propertyValue) %>",<%
    }
  }
%>

  loaded : true
};
</jalios:cache>