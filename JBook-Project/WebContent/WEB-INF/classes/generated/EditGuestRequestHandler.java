// This file has been automatically generated.
package generated;


import java.util.List;
import java.util.Set;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditFormHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditGuestRequestHandler extends EditFormHandler {

  protected GuestRequest theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return GuestRequest.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpGuestRequest
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getAvailableAuthor();


    {
      List<com.jalios.jcms.Group> list = processDataIds("groups",__groupsStr,com.jalios.jcms.Group.class);
      this.groups = list.toArray(new com.jalios.jcms.Group[0]);
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("groups".equals(field)) {
      return getAvailableGroups();
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
  // validateCommonCreateUpdateGuestRequest
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGuestRequest() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateGuestRequest()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateGuestRequest()) {
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
    GuestRequest obj = (GuestRequest)data;
    if (data == null || !Util.isSameContent(((GuestRequest)data).getGroups(), Util.getHashSet(getAvailableGroups()))) {
      obj.setGroups(Util.getHashSet(getAvailableGroups()));
    }
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof GuestRequest) {
      super.setId(v);
      theContent = (GuestRequest)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // groups
  // ----------------------------------------------------------------------
  protected TypeFieldEntry groupsTFE = channel.getTypeFieldEntry(GuestRequest.class, "groups", true);
  protected com.jalios.jcms.Group[] groups = new com.jalios.jcms.Group[0];
  protected int groupsAddCount = 0;
  String[] __groupsStr = null;
  public void setGroups(String[]  v) {
    __groupsStr = v;
  }
  public com.jalios.jcms.Group[] getAvailableGroups() {
    if (theContent != null && isFieldMissing("groups")) {
	  Set<com.jalios.jcms.Group> objectValue = theContent.getGroups();
      if (objectValue == null) {
        return groups;
      }
      return objectValue.toArray(new com.jalios.jcms.Group[objectValue.size()]);
    }
    return groups;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 4bAo6B4VO937mvc0sdwFNg==
