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
public class EditBlogHandler extends com.jalios.jcmsplugin.blog.EditAbstractBlogHandler {
   
  protected Blog theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return Blog.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpBlog  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("bloggerGroup", __bloggerGroupStr, com.jalios.jcms.Group.class);
      if (data != null) { 
        bloggerGroup = (com.jalios.jcms.Group)data;
      } else {
        isBloggerGroupValidated = Util.isEmpty(__bloggerGroupStr);
      }
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("description".equals(field)) {
      return getAvailableDescription();
    }
    
    if ("bloggerGroup".equals(field)) {
      return getAvailableBloggerGroup();
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
  // validateCommonCreateUpdateBlog  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateBlog() {
    if (!isBloggerGroupValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "bloggerGroup", userLang)));
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
    if (!validateCommonCreateUpdateBlog()) {
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
    
    if (!validateCommonCreateUpdateBlog()) {
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
    Blog obj = (Blog)data;
    obj.setDescription(getAvailableDescription());
    obj.setBloggerGroup(getAvailableBloggerGroup());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Blog) {
      super.setId(v);
      theContent = (Blog)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(Blog.class, "description", true);
  protected String description = channel.getTypeFieldEntry(Blog.class, "description", true).getDefaultTextString();
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
  // bloggerGroup
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry bloggerGroupTFE = channel.getTypeFieldEntry(Blog.class, "bloggerGroup", true);
  protected boolean isBloggerGroupValidated = true;
  protected com.jalios.jcms.Group bloggerGroup;
  String __bloggerGroupStr = null;
  public void setBloggerGroup(String v) {
    __bloggerGroupStr = v;
  }
  public com.jalios.jcms.Group getAvailableBloggerGroup() {
    if (theContent != null && isFieldMissing("bloggerGroup")) {
     com.jalios.jcms.Group objectValue = theContent.getBloggerGroup();
      return objectValue;
    }
    return bloggerGroup;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// VJEtSm0fYf2e0IDCBV9m5w==