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
public class EditPortletBirthdayHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletBirthday theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletBirthday.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletBirthday  
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
  
    if ("workspaceMembers".equals(field)) {
      return getAvailableWorkspaceMembers();
    }
    
    if ("relationshipFilter".equals(field)) {
      return getAvailableRelationshipFilter();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("workspaceMembers".equals(field)) {
      return PortletBirthday.getWorkspaceMembersValues();
    }
    if ("relationshipFilter".equals(field)) {
      return PortletBirthday.getRelationshipFilterValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("workspaceMembers".equals(field)) {
      return PortletBirthday.getWorkspaceMembersLabels(userLang);
    }
    if ("relationshipFilter".equals(field)) {
      return PortletBirthday.getRelationshipFilterLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletBirthday  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletBirthday() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletBirthday()) {
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
    
    if (!validateCommonCreateUpdatePortletBirthday()) {
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
    PortletBirthday obj = (PortletBirthday)data;
    obj.setWorkspaceMembers(getAvailableWorkspaceMembers());
    obj.setRelationshipFilter(getAvailableRelationshipFilter());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletBirthday) {
      super.setId(v);
      theContent = (PortletBirthday)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // workspaceMembers
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry workspaceMembersTFE = channel.getTypeFieldEntry(PortletBirthday.class, "workspaceMembers", true);
  protected boolean workspaceMembers = false;
  public void setWorkspaceMembers(boolean  v) {
    this.workspaceMembers = v;
  }
  
  public boolean getAvailableWorkspaceMembers() {
    if (theContent != null && isFieldMissing("workspaceMembers")) {
     boolean objectValue = theContent.getWorkspaceMembers();
      return objectValue;
    }
    return workspaceMembers;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // relationshipFilter
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry relationshipFilterTFE = channel.getTypeFieldEntry(PortletBirthday.class, "relationshipFilter", true);
  protected boolean relationshipFilter = false;
  public void setRelationshipFilter(boolean  v) {
    this.relationshipFilter = v;
  }
  
  public boolean getAvailableRelationshipFilter() {
    if (theContent != null && isFieldMissing("relationshipFilter")) {
     boolean objectValue = theContent.getRelationshipFilter();
      return objectValue;
    }
    return relationshipFilter;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// YZK3i4qLSUtVA4UKrh50IA==
