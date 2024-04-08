// This class was automatically generated by jsc. Please, do not edit.
// Generation date: Thu Apr 04 15:21:29 WET 2024

package generated;

import java.util.HashMap;
import java.util.Map;

import com.jalios.jstore.DecodeContext;
import com.jalios.jstore.StorableLogEntry;
import com.jalios.jstore.StoreUtil;

@SuppressWarnings("unchecked")
public class Article_HANDLER implements com.jalios.jstore.StorableHandler {

  @Override
@SuppressWarnings("rawtypes")
  public void setAttributes(com.jalios.jstore.Storable storable, StorableLogEntry sle, com.jalios.jstore.Store store) {
    Article handler = (generated.Article)storable;
    String value;
    Map<String,String> attributes = sle.getAttributes();
    value = attributes.get("summary");
    if (value != null) {
      handler.setSummary(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "summary")));
    }

    value = attributes.get("summaryML");
    if (value != null) {
      handler.setSummaryML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "summaryML")));
    }

    value = attributes.get("intro");
    if (value != null) {
      handler.setIntro(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "intro")));
    }

    value = attributes.get("introML");
    if (value != null) {
      handler.setIntroML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "introML")));
    }

    value = attributes.get("picture");
    if (value != null) {
      handler.setPicture(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "picture")));
    }

    value = attributes.get("pictureML");
    if (value != null) {
      handler.setPictureML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "pictureML")));
    }

    value = attributes.get("pictureAlt");
    if (value != null) {
      handler.setPictureAlt(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "pictureAlt")));
    }

    value = attributes.get("pictureAltML");
    if (value != null) {
      handler.setPictureAltML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "pictureAltML")));
    }

    value = attributes.get("content");
    if (value != null) {
      handler.setContent(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "content")));
    }

    value = attributes.get("contentML");
    if (value != null) {
      handler.setContentML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "contentML")));
    }

    value = attributes.get("relatedContents");
    if (value != null) {
      handler.setRelatedContents(StoreUtil.decodeObject(com.jalios.jcms.Content[].class, value, store, new DecodeContext(sle, "relatedContents")));
    }

    value = attributes.get("relatedContentsDBID");
    if (value != null) {
      handler.setRelatedContentsDBID(StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "relatedContentsDBID")));
    }

    value = attributes.get("mainLanguage");
    if (value != null) {
      handler.setMainLanguage(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "mainLanguage")));
    }

    value = attributes.get("title");
    if (value != null) {
      handler.setTitle(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "title")));
    }

    value = attributes.get("titleML");
    if (value != null) {
      handler.setTitleML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "titleML")));
    }

    value = attributes.get("pdate");
    if (value != null) {
      handler.setPdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "pdate")));
    }

    value = attributes.get("edate");
    if (value != null) {
      handler.setEdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "edate")));
    }

    value = attributes.get("sdate");
    if (value != null) {
      handler.setSdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "sdate")));
    }

    value = attributes.get("adate");
    if (value != null) {
      handler.setAdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "adate")));
    }

    value = attributes.get("udate");
    if (value != null) {
      handler.setUdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "udate")));
    }

    value = attributes.get("majorVersion");
    if (value != null) {
        try {handler.setMajorVersion((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("pstatus");
    if (value != null) {
        try {handler.setPstatus((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("mergeDate");
    if (value != null) {
      handler.setMergeDate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mergeDate")));
    }

    value = attributes.get("mergeId");
    if (value != null) {
      handler.setMergeId(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "mergeId")));
    }

    value = attributes.get("templates");
    if (value != null) {
      handler.setTemplates(StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "templates")));
    }

    value = attributes.get("categories");
    if (value != null) {
      handler.setCategories(StoreUtil.decodeObject(com.jalios.jcms.Category[].class, value, store, new DecodeContext(sle, "categories")));
    }

    value = attributes.get("authorizedMemberSet");
    if (value != null) {
      handler.setAuthorizedMemberSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "authorizedMemberSet")));
    }

    value = attributes.get("authorizedMemberSetDBID");
    if (value != null) {
      handler.setAuthorizedMemberSetDBID(StoreUtil.decodeObject(java.util.HashSet.class, value, store, new DecodeContext(sle, "authorizedMemberSetDBID")));
    }

    value = attributes.get("authorizedGroupSet");
    if (value != null) {
      handler.setAuthorizedGroupSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "authorizedGroupSet")));
    }

    value = attributes.get("updateMemberSet");
    if (value != null) {
      handler.setUpdateMemberSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "updateMemberSet")));
    }

    value = attributes.get("updateGroupSet");
    if (value != null) {
      handler.setUpdateGroupSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "updateGroupSet")));
    }

    value = attributes.get("restrictUpdateRights");
    if (value != null) {
        handler.setRestrictUpdateRights(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("mainInstance");
    if (value != null) {
      handler.setMainInstance(StoreUtil.decodeObject(com.jalios.jcms.Publication.class, value, store, new DecodeContext(sle, "mainInstance")));
    }

    value = attributes.get("isTracked");
    if (value != null) {
        handler.setTracked(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("readAck");
    if (value != null) {
        handler.setReadAck(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("friendlyURLSet");
    if (value != null) {
      handler.setFriendlyURLSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "friendlyURLSet")));
    }

    value = attributes.get("workspace");
    if (value != null) {
      handler.setWorkspace(StoreUtil.decodeObject(com.jalios.jcms.workspace.Workspace.class, value, store, new DecodeContext(sle, "workspace")));
    }

    value = attributes.get("roleMap");
    if (value != null) {
      handler.setRoleMap(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "roleMap")));
    }

    value = attributes.get("workflowId");
    if (value != null) {
      handler.setWorkflowId(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "workflowId")));
    }

    value = attributes.get("attachWorkspaceSet");
    if (value != null) {
      handler.setAttachWorkspaceSet(StoreUtil.decodeObject(java.util.Set.class, value, store, new DecodeContext(sle, "attachWorkspaceSet")));
    }

    value = attributes.get("author");
    if (value != null) {
      handler.setAuthor(StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "author")));
    }

    value = attributes.get("authorDBID");
    if (value != null) {
      handler.setAuthorDBID(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "authorDBID")));
    }

    value = attributes.get("opAuthor");
    if (value != null) {
      handler.setOpAuthor(StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opAuthor")));
    }

    value = attributes.get("opDelegate");
    if (value != null) {
      handler.setOpDelegate(StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opDelegate")));
    }

    value = attributes.get("extension");
    if (value != null) {
      handler.setExtension(StoreUtil.decodeObject(com.jalios.jcms.DataExtension.class, value, store, new DecodeContext(sle, "extension")));
    }

    value = attributes.get("importMap");
    if (value != null) {
      handler.setImportMap(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "importMap")));
    }

    value = attributes.get("extraDataMap");
    if (value != null) {
      handler.setExtraDataMap(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "extraDataMap")));
    }

    value = attributes.get("cdate");
    if (value != null) {
      handler.setCdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "cdate")));
    }

    value = attributes.get("mdate");
    if (value != null) {
      handler.setMdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mdate")));
    }

  }

  @Override
