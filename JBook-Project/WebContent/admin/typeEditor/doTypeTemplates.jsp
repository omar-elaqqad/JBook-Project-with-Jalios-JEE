<%--
  @Summary: Type Templates Editor
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: False
  @Deprecated: False
  @Since: jcms-4.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>

<div class="tab-page">
  <h2 class="tab"><% /* %>Templates<% */ %><%= glp("ui.adm.type-edit.tpl.tab") %></h2>
  <jalios:message msg="ui.adm.type-edit.tpl.h" />
  <form method="post" action="admin/typeEditor.jsp" name="editFormTemplates" class="form-horizontal">
    <fieldset style="margin-bottom: 2em;">
      <legend class='formLabel'><%= glp("ui.adm.type-edit.tpl.new") %></legend>
    
      <div class="row">
        <div class="col-md-6">
          <div class="media">
            <div class='tmplThumbnail pull-left'>
              <img class='tmplThumbnail' src='s.gif' style="background-image: url('');"/>
            </div>
            <div class="media-body">
              <div class='tmplName'>
                <jalios:field  name='templateNames' label='<%= glp("ui.com.lbl.name") %>' required='<%= true %>' ml='<%= false %>'>
                  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                </jalios:field>
              </div>
              <div class='tmplJsp'>
                <jalios:field  name='templatePaths' label='<%= glp("ui.com.lbl.jsp") %>' required='<%= true %>' ml='<%= false %>'>
                  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                </jalios:field>
              </div>
              <div class='tmplLabel'>
                <jalios:field  name='templateLabels' label='<%= glp("ui.com.lbl.label") %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>'>
                  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                </jalios:field>
              </div>
              <div class='tmplLabel'>
                <jalios:field  name='templateUsages' label='<%= glp("ui.com.lbl.tmpl-usage") %>' description='<%= glp("ui.com.lbl.tmpl-usage.h") %>' required='<%= true %>' ml='<%= false %>'>
                  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                </jalios:field>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class='tmplDescription'>
            <jalios:field  name='<%= "templateDescriptions" %>' label='<%= glp("ui.com.lbl.description") %>' ml='<%= channel.isMultilingual() %>'>
              <jalios:control settings='<%= new TextAreaSettings().rows(6) %>' />
            </jalios:field>
          </div>
        </div>
        <div class="col-md-12 br">
          <input class='btn btn-primary' type="submit" name="opUpdateTemplate" value='<%= glp("ui.com.btn.add") %>' />
        </div>
      </div>
    
      <div class="tab-pane" id="typeEditor-tpl-tab">
        <%
          com.jalios.jcms.handler.TypeEditorHandler formHandler = (com.jalios.jcms.handler.TypeEditorHandler)request.getAttribute("formHandler"); 
          TypeEntry te = channel.getTypeEntry("generated."+formHandler.getTypeName());
          
          Map<String, Set<TypeTemplateEntry>> usageMap = formHandler.getTemplateUsageMapFromXml();
          boolean clearTmpl = false;
          boolean hr = false;
          for(Map.Entry<String, Set<TypeTemplateEntry>> itEntry : usageMap.entrySet()) {
            String usage = itEntry.getKey();
            if (Util.isEmpty(itEntry.getValue())){ continue; }
        %>
        <div class="tab-page">
          <h2 class="tab"><%= glp("ui.editportlet.usage."+usage) %></h2>
          
          <%
            List<TypeTemplateEntry> tteList = new ArrayList<TypeTemplateEntry>();
            tteList.addAll(itEntry.getValue());
            int pluggedCounter = tteList.size()+1;
            
            if (te != null){
	            Set<TypeTemplateEntry > tteSet = te.getTemplateEntrySet(usage);
	            for(TypeTemplateEntry ttePlug : tteSet){
	              if (ttePlug.isPlugged()){ tteList.add(ttePlug); }
	            }
            }
          %>
          <jalios:foreach collection="<%= tteList %>" name="tte" type="TypeTemplateEntry">
          <% if (itCounter.intValue() == 1) { 
            clearTmpl = true;
            hr = false; 
          %>
            <fieldset>
              <legend class='formLabel'>
                <jalios:icon src="form"/> <%= glp("ui.adm.type-edit.tpl.type") %>
              </legend>
          <% } else if (itCounter.intValue() == pluggedCounter) { 
            clearTmpl = false;
            hr = false;
          %>
            </fieldset>
            <fieldset>
              <legend class='formLabel'>
                <jalios:icon src="plugin"/> <%= glp("ui.adm.type-edit.tpl.plugin") %>
              </legend>
          <% } %>
          <% if (hr){ %>
            <hr />
          <% } hr=true; %>
          <div class='tmpl <%= tte.isPlugged() ? "tmpl-disabled" : "" %>'>
            <% if(!tte.isPlugged()) { %>
              <input type='hidden' name='templateUsages' value='<%= usage %>' />
            <% } %>
            <% String thumbPath = tte.isPlugged() ? "" : "types/"+formHandler.getTypeName()+"/"; %>
 
          <div class="row type-editor-template-wrapper">
            <div class="col-md-6">
              <div class="media">
                <div class='tmplThumbnail pull-left'>
                  <img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= thumbPath+tte.getThumbnailPath() %>)"/>
                </div>
                <div class="media-body">
                  <div class='tmplName'>
                    <jalios:field  name='templateNames' label='<%= glp("ui.com.lbl.name") %>' required='<%= true %>' ml='<%= false %>' value='<%= tte.getInternalName() %>' disabled='<%= tte.isPlugged() %>'>
                      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                    </jalios:field>
                  </div>
                  <div class='tmplJsp'>
                    <jalios:field  name='templatePaths' label='<%= glp("ui.com.lbl.jsp") %>' required='<%= true %>' ml='<%= false %>' value='<%= tte.isPlugged() ? tte.getPath() : tte.getPath() %>' disabled='<%= tte.isPlugged() %>'>
                      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                    </jalios:field>
                  </div>
                  <div class='tmplLabel'>
                    <jalios:field  name='templateLabels' label='<%= glp("ui.com.lbl.label") %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= tte.getLabelMap() %>' disabled='<%= tte.isPlugged() %>'>
                      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                    </jalios:field>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class='tmplDescription'>
                <jalios:field  name='<%= "templateDescriptions" %>' label='<%= glp("ui.com.lbl.description") %>' ml='<%= channel.isMultilingual() %>' value='<%= tte.getDescriptionMap() %>' disabled='<%= tte.isPlugged() %>'>
                  <jalios:control settings='<%= new TextAreaSettings().rows(6) %>' />
                </jalios:field>
              </div>
            </div>
            <div class="col-md-12">
              <% if (clearTmpl){ %><input class='btn btn-danger js-clear-template' type="button" name="opUpdateTemplate" value='<%= encodeForHTMLAttribute(glp("ui.com.btn.delete")) %>' title="<%= encodeForHTMLAttribute(glp("msg.js.confirm")) %>" /><% } %>
            </div>
      </div>
    </div>
    </jalios:foreach>
  </fieldset>
</div>
<% } %>
</div> <%-- END: typeEditor-tpl-tab --%>
<div>
  <input type="hidden" name="action" value="true" />
  <input type="hidden" name="type" value="<%= formHandler.getTypeName() %>" />
  <input class='btn btn-primary' type="submit" name="opUpdateTemplate" value="<%= glp("ui.com.btn.update") %>" />
</div>
</form>
</div>