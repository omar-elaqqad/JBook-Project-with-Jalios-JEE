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
public class EditPortletMemberStatusHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletMemberStatus theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletMemberStatus.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMemberStatus  
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
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("workspaceMembers".equals(field)) {
      return PortletMemberStatus.getWorkspaceMembersValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("workspaceMembers".equals(field)) {
      return PortletMemberStatus.getWorkspaceMembersLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMemberStatus  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMemberStatus() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletMemberStatus()) {
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
    
    if (!validateCommonCreateUpdatePortletMemberStatus()) {
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
    PortletMemberStatus obj = (PortletMemberStatus)data;
    obj.setWorkspaceMembers(getAvailableWorkspaceMembers());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMemberStatus) {
      super.setId(v);
      theContent = (PortletMemberStatus)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // workspaceMembers
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry workspaceMembersTFE = channel.getTypeFieldEntry(PortletMemberStatus.class, "workspaceMembers", true);
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
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// cjsrD6gHbeHaB/oL6Lm7UA==
