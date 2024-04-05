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
public class EditGuestConvHandler extends com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestConversionSuperHandler {
   
  protected GuestConv theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return GuestConv.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpGuestConv  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getAvailableAuthor();
    
    
    {
      Data data = processDataId("contact", __contactStr, com.jalios.jcms.Member.class);
      if (data != null) { 
        contact = (com.jalios.jcms.Member)data;
      } else {
        isContactValidated = Util.isEmpty(__contactStr);
      }
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("contact".equals(field)) {
      return getAvailableContact();
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
  // validateCommonCreateUpdateGuestConv  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGuestConv() {
    if (!isContactValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "contact", userLang)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateGuestConv()) {
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
    
    if (!validateCommonCreateUpdateGuestConv()) {
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
    GuestConv obj = (GuestConv)data;
    obj.setContact(getAvailableContact());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof GuestConv) {
      super.setId(v);
      theContent = (GuestConv)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // contact
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry contactTFE = channel.getTypeFieldEntry(GuestConv.class, "contact", true);
  protected boolean isContactValidated = true;
  protected com.jalios.jcms.Member contact;
  String __contactStr = null;
  public void setContact(String v) {
    __contactStr = v;
  }
  public com.jalios.jcms.Member getAvailableContact() {
    if (theContent != null && isFieldMissing("contact")) {
     com.jalios.jcms.Member objectValue = theContent.getContact();
      return objectValue;
    }
    return contact;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 8PbRC5w++vfVz+QgON94cg==
