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
public class EditPortletWYSIWYGHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletWYSIWYG theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletWYSIWYG.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletWYSIWYG  
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
  
    if ("wysiwyg".equals(field)) {
      return getAllAvailableWysiwygML();
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
  // validateCommonCreateUpdatePortletWYSIWYG  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletWYSIWYG() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletWYSIWYG()) {
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
    
    if (!validateCommonCreateUpdatePortletWYSIWYG()) {
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
    PortletWYSIWYG obj = (PortletWYSIWYG)data;
    obj.setWysiwyg(getAvailableWysiwyg());
    obj.setWysiwygML(getAvailableWysiwygML());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletWYSIWYG) {
      super.setId(v);
      theContent = (PortletWYSIWYG)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // wysiwyg
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry wysiwygTFE = channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true);
  protected String wysiwyg = channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextString();
  protected HashMap<String,String> wysiwygML = wysiwygTFE.getDefaultTextMap();
  public void setWysiwyg(String[] v) {
    wysiwyg = getMultilingualMainValue(wysiwygTFE, v);
    wysiwygML = getMultilingualMLMap(wysiwygTFE, v);
  }
  public String getAvailableWysiwyg() {
    if (theContent != null && isFieldMissing("wysiwyg")) {
     String objectValue = theContent.getWysiwyg();
      return objectValue;
    }
    return wysiwyg;
  }
  
    
  public HashMap<String,String> getAllAvailableWysiwygML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableWysiwygML());
    map.put(channel.getLanguage(),getAvailableWysiwyg(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableWysiwygML() {
    if (theContent != null && isFieldMissing("wysiwyg")) {
      return theContent.getWysiwygML();
    }
    return wysiwygML;
  }
  public String getAvailableWysiwyg(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(wysiwyg, channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextString())) {
          return wysiwyg;
      	}
      } else {
      	if (wysiwygML != null && Util.notEmpty(wysiwygML.get(lang))) {
      	  return wysiwygML.get(lang);
      	}
      }
      return Util.getString(theContent.getWysiwyg(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return wysiwyg;
    }
    return wysiwygML == null ? "" : Util.getString(wysiwygML.get(lang), "");
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// H7dCoILRQePJ89nAut8x5g==
