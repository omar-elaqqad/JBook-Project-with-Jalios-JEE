// This file has been automatically generated.
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.jcms.wysiwyg.WysiwygManager;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditWebPageHandler extends EditPublicationHandler {
   
  protected WebPage theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return WebPage.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpWebPage  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("url".equals(field)) {
      return getAvailableUrl();
    }
    
    if ("urlToShot".equals(field)) {
      return getAvailableUrlToShot();
    }
    
    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateWebPage  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateWebPage() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateWebPage()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateWebPage()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    WebPage obj = (WebPage)data;
    obj.setUrl(getAvailableUrl());
    obj.setUrlToShot(getAvailableUrlToShot());
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof WebPage) {
      super.setId(v);
      theContent = (WebPage)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry urlTFE = channel.getTypeFieldEntry(WebPage.class, "url", true);
  protected String url = channel.getTypeFieldEntry(WebPage.class, "url", true).getDefaultTextString();
  public void setUrl(String[] v) {
    url = getMonolingualValue(urlTFE, v);
  }
  public String getAvailableUrl() {
    if (theContent != null && isFieldMissing("url")) {
     String objectValue = theContent.getUrl();
      return objectValue;
    }
    return url;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // urlToShot
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry urlToShotTFE = channel.getTypeFieldEntry(WebPage.class, "urlToShot", true);
  protected String urlToShot = channel.getTypeFieldEntry(WebPage.class, "urlToShot", true).getDefaultTextString();
  public void setUrlToShot(String[] v) {
    urlToShot = getMonolingualValue(urlToShotTFE, v);
  }
  public String getAvailableUrlToShot() {
    if (theContent != null && isFieldMissing("urlToShot")) {
     String objectValue = theContent.getUrlToShot();
      return objectValue;
    }
    return urlToShot;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(WebPage.class, "description", true);
  protected String description = channel.getTypeFieldEntry(WebPage.class, "description", true).getDefaultTextString();
  protected HashMap<String,String> descriptionML = descriptionTFE.getDefaultTextMap();
  public void setDescription(String[] v) {
    description = getMultilingualMainValue(descriptionTFE, v);
    descriptionML = getMultilingualMLMap(descriptionTFE, v);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }
  
    
  public HashMap<String,String> getAllAvailableDescriptionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(WebPage.class, "description", true).getDefaultTextString())) {
          return description;
      	}
      } else {
      	if (descriptionML != null && Util.notEmpty(descriptionML.get(lang))) {
      	  return descriptionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDescription(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return description;
    }
    return descriptionML == null ? "" : Util.getString(descriptionML.get(lang), "");
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 2EPI936ev/Xki/GC1To5Ag==
