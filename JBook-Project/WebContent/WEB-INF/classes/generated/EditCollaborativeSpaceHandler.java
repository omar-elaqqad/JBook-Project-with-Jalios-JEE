// This file has been automatically generated.
package generated;


import java.util.HashMap;
import java.util.List;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditCollaborativeSpaceHandler extends generated.EditAbstractCollectionHandler {

  protected CollaborativeSpace theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return CollaborativeSpace.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpCollaborativeSpace
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("followersGroup", __followersGroupStr, com.jalios.jcms.Group.class);
      if (data != null) {
        followersGroup = (com.jalios.jcms.Group)data;
      } else {
        isFollowersGroupValidated = Util.isEmpty(__followersGroupStr);
      }
    }
    {
      Data data = processDataId("jportal", __jportalStr, com.jalios.jcms.jportal.AbstractJPortal.class);
      if (data != null) {
        jportal = (com.jalios.jcms.jportal.AbstractJPortal)data;
      } else {
        isJportalValidated = Util.isEmpty(__jportalStr);
      }
    }
    {
      Data data = processDataId("model", __modelStr, com.jalios.jcms.workspace.Workspace.class);
      if (data != null) {
        model = (com.jalios.jcms.workspace.Workspace)data;
      } else {
        isModelValidated = Util.isEmpty(__modelStr);
      }
    }
    {
      List<com.jalios.jcms.portlet.PortalElement> list = processDataIds("applications",__applicationsStr,com.jalios.jcms.portlet.PortalElement.class);
      this.applications = list.toArray(new com.jalios.jcms.portlet.PortalElement[0]);
    }
    {
      List<com.jalios.jcms.portlet.PortalElement> list = processDataIds("mobilePortlets",__mobilePortletsStr,com.jalios.jcms.portlet.PortalElement.class);
      this.mobilePortlets = list.toArray(new com.jalios.jcms.portlet.PortalElement[0]);
    }
    if (!validateUploadedFileDocument(getAvailableJportal(),   fdauthor, getAvailableWorkspace()) || !validateUploadedFileDocument(getAvailableModel(),   fdauthor, getAvailableWorkspace()) || !validateUploadedFileDocument(getAvailableApplications(),   fdauthor, getAvailableWorkspace()) || !validateUploadedFileDocument(getAvailableMobilePortlets(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableJportal(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableModel(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableApplications(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableMobilePortlets(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }

    if ("introduction".equals(field)) {
      return getAllAvailableIntroductionML();
    }

    if ("accessPolicy".equals(field)) {
      return getAvailableAccessPolicy();
    }

    if ("signupPolicy".equals(field)) {
      return getAvailableSignupPolicy();
    }

    if ("followersGroup".equals(field)) {
      return getAvailableFollowersGroup();
    }

    if ("layout".equals(field)) {
      return getAvailableLayout();
    }

    if ("dashboardColumnCount".equals(field)) {
      return getAvailableDashboardColumnCount();
    }

    if ("theme".equals(field)) {
      return getAvailableTheme();
    }

    if ("header".equals(field)) {
      return getAvailableHeader();
    }

    if ("headerSettings".equals(field)) {
      return getAvailableHeaderSettings();
    }

    if ("exactCategory".equals(field)) {
      return getAvailableExactCategory();
    }

    if ("mobileShowIntro".equals(field)) {
      return getAvailableMobileShowIntro();
    }

    if ("mobileShowApplications".equals(field)) {
      return getAvailableMobileShowApplications();
    }

    if ("jportal".equals(field)) {
      return getAvailableJportal();
    }

    if ("syncMode".equals(field)) {
      return getAvailableSyncMode();
    }

    if ("modelSyncMode".equals(field)) {
      return getAvailableModelSyncMode();
    }

    if ("model".equals(field)) {
      return getAvailableModel();
    }

    if ("applications".equals(field)) {
      return getAvailableApplications();
    }

    if ("mobilePortlets".equals(field)) {
      return getAvailableMobilePortlets();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("accessPolicy".equals(field)) {
      return CollaborativeSpace.getAccessPolicyValues();
    }
    if ("signupPolicy".equals(field)) {
      return CollaborativeSpace.getSignupPolicyValues();
    }
    if ("layout".equals(field)) {
      return CollaborativeSpace.getLayoutValues();
    }
    if ("exactCategory".equals(field)) {
      return CollaborativeSpace.getExactCategoryValues();
    }
    if ("mobileShowIntro".equals(field)) {
      return CollaborativeSpace.getMobileShowIntroValues();
    }
    if ("mobileShowApplications".equals(field)) {
      return CollaborativeSpace.getMobileShowApplicationsValues();
    }
    if ("syncMode".equals(field)) {
      return CollaborativeSpace.getSyncModeValues();
    }
    if ("modelSyncMode".equals(field)) {
      return CollaborativeSpace.getModelSyncModeValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("accessPolicy".equals(field)) {
      return CollaborativeSpace.getAccessPolicyLabels(userLang);
    }
    if ("signupPolicy".equals(field)) {
      return CollaborativeSpace.getSignupPolicyLabels(userLang);
    }
    if ("layout".equals(field)) {
      return CollaborativeSpace.getLayoutLabels(userLang);
    }
    if ("exactCategory".equals(field)) {
      return CollaborativeSpace.getExactCategoryLabels(userLang);
    }
    if ("mobileShowIntro".equals(field)) {
      return CollaborativeSpace.getMobileShowIntroLabels(userLang);
    }
    if ("mobileShowApplications".equals(field)) {
      return CollaborativeSpace.getMobileShowApplicationsLabels(userLang);
    }
    if ("syncMode".equals(field)) {
      return CollaborativeSpace.getSyncModeLabels(userLang);
    }
    if ("modelSyncMode".equals(field)) {
      return CollaborativeSpace.getModelSyncModeLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateCollaborativeSpace
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateCollaborativeSpace() {
    if (!isFollowersGroupValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "followersGroup", userLang)));
      return false;
    }
    if (!isDashboardColumnCountValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "dashboardColumnCount", userLang)));
      return false;
    }
    if (!isJportalValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "jportal", userLang)));
      return false;
    }
    if (!isModelValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "model", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateCollaborativeSpace()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateCollaborativeSpace()) {
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
    CollaborativeSpace obj = (CollaborativeSpace)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setIntroduction(getAvailableIntroduction());
    obj.setIntroductionML(getAvailableIntroductionML());
    obj.setAccessPolicy(getAvailableAccessPolicy());
    obj.setSignupPolicy(getAvailableSignupPolicy());
    obj.setFollowersGroup(getAvailableFollowersGroup());
    obj.setLayout(getAvailableLayout());
    obj.setDashboardColumnCount(getAvailableDashboardColumnCount());
    obj.setTheme(getAvailableTheme());
    obj.setHeader(getAvailableHeader());
    obj.setHeaderSettings(getAvailableHeaderSettings());
    obj.setExactCategory(getAvailableExactCategory());
    obj.setMobileShowIntro(getAvailableMobileShowIntro());
    obj.setMobileShowApplications(getAvailableMobileShowApplications());
    obj.setJportal(getAvailableJportal());
    obj.setSyncMode(getAvailableSyncMode());
    obj.setModelSyncMode(getAvailableModelSyncMode());
    obj.setModel(getAvailableModel());
    obj.setApplications(getAvailableApplications());
    obj.setMobilePortlets(getAvailableMobilePortlets());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof CollaborativeSpace) {
      super.setId(v);
      theContent = (CollaborativeSpace)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "description", true);
  protected String description = channel.getTypeFieldEntry(CollaborativeSpace.class, "description", true).getDefaultTextString();
  protected HashMap<String,String> descriptionML = descriptionTFE.getDefaultTextMap();
  @Override
public void setDescription(String[] v) {
    description = getMultilingualMainValue(descriptionTFE, v);
    descriptionML = getMultilingualMLMap(descriptionTFE, v);
  }
  @Override
public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }


  @Override
