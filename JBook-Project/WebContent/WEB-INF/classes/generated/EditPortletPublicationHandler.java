// This file has been automatically generated.
package generated;


import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletPublicationHandler extends EditAbstractPortletSkinableHandler {

  protected PortletPublication theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletPublication.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletPublication
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("pub", __pubStr, com.jalios.jcms.Publication.class);
      if (data != null) {
        pub = (com.jalios.jcms.Publication)data;
      } else {
        isPubValidated = Util.isEmpty(__pubStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailablePub(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailablePub(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("pub".equals(field)) {
      return getAvailablePub();
    }

    if ("template".equals(field)) {
      return getAvailableTemplate();
    }

    if ("showDisplayHeader".equals(field)) {
      return getAvailableShowDisplayHeader();
    }

    if ("showDisplayFooter".equals(field)) {
      return getAvailableShowDisplayFooter();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("showDisplayHeader".equals(field)) {
      return PortletPublication.getShowDisplayHeaderValues();
    }
    if ("showDisplayFooter".equals(field)) {
      return PortletPublication.getShowDisplayFooterValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("showDisplayHeader".equals(field)) {
      return PortletPublication.getShowDisplayHeaderLabels(userLang);
    }
    if ("showDisplayFooter".equals(field)) {
      return PortletPublication.getShowDisplayFooterLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletPublication
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletPublication() {
    if (!isPubValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "pub", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletPublication()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletPublication()) {
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
    PortletPublication obj = (PortletPublication)data;
    obj.setPub(getAvailablePub());
    obj.setTemplate(getAvailableTemplate());
    obj.setShowDisplayHeader(getAvailableShowDisplayHeader());
    obj.setShowDisplayFooter(getAvailableShowDisplayFooter());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletPublication) {
      super.setId(v);
      theContent = (PortletPublication)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // pub
  // ----------------------------------------------------------------------
  protected TypeFieldEntry pubTFE = channel.getTypeFieldEntry(PortletPublication.class, "pub", true);
  protected boolean isPubValidated = true;
  protected com.jalios.jcms.Publication pub;
  String __pubStr = null;
  public void setPub(String v) {
    __pubStr = v;
  }
  public com.jalios.jcms.Publication getAvailablePub() {
    if (theContent != null && isFieldMissing("pub")) {
     com.jalios.jcms.Publication objectValue = theContent.getPub();
      return objectValue;
    }
    return pub;
  }




  // ----------------------------------------------------------------------
  // template
  // ----------------------------------------------------------------------
  protected TypeFieldEntry templateTFE = channel.getTypeFieldEntry(PortletPublication.class, "template", true);
  protected String template = channel.getTypeFieldEntry(PortletPublication.class, "template", true).getDefaultTextString();
  public void setTemplate(String[] v) {
    template = getMonolingualValue(templateTFE, v);
  }
  public String getAvailableTemplate() {
    if (theContent != null && isFieldMissing("template")) {
     String objectValue = theContent.getTemplate();
      return objectValue;
    }
    return template;
  }




  // ----------------------------------------------------------------------
  // showDisplayHeader
  // ----------------------------------------------------------------------
  protected TypeFieldEntry showDisplayHeaderTFE = channel.getTypeFieldEntry(PortletPublication.class, "showDisplayHeader", true);
  protected boolean showDisplayHeader = true;
  public void setShowDisplayHeader(boolean  v) {
    this.showDisplayHeader = v;
  }

  public boolean getAvailableShowDisplayHeader() {
    if (theContent != null && isFieldMissing("showDisplayHeader")) {
     boolean objectValue = theContent.getShowDisplayHeader();
      return objectValue;
    }
    return showDisplayHeader;
  }




  // ----------------------------------------------------------------------
  // showDisplayFooter
  // ----------------------------------------------------------------------
  protected TypeFieldEntry showDisplayFooterTFE = channel.getTypeFieldEntry(PortletPublication.class, "showDisplayFooter", true);
  protected boolean showDisplayFooter = true;
  public void setShowDisplayFooter(boolean  v) {
    this.showDisplayFooter = v;
  }

  public boolean getAvailableShowDisplayFooter() {
    if (theContent != null && isFieldMissing("showDisplayFooter")) {
     boolean objectValue = theContent.getShowDisplayFooter();
      return objectValue;
    }
    return showDisplayFooter;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// O1/H7s4NSomLCCGCK6LfGg==
