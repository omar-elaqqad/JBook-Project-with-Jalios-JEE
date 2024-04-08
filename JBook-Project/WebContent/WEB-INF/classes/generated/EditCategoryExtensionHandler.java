// This file has been automatically generated.
package generated;


import com.jalios.jcms.DataExtension;
import com.jalios.jcms.Member;
import com.jalios.jcms.handler.EditTypeExtensionHandler;
@SuppressWarnings({"unchecked", "unused"})
public class EditCategoryExtensionHandler extends EditTypeExtensionHandler {

  CategoryExtension theExtension;
  @Override
public Class getExtensionClass() {
    return CategoryExtension.class;
  }
  @Override
public boolean isEmptyExtension() {
    return true;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpCategoryExtension
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
  // validateCommonCreateUpdateCategoryExtension
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateCategoryExtension() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateCategoryExtension()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateCategoryExtension()) {
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
    CategoryExtension obj = (CategoryExtension)data;
  }

  @Override
public void setExtension(DataExtension extension) {
    if (extension instanceof CategoryExtension) {
      super.setExtension(extension);
      theExtension = (CategoryExtension)extension;
    }
  }


}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// iGanjIf2rW5dDupoLCpXPg==
