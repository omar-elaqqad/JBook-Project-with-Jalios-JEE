// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletMemberStatusHandler extends EditAbstractPortletSkinableHandler {

  protected PortletMemberStatus theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletMemberStatus.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMemberStatus
  // ----------------------------------------------------------------------

  @Override
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
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletMemberStatus()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletMemberStatus()) {
      return false;
    }

    return true;
  }

  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  @Override
protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  @Override
protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  @Override
protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  @Override
public void setFields(Publication data) {
    super.setFields(data);
    PortletMemberStatus obj = (PortletMemberStatus)data;
    obj.setWorkspaceMembers(getAvailableWorkspaceMembers());
  }

  @Override
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
