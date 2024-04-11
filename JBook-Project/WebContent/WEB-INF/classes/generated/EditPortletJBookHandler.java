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
public class EditPortletJBookHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletJBook theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletJBook.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletJBook  
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
  
    if ("refineWorkspace".equals(field)) {
      return getAvailableRefineWorkspace();
    }
    
    if ("topicRoot".equals(field)) {
      return getTopicRootCatSet();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("refineWorkspace".equals(field)) {
      return PortletJBook.getRefineWorkspaceValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("refineWorkspace".equals(field)) {
      return PortletJBook.getRefineWorkspaceLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletJBook  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletJBook() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletJBook()) {
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
    
    if (!validateCommonCreateUpdatePortletJBook()) {
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
    PortletJBook obj = (PortletJBook)data;
    obj.setRefineWorkspace(getAvailableRefineWorkspace());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletJBook) {
      super.setId(v);
      theContent = (PortletJBook)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // refineWorkspace
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry refineWorkspaceTFE = channel.getTypeFieldEntry(PortletJBook.class, "refineWorkspace", true);
  protected boolean refineWorkspace = true;
  public void setRefineWorkspace(boolean  v) {
    this.refineWorkspace = v;
  }
  
  public boolean getAvailableRefineWorkspace() {
    if (theContent != null && isFieldMissing("refineWorkspace")) {
     boolean objectValue = theContent.getRefineWorkspace();
      return objectValue;
    }
    return refineWorkspace;
  }
  
    
  
  
  public void setTopicRoot(String[] v) {
    updateCids(v);
  }
  public Category getTopicRootRoot() {
    return channel.getCategory("$channel.root-category");
  }  
    
  public Set<Category> getTopicRootCatSet() {
    Category rootCat = getTopicRootRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// bIcoasXWTKCTEm3tP6I2Vw==
