// This class was automatically generated by jsc. Please, do not edit.
// Generation date: Thu Apr 04 15:21:55 WET 2024

package generated;

import java.util.*;
import com.jalios.jstore.*;

@SuppressWarnings("unchecked")
public class MemberExtension_HANDLER implements com.jalios.jstore.StorableHandler {

  @SuppressWarnings("rawtypes")
  public void setAttributes(com.jalios.jstore.Storable storable, StorableLogEntry sle, com.jalios.jstore.Store store) {
    MemberExtension handler = (generated.MemberExtension)storable;
    String value;
    Map<String,String> attributes = sle.getAttributes();
    value = attributes.get("author");
    if (value != null) {
      handler.setAuthor((com.jalios.jcms.Member)StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "author")));
    }

    value = attributes.get("authorDBID");
    if (value != null) {
      handler.setAuthorDBID((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "authorDBID")));
    }

    value = attributes.get("opAuthor");
    if (value != null) {
      handler.setOpAuthor((com.jalios.jcms.Member)StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opAuthor")));
    }

    value = attributes.get("opDelegate");
    if (value != null) {
      handler.setOpDelegate((com.jalios.jcms.Member)StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opDelegate")));
    }

    value = attributes.get("extension");
    if (value != null) {
      handler.setExtension((com.jalios.jcms.DataExtension)StoreUtil.decodeObject(com.jalios.jcms.DataExtension.class, value, store, new DecodeContext(sle, "extension")));
    }

    value = attributes.get("importMap");
    if (value != null) {
      handler.setImportMap((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "importMap")));
    }

    value = attributes.get("extraDataMap");
    if (value != null) {
      handler.setExtraDataMap((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "extraDataMap")));
    }

    value = attributes.get("cdate");
    if (value != null) {
      handler.setCdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "cdate")));
    }

    value = attributes.get("mdate");
    if (value != null) {
      handler.setMdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mdate")));
    }

  }

  public Map<String,String> getAttributes(com.jalios.jstore.Storable storable, com.jalios.jstore.Store store) {
    generated.MemberExtension handler = (generated.MemberExtension)storable;
    Map<String,String> attributes = new HashMap<String,String>();
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
