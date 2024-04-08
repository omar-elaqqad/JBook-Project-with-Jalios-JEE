// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletJspHandler extends EditAbstractPortletSkinableHandler {

  protected PortletJsp theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletJsp.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletJsp
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

    if ("jsp".equals(field)) {
      return getAvailableJsp();
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
  // validateCommonCreateUpdatePortletJsp
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletJsp() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletJsp()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletJsp()) {
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
    PortletJsp obj = (PortletJsp)data;
    obj.setJsp(getAvailableJsp());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletJsp) {
      super.setId(v);
      theContent = (PortletJsp)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // jsp
  // ----------------------------------------------------------------------
  protected TypeFieldEntry jspTFE = channel.getTypeFieldEntry(PortletJsp.class, "jsp", true);
  protected String jsp = channel.getTypeFieldEntry(PortletJsp.class, "jsp", true).getDefaultTextString();
  public void setJsp(String[] v) {
    jsp = getMonolingualValue(jspTFE, v);
  }
  public String getAvailableJsp() {
    if (theContent != null && isFieldMissing("jsp")) {
     String objectValue = theContent.getJsp();
      return objectValue;
    }
    return jsp;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// /ML4LSM2j2KHiL1W2Vh61Q==
