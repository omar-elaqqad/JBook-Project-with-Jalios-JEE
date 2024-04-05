<%@ include file="/plugins/BlogPlugin/jsp/portlet/doCommonBlogPortletParams.jspf" %>  
<%     
  List<AbstractBlogPost> blogPostList = blog.getBlogPostPageResult("pdate", true, 0,channel.getIntegerProperty("jcmsplugin.blog.blogpost.archive.max",500),loggedMember,false,null).getResultList();

  if (blog == null || Util.isEmpty(blogPostList)) {
    return;
  }
  
  Calendar cal = Calendar.getInstance();
  AbstractBlogPost firstPost = Util.getFirst(blogPostList);
  cal.setTime(firstPost.getPdate() != null ? firstPost.getPdate() : firstPost.getCdate());
  String[] monthLabels = (new DateFormatSymbols(userLocale)).getMonths();
  int curMonth = cal.get(Calendar.MONTH); 
  int curYear = cal.get(Calendar.YEAR); 
  int firstPostYear = cal.get(Calendar.YEAR); 
  int cptMonth =  0;
  
  int postListSize = Util.getSize(blogPostList);
  
  int previousMonth = -1;
  int previousYear = -1;
%>
<jalios:panel title="jcmsplugin.blog.title.archive" picture="jcmsplugin-blog-archive" css="panel-default blog-archive">

      <ul class="item-box noTooltipCard">
      
      <jalios:foreach collection='<%= blogPostList %>' name='itPub' type='Publication'>
        <%
            cal.setTime(itPub.getPdate() != null ? itPub.getPdate() : itPub.getCdate());
            int month = cal.get(Calendar.MONTH);
            int year  = cal.get(Calendar.YEAR);
            boolean isNewYear = year != curYear;
            boolean isNewMonth = (month != curMonth || year != curYear);
        %>       
        <% if (postListSize == itCounter && !isNewMonth && !isNewYear) {cptMonth++;} %>
        <% if (isNewMonth || postListSize == itCounter){ %>
        <li class="month month-<%= previousYear %><%= curYear != firstPostYear ? " hide" : "" %>">
        <span class="item-info" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.label.blog-post-count",cptMonth)) %>" ><%= cptMonth %></span>  
            &nbsp; 
            <%
                String[] paramNames = new String[]{"month","year"};
                String[] paramValues = new String[]{String.valueOf(curMonth),String.valueOf(curYear)};
                String param = "blogDisplay=archive&amp;month=" + String.valueOf(curMonth) + "&amp;year="+ String.valueOf(curYear) ;
            %>
            <jalios:link  params="<%= param %>"  data="<%= blog %>"> <%= Util.recapitalize(monthLabels[curMonth]) %> <%= curYear %></jalios:link>
          </li>
          <% 
                cptMonth = 0;
                curMonth = month;
                curYear = year;       
              }
                cptMonth++;
          %> 
          <% if(isNewYear){%>
           <li class="year"><a href="#" data-jalios-action="toggle:hide" data-jalios-target=".blog-archive .month-<%= year %>"><%= year %></a></li>
          <%}%>   
          <% if (postListSize > 1 && postListSize == itCounter && (curMonth != previousMonth || curYear != previousYear)){%>    
          <li class="month month-<%= curYear %><%= curYear != firstPostYear ? " hide" : " " %>" >
          <span class="item-info"><%= cptMonth %></span>  
          &nbsp; 
          <%
              String[] paramNames = new String[]{"month","year"};
              String[] paramValues = new String[]{String.valueOf(curMonth),String.valueOf(curYear)};
              String param = "blogDisplay=archive&amp;month="+String.valueOf(curMonth)+"&amp;year="+String.valueOf(curYear);
          %>
          <jalios:link  params="<%= param %>"  data="<%= blog %>"> <%= Util.recapitalize(monthLabels[curMonth]) %> <%= curYear %></jalios:link>
        </li>
        <% 
              cptMonth = 0;
              curMonth = month;
              curYear = year;       
            }
            previousMonth = cal.get(Calendar.MONTH);
            previousYear = cal.get(Calendar.YEAR);
        %>               
      </jalios:foreach>
    </ul>


</jalios:panel>