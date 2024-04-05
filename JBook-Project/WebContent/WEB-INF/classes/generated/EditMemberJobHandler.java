// This file has been automatically generated.
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.jcms.wysiwyg.WysiwygManager;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditMemberJobHandler extends EditPublicationHandler {
   
  protected MemberJob theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return MemberJob.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpMemberJob  
  // ----------------------------------------------------------------------
  
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
  
    if ("organization".equals(field)) {
      return getAvailableOrganization();
    }
    
    if ("description".equals(field)) {
      return getAvailableDescription();
    }
    
    if ("place".equals(field)) {
      return getAvailablePlace();
    }
    
    if ("site".equals(field)) {
      return getAvailableSite();
    }
    
    if ("startDate".equals(field)) {
      return getAvailableStartDate();
    }
    
    if ("endDate".equals(field)) {
      return getAvailableEndDate();
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
  // validateCommonCreateUpdateMemberJob  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateMemberJob() {
    if (!isStartDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startDate", userLang), HttpUtil.encodeForHTML(__startDateStr)));
      return false;
    }
    if (!isEndDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endDate", userLang), HttpUtil.encodeForHTML(__endDateStr)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateMemberJob()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateMemberJob()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
    if (!isStartDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startDate", userLang), HttpUtil.encodeForHTML(__startDateStr)));
      return false;
    }
    if (!isEndDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endDate", userLang), HttpUtil.encodeForHTML(__endDateStr)));
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
    if (!isStartDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startDate", userLang), HttpUtil.encodeForHTML(__startDateStr)));
      return false;
    }
    if (!isEndDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endDate", userLang), HttpUtil.encodeForHTML(__endDateStr)));
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
    if (!isStartDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startDate", userLang), HttpUtil.encodeForHTML(__startDateStr)));
      return false;
    }
    if (!isEndDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endDate", userLang), HttpUtil.encodeForHTML(__endDateStr)));
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    MemberJob obj = (MemberJob)data;
    obj.setOrganization(getAvailableOrganization());
    obj.setDescription(getAvailableDescription());
    obj.setPlace(getAvailablePlace());
    obj.setSite(getAvailableSite());
    obj.setStartDate(getAvailableStartDate());
    obj.setEndDate(getAvailableEndDate());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof MemberJob) {
      super.setId(v);
      theContent = (MemberJob)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // organization
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry organizationTFE = channel.getTypeFieldEntry(MemberJob.class, "organization", true);
  protected String organization = channel.getTypeFieldEntry(MemberJob.class, "organization", true).getDefaultTextString();
  public void setOrganization(String[] v) {
    organization = getMonolingualValue(organizationTFE, v);
  }
  public String getAvailableOrganization() {
    if (theContent != null && isFieldMissing("organization")) {
     String objectValue = theContent.getOrganization();
      return objectValue;
    }
    return organization;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(MemberJob.class, "description", true);
  protected String description = channel.getTypeFieldEntry(MemberJob.class, "description", true).getDefaultTextString();
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
  // place
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry placeTFE = channel.getTypeFieldEntry(MemberJob.class, "place", true);
  protected String place = channel.getTypeFieldEntry(MemberJob.class, "place", true).getDefaultTextString();
  public void setPlace(String[] v) {
    place = getMonolingualValue(placeTFE, v);
  }
  public String getAvailablePlace() {
    if (theContent != null && isFieldMissing("place")) {
     String objectValue = theContent.getPlace();
      return objectValue;
    }
    return place;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // site
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry siteTFE = channel.getTypeFieldEntry(MemberJob.class, "site", true);
  protected String site = channel.getTypeFieldEntry(MemberJob.class, "site", true).getDefaultTextString();
  public void setSite(String[] v) {
    site = getMonolingualValue(siteTFE, v);
  }
  public String getAvailableSite() {
    if (theContent != null && isFieldMissing("site")) {
     String objectValue = theContent.getSite();
      return objectValue;
    }
    return site;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // startDate
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry startDateTFE = channel.getTypeFieldEntry(MemberJob.class, "startDate", true);
  protected String __startDateStr = "";
  protected boolean isStartDateValidated = true;
  protected Date startDate;
  public void setStartDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __startDateStr = v.trim();      
      startDate = dateFormatter.parse(__startDateStr);
    } catch(java.text.ParseException ex) {
      isStartDateValidated = false;
    }
  }
  public java.util.Date getAvailableStartDate() {
    if (theContent != null && isFieldMissing("startDate")) {
     java.util.Date objectValue = theContent.getStartDate();
      return objectValue;
    }
    return startDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // endDate
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry endDateTFE = channel.getTypeFieldEntry(MemberJob.class, "endDate", true);
  protected String __endDateStr = "";
  protected boolean isEndDateValidated = true;
  protected Date endDate;
  public void setEndDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __endDateStr = v.trim();      
      endDate = dateFormatter.parse(__endDateStr);
    } catch(java.text.ParseException ex) {
      isEndDateValidated = false;
    }
  }
  public java.util.Date getAvailableEndDate() {
    if (theContent != null && isFieldMissing("endDate")) {
     java.util.Date objectValue = theContent.getEndDate();
      return objectValue;
    }
    return endDate;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 0yqAw0PTSdScCLeMCsjmKg==
