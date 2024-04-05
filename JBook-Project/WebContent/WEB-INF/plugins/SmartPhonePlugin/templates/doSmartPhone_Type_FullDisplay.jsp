<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*, com.jalios.jcms.portlet.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");

final Channel channel = Channel.getChannel();

boolean isPublicationType = true;
boolean isFileDocument = false;
Element   typeElt = (Element)session.getAttribute("typeElt");

List extendedTypeList = null;
String className = null;
// Extension
if (typeElt == null) {
  typeElt = (Element)session.getAttribute("extensionElt");
  isPublicationType = false;
  String extendedType = typeElt.getAttributeValue("type");
  className = Util.getClassShortName(extendedType) + "Extension";
} 
// Publication Type
else {
  extendedTypeList = (List)session.getAttribute("extendedTypeList");
  className = typeElt.getAttributeValue("name");
  isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
}
String superclass = Util.getString(typeElt.getAttributeValue("superclass"), "");

// Get the fields (and the inherited fields), 
List fieldEntryList = Util.getArrayList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry itField = (TypeFieldEntry)it.next();
  if (itField.isHidden()) {
    it.remove();
  }
}

%>
[[%@ page contentType="text/html; charset=UTF-8" %]][[%
%]][[%-- This file has been automatically generated. --%]][[%
%]][[%--
  @Summary: <%= className %> SmartPhone display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%]][[%
<% if (isFileDocument) { %>
%]][[%@ include file='/plugins/SmartPhonePlugin/jsp/type/fileDocument.jsp' %]]
<% } else { %>
%]][[%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %]]
[[%
  <%= className %> pub = (<%= className %>) getPublicationParameter("id");
%]]
[[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %]]
<div id="pub-default" data-role="page" class="pub-page pub-default">
  [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %]]
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %]]
      [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %]]
      [[% if (Util.notEmpty(pub.getAbstract())) { %]]
      <div class="card-item pub-body">
        [[jalios:include target="SMARTPHONE_PUB_BODY_TOP" /]]


        <dl>


<% String data = "pub"; %>

<jalios:foreach collection="<%= fieldEntryList %>" name="itField" type="TypeFieldEntry">
<%
  String name = itField.getName();
  String nameCap = itField.getNameCap();
  String label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + name + "\", userLang) %]]";
  String type = itField.getType();
  String editor = itField.getEditor();
  if (editor == null) { editor = ""; }
  boolean isAbstract = itField.isAbstract();

  boolean fieldML         = itField.isFieldML();
  boolean fieldSearchable = itField.isSearchable();
  boolean fieldWiki       = itField.isFieldWiki();
  boolean openWindow      = itField.isOpenWindow();
  boolean resize          = itField.isResize();
  int resizeWidth         = itField.getResizeWidth();
  int resizeHeight        = itField.getResizeHeight();
  
  String getter = data + ".get" + nameCap + "(" + (fieldML ? "userLang" : "") + ")";
  
  boolean isDateOnly = itField.isDateOnly(); 
  String dateFormat = itField.getDateFormat();

  String unit       = itField.getUnit();
  String unitBefore = itField.getUnitBefore();
  String unitAfter  = itField.getUnitAfter();
  int decimals      = itField.getDecimals();
  
  String rootCatId  = itField.getRoot();

  String typeShort = itField.getTypeShort();

  String editorCSS = editor;
  if (editorCSS.endsWith("[]")) {
   editorCSS = editorCSS.substring(0, editorCSS.length() - 2);
  }
 editorCSS = editorCSS + "Editor";

  String isEmptySelector = "";
  if (type.equals("String[]") || type.equals("String")) { 
    isEmptySelector = "[[%= Util.isEmpty(" + data + ".get" + nameCap + "(" + (fieldML ? "userLang" : "") + ")) ? \"empty\" : \"\" %]]";
  }
  else if (itField.isAnyLink() || itField.isTypePrimitiveArray() || (itField.isTypeMV() && editor.equals("duration")) || 
      itField.isTypeDate() || itField.isTypeDateArray()) { 
    isEmptySelector = "[[%= Util.isEmpty(" + data + ".get" + nameCap + "(" + (fieldML ? "userLang" : "") + ")) ? \"empty\" : \"\" %]]";
  }
  else if (editor.equals("category")) {
    isEmptySelector = "[[%= Util.isEmpty(" + data + ".get" + nameCap + "(loggedMember)) ? \"empty\" : \"\" %]]";
  }  
  
  String foreachCollection = "array";
  if (itField.isTypeCollection()) {
    foreachCollection="collection";
  }
%>
<jalios:if predicate='<%= editor.equals("sqlresult") %>'>
  [[% request.setAttribute("sqr", <%= getter %>); %]]
</jalios:if>
          [[%-- <%= nameCap %> ------------------------------------------------------------ --%]]
          <dt class="smartphone-fulldisplay-key"><%= label %></dt>
          <dd class="smartphone-fulldisplay-value" <% if (type.startsWith("String")) { %>[[%= gfla(<%= data %>, "<%= name %>") %]]<% } %>>

<jalios:select>

<%-- ** STRING[] / SQLQUERY **************************************** --%>
<jalios:if predicate='<%= type.equals("String[]") && editor.equals("sqlquery") %>'>
            [[% if (Util.notEmpty(sqrArray<%= nameCap %>)) { %]]
              <ol>
                [[% SQLQueryResult[] sqrArray<%= nameCap %> = <%= data %>.get<%= nameCap %>SQR(); %>
                [[jalios:foreach name="sqr" type="SQLQueryResult" array="[[%= sqrArray<%= nameCap %> %]]"]]
                <li>
                  [[% request.setAttribute("sqr", sqr); %]]
                  [[jsp:include page="/jcore/doDisplaySQLQuery.jsp"/]]
                  [[% request.removeAttribute("sqr"); %]]
                </li>
                [[/jalios:foreach]]
              </ol>
            [[% } %]]
</jalios:if>

<%-- ** STRING[] / DBRECORD **************************************** --%>
<jalios:if predicate='<%= type.equals("String[]") && editor.equals("dbrecord") %>'>
            [[% { 
              String[] labels =  <%= data %>.get<%= nameCap %>Label();
              String[] params =  <%= data %>.get<%= nameCap %>DisplayParams();
            %]]
            [[jalios:if predicate="[[%= labels != null && params != null && labels.length > 0 %]]"]]
              <ol>
                [[% for(int i = 0; i < labels.length; i++) { %]]
                <li><a href="jcore/displayDBRecord.jsp?[[%= params[i] %]]">[[%= labels[i] %]]</a></li>
                [[% } %]]
              </ol>
            [[/jalios:if]]
            [[% } %]]
</jalios:if>

<%-- ** STRING[] **************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && typeShort.equals("String")  %>'>
            [[% if (Util.notEmpty(<%= data %>.get<%= nameCap %>(<%= fieldML ? "userLang" : "" %>))) { %]]
              <ol>
                [[jalios:foreach name="itString" type="String" <%= foreachCollection %>="[[%= <%= data %>.get<%= nameCap %>(<%= fieldML ? "userLang" : "" %>) %]]"]]
                  [[jalios:if predicate='[[%= Util.notEmpty(itString) %]]']]
                    <li>
<jalios:select>

<%-- -- STRING[] / IMAGE -------------------------------- --%>
<jalios:if predicate='<%= editor.equals("image") %>'>
<% if (resize) { %>
                      <p>[[jalios:thumbnail path='[[%= Util.encodeUrl(itString) %]]' width='<%= resizeWidth %>' height='<%= resizeHeight %>' /]]</p>
<% } else { %>
                      <p><img src='[[%= Util.encodeUrl(itString) %]]' alt='' /></p>
<% } %>
</jalios:if>

<%-- -- STRING[] / MEDIA -------------------------------- --%>
<jalios:if predicate='<%= editor.equals("media") %>'>
                      <p>[[jalios:media path='[[%= Util.encodeUrl(itString) %]]' /]]</p>
</jalios:if>

<%-- -- STRING[] / URL -------------------------------- --%>
<jalios:if predicate='<%= editor.equals("url") %>'>
                      <a href='[[%= itString %]]'<%= openWindow ? "target='blank'" : "" %>>[[%= itString %]]</a>
</jalios:if>

<%-- -- STRING[] / EMAIL -------------------------------- --%>
<jalios:if predicate='<%= editor.equals("email") %>'>
                      <a href='mailto:[[%= itString %]]'>[[%= itString %]]</a>
</jalios:if>

<%-- -- STRING[] / PASSWORD -------------------------------- --%>
<jalios:if predicate='<%= editor.equals("password") %>'>
                     ******
</jalios:if>

<%-- -- STRING[] / QUERY ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("query") %>'>
                      [[%= itString %]]
                      <ul style="list-style-type: none; padding: 0">
                      [[jalios:query name='<%= name %>ResultSet' queryString='[[%= itString %]]' />
                      [[jalios:pager name="<%= name %>Pager" declare='true' action="init" size="[[%= <%= name %>ResultSet.size() %]]"/>
                      [[jalios:foreach counter='itCounter2'
                                       collection='[[%= <%= name %>ResultSet %]]' 
                                       type='Publication' 
                                       name='itPub' 
                                       max='[[%= <%= name %>Pager.getPageSize() %]]'
                                       skip='[[%= <%= name %>Pager.getStart() %]]'
                                       >
                      <li>[[%= itCounter2.intValue() + <%= name %>Pager.getStart() %]]. [[jalios:link data='[[%= itPub %]]'/]]</li>
                      [[/jalios:foreach>
                      </ul>
                      [[jalios:pager name="<%= name %>Pager" /> 
</jalios:if>

<%-- -- STRING[] / TEXTAREA / WIKI ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("textarea") && fieldWiki %>'>
                      [[jalios:wiki]][[%= itString %]][[/jalios:wiki]]
</jalios:if>

<%-- -- STRING[] / TEXTAREA ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("textarea") %>'>
                      [[%= itString %]]
</jalios:if>

<%-- -- STRING[] / WYSIWYG ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("wysiwyg") %>'>
                      [[jalios:wysiwyg]][[%= itString %]][[/jalios:wysiwyg]]
</jalios:if>

<%-- -- STRING[] / ENUMERATE ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("enumerate") %>'>
                      [[%= <%= data %>.get<%= nameCap %>Label(itString, userLang) %]]
</jalios:if>

<%-- -- STRING[] / TEXTFIELD ----------------------------- --%>
<jalios:default>
                      [[%= itString %]]
</jalios:default>
</jalios:select>
                    </li>
                  [[/jalios:if]]
                [[/jalios:foreach]]
              </ol>
            [[% } %]]
</jalios:if>

<%-- ** STRING ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && type.equals("String") %>'>
            [[jalios:if predicate='[[%= Util.notEmpty(<%= getter %>) %]]']]
<jalios:select>

<%-- -- STRING / IMAGE ---------------------------------- --%>
<jalios:if predicate='<%= editor.equals("image") %>'>
<% if (resize) { %>
            <p>[[jalios:thumbnail path='[[%= Util.encodeUrl(<%= getter %>) %]]' width='<%= resizeWidth %>' height='<%= resizeHeight %>' /]]</p>
<% } else { %>
            <img src='[[%= Util.encodeUrl(<%= getter %>) %]]' alt='' />
<% } %>
</jalios:if>

<%-- -- STRING / MEDIA -------------------------------- --%>
<jalios:if predicate='<%= editor.equals("media") %>'>
            <p>[[jalios:media path='[[%= Util.encodeUrl(<%= getter %>) %]]' /]]</p>
</jalios:if>

<%-- -- STRING / URL ---------------------------------- --%>
<jalios:if predicate='<%= editor.equals("url") %>'>
            <a href='[[%= <%= getter %> %]]' <%= openWindow ? "target='blank'" : "" %>>[[%= <%= getter %>%]]</a>
</jalios:if>

<%-- -- STRING / EMAIL ---------------------------------- --%>
<jalios:if predicate='<%= editor.equals("email") %>'>
            <a href='mailto:[[%= <%= getter %> %]]'>[[%= <%= getter %>%]]</a>
</jalios:if>

<%-- -- STRING / PASSWORD ---------------------------------- --%>
<jalios:if predicate='<%= editor.equals("password") %>'>
            ******
</jalios:if>

<%-- -- STRING / QUERY ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("query") %>'>
            <ul style="list-style-type: none; padding: 0">
              [[jalios:query name='<%= name %>ResultSet' queryString='[[%= <%= getter %> %]]' />
              [[jalios:pager name="<%= name %>Pager" declare='true' action="init" size="[[%= <%= name %>ResultSet.size() %]]"/>
              [[jalios:foreach collection='[[%= <%= name %>ResultSet %]]' 
                               type='Publication' 
                               name='itPub' 
                               max='[[%= <%= name %>Pager.getPageSize() %]]'
                               skip='[[%= <%= name %>Pager.getStart() %]]'
                               >
                <li>[[%= itCounter.intValue() + <%= name %>Pager.getStart() %]]. [[jalios:link data='[[%= itPub %]]'/]]</li>
              [[/jalios:foreach>
              [[jalios:pager name="<%= name %>Pager" />
            </ul>
</jalios:if>

<%-- -- STRING / TEXTAREA / WIKI ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("textarea") && fieldWiki %>'>
            [[jalios:wiki]][[%= <%= getter %> %]][[/jalios:wiki]]
</jalios:if>

<%-- -- STRING / TEXTAREA ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("textarea") %>'>
            [[%= <%= getter %> %]]
</jalios:if>

<%-- -- STRING / WYSIWYG ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("wysiwyg") %>'>
            [[jalios:wysiwyg]][[%= <%= getter %> %]][[/jalios:wysiwyg]]            
</jalios:if>

<%-- -- STRING / ENUMERATE ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("enumerate") %>'>
            [[%= <%= data %>.get<%= nameCap %>Label(<%= getter %>, userLang) %]]
</jalios:if>

<%-- -- STRING / SQLQUERY ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("sqlquery") %>'>
            [[% request.setAttribute("dataSource", <%= data %>.get<%= nameCap %>DataSource()); %]]
            [[% request.setAttribute("sqlQuery", <%= getter %>); %]]
            [[% request.setAttribute("maxRows", "" + <%= data %>.get<%= nameCap %>MaxRows()); %]]
            [[jsp:include page="/jcore/doDisplaySQLQuery.jsp"/]]
</jalios:if>

<%-- -- STRING / DBRECORD ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("dbrecord") %>'>
            <a href="jcore/displayDBRecord.jsp?[[%= <%= data %>.get<%= nameCap %>DisplayParams() %]]">[[%= <%= data %>.get<%= nameCap %>Label() %]]</a>
</jalios:if>

<%-- -- STRING / TEXTFIELD ------------------------------- --%>
<jalios:default>
            [[%= <%= getter %> %]]
</jalios:default>

</jalios:select>
            [[/jalios:if]]
</jalios:if>

<%-- ** INT ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && editor.equals("int") %>'>
            <%= unitBefore %>[[% /* %]]<%= 123456789 %>[[% */ %]][[%= NumberFormat.getInstance(userLocale).format(<%= getter %>) %]]<%= unitAfter %>
</jalios:if>

<%-- ** DOUBLE ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && type.equals("double") %>'>
<% String decimalPattern = "#." + Util.repeat("#", decimals); %>
            <%= unitBefore %>[[% /* %]]<%= 123456789 %>[[% */ %]][[%= (new DecimalFormat("<%= decimalPattern %>")).format(<%= getter %>) %]]<%= unitAfter %>
</jalios:if>

<%-- ** DURATION ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && editor.equals("duration") %>'>
            [[jalios:duration time='[[%= <%= getter %> * 1000L %]]'/]]
</jalios:if>

<%-- ** INT[]  ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && editor.equals("int") %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[% for(int value: <%= getter %>) { %]]
              <li><%= unitBefore %>[[% /* %]]<%= 123456789 %>[[% */ %]][[%= NumberFormat.getInstance(userLocale).format(value) %]]<%= unitAfter %></li>
              [[% } %]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- ** DOUBLE[] ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && editor.equals("double") %>'>
<% String decimalPattern = "#." + Util.repeat("#", decimals); %>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[% for(double value: <%= getter %>) { %]]
              <li><%= unitBefore %>[[% /* %]]<%= 123456789 %>[[% */ %]][[%= (new DecimalFormat("<%= decimalPattern %>")).format(value) %]]<%= unitAfter %></li>
              [[% } %]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- ** DURATION[]  ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && editor.equals("duration") %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[% for(long value: <%= getter %>) { %]]
              <li>[[jalios:duration time='[[%= value * 1000L %]]'/]]</li>
              [[% } %]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- ** BOOLEAN ***************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && editor.equals("boolean") %>'>
            [[%= <%= data %>.get<%= nameCap %>Label(userLang) %]]
</jalios:if>

<%-- ** BOOLEAN[]  ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && editor.equals("boolean") %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[% TypeFieldEntry tfe = channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", true); %]]
              [[% for(boolean value: <%= getter %>) { %]]
              <li>[[%= value ? tfe.getOnLabel(userLang) : tfe.getOffLabel(userLang) %]]</li>
              [[% } %]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- ** CATEGORY ******************************************** --%>
<jalios:if predicate='<%= isPublicationType && editor.equals("category") %>'>
            [[% if (Util.notEmpty(<%= data %>.get<%= nameCap %>(loggedMember))) { %]]
            <ol>
            [[jalios:foreach collection="[[%= <%= data %>.get<%= nameCap %>(loggedMember) %]]" type="Category" name="itCategory" ]]
              <li>[[% if (itCategory != null) { %]]<a href="[[%= ResourceHelper.getQuery() %]]?cids=[[%= itCategory.getId() %]]">[[%= itCategory.getAncestorString(channel.getCategory("<%= rootCatId %>"), " > ", true, userLang) %]]</a>[[% } %]]</li>
            [[/jalios:foreach]]
            </ol>
            [[% } %]]
</jalios:if>
<jalios:if predicate='<%= !isPublicationType && editor.equals("category") %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
            [[jalios:foreach collection="[[%= <%= getter %> %]]" type="Category" name="itCategory" ]]
              <li><a href="[[%= ResourceHelper.getQuery() %]]?cids=[[%= itCategory.getId() %]]">[[%= itCategory.getAncestorString(channel.getCategory("<%= rootCatId %>"), " > ", true, userLang) %]]</a></li>
            [[/jalios:foreach]]
            </ol>
            [[% } %]]
</jalios:if>
<%-- ** LINK[] ******************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && editor.equals("link") %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[jalios:foreach name="itData" type="<%= typeShort %>" <%= foreachCollection %>="[[%= <%= getter %> %]]"]]
              [[jalios:if predicate='[[%= itData != null && itData.canBeReadBy(loggedMember) %]]']]
              <li>
<% if (itField.isTypeDocumentMV()) { %>
              [[jalios:link data='[[%= itData %]]' params='details=true' ]][[jalios:fileicon doc='[[%= itData %]]' /]][[/jalios:link]]
              [[jalios:link data='[[%= itData %]]'/]]
              - [[jalios:filesize doc='[[%= itData %]]'/]]
              [[jalios:pdf doc='[[%= itData %]]' /]]
<% } else { %>
              [[jalios:link data='[[%= itData %]]'/]]
<% } %>
              </li>
              [[/jalios:if]]
              [[/jalios:foreach]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- ** LINK ******************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && editor.equals("link") %>'>
            [[jalios:if predicate='[[%= <%= getter %> != null && <%= getter %>.canBeReadBy(loggedMember) %]]']]
<% if (itField.isTypeDocument()) { %>
            [[jalios:link data='[[%= <%= getter %> %]]' params='details=true' ]][[jalios:fileicon doc='[[%= <%= getter %> %]]' /]][[/jalios:link]]
            [[jalios:link data='[[%= <%= getter %> %]]'/]]
            - [[jalios:filesize doc='[[%=  <%= getter %> %]]'/]]
            [[jalios:pdf doc='[[%= <%= getter %> %]]' /]]
<% } else { %>
            [[jalios:link data='[[%= <%= getter %> %]]'/]]
<% } %>
            [[/jalios:if]]
</jalios:if>

<%-- ** MEMBER[] / GROUP[] ******************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && (editor.equals("member") || editor.equals("group")) %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[jalios:foreach name="itData" type="<%= typeShort %>" <%= foreachCollection %>="[[%= <%= getter %> %]]"]]
              [[jalios:if predicate='[[%= itData != null %]]']]
              <li>[[jalios:link data='[[%= itData %]]'/]]</li>
              [[/jalios:if]]
              [[/jalios:foreach]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- ** MEMBER / GROUP ******************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && (editor.equals("member") || editor.equals("group")) %>'>
            [[jalios:if predicate='[[%= <%= getter %> != null %]]']]
            [[jalios:link data='[[%= <%= getter %> %]]'/]]
            [[/jalios:if]]
</jalios:if>

<%-- ** DATE ******************************************** --%>
<jalios:if predicate='<%= itField.isTypeScalar() && editor.equals("date") %>'>
            [[jalios:if predicate='[[%= <%= getter %> != null %]]']]
            [[jalios:date date='[[%= <%= getter %> %]]' format='[[%= "<%= dateFormat %>" %]]'/]]
<jalios:if predicate="<%= !isDateOnly %>">
            [[jalios:time date='[[%= <%= getter %> %]]' format='[[%= "<%= dateFormat %>" %]]'/]]
</jalios:if>
            [[/jalios:if]]
</jalios:if>

<%-- ** DATE[]  ****************************************** --%>
<jalios:if predicate='<%= itField.isTypeMV() && editor.equals("date") %>'>
            [[% if (Util.notEmpty(<%= getter %>)) { %]]
            <ol>
              [[% for(Date date: <%= getter %>) { %]]
                [[jalios:if predicate='[[%= date != null %]]']]
                <li>
                  [[jalios:date date='[[%= date %]]' format='[[%= "<%= dateFormat %>" %]]'/]]
                  <jalios:if predicate="<%= !isDateOnly %>">
                  [[jalios:time date='[[%= date %]]' format='[[%= "<%= dateFormat %>" %]]'/]]
                  </jalios:if>
                </li>
                [[/jalios:if]]
              [[% } %]]
            </ol>
            [[% } %]]
</jalios:if>

<%-- -- SQLResult ------------------------------- --%>
<jalios:if predicate='<%= editor.equals("sqlresult") %>'>
            [[jsp:include page="/jcore/doDisplaySQLQuery.jsp"/]]
</jalios:if>


</jalios:select>
          </dd>
<jalios:if predicate='<%= editor.equals("sqlresult") %>'>
  [[% request.removeAttribute("sqr"); %]]
</jalios:if>
</jalios:foreach>


        </dl>

        [[jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" /]]
      </div>[[%-- EOF .pub-body --%]]
      [[% } %]]
      
      [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %]]
      [[jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' /]]
    </div>[[%-- EOF .pub --%]]
    
    <a data-role="none" class="ui-btn" href="[[%= pub.getDisplayUrl(userLocale) %>?[[%= SmartPhonePortalPolicyFilter.FORCE_NO_SMARTPHONE_SESSION_ATTR %]]" data-ajax="false">[[%= glp("jcmsplugin.smartphone.action.see-publication") %]]</a>
    [[jalios:include target="SMARTPHONE_PUB_FOOTER" /]]
  </div>[[%-- EOF .content --%]]
</div>[[%-- EOF #pub-default --%]]
[[%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %]]



<% } %>

<% out.flush(); %>
