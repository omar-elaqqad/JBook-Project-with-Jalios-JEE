// This file has been automatically generated.
package generated;


import com.jalios.jcms.DataExtension;
import com.jalios.jcms.Member;
import com.jalios.jcms.handler.EditTypeExtensionHandler;
@SuppressWarnings({"unchecked", "unused"})
public class EditGroupExtensionHandler extends EditTypeExtensionHandler {

  GroupExtension theExtension;
  @Override
public Class getExtensionClass() {
    return GroupExtension.class;
  }
  @Override
public boolean isEmptyExtension() {
    return true;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpGroupExtension
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
  // validateCommonCreateUpdateGroupExtension
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGroupExtension() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateGroupExtension()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateGroupExtension()) {
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
    GroupExtension obj = (GroupExtension)data;
  }

  @Override
public void setExtension(DataExtension extension) {
    if (extension instanceof GroupExtension) {
      super.setExtension(extension);
      theExtension = (GroupExtension)extension;
    }
  }


}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// NA/eemyk86XCBudEFmc8Fg==
