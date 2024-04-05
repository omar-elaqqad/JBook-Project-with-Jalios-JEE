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
public class EditPortletBookmarksHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletBookmarks theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletBookmarks.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletBookmarks  
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
  
    if ("openLinksInNewWindow".equals(field)) {
      return getAvailableOpenLinksInNewWindow();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("openLinksInNewWindow".equals(field)) {
      return PortletBookmarks.getOpenLinksInNewWindowValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("openLinksInNewWindow".equals(field)) {
      return PortletBookmarks.getOpenLinksInNewWindowLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletBookmarks  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletBookmarks() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletBookmarks()) {
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
    
    if (!validateCommonCreateUpdatePortletBookmarks()) {
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
    PortletBookmarks obj = (PortletBookmarks)data;
    obj.setOpenLinksInNewWindow(getAvailableOpenLinksInNewWindow());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletBookmarks) {
      super.setId(v);
      theContent = (PortletBookmarks)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // openLinksInNewWindow
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry openLinksInNewWindowTFE = channel.getTypeFieldEntry(PortletBookmarks.class, "openLinksInNewWindow", true);
  protected boolean openLinksInNewWindow = false;
  public void setOpenLinksInNewWindow(boolean  v) {
    this.openLinksInNewWindow = v;
  }
  
  public boolean getAvailableOpenLinksInNewWindow() {
    if (theContent != null && isFieldMissing("openLinksInNewWindow")) {
     boolean objectValue = theContent.getOpenLinksInNewWindow();
      return objectValue;
    }
    return openLinksInNewWindow;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// MGqTK31eHfiXPz0PoOitIw==
