// This file has been automatically generated.
package generated;


import java.util.HashMap;
import java.util.List;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditFormHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditCSRequestHandler extends EditFormHandler {

  protected CSRequest theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return CSRequest.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpCSRequest
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getAvailableAuthor();


    {
      List<com.jalios.jcms.Member> list = processDataIds("admins",__adminsStr,com.jalios.jcms.Member.class);
      this.admins = list.toArray(new com.jalios.jcms.Member[0]);
    }
    {
      List<com.jalios.jcms.Group> list = processDataIds("groups",__groupsStr,com.jalios.jcms.Group.class);
      this.groups = list.toArray(new com.jalios.jcms.Group[0]);
    }
    {
      List<com.jalios.jcms.Member> list = processDataIds("members",__membersStr,com.jalios.jcms.Member.class);
      this.members = list.toArray(new com.jalios.jcms.Member[0]);
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("name".equals(field)) {
      return getAllAvailableNameML();
    }

    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }

    if ("accessPolicy".equals(field)) {
      return getAvailableAccessPolicy();
    }

    if ("signupPolicy".equals(field)) {
      return getAvailableSignupPolicy();
    }

    if ("model".equals(field)) {
      return getAvailableModel();
    }

    if ("language".equals(field)) {
      return getAvailableLanguage();
    }

    if ("admins".equals(field)) {
      return getAvailableAdmins();
    }

    if ("groups".equals(field)) {
      return getAvailableGroups();
    }

    if ("members".equals(field)) {
      return getAvailableMembers();
    }

    if ("notificationPolicy".equals(field)) {
      return getAvailableNotificationPolicy();
    }

    if ("parent".equals(field)) {
      return getAvailableParent();
    }

    if ("syncMode".equals(field)) {
      return getAvailableSyncMode();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("accessPolicy".equals(field)) {
      return CSRequest.getAccessPolicyValues();
    }
    if ("signupPolicy".equals(field)) {
      return CSRequest.getSignupPolicyValues();
    }
    if ("notificationPolicy".equals(field)) {
      return CSRequest.getNotificationPolicyValues();
    }
    if ("syncMode".equals(field)) {
      return CSRequest.getSyncModeValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("accessPolicy".equals(field)) {
      return CSRequest.getAccessPolicyLabels(userLang);
    }
    if ("signupPolicy".equals(field)) {
      return CSRequest.getSignupPolicyLabels(userLang);
    }
    if ("notificationPolicy".equals(field)) {
      return CSRequest.getNotificationPolicyLabels(userLang);
    }
    if ("syncMode".equals(field)) {
      return CSRequest.getSyncModeLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateCSRequest
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateCSRequest() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateCSRequest()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateCSRequest()) {
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
    CSRequest obj = (CSRequest)data;
    obj.setName(getAvailableName());
    obj.setNameML(getAvailableNameML());
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setAccessPolicy(getAvailableAccessPolicy());
    obj.setSignupPolicy(getAvailableSignupPolicy());
    obj.setModel(getAvailableModel());
    obj.setLanguage(getAvailableLanguage());
    obj.setAdmins(getAvailableAdmins());
    obj.setGroups(getAvailableGroups());
    obj.setMembers(getAvailableMembers());
    obj.setNotificationPolicy(getAvailableNotificationPolicy());
    obj.setParent(getAvailableParent());
    obj.setSyncMode(getAvailableSyncMode());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof CSRequest) {
      super.setId(v);
      theContent = (CSRequest)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------
  protected TypeFieldEntry nameTFE = channel.getTypeFieldEntry(CSRequest.class, "name", true);
  protected String name = channel.getTypeFieldEntry(CSRequest.class, "name", true).getDefaultTextString();
  protected HashMap<String,String> nameML = nameTFE.getDefaultTextMap();
  public void setName(String[] v) {
    name = getMultilingualMainValue(nameTFE, v);
    nameML = getMultilingualMLMap(nameTFE, v);
  }
  public String getAvailableName() {
    if (theContent != null && isFieldMissing("name")) {
     String objectValue = theContent.getName();
      return objectValue;
    }
    return name;
  }


  public HashMap<String,String> getAllAvailableNameML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableNameML());
    map.put(channel.getLanguage(),getAvailableName(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableNameML() {
    if (theContent != null && isFieldMissing("name")) {
      return theContent.getNameML();
    }
    return nameML;
  }
  public String getAvailableName(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(name, channel.getTypeFieldEntry(CSRequest.class, "name", true).getDefaultTextString())) {
          return name;
      	}
      } else {
      	if (nameML != null && Util.notEmpty(nameML.get(lang))) {
      	  return nameML.get(lang);
      	}
      }
      return Util.getString(theContent.getName(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return name;
    }
    return nameML == null ? "" : Util.getString(nameML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(CSRequest.class, "description", true);
  protected String description = channel.getTypeFieldEntry(CSRequest.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(CSRequest.class, "description", true).getDefaultTextString())) {
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
  // accessPolicy
  // ----------------------------------------------------------------------
  protected TypeFieldEntry accessPolicyTFE = channel.getTypeFieldEntry(CSRequest.class, "accessPolicy", true);
  protected String accessPolicy = channel.getTypeFieldEntry(CSRequest.class, "accessPolicy", true).getDefaultTextString();
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
  protected TypeFieldEntry signupPolicyTFE = channel.getTypeFieldEntry(CSRequest.class, "signupPolicy", true);
  protected String signupPolicy = channel.getTypeFieldEntry(CSRequest.class, "signupPolicy", true).getDefaultTextString();
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
  // model
  // ----------------------------------------------------------------------
  protected TypeFieldEntry modelTFE = channel.getTypeFieldEntry(CSRequest.class, "model", true);
  protected String model = channel.getTypeFieldEntry(CSRequest.class, "model", true).getDefaultTextString();
  public void setModel(String[] v) {
    model = getMonolingualValue(modelTFE, v);
  }
  public String getAvailableModel() {
    if (theContent != null && isFieldMissing("model")) {
     String objectValue = theContent.getModel();
      return objectValue;
    }
    return model;
  }




  // ----------------------------------------------------------------------
  // language
  // ----------------------------------------------------------------------
  protected TypeFieldEntry languageTFE = channel.getTypeFieldEntry(CSRequest.class, "language", true);
  protected String language = channel.getTypeFieldEntry(CSRequest.class, "language", true).getDefaultTextString();
  public void setLanguage(String[] v) {
    language = getMonolingualValue(languageTFE, v);
  }
  public String getAvailableLanguage() {
    if (theContent != null && isFieldMissing("language")) {
     String objectValue = theContent.getLanguage();
      return objectValue;
    }
    return language;
  }




  // ----------------------------------------------------------------------
  // admins
  // ----------------------------------------------------------------------
  protected TypeFieldEntry adminsTFE = channel.getTypeFieldEntry(CSRequest.class, "admins", true);
  protected com.jalios.jcms.Member[] admins = new com.jalios.jcms.Member[0];
  protected int adminsAddCount = 0;
  String[] __adminsStr = null;
  public void setAdmins(String[]  v) {
    __adminsStr = v;
  }
  public com.jalios.jcms.Member[] getAvailableAdmins() {
    if (theContent != null && isFieldMissing("admins")) {
	  com.jalios.jcms.Member[] objectValue = theContent.getAdmins();
      if (objectValue == null) {
        return admins;
      }
      return objectValue;
    }
    return admins;
  }



  public void setAdminsAddCount(int  v) {
    adminsAddCount = v;
  }

  public int getAdminsCount() {
    int arraySize = Util.getSize(getAvailableAdmins());
    int res = 3 + arraySize + adminsAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // groups
  // ----------------------------------------------------------------------
  protected TypeFieldEntry groupsTFE = channel.getTypeFieldEntry(CSRequest.class, "groups", true);
  protected com.jalios.jcms.Group[] groups = new com.jalios.jcms.Group[0];
  protected int groupsAddCount = 0;
  String[] __groupsStr = null;
  public void setGroups(String[]  v) {
    __groupsStr = v;
  }
  public com.jalios.jcms.Group[] getAvailableGroups() {
    if (theContent != null && isFieldMissing("groups")) {
	  com.jalios.jcms.Group[] objectValue = theContent.getGroups();
      if (objectValue == null) {
        return groups;
      }
      return objectValue;
    }
    return groups;
  }



  public void setGroupsAddCount(int  v) {
    groupsAddCount = v;
  }

  public int getGroupsCount() {
    int arraySize = Util.getSize(getAvailableGroups());
    int res = 3 + arraySize + groupsAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // members
  // ----------------------------------------------------------------------
  protected TypeFieldEntry membersTFE = channel.getTypeFieldEntry(CSRequest.class, "members", true);
  protected com.jalios.jcms.Member[] members = new com.jalios.jcms.Member[0];
  protected int membersAddCount = 0;
  String[] __membersStr = null;
  public void setMembers(String[]  v) {
    __membersStr = v;
  }
  public com.jalios.jcms.Member[] getAvailableMembers() {
    if (theContent != null && isFieldMissing("members")) {
	  com.jalios.jcms.Member[] objectValue = theContent.getMembers();
      if (objectValue == null) {
        return members;
      }
      return objectValue;
    }
    return members;
  }



  public void setMembersAddCount(int  v) {
    membersAddCount = v;
  }

  public int getMembersCount() {
    int arraySize = Util.getSize(getAvailableMembers());
    int res = 3 + arraySize + membersAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // notificationPolicy
  // ----------------------------------------------------------------------
  protected TypeFieldEntry notificationPolicyTFE = channel.getTypeFieldEntry(CSRequest.class, "notificationPolicy", true);
  protected String notificationPolicy = channel.getTypeFieldEntry(CSRequest.class, "notificationPolicy", true).getDefaultTextString();
  public void setNotificationPolicy(String[] v) {
    notificationPolicy = getMonolingualValue(notificationPolicyTFE, v);
  }
  public String getAvailableNotificationPolicy() {
    if (theContent != null && isFieldMissing("notificationPolicy")) {
     String objectValue = theContent.getNotificationPolicy();
      return objectValue;
    }
    return notificationPolicy;
  }




  // ----------------------------------------------------------------------
  // parent
  // ----------------------------------------------------------------------
  protected TypeFieldEntry parentTFE = channel.getTypeFieldEntry(CSRequest.class, "parent", true);
  protected String parent = channel.getTypeFieldEntry(CSRequest.class, "parent", true).getDefaultTextString();
  public void setParent(String[] v) {
    parent = getMonolingualValue(parentTFE, v);
  }
  public String getAvailableParent() {
    if (theContent != null && isFieldMissing("parent")) {
     String objectValue = theContent.getParent();
      return objectValue;
    }
    return parent;
  }




  // ----------------------------------------------------------------------
  // syncMode
  // ----------------------------------------------------------------------
  protected TypeFieldEntry syncModeTFE = channel.getTypeFieldEntry(CSRequest.class, "syncMode", true);
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



}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// d+KyFnQ2JCvt7ds1bg/gvA==
