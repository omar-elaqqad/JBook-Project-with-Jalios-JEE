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
public class EditBookHandler extends EditPublicationHandler {
   
  protected Book theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return Book.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpBook  
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
  
    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }
    
    if ("image".equals(field)) {
      return getAvailableImage();
    }
    
    if ("topics".equals(field)) {
      return getTopicsCatSet();
    }
    
    if ("isbn".equals(field)) {
      return getAvailableIsbn();
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
  // validateCommonCreateUpdateBook  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateBook() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateBook()) {
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
    
    if (!validateCommonCreateUpdateBook()) {
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
    Book obj = (Book)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setImage(getAvailableImage());
    obj.setIsbn(getAvailableIsbn());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Book) {
      super.setId(v);
      theContent = (Book)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(Book.class, "description", true);
  protected String description = channel.getTypeFieldEntry(Book.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(Book.class, "description", true).getDefaultTextString())) {
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
  // image
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry imageTFE = channel.getTypeFieldEntry(Book.class, "image", true);
  protected String image = channel.getTypeFieldEntry(Book.class, "image", true).getDefaultTextString();
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
  // isbn
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry isbnTFE = channel.getTypeFieldEntry(Book.class, "isbn", true);
  protected String isbn = channel.getTypeFieldEntry(Book.class, "isbn", true).getDefaultTextString();
  public void setIsbn(String[] v) {
    isbn = getMonolingualValue(isbnTFE, v);
  }
  public String getAvailableIsbn() {
    if (theContent != null && isFieldMissing("isbn")) {
     String objectValue = theContent.getIsbn();
      return objectValue;
    }
    return isbn;
  }
  
    
  
  
  public void setTopics(String[] v) {
    updateCids(v);
  }
  public Category getTopicsRoot() {
    return channel.getCategory("$id.jcmsplugin.jbook.catalog.topic-root");
  }  
    
  public Set<Category> getTopicsCatSet() {
    Category rootCat = getTopicsRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// f645NOn6NTuNyIWPGR6/IQ==
