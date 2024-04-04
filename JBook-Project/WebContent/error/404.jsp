<%@ include file="/jcore/doInitPage.jspf" %><%
%><div class="container error error-404">
  <div class="boo-wrapper">
    <div class="boo">
      <div class="face"></div>
    </div>
    <div class="shadow"></div>

    <h1><%= glp("error.404.message.title") %></h1>
    <h3><%= glp("error.404.message.msg") %></h3>
    <p><%= glp("error.404.message.msg.details") %></p>
  </div>
</div>
<script type="text/javascript" src="error/k.js"></script>