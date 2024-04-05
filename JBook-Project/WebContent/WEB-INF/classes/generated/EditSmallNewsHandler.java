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
public class EditSmallNewsHandler extends EditPublicationHandler {
   
  protected SmallNews theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return SmallNews.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpSmallNews  
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
  
    if ("intro".equals(field)) {
      return getAllAvailableIntroML();
    }
    
    if ("content".equals(field)) {
      return getAllAvailableContentML();
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
  // validateCommonCreateUpdateSmallNews  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateSmallNews() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateSmallNews()) {
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
    
    if (!validateCommonCreateUpdateSmallNews()) {
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
    SmallNews obj = (SmallNews)data;
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setContent(getAvailableContent());
    obj.setContentML(getAvailableContentML());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof SmallNews) {
      super.setId(v);
      theContent = (SmallNews)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry introTFE = channel.getTypeFieldEntry(SmallNews.class, "intro", true);
  protected String intro = channel.getTypeFieldEntry(SmallNews.class, "intro", true).getDefaultTextString();
  protected HashMap<String,String> introML = introTFE.getDefaultTextMap();
  public void setIntro(String[] v) {
    intro = getMultilingualMainValue(introTFE, v);
    introML = getMultilingualMLMap(introTFE, v);
  }
  public String getAvailableIntro() {
    if (theContent != null && isFieldMissing("intro")) {
     String objectValue = theContent.getIntro();
      return objectValue;
    }
    return intro;
  }
  
    
  public HashMap<String,String> getAllAvailableIntroML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableIntroML());
    map.put(channel.getLanguage(),getAvailableIntro(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableIntroML() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntroML();
    }
    return introML;
  }
  public String getAvailableIntro(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(SmallNews.class, "intro", true).getDefaultTextString())) {
          return intro;
      	}
      } else {
      	if (introML != null && Util.notEmpty(introML.get(lang))) {
      	  return introML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntro(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return intro;
    }
    return introML == null ? "" : Util.getString(introML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry contentTFE = channel.getTypeFieldEntry(SmallNews.class, "content", true);
  protected String content = channel.getTypeFieldEntry(SmallNews.class, "content", true).getDefaultTextString();
  protected HashMap<String,String> contentML = contentTFE.getDefaultTextMap();
  public void setContent(String[] v) {
    content = getMultilingualMainValue(contentTFE, v);
    contentML = getMultilingualMLMap(contentTFE, v);
  }
  public String getAvailableContent() {
    if (theContent != null && isFieldMissing("content")) {
     String objectValue = theContent.getContent();
      return objectValue;
    }
    return content;
  }
  
    
  public HashMap<String,String> getAllAvailableContentML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableContentML());
    map.put(channel.getLanguage(),getAvailableContent(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableContentML() {
    if (theContent != null && isFieldMissing("content")) {
      return theContent.getContentML();
    }
    return contentML;
  }
  public String getAvailableContent(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(content, channel.getTypeFieldEntry(SmallNews.class, "content", true).getDefaultTextString())) {
          return content;
      	}
      } else {
      	if (contentML != null && Util.notEmpty(contentML.get(lang))) {
      	  return contentML.get(lang);
      	}
      }
      return Util.getString(theContent.getContent(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return content;
    }
    return contentML == null ? "" : Util.getString(contentML.get(lang), "");
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// NIWH6zZg5GDT5qplGnb20A==
