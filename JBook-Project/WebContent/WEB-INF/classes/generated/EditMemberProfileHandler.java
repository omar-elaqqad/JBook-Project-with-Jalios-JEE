// This file has been automatically generated.
package generated;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jalios.jcms.HttpUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditMemberProfileHandler extends EditPublicationHandler {

  protected MemberProfile theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return MemberProfile.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpMemberProfile
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

    if ("introduction".equals(field)) {
      return getAvailableIntroduction();
    }

    if ("interest".equals(field)) {
      return getAvailableInterest();
    }

    if ("dateOfBirth".equals(field)) {
      return getAvailableDateOfBirth();
    }

    if ("dateOfArrival".equals(field)) {
      return getAvailableDateOfArrival();
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
  // validateCommonCreateUpdateMemberProfile
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateMemberProfile() {
    if (!isDateOfBirthValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfBirth", userLang), HttpUtil.encodeForHTML(__dateOfBirthStr)));
      return false;
    }
    if (!isDateOfArrivalValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfArrival", userLang), HttpUtil.encodeForHTML(__dateOfArrivalStr)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateMemberProfile()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateMemberProfile()) {
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
    if (!isDateOfBirthValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfBirth", userLang), HttpUtil.encodeForHTML(__dateOfBirthStr)));
      return false;
    }
    if (!isDateOfArrivalValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfArrival", userLang), HttpUtil.encodeForHTML(__dateOfArrivalStr)));
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
    if (!isDateOfBirthValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfBirth", userLang), HttpUtil.encodeForHTML(__dateOfBirthStr)));
      return false;
    }
    if (!isDateOfArrivalValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfArrival", userLang), HttpUtil.encodeForHTML(__dateOfArrivalStr)));
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
    if (!isDateOfBirthValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfBirth", userLang), HttpUtil.encodeForHTML(__dateOfBirthStr)));
      return false;
    }
    if (!isDateOfArrivalValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "dateOfArrival", userLang), HttpUtil.encodeForHTML(__dateOfArrivalStr)));
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
    MemberProfile obj = (MemberProfile)data;
    obj.setIntroduction(getAvailableIntroduction());
    if (data == null || !Util.isSameContent(((MemberProfile)data).getInterest(), Util.getArrayList(false, true, getAvailableInterest()))) {
      obj.setInterest(Util.getArrayList(false, true, getAvailableInterest()));
    }
    obj.setDateOfBirth(getAvailableDateOfBirth());
    obj.setDateOfArrival(getAvailableDateOfArrival());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof MemberProfile) {
      super.setId(v);
      theContent = (MemberProfile)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // introduction
  // ----------------------------------------------------------------------
  protected TypeFieldEntry introductionTFE = channel.getTypeFieldEntry(MemberProfile.class, "introduction", true);
  protected String introduction = channel.getTypeFieldEntry(MemberProfile.class, "introduction", true).getDefaultTextString();
  public void setIntroduction(String[] v) {
    introduction = getMonolingualValue(introductionTFE, v);
  }
  public String getAvailableIntroduction() {
    if (theContent != null && isFieldMissing("introduction")) {
     String objectValue = theContent.getIntroduction();
      return objectValue;
    }
    return introduction;
  }




  // ----------------------------------------------------------------------
  // interest
  // ----------------------------------------------------------------------
  protected TypeFieldEntry interestTFE = channel.getTypeFieldEntry(MemberProfile.class, "interest", true);
  protected String[] interest = new String[0];
  protected int interestAddCount = 0;
  public void setInterest(String[] v) {
    interest = getMonolingualValueArray(interestTFE, v);
  }

  public String[] getAvailableInterest() {
    if (theContent != null && isFieldMissing("interest")) {
	  List<String> objectValue = theContent.getInterest();
      if (objectValue == null) {
        return interest;
      }
      return objectValue.toArray(new String[objectValue.size()]);
    }
    return interest;
  }




  // ----------------------------------------------------------------------
  // dateOfBirth
  // ----------------------------------------------------------------------
  protected TypeFieldEntry dateOfBirthTFE = channel.getTypeFieldEntry(MemberProfile.class, "dateOfBirth", true);
  protected String __dateOfBirthStr = "";
  protected boolean isDateOfBirthValidated = true;
  protected Date dateOfBirth;
  public void setDateOfBirth(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);
      __dateOfBirthStr = v.trim();
      dateOfBirth = dateFormatter.parse(__dateOfBirthStr);
    } catch(java.text.ParseException ex) {
      isDateOfBirthValidated = false;
    }
  }
  public java.util.Date getAvailableDateOfBirth() {
    if (theContent != null && isFieldMissing("dateOfBirth")) {
     java.util.Date objectValue = theContent.getDateOfBirth();
      return objectValue;
    }
    return dateOfBirth;
  }




  // ----------------------------------------------------------------------
  // dateOfArrival
  // ----------------------------------------------------------------------
  protected TypeFieldEntry dateOfArrivalTFE = channel.getTypeFieldEntry(MemberProfile.class, "dateOfArrival", true);
  protected String __dateOfArrivalStr = "";
  protected boolean isDateOfArrivalValidated = true;
  protected Date dateOfArrival;
  public void setDateOfArrival(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);
      __dateOfArrivalStr = v.trim();
      dateOfArrival = dateFormatter.parse(__dateOfArrivalStr);
    } catch(java.text.ParseException ex) {
      isDateOfArrivalValidated = false;
    }
  }
  public java.util.Date getAvailableDateOfArrival() {
    if (theContent != null && isFieldMissing("dateOfArrival")) {
     java.util.Date objectValue = theContent.getDateOfArrival();
      return objectValue;
    }
    return dateOfArrival;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// OLKyDO+rhAcZH3fd4z463A==
