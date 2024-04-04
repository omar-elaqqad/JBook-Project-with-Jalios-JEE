<%@ page import="java.util.regex.Pattern" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  final String   autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  int skip = getIntParameter("skip", 0);
  
  String highlightPattern  = "s#("+Pattern.quote(autocomplete)+")#<span class='match'>$1</span>#gi";
  Pattern matchPattern = Pattern.compile(".*"+Pattern.quote(Util.unaccentuate(autocomplete))+".*", Pattern.CASE_INSENSITIVE);
  if (Util.isEmpty(autocomplete)) {
    highlightPattern = null;
    matchPattern = null;
  }
	
  final List<String> countryCodeList = Util.splitToList(channel.getProperty("iso-3166-1-codes").toUpperCase(), ", ");
  final SortedMap<String,String> countryNameToCountryCodeMap = new TreeMap<String,String>(Collator.getInstance(userLocale));
  for (String countryCode : countryCodeList) { 
    String userCountryName = glp("country." + countryCode);
    String nativeCountryName = channel.getProperty("country." + countryCode);
    if (Util.notEmpty(autocomplete) &&
        !(countryCode.equalsIgnoreCase(autocomplete) || 
          matchPattern.matcher(Util.unaccentuate(userCountryName)).matches() || 
          matchPattern.matcher(Util.unaccentuate(nativeCountryName)).matches()) ) {
      continue;
    }
    countryNameToCountryCodeMap.put(userCountryName, countryCode);
  }
  if (skip > countryNameToCountryCodeMap.size()) {
    skip = 0;
  }
  
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.country", 
                          channel.getIntegerProperty("autocomplete.proposedresults", 10));
  int more = skip + proposedResults;
  
  String acurl = "jcore/autocomplete/accountry.jsp?autocomplete="+autocomplete+"&skip=";
%><ul class="dropdown-menu"><%
  if (countryNameToCountryCodeMap.size() == 0) {
    out.println("<li class='nomatch'><a href='#'>"+glp("ui.com.lbl.no-result")+"</a></li>"); 
  } else {
    int beginPageCount = skip +1; //count from 1
    int endPageCount = Math.min(skip+proposedResults, countryNameToCountryCodeMap.size());

    if (skip > 0){ out.println("<li class='info results'><a href='#'>"+glp("ui.com.lbl.count-result",beginPageCount,endPageCount)+"</a></li>"); }
    if (skip > 0){ out.println("<li class='ajax-refresh previous'><a href='"+acurl+(skip - proposedResults)+"'>"+glp("ui.com.lbl.prev-result")+"</a></li>"); }
    
    int i = 0; boolean first = true;
    for (Map.Entry<String,String> mapEntry : countryNameToCountryCodeMap.entrySet()) {
      String countryCode = mapEntry.getValue();
      String userCountryName = mapEntry.getKey();
      String nativeCountryName = channel.getProperty("country." + countryCode);
  
      String highlightedUserCountryName   = Util.replace(userCountryName, highlightPattern);
      String highlightedNativeCountryName = Util.replace(nativeCountryName, highlightPattern);
      i++; 
      if (i <= skip) { continue; }
    %><li <%= first ? "class='active'" : "" %> data-value='<%= countryCode %>' data-placeholder="<%= encodeForHTMLAttribute(userCountryName) %>"><a href="#"><%
     %><jalios:country country='<%= countryCode %>'/> <%= highlightedUserCountryName %><br/><%
     %><span class='info'><%= highlightedNativeCountryName %></span><%
    %></a></li><%
      first = false;
      if (i >= more) { break; }
    } 
    if (countryNameToCountryCodeMap.size() > i){ out.println("<li class='ajax-refresh next'><a href='"+acurl+more+"'>"+glp("ui.com.lbl.next-result")+"</a></li>"); }
  }
%></ul>