public Map<String,String> getAttributes(com.jalios.jstore.Storable storable, com.jalios.jstore.Store store) {
    generated.Article handler = (generated.Article)storable;
    Map<String,String> attributes = new HashMap<>();
    attributes.put("summary", StoreUtil.encodeObject(handler.getSummary(), store));
    attributes.put("summaryML", StoreUtil.encodeObject(handler.getSummaryML(), store));
    attributes.put("intro", StoreUtil.encodeObject(handler.getIntro(), store));
    attributes.put("introML", StoreUtil.encodeObject(handler.getIntroML(), store));
    attributes.put("picture", StoreUtil.encodeObject(handler.getPicture(), store));
    attributes.put("pictureML", StoreUtil.encodeObject(handler.getPictureML(), store));
    attributes.put("pictureAlt", StoreUtil.encodeObject(handler.getPictureAlt(), store));
    attributes.put("pictureAltML", StoreUtil.encodeObject(handler.getPictureAltML(), store));
    attributes.put("content", StoreUtil.encodeObject(handler.getContent(), store));
    attributes.put("contentML", StoreUtil.encodeObject(handler.getContentML(), store));
    attributes.put("relatedContents", StoreUtil.encodeObject(handler.getRelatedContents(), store));
    attributes.put("relatedContentsDBID", StoreUtil.encodeObject(handler.getRelatedContentsDBID(), store));
    attributes.put("mainLanguage", StoreUtil.encodeObject(handler.getMainLanguage(), store));
    attributes.put("title", StoreUtil.encodeObject(handler.getTitle(), store));
    attributes.put("titleML", StoreUtil.encodeObject(handler.getTitleML(), store));
    attributes.put("pdate", StoreUtil.encodeObject(handler.getPdate(), store));
    attributes.put("edate", StoreUtil.encodeObject(handler.getEdate(), store));
    attributes.put("sdate", StoreUtil.encodeObject(handler.getSdate(), store));
    attributes.put("adate", StoreUtil.encodeObject(handler.getAdate(), store));
    attributes.put("udate", StoreUtil.encodeObject(handler.getUdate(), store));
    attributes.put("majorVersion", String.valueOf(handler.getMajorVersion()));
    attributes.put("pstatus", String.valueOf(handler.getPstatus()));
    attributes.put("mergeDate", StoreUtil.encodeObject(handler.getMergeDate(), store));
    attributes.put("mergeId", StoreUtil.encodeObject(handler.getMergeId(), store));
    attributes.put("templates", StoreUtil.encodeObject(handler.getTemplates(), store));
    attributes.put("categories", StoreUtil.encodeObject(handler.getCategories(), store));
    attributes.put("authorizedMemberSet", StoreUtil.encodeObject(handler.getAuthorizedMemberSet(), store));
    attributes.put("authorizedMemberSetDBID", StoreUtil.encodeObject(handler.getAuthorizedMemberSetDBID(), store));
    attributes.put("authorizedGroupSet", StoreUtil.encodeObject(handler.getAuthorizedGroupSet(), store));
    attributes.put("updateMemberSet", StoreUtil.encodeObject(handler.getUpdateMemberSet(), store));
    attributes.put("updateGroupSet", StoreUtil.encodeObject(handler.getUpdateGroupSet(), store));
    attributes.put("restrictUpdateRights", String.valueOf(handler.getRestrictUpdateRights()));
    attributes.put("mainInstance", StoreUtil.encodeObject(handler.getMainInstance(), store));
    attributes.put("isTracked", String.valueOf(handler.isTracked()));
    attributes.put("readAck", String.valueOf(handler.getReadAck()));
    attributes.put("friendlyURLSet", StoreUtil.encodeObject(handler.getFriendlyURLSet(), store));
    attributes.put("workspace", StoreUtil.encodeObject(handler.getWorkspace(), store));
    attributes.put("roleMap", StoreUtil.encodeObject(handler.getRoleMap(), store));
    attributes.put("workflowId", StoreUtil.encodeObject(handler.getWorkflowId(), store));
    attributes.put("attachWorkspaceSet", StoreUtil.encodeObject(handler.getAttachWorkspaceSet(), store));
    attributes.put("author", StoreUtil.encodeObject(handler.getAuthor(), store));
    attributes.put("authorDBID", StoreUtil.encodeObject(handler.getAuthorDBID(), store));
    attributes.put("opAuthor", StoreUtil.encodeObject(handler.getOpAuthor(), store));
    attributes.put("opDelegate", StoreUtil.encodeObject(handler.getOpDelegate(), store));
    attributes.put("extension", StoreUtil.encodeObject(handler.getExtension(), store));
    attributes.put("importMap", StoreUtil.encodeObject(handler.getImportMap(), store));
    attributes.put("extraDataMap", StoreUtil.encodeObject(handler.getExtraDataMap(), store));
    attributes.put("cdate", StoreUtil.encodeObject(handler.getCdate(), store));
    attributes.put("mdate", StoreUtil.encodeObject(handler.getMdate(), store));
    return attributes;
  }
}
