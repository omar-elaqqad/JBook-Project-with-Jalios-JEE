// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletBookmarksHandler extends EditAbstractPortletSkinableHandler {

  protected PortletBookmarks theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletBookmarks.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletBookmarks
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

    if ("openLinksInNewWindow".equals(field)) {
      return getAvailableOpenLinksInNewWindow();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("openLinksInNewWindow".equals(field)) {
      return PortletBookmarks.getOpenLinksInNewWindowValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("openLinksInNewWindow".equals(field)) {
      return PortletBookmarks.getOpenLinksInNewWindowLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletBookmarks
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletBookmarks() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletBookmarks()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletBookmarks()) {
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
    PortletBookmarks obj = (PortletBookmarks)data;
    obj.setOpenLinksInNewWindow(getAvailableOpenLinksInNewWindow());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletBookmarks) {
      super.setId(v);
      theContent = (PortletBookmarks)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // openLinksInNewWindow
  // ----------------------------------------------------------------------
  protected TypeFieldEntry openLinksInNewWindowTFE = channel.getTypeFieldEntry(PortletBookmarks.class, "openLinksInNewWindow", true);
  protected boolean openLinksInNewWindow = false;
  public void setOpenLinksInNewWindow(boolean  v) {
    this.openLinksInNewWindow = v;
  }

  public boolean getAvailableOpenLinksInNewWindow() {
    if (theContent != null && isFieldMissing("openLinksInNewWindow")) {
     boolean objectValue = theContent.getOpenLinksInNewWindow();
      return objectValue;
    }
    return openLinksInNewWindow;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// MGqTK31eHfiXPz0PoOitIw==
