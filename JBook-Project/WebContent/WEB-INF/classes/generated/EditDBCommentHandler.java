// This file has been automatically generated.
package generated;


import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditDBCommentHandler extends com.jalios.jcmsplugin.dbcomment.EditAbstractDBCommentHandler {

  protected DBComment theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return DBComment.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpDBComment
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("targetContent", __targetContentStr, com.jalios.jcms.Publication.class);
      if (data != null) {
        targetContent = (com.jalios.jcms.Publication)data;
      } else {
        isTargetContentValidated = Util.isEmpty(__targetContentStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableTargetContent(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableTargetContent(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("name".equals(field)) {
      return getAvailableName();
    }

    if ("email".equals(field)) {
      return getAvailableEmail();
    }

    if ("webSite".equals(field)) {
      return getAvailableWebSite();
    }

    if ("description".equals(field)) {
      return getAvailableDescription();
    }

    if ("targetContent".equals(field)) {
      return getAvailableTargetContent();
    }

    if ("ipAddress".equals(field)) {
      return getAvailableIpAddress();
    }

    if ("userAgent".equals(field)) {
      return getAvailableUserAgent();
    }

    if ("referer".equals(field)) {
      return getAvailableReferer();
    }

    if ("privateComment".equals(field)) {
      return getAvailablePrivateComment();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("privateComment".equals(field)) {
      return DBComment.getPrivateCommentValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("privateComment".equals(field)) {
      return DBComment.getPrivateCommentLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateDBComment
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateDBComment() {
    if (!isTargetContentValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "targetContent", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateDBComment()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateDBComment()) {
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
    DBComment obj = (DBComment)data;
    obj.setName(getAvailableName());
    obj.setEmail(getAvailableEmail());
    obj.setWebSite(getAvailableWebSite());
    obj.setDescription(getAvailableDescription());
    obj.setTargetContent(getAvailableTargetContent());
    obj.setIpAddress(getAvailableIpAddress());
    obj.setUserAgent(getAvailableUserAgent());
    obj.setReferer(getAvailableReferer());
    obj.setPrivateComment(getAvailablePrivateComment());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof DBComment) {
      super.setId(v);
      theContent = (DBComment)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------
  protected TypeFieldEntry nameTFE = channel.getTypeFieldEntry(DBComment.class, "name", true);
  protected String name = channel.getTypeFieldEntry(DBComment.class, "name", true).getDefaultTextString();
  public void setName(String[] v) {
    name = getMonolingualValue(nameTFE, v);
  }
  public String getAvailableName() {
    if (theContent != null && isFieldMissing("name")) {
     String objectValue = theContent.getName();
      return objectValue;
    }
    return name;
  }




  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------
  protected TypeFieldEntry emailTFE = channel.getTypeFieldEntry(DBComment.class, "email", true);
  protected String email = channel.getTypeFieldEntry(DBComment.class, "email", true).getDefaultTextString();
  public void setEmail(String[] v) {
    email = getMonolingualValue(emailTFE, v);
  }
  public String getAvailableEmail() {
    if (theContent != null && isFieldMissing("email")) {
     String objectValue = theContent.getEmail();
      return objectValue;
    }
    return email;
  }




  // ----------------------------------------------------------------------
  // webSite
  // ----------------------------------------------------------------------
  protected TypeFieldEntry webSiteTFE = channel.getTypeFieldEntry(DBComment.class, "webSite", true);
  protected String webSite = channel.getTypeFieldEntry(DBComment.class, "webSite", true).getDefaultTextString();
  public void setWebSite(String[] v) {
    webSite = getMonolingualValue(webSiteTFE, v);
  }
  public String getAvailableWebSite() {
    if (theContent != null && isFieldMissing("webSite")) {
     String objectValue = theContent.getWebSite();
      return objectValue;
    }
    return webSite;
  }




  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(DBComment.class, "description", true);
  protected String description = channel.getTypeFieldEntry(DBComment.class, "description", true).getDefaultTextString();
  public void setDescription(String[] v) {
    description = getMonolingualValue(descriptionTFE, v);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }




  // ----------------------------------------------------------------------
  // targetContent
  // ----------------------------------------------------------------------
  protected TypeFieldEntry targetContentTFE = channel.getTypeFieldEntry(DBComment.class, "targetContent", true);
  protected boolean isTargetContentValidated = true;
  protected com.jalios.jcms.Publication targetContent;
  String __targetContentStr = null;
  public void setTargetContent(String v) {
    __targetContentStr = v;
  }
  public com.jalios.jcms.Publication getAvailableTargetContent() {
    if (theContent != null && isFieldMissing("targetContent")) {
     com.jalios.jcms.Publication objectValue = theContent.getTargetContent();
      return objectValue;
    }
    return targetContent;
  }




  // ----------------------------------------------------------------------
  // ipAddress
  // ----------------------------------------------------------------------
  protected TypeFieldEntry ipAddressTFE = channel.getTypeFieldEntry(DBComment.class, "ipAddress", true);
  protected String ipAddress = channel.getTypeFieldEntry(DBComment.class, "ipAddress", true).getDefaultTextString();
  public void setIpAddress(String[] v) {
    ipAddress = getMonolingualValue(ipAddressTFE, v);
  }
  public String getAvailableIpAddress() {
    if (theContent != null && isFieldMissing("ipAddress")) {
     String objectValue = theContent.getIpAddress();
      return objectValue;
    }
    return ipAddress;
  }




  // ----------------------------------------------------------------------
  // userAgent
  // ----------------------------------------------------------------------
  protected TypeFieldEntry userAgentTFE = channel.getTypeFieldEntry(DBComment.class, "userAgent", true);
  protected String userAgent = channel.getTypeFieldEntry(DBComment.class, "userAgent", true).getDefaultTextString();
  public void setUserAgent(String[] v) {
    userAgent = getMonolingualValue(userAgentTFE, v);
  }
  public String getAvailableUserAgent() {
    if (theContent != null && isFieldMissing("userAgent")) {
     String objectValue = theContent.getUserAgent();
      return objectValue;
    }
    return userAgent;
  }




  // ----------------------------------------------------------------------
  // referer
  // ----------------------------------------------------------------------
  protected TypeFieldEntry refererTFE = channel.getTypeFieldEntry(DBComment.class, "referer", true);
  protected String referer = channel.getTypeFieldEntry(DBComment.class, "referer", true).getDefaultTextString();
  public void setReferer(String[] v) {
    referer = getMonolingualValue(refererTFE, v);
  }
  public String getAvailableReferer() {
    if (theContent != null && isFieldMissing("referer")) {
     String objectValue = theContent.getReferer();
      return objectValue;
    }
    return referer;
  }




  // ----------------------------------------------------------------------
  // privateComment
  // ----------------------------------------------------------------------
  protected TypeFieldEntry privateCommentTFE = channel.getTypeFieldEntry(DBComment.class, "privateComment", true);
  protected boolean privateComment = false;
  public void setPrivateComment(boolean  v) {
    this.privateComment = v;
  }

  public boolean getAvailablePrivateComment() {
    if (theContent != null && isFieldMissing("privateComment")) {
     boolean objectValue = theContent.getPrivateComment();
      return objectValue;
    }
    return privateComment;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// K4CqegQ3WJGs8pj+c035sA==
