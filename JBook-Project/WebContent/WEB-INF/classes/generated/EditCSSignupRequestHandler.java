// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditFormHandler;
@SuppressWarnings({"unchecked", "unused"})
public class EditCSSignupRequestHandler extends EditFormHandler {

  protected CSSignupRequest theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return CSSignupRequest.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpCSSignupRequest
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
  // validateCommonCreateUpdateCSSignupRequest
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateCSSignupRequest() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateCSSignupRequest()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateCSSignupRequest()) {
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
    CSSignupRequest obj = (CSSignupRequest)data;
    obj.setName(getAvailableName());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof CSSignupRequest) {
      super.setId(v);
      theContent = (CSSignupRequest)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------
  protected TypeFieldEntry nameTFE = channel.getTypeFieldEntry(CSSignupRequest.class, "name", true);
  protected String name = channel.getTypeFieldEntry(CSSignupRequest.class, "name", true).getDefaultTextString();
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






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// Rw7CRsCAnf+C7wPL7Lmv6g==
