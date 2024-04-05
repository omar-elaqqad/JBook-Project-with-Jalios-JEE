<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.blog.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--  
--%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  BlogManager blogMgr = BlogManager.getInstance();
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max", smartPhoneManager.getDefaultPageSize());
  
  PageResult<AbstractBlogPost> pageResult = blogMgr.getBlogPostPageResult("pdate", true, skip, max, loggedMember, null);
%>
<jalios:foreach collection="<%= pageResult.getResultList() %>" type="AbstractBlogPost" name="itBlogPost" skip="<%= skip %>" max="<%= max %>">
  <jalios:cardData data="<%= itBlogPost %>" template="jmobile-detailed" css="has-rounded-corners"/>
</jalios:foreach>
<% if ((skip + max) < pageResult.getTotalSize()) {%>
  <div>
    <a data-jalios-ajax-action="plugins/BlogPlugin/smartphone/jsp/service/allBlogPostsMore.jsp?skip=<%= skip +max %>&amp;max=<%= max %>" data-role="button" class="ui-btn ajax-refresh ui-link">
      <%= glp("jcmsplugin.smartphone.action.showmore") %>
    </a>
  </div>
<% } %>