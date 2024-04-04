<%@ include file='/jcore/doInitPage.jspf'%>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="homepage-welcome">

  <%-- TITLE --%>
  <div class="homepage-welcome-title">
    <h1><%= glp("ui.homepage.welcome.title") %></h1>
    <p class="lead"><%= glp("ui.homepage.welcome.text") %></p>
  </div>
  
  <%-- NEWS --%>
  <div class="homepage-news row">
  
    <%-- DWP --%>
    <div class="col-md-4">
      <div class="homepage-news-box text-center">
        <div class="homepage-big-image">
          <img src="images/jalios/home/home-dwp.png" alt="" class="img-responsive" />
        </div>
        <h2><%= glp("ui.homepage.welcome.news.dwp.title") %></h2>
        <p><%= glp("ui.homepage.welcome.news.dwp.text") %></p>
      </div>
    </div>
  
    <%-- APPS --%>
    <div class="col-md-4">
      <div class="homepage-news-box text-center">
        <div class="homepage-big-image">
          <img src="images/jalios/home/home-apps.png" alt="" class="img-responsive" />
        </div>
        <h2><%= glp("ui.homepage.welcome.news.apps.title") %></h2>
        <p><%= glp("ui.homepage.welcome.news.apps.text") %><p>
      </div>
    </div>
  
    <%-- UX --%>
    <div class="col-md-4">
      <div class="homepage-news-box text-center">
        <div class="homepage-big-image">
          <img src="images/jalios/home/home-ux.png" alt="" class="img-responsive" />
        </div>
        <h2><%= glp("ui.homepage.welcome.news.ux.title") %></h2>
        <p><%= glp("ui.homepage.welcome.news.ux.text") %></p>
      </div>
    </div>
    
    <div class="col-md-12 homepage-more-news">
      <a href="http://community.jalios.com/jplatform10" class="btn btn-lg btn-default"><%= glp("ui.homepage.welcome.news.more-news") %></a>
    </div>
    
  </div>
</div>