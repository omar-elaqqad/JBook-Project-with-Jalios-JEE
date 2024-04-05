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
public class EditGuestRequestHandler extends EditFormHandler {
   
  protected GuestRequest theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return GuestRequest.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpGuestRequest  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getAvailableAuthor();
    
    
    {
      List<com.jalios.jcms.Group> list = processDataIds("groups",__groupsStr,com.jalios.jcms.Group.class);
      this.groups = (com.jalios.jcms.Group[])list.toArray(new com.jalios.jcms.Group[0]);
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("groups".equals(field)) {
      return getAvailableGroups();
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
  // validateCommonCreateUpdateGuestRequest  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGuestRequest() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateGuestRequest()) {
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
    
    if (!validateCommonCreateUpdateGuestRequest()) {
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
    GuestRequest obj = (GuestRequest)data;
    if (data == null || !Util.isSameContent(((GuestRequest)data).getGroups(), Util.getHashSet(getAvailableGroups()))) {
      obj.setGroups(Util.getHashSet(getAvailableGroups()));
    }
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof GuestRequest) {
      super.setId(v);
      theContent = (GuestRequest)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // groups
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry groupsTFE = channel.getTypeFieldEntry(GuestRequest.class, "groups", true);
  protected com.jalios.jcms.Group[] groups = new com.jalios.jcms.Group[0];
  protected int groupsAddCount = 0;
  String[] __groupsStr = null;
  public void setGroups(String[]  v) {
    __groupsStr = v;
  }
  public com.jalios.jcms.Group[] getAvailableGroups() {
    if (theContent != null && isFieldMissing("groups")) {
	  Set<com.jalios.jcms.Group> objectValue = theContent.getGroups();
      if (objectValue == null) {
        return groups;
      }
      return objectValue.toArray(new com.jalios.jcms.Group[objectValue.size()]);
    }
    return groups;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 4bAo6B4VO937mvc0sdwFNg==
