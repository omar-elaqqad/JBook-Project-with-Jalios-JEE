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
public class EditPortletLoggedMembersHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletLoggedMembers theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletLoggedMembers.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletLoggedMembers  
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
  
    if ("limitPortletAccess".equals(field)) {
      return getAvailableLimitPortletAccess();
    }
    
    if ("displayNumbers".equals(field)) {
      return getAvailableDisplayNumbers();
    }
    
    if ("displayMembers".equals(field)) {
      return getAvailableDisplayMembers();
    }
    
    if ("displayLinkToMembersProfile".equals(field)) {
      return getAvailableDisplayLinkToMembersProfile();
    }
    
    if ("maximumMembers".equals(field)) {
      return getAvailableMaximumMembers();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("limitPortletAccess".equals(field)) {
      return PortletLoggedMembers.getLimitPortletAccessValues();
    }
    if ("displayNumbers".equals(field)) {
      return PortletLoggedMembers.getDisplayNumbersValues();
    }
    if ("displayMembers".equals(field)) {
      return PortletLoggedMembers.getDisplayMembersValues();
    }
    if ("displayLinkToMembersProfile".equals(field)) {
      return PortletLoggedMembers.getDisplayLinkToMembersProfileValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("limitPortletAccess".equals(field)) {
      return PortletLoggedMembers.getLimitPortletAccessLabels(userLang);
    }
    if ("displayNumbers".equals(field)) {
      return PortletLoggedMembers.getDisplayNumbersLabels(userLang);
    }
    if ("displayMembers".equals(field)) {
      return PortletLoggedMembers.getDisplayMembersLabels(userLang);
    }
    if ("displayLinkToMembersProfile".equals(field)) {
      return PortletLoggedMembers.getDisplayLinkToMembersProfileLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletLoggedMembers  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletLoggedMembers() {
    if (!isMaximumMembersValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maximumMembers", userLang)));
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
    if (!validateCommonCreateUpdatePortletLoggedMembers()) {
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
    
    if (!validateCommonCreateUpdatePortletLoggedMembers()) {
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
    PortletLoggedMembers obj = (PortletLoggedMembers)data;
    obj.setLimitPortletAccess(getAvailableLimitPortletAccess());
    obj.setDisplayNumbers(getAvailableDisplayNumbers());
    obj.setDisplayMembers(getAvailableDisplayMembers());
    obj.setDisplayLinkToMembersProfile(getAvailableDisplayLinkToMembersProfile());
    obj.setMaximumMembers(getAvailableMaximumMembers());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletLoggedMembers) {
      super.setId(v);
      theContent = (PortletLoggedMembers)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // limitPortletAccess
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry limitPortletAccessTFE = channel.getTypeFieldEntry(PortletLoggedMembers.class, "limitPortletAccess", true);
  protected boolean limitPortletAccess = false;
  public void setLimitPortletAccess(boolean  v) {
    this.limitPortletAccess = v;
  }
  
  public boolean getAvailableLimitPortletAccess() {
    if (theContent != null && isFieldMissing("limitPortletAccess")) {
     boolean objectValue = theContent.getLimitPortletAccess();
      return objectValue;
    }
    return limitPortletAccess;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayNumbers
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayNumbersTFE = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayNumbers", true);
  protected boolean displayNumbers = true;
  public void setDisplayNumbers(boolean  v) {
    this.displayNumbers = v;
  }
  
  public boolean getAvailableDisplayNumbers() {
    if (theContent != null && isFieldMissing("displayNumbers")) {
     boolean objectValue = theContent.getDisplayNumbers();
      return objectValue;
    }
    return displayNumbers;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayMembers
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayMembersTFE = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayMembers", true);
  protected String displayMembers = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayMembers", true).getDefaultTextString();
  public void setDisplayMembers(String[] v) {
    displayMembers = getMonolingualValue(displayMembersTFE, v);
  }
  public String getAvailableDisplayMembers() {
    if (theContent != null && isFieldMissing("displayMembers")) {
     String objectValue = theContent.getDisplayMembers();
      return objectValue;
    }
    return displayMembers;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayLinkToMembersProfile
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayLinkToMembersProfileTFE = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayLinkToMembersProfile", true);
  protected boolean displayLinkToMembersProfile = true;
  public void setDisplayLinkToMembersProfile(boolean  v) {
    this.displayLinkToMembersProfile = v;
  }
  
  public boolean getAvailableDisplayLinkToMembersProfile() {
    if (theContent != null && isFieldMissing("displayLinkToMembersProfile")) {
     boolean objectValue = theContent.getDisplayLinkToMembersProfile();
      return objectValue;
    }
    return displayLinkToMembersProfile;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // maximumMembers
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry maximumMembersTFE = channel.getTypeFieldEntry(PortletLoggedMembers.class, "maximumMembers", true);
  protected boolean isMaximumMembersValidated = true;
  protected int maximumMembers = 10;
  public void setMaximumMembers(String v) {
    try {
      maximumMembers = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaximumMembersValidated = false;
    }
  }
  public int getAvailableMaximumMembers() {
    if (theContent != null && isFieldMissing("maximumMembers")) {
     int objectValue = theContent.getMaximumMembers();
      return objectValue;
    }
    return maximumMembers;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// IsYC/hwyk2fM6mlwppFEEg==
