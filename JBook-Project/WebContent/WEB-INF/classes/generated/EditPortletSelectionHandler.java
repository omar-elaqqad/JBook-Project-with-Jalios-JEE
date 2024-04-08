// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletSelectionHandler extends EditAbstractCollectionHandler {

  protected PortletSelection theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletSelection.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletSelection
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

    if ("showDisplayHeaderFooter".equals(field)) {
      return getAvailableShowDisplayHeaderFooter();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("showDisplayHeaderFooter".equals(field)) {
      return PortletSelection.getShowDisplayHeaderFooterValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("showDisplayHeaderFooter".equals(field)) {
      return PortletSelection.getShowDisplayHeaderFooterLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletSelection
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletSelection() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletSelection()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletSelection()) {
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
    PortletSelection obj = (PortletSelection)data;
    obj.setShowDisplayHeaderFooter(getAvailableShowDisplayHeaderFooter());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletSelection) {
      super.setId(v);
      theContent = (PortletSelection)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // showDisplayHeaderFooter
  // ----------------------------------------------------------------------
  protected TypeFieldEntry showDisplayHeaderFooterTFE = channel.getTypeFieldEntry(PortletSelection.class, "showDisplayHeaderFooter", true);
  protected boolean showDisplayHeaderFooter = true;
  public void setShowDisplayHeaderFooter(boolean  v) {
    this.showDisplayHeaderFooter = v;
  }

  public boolean getAvailableShowDisplayHeaderFooter() {
    if (theContent != null && isFieldMissing("showDisplayHeaderFooter")) {
     boolean objectValue = theContent.getShowDisplayHeaderFooter();
      return objectValue;
    }
    return showDisplayHeaderFooter;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// PJkm4IQlgV4XwnGDg0iwew==
