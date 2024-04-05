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
public class EditPortletMemberProfileHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletMemberProfile theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletMemberProfile.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMemberProfile  
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
  
    if ("showSuggestions".equals(field)) {
      return getAvailableShowSuggestions();
    }
    
    if ("showConnectionRequests".equals(field)) {
      return getAvailableShowConnectionRequests();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("showSuggestions".equals(field)) {
      return PortletMemberProfile.getShowSuggestionsValues();
    }
    if ("showConnectionRequests".equals(field)) {
      return PortletMemberProfile.getShowConnectionRequestsValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("showSuggestions".equals(field)) {
      return PortletMemberProfile.getShowSuggestionsLabels(userLang);
    }
    if ("showConnectionRequests".equals(field)) {
      return PortletMemberProfile.getShowConnectionRequestsLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMemberProfile  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMemberProfile() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletMemberProfile()) {
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
    
    if (!validateCommonCreateUpdatePortletMemberProfile()) {
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
    PortletMemberProfile obj = (PortletMemberProfile)data;
    obj.setShowSuggestions(getAvailableShowSuggestions());
    obj.setShowConnectionRequests(getAvailableShowConnectionRequests());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMemberProfile) {
      super.setId(v);
      theContent = (PortletMemberProfile)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // showSuggestions
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showSuggestionsTFE = channel.getTypeFieldEntry(PortletMemberProfile.class, "showSuggestions", true);
  protected boolean showSuggestions = true;
  public void setShowSuggestions(boolean  v) {
    this.showSuggestions = v;
  }
  
  public boolean getAvailableShowSuggestions() {
    if (theContent != null && isFieldMissing("showSuggestions")) {
     boolean objectValue = theContent.getShowSuggestions();
      return objectValue;
    }
    return showSuggestions;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showConnectionRequests
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showConnectionRequestsTFE = channel.getTypeFieldEntry(PortletMemberProfile.class, "showConnectionRequests", true);
  protected boolean showConnectionRequests = true;
  public void setShowConnectionRequests(boolean  v) {
    this.showConnectionRequests = v;
  }
  
  public boolean getAvailableShowConnectionRequests() {
    if (theContent != null && isFieldMissing("showConnectionRequests")) {
     boolean objectValue = theContent.getShowConnectionRequests();
      return objectValue;
    }
    return showConnectionRequests;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// g5bvkYrRy0G751Eo4EaTiQ==