public HashMap<String,String> getAllAvailableDescriptionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }

  @Override
public HashMap<String,String> getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  @Override
public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(CollaborativeSpace.class, "description", true).getDefaultTextString())) {
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
  // introduction
  // ----------------------------------------------------------------------
  protected TypeFieldEntry introductionTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "introduction", true);
  protected String introduction = channel.getTypeFieldEntry(CollaborativeSpace.class, "introduction", true).getDefaultTextString();
  protected HashMap<String,String> introductionML = introductionTFE.getDefaultTextMap();
  public void setIntroduction(String[] v) {
    introduction = getMultilingualMainValue(introductionTFE, v);
    introductionML = getMultilingualMLMap(introductionTFE, v);
  }
  public String getAvailableIntroduction() {
    if (theContent != null && isFieldMissing("introduction")) {
     String objectValue = theContent.getIntroduction();
      return objectValue;
    }
    return introduction;
  }


  public HashMap<String,String> getAllAvailableIntroductionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableIntroductionML());
    map.put(channel.getLanguage(),getAvailableIntroduction(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableIntroductionML() {
    if (theContent != null && isFieldMissing("introduction")) {
      return theContent.getIntroductionML();
    }
    return introductionML;
  }
  public String getAvailableIntroduction(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(introduction, channel.getTypeFieldEntry(CollaborativeSpace.class, "introduction", true).getDefaultTextString())) {
          return introduction;
      	}
      } else {
      	if (introductionML != null && Util.notEmpty(introductionML.get(lang))) {
      	  return introductionML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntroduction(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return introduction;
    }
    return introductionML == null ? "" : Util.getString(introductionML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // accessPolicy
  // ----------------------------------------------------------------------
  protected TypeFieldEntry accessPolicyTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "accessPolicy", true);
  protected String accessPolicy = channel.getTypeFieldEntry(CollaborativeSpace.class, "accessPolicy", true).getDefaultTextString();
  public void setAccessPolicy(String[] v) {
    accessPolicy = getMonolingualValue(accessPolicyTFE, v);
  }
  public String getAvailableAccessPolicy() {
    if (theContent != null && isFieldMissing("accessPolicy")) {
     String objectValue = theContent.getAccessPolicy();
      return objectValue;
    }
    return accessPolicy;
  }




  // ----------------------------------------------------------------------
  // signupPolicy
  // ----------------------------------------------------------------------
  protected TypeFieldEntry signupPolicyTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "signupPolicy", true);
  protected String signupPolicy = channel.getTypeFieldEntry(CollaborativeSpace.class, "signupPolicy", true).getDefaultTextString();
  public void setSignupPolicy(String[] v) {
    signupPolicy = getMonolingualValue(signupPolicyTFE, v);
  }
  public String getAvailableSignupPolicy() {
    if (theContent != null && isFieldMissing("signupPolicy")) {
     String objectValue = theContent.getSignupPolicy();
      return objectValue;
    }
    return signupPolicy;
  }




  // ----------------------------------------------------------------------
  // followersGroup
  // ----------------------------------------------------------------------
  protected TypeFieldEntry followersGroupTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "followersGroup", true);
  protected boolean isFollowersGroupValidated = true;
  protected com.jalios.jcms.Group followersGroup;
  String __followersGroupStr = null;
  public void setFollowersGroup(String v) {
    __followersGroupStr = v;
  }
  public com.jalios.jcms.Group getAvailableFollowersGroup() {
    if (theContent != null && isFieldMissing("followersGroup")) {
     com.jalios.jcms.Group objectValue = theContent.getFollowersGroup();
      return objectValue;
    }
    return followersGroup;
  }




  // ----------------------------------------------------------------------
  // layout
  // ----------------------------------------------------------------------
  protected TypeFieldEntry layoutTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "layout", true);
  protected String layout = channel.getTypeFieldEntry(CollaborativeSpace.class, "layout", true).getDefaultTextString();
  public void setLayout(String[] v) {
    layout = getMonolingualValue(layoutTFE, v);
  }
  public String getAvailableLayout() {
    if (theContent != null && isFieldMissing("layout")) {
     String objectValue = theContent.getLayout();
      return objectValue;
    }
    return layout;
  }




  // ----------------------------------------------------------------------
  // dashboardColumnCount
  // ----------------------------------------------------------------------
  protected TypeFieldEntry dashboardColumnCountTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "dashboardColumnCount", true);
  protected boolean isDashboardColumnCountValidated = true;
  protected int dashboardColumnCount = 2;
  public void setDashboardColumnCount(String v) {
    try {
      dashboardColumnCount = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isDashboardColumnCountValidated = false;
    }
  }
  public int getAvailableDashboardColumnCount() {
    if (theContent != null && isFieldMissing("dashboardColumnCount")) {
     int objectValue = theContent.getDashboardColumnCount();
      return objectValue;
    }
    return dashboardColumnCount;
  }




  // ----------------------------------------------------------------------
  // theme
  // ----------------------------------------------------------------------
  protected TypeFieldEntry themeTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "theme", true);
  protected String theme = channel.getTypeFieldEntry(CollaborativeSpace.class, "theme", true).getDefaultTextString();
  public void setTheme(String[] v) {
    theme = getMonolingualValue(themeTFE, v);
  }
  public String getAvailableTheme() {
    if (theContent != null && isFieldMissing("theme")) {
     String objectValue = theContent.getTheme();
      return objectValue;
    }
    return theme;
  }




  // ----------------------------------------------------------------------
  // header
  // ----------------------------------------------------------------------
  protected TypeFieldEntry headerTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "header", true);
  protected String header = channel.getTypeFieldEntry(CollaborativeSpace.class, "header", true).getDefaultTextString();
  public void setHeader(String[] v) {
    header = getMonolingualValue(headerTFE, v);
  }
  public String getAvailableHeader() {
    if (theContent != null && isFieldMissing("header")) {
     String objectValue = theContent.getHeader();
      return objectValue;
    }
    return header;
  }




  // ----------------------------------------------------------------------
  // headerSettings
  // ----------------------------------------------------------------------
  protected TypeFieldEntry headerSettingsTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "headerSettings", true);
  protected String headerSettings = channel.getTypeFieldEntry(CollaborativeSpace.class, "headerSettings", true).getDefaultTextString();
  public void setHeaderSettings(String[] v) {
    headerSettings = getMonolingualValue(headerSettingsTFE, v);
  }
  public String getAvailableHeaderSettings() {
    if (theContent != null && isFieldMissing("headerSettings")) {
     String objectValue = theContent.getHeaderSettings();
      return objectValue;
    }
    return headerSettings;
  }




  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------
  protected TypeFieldEntry exactCategoryTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "exactCategory", true);
  protected boolean exactCategory = false;
  public void setExactCategory(boolean  v) {
    this.exactCategory = v;
  }

  public boolean getAvailableExactCategory() {
    if (theContent != null && isFieldMissing("exactCategory")) {
     boolean objectValue = theContent.getExactCategory();
      return objectValue;
    }
    return exactCategory;
  }




  // ----------------------------------------------------------------------
  // mobileShowIntro
  // ----------------------------------------------------------------------
  protected TypeFieldEntry mobileShowIntroTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "mobileShowIntro", true);
  protected boolean mobileShowIntro = true;
  public void setMobileShowIntro(boolean  v) {
    this.mobileShowIntro = v;
  }

  public boolean getAvailableMobileShowIntro() {
    if (theContent != null && isFieldMissing("mobileShowIntro")) {
     boolean objectValue = theContent.getMobileShowIntro();
      return objectValue;
    }
    return mobileShowIntro;
  }




  // ----------------------------------------------------------------------
  // mobileShowApplications
  // ----------------------------------------------------------------------
  protected TypeFieldEntry mobileShowApplicationsTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "mobileShowApplications", true);
  protected boolean mobileShowApplications = true;
  public void setMobileShowApplications(boolean  v) {
    this.mobileShowApplications = v;
  }

  public boolean getAvailableMobileShowApplications() {
    if (theContent != null && isFieldMissing("mobileShowApplications")) {
     boolean objectValue = theContent.getMobileShowApplications();
      return objectValue;
    }
    return mobileShowApplications;
  }




  // ----------------------------------------------------------------------
  // jportal
  // ----------------------------------------------------------------------
  protected TypeFieldEntry jportalTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "jportal", true);
  protected boolean isJportalValidated = true;
  protected com.jalios.jcms.jportal.AbstractJPortal jportal;
  String __jportalStr = null;
  public void setJportal(String v) {
    __jportalStr = v;
  }
  public com.jalios.jcms.jportal.AbstractJPortal getAvailableJportal() {
    if (theContent != null && isFieldMissing("jportal")) {
     com.jalios.jcms.jportal.AbstractJPortal objectValue = theContent.getJportal();
      return objectValue;
    }
    return jportal;
  }




  // ----------------------------------------------------------------------
  // syncMode
  // ----------------------------------------------------------------------
  protected TypeFieldEntry syncModeTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "syncMode", true);
  protected String[] syncMode = new String[0];
  protected int syncModeAddCount = 0;
  public void setSyncMode(String[] v) {
    syncMode = getMonolingualValueArray(syncModeTFE, v);
  }

  public String[] getAvailableSyncMode() {
    if (theContent != null && isFieldMissing("syncMode")) {
	  String[] objectValue = theContent.getSyncMode();
      if (objectValue == null) {
        return syncMode;
      }
      return objectValue;
    }
    return syncMode;
  }



  public void setSyncModeAddCount(int  v) {
    syncModeAddCount = v;
  }

  public int getSyncModeCount() {
    int arraySize = Util.getSize(getAvailableSyncMode());
    int res = 3 + arraySize + syncModeAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // modelSyncMode
  // ----------------------------------------------------------------------
  protected TypeFieldEntry modelSyncModeTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "modelSyncMode", true);
  protected String[] modelSyncMode = new String[0];
  protected int modelSyncModeAddCount = 0;
  public void setModelSyncMode(String[] v) {
    modelSyncMode = getMonolingualValueArray(modelSyncModeTFE, v);
  }

  public String[] getAvailableModelSyncMode() {
    if (theContent != null && isFieldMissing("modelSyncMode")) {
	  String[] objectValue = theContent.getModelSyncMode();
      if (objectValue == null) {
        return modelSyncMode;
      }
      return objectValue;
    }
    return modelSyncMode;
  }



  public void setModelSyncModeAddCount(int  v) {
    modelSyncModeAddCount = v;
  }

  public int getModelSyncModeCount() {
    int arraySize = Util.getSize(getAvailableModelSyncMode());
    int res = 3 + arraySize + modelSyncModeAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // model
  // ----------------------------------------------------------------------
  protected TypeFieldEntry modelTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "model", true);
  protected boolean isModelValidated = true;
  protected com.jalios.jcms.workspace.Workspace model;
  String __modelStr = null;
  public void setModel(String v) {
    __modelStr = v;
  }
  public com.jalios.jcms.workspace.Workspace getAvailableModel() {
    if (theContent != null && isFieldMissing("model")) {
     com.jalios.jcms.workspace.Workspace objectValue = theContent.getModel();
      return objectValue;
    }
    return model;
  }




  // ----------------------------------------------------------------------
  // applications
  // ----------------------------------------------------------------------
  protected TypeFieldEntry applicationsTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "applications", true);
  protected com.jalios.jcms.portlet.PortalElement[] applications = new com.jalios.jcms.portlet.PortalElement[0];
  protected int applicationsAddCount = 0;
  String[] __applicationsStr = null;
  public void setApplications(String[]  v) {
    __applicationsStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement[] getAvailableApplications() {
    if (theContent != null && isFieldMissing("applications")) {
	  com.jalios.jcms.portlet.PortalElement[] objectValue = theContent.getApplications();
      if (objectValue == null) {
        return applications;
      }
      return objectValue;
    }
    return applications;
  }



  public void setApplicationsAddCount(int  v) {
    applicationsAddCount = v;
  }

  public int getApplicationsCount() {
    int arraySize = Util.getSize(getAvailableApplications());
    int res = 3 + arraySize + applicationsAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // mobilePortlets
  // ----------------------------------------------------------------------
  protected TypeFieldEntry mobilePortletsTFE = channel.getTypeFieldEntry(CollaborativeSpace.class, "mobilePortlets", true);
  protected com.jalios.jcms.portlet.PortalElement[] mobilePortlets = new com.jalios.jcms.portlet.PortalElement[0];
  protected int mobilePortletsAddCount = 0;
  String[] __mobilePortletsStr = null;
  public void setMobilePortlets(String[]  v) {
    __mobilePortletsStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement[] getAvailableMobilePortlets() {
    if (theContent != null && isFieldMissing("mobilePortlets")) {
	  com.jalios.jcms.portlet.PortalElement[] objectValue = theContent.getMobilePortlets();
      if (objectValue == null) {
        return mobilePortlets;
      }
      return objectValue;
    }
    return mobilePortlets;
  }



  public void setMobilePortletsAddCount(int  v) {
    mobilePortletsAddCount = v;
  }

  public int getMobilePortletsCount() {
    int arraySize = Util.getSize(getAvailableMobilePortlets());
    int res = 3 + arraySize + mobilePortletsAddCount;
    return res;
  }



}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// BfyXrHN55HsugMlpvlX0+w==
