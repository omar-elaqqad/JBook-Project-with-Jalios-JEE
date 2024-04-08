// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditGuestCreaHandler extends com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestCreationSuperHandler {

  protected GuestCrea theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return GuestCrea.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpGuestCrea
  // ----------------------------------------------------------------------

  @Override
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
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateGuestCrea()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateGuestCrea()) {
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
    GuestCrea obj = (GuestCrea)data;
    obj.setName(getAvailableName());
    obj.setFirstname(getAvailableFirstname());
    obj.setEmail(getAvailableEmail());
    obj.setOrganization(getAvailableOrganization());
    obj.setLanguage(getAvailableLanguage());
    obj.setCountry(getAvailableCountry());
  }

  @Override
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
