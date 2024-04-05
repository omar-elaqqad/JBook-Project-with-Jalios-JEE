<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>><%--  
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--  
--%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  BlogManager blogMgr = BlogManager.getInstance();

  int skip = getIntParameter("skip",0);
  int max = 1000;
  
  
  Blog blog = (Blog) blogMgr.getMemberBlog(loggedMember);
  Set<AbstractBlog> blogSet = new TreeSet(Publication.getTitleComparator(userLang));
  blogSet.addAll(blogMgr.getMemberBlogSet(loggedMember));
%>
<jalios:foreach collection="<%= blogSet %>" type="Blog" name="itBlog" skip="<%= skip %>" max="<%= max %>">
  <smartphone:listItem data="<%= itBlog %>" />
</jalios:foreach>
<% if ((skip + max) < Util.getSize(blogSet)) {%>
<li class="ui-listview-showmore">
  <a data-jalios-ajax-action="plugins/BlogPlugin/smartphone/jsp/service/memberBlogMore.jsp?skip=<%= skip +max %>&amp;max=<%= max %>" data-role="button" class="ui-btn ui-link ajax-refresh">
    <%= glp("jcmsplugin.smartphone.action.showmore") %>
  </a></li>
<% } %>