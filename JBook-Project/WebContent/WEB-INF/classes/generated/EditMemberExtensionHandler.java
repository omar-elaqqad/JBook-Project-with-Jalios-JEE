// This file has been automatically generated.
package generated;


import com.jalios.jcms.DataExtension;
import com.jalios.jcms.Member;
import com.jalios.jcms.handler.EditTypeExtensionHandler;
@SuppressWarnings({"unchecked", "unused"})
public class EditMemberExtensionHandler extends EditTypeExtensionHandler {

  MemberExtension theExtension;
  @Override
public Class getExtensionClass() {
    return MemberExtension.class;
  }
  @Override
public boolean isEmptyExtension() {
    return true;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpMemberExtension
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
  // validateCommonCreateUpdateMemberExtension
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateMemberExtension() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateMemberExtension()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateMemberExtension()) {
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
public void setFields(DataExtension data) {
    super.setFields(data);
    MemberExtension obj = (MemberExtension)data;
  }

  @Override
public void setExtension(DataExtension extension) {
    if (extension instanceof MemberExtension) {
      super.setExtension(extension);
      theExtension = (MemberExtension)extension;
    }
  }


}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// d1GhyRo+/sgkC8g//xY5Pw==
