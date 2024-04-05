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
public class EditMicroBloggingHandler extends com.jalios.jcmsplugin.esn.EditAbstractMicroBloggingHandler {
   
  protected MicroBlogging theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return MicroBlogging.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpMicroBlogging  
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
  
    if ("text".equals(field)) {
      return getAvailableText();
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
  // validateCommonCreateUpdateMicroBlogging  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateMicroBlogging() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateMicroBlogging()) {
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
    
    if (!validateCommonCreateUpdateMicroBlogging()) {
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
    MicroBlogging obj = (MicroBlogging)data;
    obj.setText(getAvailableText());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof MicroBlogging) {
      super.setId(v);
      theContent = (MicroBlogging)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // text
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry textTFE = channel.getTypeFieldEntry(MicroBlogging.class, "text", true);
  protected String text = channel.getTypeFieldEntry(MicroBlogging.class, "text", true).getDefaultTextString();
  public void setText(String[] v) {
    text = getMonolingualValue(textTFE, v);
  }
  public String getAvailableText() {
    if (theContent != null && isFieldMissing("text")) {
     String objectValue = theContent.getText();
      return objectValue;
    }
    return text;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 1es+YLKDA3jhfnmdZNthHA==
