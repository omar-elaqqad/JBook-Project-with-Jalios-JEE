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
public class EditGuestCreaHandler extends com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestCreationSuperHandler {
   
  protected GuestCrea theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return GuestCrea.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpGuestCrea  
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
    
    if ("firstname".equals(field)) {
      return getAvailableFirstname();
    }
    
    if ("email".equals(field)) {
      return getAvailableEmail();
    }
    
    if ("organization".equals(field)) {
      return getAvailableOrganization();
    }
    
    if ("language".equals(field)) {
      return getAvailableLanguage();
    }
    
    if ("country".equals(field)) {
      return getAvailableCountry();
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
  // validateCommonCreateUpdateGuestCrea  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGuestCrea() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateGuestCrea()) {
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
    
    if (!validateCommonCreateUpdateGuestCrea()) {
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
    GuestCrea obj = (GuestCrea)data;
    obj.setName(getAvailableName());
    obj.setFirstname(getAvailableFirstname());
    obj.setEmail(getAvailableEmail());
    obj.setOrganization(getAvailableOrganization());
    obj.setLanguage(getAvailableLanguage());
    obj.setCountry(getAvailableCountry());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof GuestCrea) {
      super.setId(v);
      theContent = (GuestCrea)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry nameTFE = channel.getTypeFieldEntry(GuestCrea.class, "name", true);
  protected String name = channel.getTypeFieldEntry(GuestCrea.class, "name", true).getDefaultTextString();
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
  
    
  
   
  // ----------------------------------------------------------------------
  // firstname
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry firstnameTFE = channel.getTypeFieldEntry(GuestCrea.class, "firstname", true);
  protected String firstname = channel.getTypeFieldEntry(GuestCrea.class, "firstname", true).getDefaultTextString();
  public void setFirstname(String[] v) {
    firstname = getMonolingualValue(firstnameTFE, v);
  }
  public String getAvailableFirstname() {
    if (theContent != null && isFieldMissing("firstname")) {
     String objectValue = theContent.getFirstname();
      return objectValue;
    }
    return firstname;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry emailTFE = channel.getTypeFieldEntry(GuestCrea.class, "email", true);
  protected String email = channel.getTypeFieldEntry(GuestCrea.class, "email", true).getDefaultTextString();
  public void setEmail(String[] v) {
    email = getMonolingualValue(emailTFE, v);
  }
  public String getAvailableEmail() {
    if (theContent != null && isFieldMissing("email")) {
     String objectValue = theContent.getEmail();
      return objectValue;
    }
    return email;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // organization
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry organizationTFE = channel.getTypeFieldEntry(GuestCrea.class, "organization", true);
  protected String organization = channel.getTypeFieldEntry(GuestCrea.class, "organization", true).getDefaultTextString();
  public void setOrganization(String[] v) {
    organization = getMonolingualValue(organizationTFE, v);
  }
  public String getAvailableOrganization() {
    if (theContent != null && isFieldMissing("organization")) {
     String objectValue = theContent.getOrganization();
      return objectValue;
    }
    return organization;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // language
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry languageTFE = channel.getTypeFieldEntry(GuestCrea.class, "language", true);
  protected String language = channel.getTypeFieldEntry(GuestCrea.class, "language", true).getDefaultTextString();
  public void setLanguage(String[] v) {
    language = getMonolingualValue(languageTFE, v);
  }
  public String getAvailableLanguage() {
    if (theContent != null && isFieldMissing("language")) {
     String objectValue = theContent.getLanguage();
      return objectValue;
    }
    return language;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // country
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry countryTFE = channel.getTypeFieldEntry(GuestCrea.class, "country", true);
  protected String country = channel.getTypeFieldEntry(GuestCrea.class, "country", true).getDefaultTextString();
  public void setCountry(String[] v) {
    country = getMonolingualValue(countryTFE, v);
  }
  public String getAvailableCountry() {
    if (theContent != null && isFieldMissing("country")) {
     String objectValue = theContent.getCountry();
      return objectValue;
    }
    return country;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// wDfWXb9xm6QQTV/vT2v5/Q==
