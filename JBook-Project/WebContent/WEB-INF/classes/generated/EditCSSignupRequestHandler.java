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
public class EditCSSignupRequestHandler extends EditFormHandler {
   
  protected CSSignupRequest theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return CSSignupRequest.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpCSSignupRequest  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getAvailableAuthor();
    
    
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("name".equals(field)) {
      return getAvailableName();
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
  // validateCommonCreateUpdateCSSignupRequest  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateCSSignupRequest() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateCSSignupRequest()) {
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
    
    if (!validateCommonCreateUpdateCSSignupRequest()) {
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
    CSSignupRequest obj = (CSSignupRequest)data;
    obj.setName(getAvailableName());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof CSSignupRequest) {
      super.setId(v);
      theContent = (CSSignupRequest)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry nameTFE = channel.getTypeFieldEntry(CSSignupRequest.class, "name", true);
  protected String name = channel.getTypeFieldEntry(CSSignupRequest.class, "name", true).getDefaultTextString();
  public void setName(String[] v) {
    name = getMonolingualValue(nameTFE, v);
  }
  public String getAvailableName() {
    if (theContent != null && isFieldMissing("name")) {
     String objectValue = theContent.getName();
      return objectValue;
    }
    return name;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// Rw7CRsCAnf+C7wPL7Lmv6g==
