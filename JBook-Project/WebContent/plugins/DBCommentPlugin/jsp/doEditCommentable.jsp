<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%@ page import="com.jalios.jcms.handler.EditPublicationHandler" %><%
  EditPublicationHandler handler  = (EditPublicationHandler) request.getAttribute("formHandler");
  
  if (Util.toBoolean(request.getAttribute("jcmsplugin.dbcomment.edit-commentable-enabled"),false)) {
    return;
  }
  
  request.setAttribute("jcmsplugin.dbcomment.edit-commentable-enabled",true);
  
  DBCommentManager dbCommentMgr = DBCommentManager.getInstance();
  if(!workspace.canPublish(DBComment.class)){
      return;
  }
  if (handler == null || !handler.isFieldEdition("") || !dbCommentMgr.isEditCommentableEnabled()){
    return;
  }
    
  Class classBeingProcessed = (Class) handler.getPublicationClass() ;
  
  if (classBeingProcessed == null || !dbCommentMgr.isCommentable(classBeingProcessed)) {
    return;
  }
  
  String   formName      = Util.getString(request.getAttribute("formName"),"editForm");
  boolean  fieldSet      = Util.toBoolean(request.getAttribute("extraDataFieldSet"),false);
  boolean  isDBDataClass = DBData.class.isAssignableFrom(classBeingProcessed) || (handler.getPublication() != null && handler.getPublication() instanceof DBFileDocument) ;
  
  //Handle DB data
  // Retrieve authorized values
  Map<String,String> defaultExtraDBData = Data.getNewDefaultExtraDBDataMap(classBeingProcessed, null, false, classBeingProcessed == handler.getDataClass());
  boolean processExtraDBData = Util.notEmpty(defaultExtraDBData);
  
  // Retrieve object values
  Map<String,String> availableExtraDBData = processExtraDBData ? handler.getAvailableExtraDBDataMap() : null;
  processExtraDBData = Util.notEmpty(availableExtraDBData);
  
  //Handle Store data
  // Retrieve authorized values
  Map<String,String> defaultExtraData = Data.getNewDefaultExtraDataMap(classBeingProcessed, null, false, classBeingProcessed == handler.getDataClass());
  boolean processExtraData = Util.notEmpty(defaultExtraData);
  
  // Retrieve object values
  Map<String,String> availableExtraData = processExtraData ? handler.getAvailableExtraDataMap() : null;
  processExtraData = Util.notEmpty(availableExtraData);
  
  String isCommentableValue = isDBDataClass ? defaultExtraDBData.get(dbCommentMgr.EXTRA_DB_DATA_IS_COMMENTABLE) : defaultExtraData.get(dbCommentMgr.EXTRA_DATA_IS_COMMENTABLE);
  
  if ((!processExtraDBData && !processExtraData) && (Util.notEmpty(isCommentableValue))) {
    return;
  }
  
  if (isDBDataClass && processExtraDBData) {
    String extraKeyFieldName = "extraDBKeys";
    String extraValueFieldName = "extraDBValues";
    Map<String,String> availableValuesMap = availableExtraDBData;
    String prefix = Util.getString(request.getAttribute("extraDBPrefix"), "");
    String itKey = defaultExtraDBData.get(DBCommentManager.EXTRA_DB_DATA_IS_COMMENTABLE_LONGKEY);
    String itValue = availableValuesMap.get(DBCommentManager.EXTRA_DB_DATA_IS_COMMENTABLE);             
    
    if (handler.getPublication() != null && Util.isEmpty(handler.getPublication().getExtraDBData(DBCommentManager.EXTRA_DB_DATA_IS_COMMENTABLE))) {
      itValue = new Boolean(dbCommentMgr.getCommentableDefaultValue()).toString();
    } else {
      itValue = handler.getPublication() != null ? itValue : new Boolean(dbCommentMgr.getCommentableDefaultValue()).toString();          
    }    
    %>
    <input type="hidden" name="<%= extraKeyFieldName %>" value="extradb.Publication.jcmsplugin.dbcomment.commentable" />
		<jalios:field name="<%= extraValueFieldName %>" label="jcmsplugin.dbcomment.commentable.title" value="<%= itValue %>" tooltip="jcmsplugin.dbcomment.commentable.description">
		  <jalios:control settings="<%= new BooleanSettings().select() %>" />
		</jalios:field>		             
    <% 
  }
  
  if (!isDBDataClass && processExtraData) {
    String extraKeyFieldName = "extraKeys";
    String extraValueFieldName = "extraValues";
    Map<String,String> availableValuesMap = availableExtraData;
    String prefix = Util.getString(request.getAttribute("extraPrefix"), "");
    String itKey = defaultExtraData.get(DBCommentManager.EXTRA_DATA_IS_COMMENTABLE_LONGKEY);
    String itValue = availableValuesMap.get(DBCommentManager.EXTRA_DATA_IS_COMMENTABLE); 
    
    if (handler.getPublication() != null && Util.isEmpty(handler.getPublication().getExtraData(DBCommentManager.EXTRA_DATA_IS_COMMENTABLE))) {
      itValue = new Boolean(dbCommentMgr.getCommentableDefaultValue()).toString();
    } else {
      itValue = handler.getPublication() != null ? itValue : new Boolean(dbCommentMgr.getCommentableDefaultValue()).toString();          
    }
    %>
    <input type="hidden" name="<%= extraKeyFieldName %>" value="extra.Publication.jcmsplugin.dbcomment.commentable" />
		<jalios:field name="<%= extraValueFieldName %>" label="jcmsplugin.dbcomment.commentable.title" value="<%= itValue %>" tooltip="jcmsplugin.dbcomment.commentable.description">
		  <jalios:control settings="<%= new BooleanSettings().select() %>" />
		</jalios:field>		               
    <% 
  }                   
%>