// This file has been automatically generated.
package generated;


import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditGuestConvHandler extends com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestConversionSuperHandler {

  protected GuestConv theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return GuestConv.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpGuestConv
  // ----------------------------------------------------------------------

  @Override
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
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateGuestConv()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateGuestConv()) {
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
    GuestConv obj = (GuestConv)data;
    obj.setContact(getAvailableContact());
  }

  @Override
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
