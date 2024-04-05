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
public class EditPortletPollHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletPoll theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletPoll.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletPoll  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("poll", __pollStr, generated.Poll.class);
      if (data != null) { 
        poll = (generated.Poll)data;
      } else {
        isPollValidated = Util.isEmpty(__pollStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailablePoll(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailablePoll(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("hideWhenNoResults".equals(field)) {
      return getAvailableHideWhenNoResults();
    }
    
    if ("poll".equals(field)) {
      return getAvailablePoll();
    }
    
    if ("refineWorkspace".equals(field)) {
      return getAvailableRefineWorkspace();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("hideWhenNoResults".equals(field)) {
      return PortletPoll.getHideWhenNoResultsValues();
    }
    if ("refineWorkspace".equals(field)) {
      return PortletPoll.getRefineWorkspaceValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("hideWhenNoResults".equals(field)) {
      return PortletPoll.getHideWhenNoResultsLabels(userLang);
    }
    if ("refineWorkspace".equals(field)) {
      return PortletPoll.getRefineWorkspaceLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletPoll  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletPoll() {
    if (!isPollValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "poll", userLang)));
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
    if (!validateCommonCreateUpdatePortletPoll()) {
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
    
    if (!validateCommonCreateUpdatePortletPoll()) {
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
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
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
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    PortletPoll obj = (PortletPoll)data;
    obj.setHideWhenNoResults(getAvailableHideWhenNoResults());
    obj.setPoll(getAvailablePoll());
    obj.setRefineWorkspace(getAvailableRefineWorkspace());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletPoll) {
      super.setId(v);
      theContent = (PortletPoll)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry hideWhenNoResultsTFE = channel.getTypeFieldEntry(PortletPoll.class, "hideWhenNoResults", true);
  protected boolean hideWhenNoResults = false;
  public void setHideWhenNoResults(boolean  v) {
    this.hideWhenNoResults = v;
  }
  
  public boolean getAvailableHideWhenNoResults() {
    if (theContent != null && isFieldMissing("hideWhenNoResults")) {
     boolean objectValue = theContent.getHideWhenNoResults();
      return objectValue;
    }
    return hideWhenNoResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // poll
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pollTFE = channel.getTypeFieldEntry(PortletPoll.class, "poll", true);
  protected boolean isPollValidated = true;
  protected generated.Poll poll;
  String __pollStr = null;
  public void setPoll(String v) {
    __pollStr = v;
  }
  public generated.Poll getAvailablePoll() {
    if (theContent != null && isFieldMissing("poll")) {
     generated.Poll objectValue = theContent.getPoll();
      return objectValue;
    }
    return poll;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // refineWorkspace
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry refineWorkspaceTFE = channel.getTypeFieldEntry(PortletPoll.class, "refineWorkspace", true);
  protected String refineWorkspace = channel.getTypeFieldEntry(PortletPoll.class, "refineWorkspace", true).getDefaultTextString();
  public void setRefineWorkspace(String[] v) {
    refineWorkspace = getMonolingualValue(refineWorkspaceTFE, v);
  }
  public String getAvailableRefineWorkspace() {
    if (theContent != null && isFieldMissing("refineWorkspace")) {
     String objectValue = theContent.getRefineWorkspace();
      return objectValue;
    }
    return refineWorkspace;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// wbEWK0RfbwPJNg5S4PHRCw==
