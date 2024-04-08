// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditFormHandler;
@SuppressWarnings({"unchecked", "unused"})
public class EditSignUpHandler extends EditFormHandler {

  protected SignUp theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return SignUp.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpSignUp
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

    if ("firstName".equals(field)) {
      return getAvailableFirstName();
    }

    if ("email".equals(field)) {
      return getAvailableEmail();
    }

    if ("salutation".equals(field)) {
      return getAvailableSalutation();
    }

    if ("jobTitle".equals(field)) {
      return getAvailableJobTitle();
    }

    if ("favoriteLogin".equals(field)) {
      return getAvailableFavoriteLogin();
    }

    if ("message".equals(field)) {
      return getAvailableMessage();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("salutation".equals(field)) {
      return SignUp.getSalutationValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("salutation".equals(field)) {
      return SignUp.getSalutationLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateSignUp
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateSignUp() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateSignUp()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateSignUp()) {
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
    SignUp obj = (SignUp)data;
    obj.setName(getAvailableName());
    obj.setFirstName(getAvailableFirstName());
    obj.setEmail(getAvailableEmail());
    obj.setSalutation(getAvailableSalutation());
    obj.setJobTitle(getAvailableJobTitle());
    obj.setFavoriteLogin(getAvailableFavoriteLogin());
    obj.setMessage(getAvailableMessage());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof SignUp) {
      super.setId(v);
      theContent = (SignUp)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------
  protected TypeFieldEntry nameTFE = channel.getTypeFieldEntry(SignUp.class, "name", true);
  protected String name = channel.getTypeFieldEntry(SignUp.class, "name", true).getDefaultTextString();
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
  // firstName
  // ----------------------------------------------------------------------
  protected TypeFieldEntry firstNameTFE = channel.getTypeFieldEntry(SignUp.class, "firstName", true);
  protected String firstName = channel.getTypeFieldEntry(SignUp.class, "firstName", true).getDefaultTextString();
  public void setFirstName(String[] v) {
    firstName = getMonolingualValue(firstNameTFE, v);
  }
  public String getAvailableFirstName() {
    if (theContent != null && isFieldMissing("firstName")) {
     String objectValue = theContent.getFirstName();
      return objectValue;
    }
    return firstName;
  }




  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------
  protected TypeFieldEntry emailTFE = channel.getTypeFieldEntry(SignUp.class, "email", true);
  protected String email = channel.getTypeFieldEntry(SignUp.class, "email", true).getDefaultTextString();
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
  // salutation
  // ----------------------------------------------------------------------
  protected TypeFieldEntry salutationTFE = channel.getTypeFieldEntry(SignUp.class, "salutation", true);
  protected String salutation = channel.getTypeFieldEntry(SignUp.class, "salutation", true).getDefaultTextString();
  public void setSalutation(String[] v) {
    salutation = getMonolingualValue(salutationTFE, v);
  }
  public String getAvailableSalutation() {
    if (theContent != null && isFieldMissing("salutation")) {
     String objectValue = theContent.getSalutation();
      return objectValue;
    }
    return salutation;
  }




  // ----------------------------------------------------------------------
  // jobTitle
  // ----------------------------------------------------------------------
  protected TypeFieldEntry jobTitleTFE = channel.getTypeFieldEntry(SignUp.class, "jobTitle", true);
  protected String jobTitle = channel.getTypeFieldEntry(SignUp.class, "jobTitle", true).getDefaultTextString();
  public void setJobTitle(String[] v) {
    jobTitle = getMonolingualValue(jobTitleTFE, v);
  }
  public String getAvailableJobTitle() {
    if (theContent != null && isFieldMissing("jobTitle")) {
     String objectValue = theContent.getJobTitle();
      return objectValue;
    }
    return jobTitle;
  }




  // ----------------------------------------------------------------------
  // favoriteLogin
  // ----------------------------------------------------------------------
  protected TypeFieldEntry favoriteLoginTFE = channel.getTypeFieldEntry(SignUp.class, "favoriteLogin", true);
  protected String favoriteLogin = channel.getTypeFieldEntry(SignUp.class, "favoriteLogin", true).getDefaultTextString();
  public void setFavoriteLogin(String[] v) {
    favoriteLogin = getMonolingualValue(favoriteLoginTFE, v);
  }
  public String getAvailableFavoriteLogin() {
    if (theContent != null && isFieldMissing("favoriteLogin")) {
     String objectValue = theContent.getFavoriteLogin();
      return objectValue;
    }
    return favoriteLogin;
  }




  // ----------------------------------------------------------------------
  // message
  // ----------------------------------------------------------------------
  protected TypeFieldEntry messageTFE = channel.getTypeFieldEntry(SignUp.class, "message", true);
  protected String message = channel.getTypeFieldEntry(SignUp.class, "message", true).getDefaultTextString();
  public void setMessage(String[] v) {
    message = getMonolingualValue(messageTFE, v);
  }
  public String getAvailableMessage() {
    if (theContent != null && isFieldMissing("message")) {
     String objectValue = theContent.getMessage();
      return objectValue;
    }
    return message;
  }






  @Override
public boolean isNotifySubmit() {
    return true;
  }


}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// E/ctQBn6qorGwt9Nsp16Yw==
