!function(c){var b=/sqlquery/i;var d=function(h){var f=c.jalios.Event.match(h,"broker",b,true);if(!f){return}var g=f.options;var e=c(f.source.currentTarget);var l=e.getWidget();g.dataSource=l.find(".sqlquery-ds").val();g.maxRows=l.find(".sqlquery-maxrows").val();g.sqlQuery=l.find(".sqlquery-query").val();var j="work/checkSQLQuery.jsp?";j=j+c.param(g,true);j=c.jalios.Http.getContextPath()+"/"+j;j=JCMS.Security.getUrlWithCSRFToken(j);var i=c.jalios.Properties.get("sqlquery.check-popup.width")||930;var k=c.jalios.Properties.get("sqlquery.check-popup.height")||570;c.jalios.Browser.popupWindow(j,"SqlQuery",i,k,false,true,true,true,false,false)};var a=function(){c(document).on("jalios:broker",d)};c(document).ready(function(e){a()})}(window.jQuery);