<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletIndicator diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletIndicator newObj = (generated.PortletIndicator)request.getAttribute("newPub"); 
generated.PortletIndicator oldObj = (generated.PortletIndicator)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletIndicator.class);
boolean isSuperTypeIncluded = Boolean.TRUE.equals((Boolean)request.getAttribute("isSuperTypeIncluded")); 
{
  Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
  if (superFieldCount != null) { 
    fieldCount = superFieldCount.intValue();
  }
}
String fieldDomId = "";
%>
<% if (!isSuperTypeIncluded) { %>
  <%-- ** title *****************  --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTitle(itLang, false), oldObj.getTitle(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td>
      <%= typeEntry.getTitleLabel(userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
    </td>
    <% 
      fieldDomId = "titleDiffDomId_" + itLang ; 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
		<jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    String newTitle = newObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(newObj.getTitle(itLang, false));
    String oldTitle = oldObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(oldObj.getTitle(itLang, false));
    request.setAttribute("newField", newTitle);
    request.setAttribute("oldField", oldTitle);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newTitle));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTitle));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTitle));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% oldReader.close(); %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
<% } %>
 
  <%-- ** indicatorType ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getIndicatorType(), oldObj.getIndicatorType()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "indicatorType", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getIndicatorType(), "") %></td>
    <td><%= Util.getString(oldObj.getIndicatorType(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** value ***************** --%>
  <jalios:if predicate='<%= newObj.getValue() != oldObj.getValue() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "value", userLang) %></td>
    <td><%= newObj.getValue()  %></td>
    <td><%= oldObj.getValue()  %></td>
  </tr>
  </jalios:if>
  <%-- ** targetValue ***************** --%>
  <jalios:if predicate='<%= newObj.getTargetValue() != oldObj.getTargetValue() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "targetValue", userLang) %></td>
    <td><%= newObj.getTargetValue()  %></td>
    <td><%= oldObj.getTargetValue()  %></td>
  </tr>
  </jalios:if>
  <%-- ** percentage ***************** --%>
  <jalios:if predicate='<%= newObj.getPercentage() != oldObj.getPercentage() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "percentage", userLang) %></td>
    <td><%= newObj.getPercentageLabel(userLang) %></td>
    <td><%= oldObj.getPercentageLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** label ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getLabel(itLang, false), oldObj.getLabel(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "labelDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "label", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newLabel = newObj.getLabel(itLang, false) == null ? "" : Util.toWordLine(newObj.getLabel(itLang, false));
    String oldLabel = oldObj.getLabel(itLang, false) == null ? "" : Util.toWordLine(oldObj.getLabel(itLang, false));
    request.setAttribute("newField", newLabel);
    request.setAttribute("oldField", oldLabel);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newLabel));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldLabel));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldLabel));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** unit ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getUnit(), oldObj.getUnit()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "unitDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "unit", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newUnit = newObj.getUnit() == null ? "" : Util.toWordLine(newObj.getUnit());
    String oldUnit = oldObj.getUnit() == null ? "" : Util.toWordLine(oldObj.getUnit());
    request.setAttribute("newField", newUnit);
    request.setAttribute("oldField", oldUnit);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newUnit));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldUnit));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldUnit));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  <%-- ** primaryColor ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPrimaryColor(), oldObj.getPrimaryColor()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "primaryColor", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getPrimaryColor(), "") %></td>
    <td><%= Util.getString(oldObj.getPrimaryColor(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** secondaryColor ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSecondaryColor(), oldObj.getSecondaryColor()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "secondaryColor", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getSecondaryColor(), "") %></td>
    <td><%= Util.getString(oldObj.getSecondaryColor(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** animation ***************** --%>
  <jalios:if predicate='<%= newObj.getAnimation() != oldObj.getAnimation() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "animation", userLang) %></td>
    <td><%= newObj.getAnimationLabel(userLang) %></td>
    <td><%= oldObj.getAnimationLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** briefText ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBriefText(itLang, false), oldObj.getBriefText(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "briefTextDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "briefText", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newBriefText = newObj.getBriefText(itLang, false) == null ? "" : Util.toWordLine(newObj.getBriefText(itLang, false));
    String oldBriefText = oldObj.getBriefText(itLang, false) == null ? "" : Util.toWordLine(oldObj.getBriefText(itLang, false));
    request.setAttribute("newField", newBriefText);
    request.setAttribute("oldField", oldBriefText);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newBriefText));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldBriefText));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldBriefText));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** metric ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getMetric(), oldObj.getMetric()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "metricDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "metric", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newMetric = newObj.getMetric() == null ? "" : Util.toWordLine(newObj.getMetric());
    String oldMetric = oldObj.getMetric() == null ? "" : Util.toWordLine(oldObj.getMetric());
    request.setAttribute("newField", newMetric);
    request.setAttribute("oldField", oldMetric);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newMetric));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldMetric));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldMetric));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  <%-- ** metricParameters ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getMetricParameters(), oldObj.getMetricParameters()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "metricParametersDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "metricParameters", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newMetricParameters = newObj.getMetricParameters() == null ? "" : Util.toWordLine(newObj.getMetricParameters());
    String oldMetricParameters = oldObj.getMetricParameters() == null ? "" : Util.toWordLine(oldObj.getMetricParameters());
    request.setAttribute("newField", newMetricParameters);
    request.setAttribute("oldField", oldMetricParameters);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newMetricParameters));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldMetricParameters));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldMetricParameters));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  <%-- ** linkType ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getLinkType(), oldObj.getLinkType()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "linkType", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getLinkType(), "") %></td>
    <td><%= Util.getString(oldObj.getLinkType(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** publicationLink ***************** --%>
  <jalios:if predicate='<%= newObj.getPublicationLink() != oldObj.getPublicationLink() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "publicationLink", userLang) %></td>
    <td>
      <% Data newLink = newObj.getPublicationLink(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getPublicationLink(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** categorylink ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCategorylink(loggedMember), oldObj.getCategorylink(loggedMember)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "categorylink", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getCategorylink(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= newObj.getCategorylink(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("j_5"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getCategorylink(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= oldObj.getCategorylink(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("j_5"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** linkLabel ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getLinkLabel(itLang, false), oldObj.getLinkLabel(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "linkLabelDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "linkLabel", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newLinkLabel = newObj.getLinkLabel(itLang, false) == null ? "" : Util.toWordLine(newObj.getLinkLabel(itLang, false));
    String oldLinkLabel = oldObj.getLinkLabel(itLang, false) == null ? "" : Util.toWordLine(oldObj.getLinkLabel(itLang, false));
    request.setAttribute("newField", newLinkLabel);
    request.setAttribute("oldField", oldLinkLabel);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newLinkLabel));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldLinkLabel));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldLinkLabel));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** picture ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPicture(), oldObj.getPicture()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletIndicator.class, "picture", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getPicture(), "") %></td>
    <td><%= Util.getString(oldObj.getPicture(), "") %></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/AbstractPortletSkinable/doAbstractPortletSkinableDiff.jsp"/>
<%
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
  ServletUtil.restoreAttribute(pageContext, "isSuperTypeIncluded");
%>
<% if (!isSuperTypeIncluded) { 
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  request.setAttribute("fieldCount", new Integer(fieldCount));
%>  
<jsp:include page="/work/doCommonPubDiff.jsp"/>
<% 
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
 } else {
     request.setAttribute("fieldCount", new Integer(fieldCount));
 } %>
<% } %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- NiizPJtFPEppCO/d2esajw== --%>