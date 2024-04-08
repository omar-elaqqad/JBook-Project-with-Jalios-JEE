// This file has been automatically generated.
package generated;


import java.util.HashMap;
import java.util.List;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditSmartPhonePortalHandler extends EditPublicationHandler {

  protected SmartPhonePortal theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return SmartPhonePortal.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpSmartPhonePortal
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      List<com.jalios.jcms.portlet.PortalElement> list = processDataIds("portlets",__portletsStr,com.jalios.jcms.portlet.PortalElement.class);
      this.portlets = list.toArray(new com.jalios.jcms.portlet.PortalElement[0]);
    }
    if (!validateUploadedFileDocument(getAvailablePortlets(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailablePortlets(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }

    if ("structure".equals(field)) {
      return getAvailableStructure();
    }

    if ("portlets".equals(field)) {
      return getAvailablePortlets();
    }

    if ("displayScrollToTop".equals(field)) {
      return getAvailableDisplayScrollToTop();
    }

    if ("pageTitle".equals(field)) {
      return getAllAvailablePageTitleML();
    }

    if ("image".equals(field)) {
      return getAvailableImage();
    }

    if ("css".equals(field)) {
      return getAvailableCss();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("displayScrollToTop".equals(field)) {
      return SmartPhonePortal.getDisplayScrollToTopValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("displayScrollToTop".equals(field)) {
      return SmartPhonePortal.getDisplayScrollToTopLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateSmartPhonePortal
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateSmartPhonePortal() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateSmartPhonePortal()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateSmartPhonePortal()) {
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
    SmartPhonePortal obj = (SmartPhonePortal)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setStructure(getAvailableStructure());
    obj.setPortlets(getAvailablePortlets());
    obj.setDisplayScrollToTop(getAvailableDisplayScrollToTop());
    obj.setPageTitle(getAvailablePageTitle());
    obj.setPageTitleML(getAvailablePageTitleML());
    obj.setImage(getAvailableImage());
    obj.setCss(getAvailableCss());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof SmartPhonePortal) {
      super.setId(v);
      theContent = (SmartPhonePortal)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "description", true);
  protected String description = channel.getTypeFieldEntry(SmartPhonePortal.class, "description", true).getDefaultTextString();
  protected HashMap<String,String> descriptionML = descriptionTFE.getDefaultTextMap();
  public void setDescription(String[] v) {
    description = getMultilingualMainValue(descriptionTFE, v);
    descriptionML = getMultilingualMLMap(descriptionTFE, v);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }


  public HashMap<String,String> getAllAvailableDescriptionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(SmartPhonePortal.class, "description", true).getDefaultTextString())) {
          return description;
      	}
      } else {
      	if (descriptionML != null && Util.notEmpty(descriptionML.get(lang))) {
      	  return descriptionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDescription(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return description;
    }
    return descriptionML == null ? "" : Util.getString(descriptionML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // structure
  // ----------------------------------------------------------------------
  protected TypeFieldEntry structureTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "structure", true);
  protected String structure = channel.getTypeFieldEntry(SmartPhonePortal.class, "structure", true).getDefaultTextString();
  public void setStructure(String[] v) {
    structure = getMonolingualValue(structureTFE, v);
  }
  public String getAvailableStructure() {
    if (theContent != null && isFieldMissing("structure")) {
     String objectValue = theContent.getStructure();
      return objectValue;
    }
    return structure;
  }




  // ----------------------------------------------------------------------
  // portlets
  // ----------------------------------------------------------------------
  protected TypeFieldEntry portletsTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "portlets", true);
  protected com.jalios.jcms.portlet.PortalElement[] portlets = new com.jalios.jcms.portlet.PortalElement[0];
  protected int portletsAddCount = 0;
  String[] __portletsStr = null;
  public void setPortlets(String[]  v) {
    __portletsStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement[] getAvailablePortlets() {
    if (theContent != null && isFieldMissing("portlets")) {
	  com.jalios.jcms.portlet.PortalElement[] objectValue = theContent.getPortlets();
      if (objectValue == null) {
        return portlets;
      }
      return objectValue;
    }
    return portlets;
  }



  public void setPortletsAddCount(int  v) {
    portletsAddCount = v;
  }

  public int getPortletsCount() {
    int arraySize = Util.getSize(getAvailablePortlets());
    int res = 3 + arraySize + portletsAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // displayScrollToTop
  // ----------------------------------------------------------------------
  protected TypeFieldEntry displayScrollToTopTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "displayScrollToTop", true);
  protected boolean displayScrollToTop = true;
  public void setDisplayScrollToTop(boolean  v) {
    this.displayScrollToTop = v;
  }

  public boolean getAvailableDisplayScrollToTop() {
    if (theContent != null && isFieldMissing("displayScrollToTop")) {
     boolean objectValue = theContent.getDisplayScrollToTop();
      return objectValue;
    }
    return displayScrollToTop;
  }




  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------
  protected TypeFieldEntry pageTitleTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "pageTitle", true);
  protected String pageTitle = channel.getTypeFieldEntry(SmartPhonePortal.class, "pageTitle", true).getDefaultTextString();
  protected HashMap<String,String> pageTitleML = pageTitleTFE.getDefaultTextMap();
  public void setPageTitle(String[] v) {
    pageTitle = getMultilingualMainValue(pageTitleTFE, v);
    pageTitleML = getMultilingualMLMap(pageTitleTFE, v);
  }
  public String getAvailablePageTitle() {
    if (theContent != null && isFieldMissing("pageTitle")) {
     String objectValue = theContent.getPageTitle();
      return objectValue;
    }
    return pageTitle;
  }


  public HashMap<String,String> getAllAvailablePageTitleML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePageTitleML());
    map.put(channel.getLanguage(),getAvailablePageTitle(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailablePageTitleML() {
    if (theContent != null && isFieldMissing("pageTitle")) {
      return theContent.getPageTitleML();
    }
    return pageTitleML;
  }
  public String getAvailablePageTitle(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pageTitle, channel.getTypeFieldEntry(SmartPhonePortal.class, "pageTitle", true).getDefaultTextString())) {
          return pageTitle;
      	}
      } else {
      	if (pageTitleML != null && Util.notEmpty(pageTitleML.get(lang))) {
      	  return pageTitleML.get(lang);
      	}
      }
      return Util.getString(theContent.getPageTitle(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return pageTitle;
    }
    return pageTitleML == null ? "" : Util.getString(pageTitleML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------
  protected TypeFieldEntry imageTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "image", true);
  protected String image = channel.getTypeFieldEntry(SmartPhonePortal.class, "image", true).getDefaultTextString();
  public void setImage(String[] v) {
    image = getMonolingualValue(imageTFE, v);
  }
  public String getAvailableImage() {
    if (theContent != null && isFieldMissing("image")) {
     String objectValue = theContent.getImage();
      return objectValue;
    }
    return image;
  }




  // ----------------------------------------------------------------------
  // css
  // ----------------------------------------------------------------------
  protected TypeFieldEntry cssTFE = channel.getTypeFieldEntry(SmartPhonePortal.class, "css", true);
  protected String css = channel.getTypeFieldEntry(SmartPhonePortal.class, "css", true).getDefaultTextString();
  public void setCss(String[] v) {
    css = getMonolingualValue(cssTFE, v);
  }
  public String getAvailableCss() {
    if (theContent != null && isFieldMissing("css")) {
     String objectValue = theContent.getCss();
      return objectValue;
    }
    return css;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// rE/yn6CgGPUNm0tJJJlHkg==
