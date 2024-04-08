// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletMyLocksHandler extends EditAbstractPortletSkinableHandler {

  protected PortletMyLocks theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletMyLocks.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMyLocks
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

    if ("refineWorkspace".equals(field)) {
      return getAvailableRefineWorkspace();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("refineWorkspace".equals(field)) {
      return PortletMyLocks.getRefineWorkspaceValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("refineWorkspace".equals(field)) {
      return PortletMyLocks.getRefineWorkspaceLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMyLocks
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMyLocks() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletMyLocks()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletMyLocks()) {
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
    PortletMyLocks obj = (PortletMyLocks)data;
    obj.setRefineWorkspace(getAvailableRefineWorkspace());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMyLocks) {
      super.setId(v);
      theContent = (PortletMyLocks)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // refineWorkspace
  // ----------------------------------------------------------------------
  protected TypeFieldEntry refineWorkspaceTFE = channel.getTypeFieldEntry(PortletMyLocks.class, "refineWorkspace", true);
  protected boolean refineWorkspace = false;
  public void setRefineWorkspace(boolean  v) {
    this.refineWorkspace = v;
  }

  public boolean getAvailableRefineWorkspace() {
    if (theContent != null && isFieldMissing("refineWorkspace")) {
     boolean objectValue = theContent.getRefineWorkspace();
      return objectValue;
    }
    return refineWorkspace;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// OaTe5H/G/sA4hzlWoHN77Q==
