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
public class EditPortletBlogHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletBlog theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletBlog.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletBlog  
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
  
    if ("displayedList".equals(field)) {
      return getAvailableDisplayedList();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("displayedList".equals(field)) {
      return PortletBlog.getDisplayedListValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("displayedList".equals(field)) {
      return PortletBlog.getDisplayedListLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletBlog  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletBlog() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletBlog()) {
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
    
    if (!validateCommonCreateUpdatePortletBlog()) {
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
    PortletBlog obj = (PortletBlog)data;
    obj.setDisplayedList(getAvailableDisplayedList());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletBlog) {
      super.setId(v);
      theContent = (PortletBlog)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // displayedList
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayedListTFE = channel.getTypeFieldEntry(PortletBlog.class, "displayedList", true);
  protected String displayedList = channel.getTypeFieldEntry(PortletBlog.class, "displayedList", true).getDefaultTextString();
  public void setDisplayedList(String[] v) {
    displayedList = getMonolingualValue(displayedListTFE, v);
  }
  public String getAvailableDisplayedList() {
    if (theContent != null && isFieldMissing("displayedList")) {
     String objectValue = theContent.getDisplayedList();
      return objectValue;
    }
    return displayedList;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 6nKx6dCzti//nTUTAI4Ejg==
