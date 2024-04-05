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
public class EditBlogPostHandler extends com.jalios.jcmsplugin.blog.EditAbstractBlogPostHandler {
   
  protected BlogPost theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return BlogPost.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpBlogPost  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("blog", __blogStr, generated.Blog.class);
      if (data != null) { 
        blog = (generated.Blog)data;
      } else {
        isBlogValidated = Util.isEmpty(__blogStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableBlog(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableBlog(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("content".equals(field)) {
      return getAllAvailableContentML();
    }
    
    if ("summary".equals(field)) {
      return getAllAvailableSummaryML();
    }
    
    if ("blog".equals(field)) {
      return getAvailableBlog();
    }
    
    if ("category".equals(field)) {
      return getCategoryCatSet();
    }
    
    if ("featuredImage".equals(field)) {
      return getAvailableFeaturedImage();
    }
    
    if ("featuredImageAlt".equals(field)) {
      return getAllAvailableFeaturedImageAltML();
    }
    
    if ("thumbnailImage".equals(field)) {
      return getAvailableThumbnailImage();
    }
    
    if ("thumbnailImageAlt".equals(field)) {
      return getAllAvailableThumbnailImageAltML();
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
  // validateCommonCreateUpdateBlogPost  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateBlogPost() {
    if (!isBlogValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "blog", userLang)));
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
    if (!validateCommonCreateUpdateBlogPost()) {
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
    
    if (!validateCommonCreateUpdateBlogPost()) {
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
    BlogPost obj = (BlogPost)data;
    obj.setContent(getAvailableContent());
    obj.setContentML(getAvailableContentML());
    obj.setSummary(getAvailableSummary());
    obj.setSummaryML(getAvailableSummaryML());
    obj.setBlog(getAvailableBlog());
    obj.setFeaturedImage(getAvailableFeaturedImage());
    obj.setFeaturedImageAlt(getAvailableFeaturedImageAlt());
    obj.setFeaturedImageAltML(getAvailableFeaturedImageAltML());
    obj.setThumbnailImage(getAvailableThumbnailImage());
    obj.setThumbnailImageAlt(getAvailableThumbnailImageAlt());
    obj.setThumbnailImageAltML(getAvailableThumbnailImageAltML());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof BlogPost) {
      super.setId(v);
      theContent = (BlogPost)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry contentTFE = channel.getTypeFieldEntry(BlogPost.class, "content", true);
  protected String content = channel.getTypeFieldEntry(BlogPost.class, "content", true).getDefaultTextString();
  protected HashMap<String,String> contentML = contentTFE.getDefaultTextMap();
  public void setContent(String[] v) {
    content = getMultilingualMainValue(contentTFE, v);
    contentML = getMultilingualMLMap(contentTFE, v);
  }
  public String getAvailableContent() {
    if (theContent != null && isFieldMissing("content")) {
     String objectValue = theContent.getContent();
      return objectValue;
    }
    return content;
  }
  
    
  public HashMap<String,String> getAllAvailableContentML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableContentML());
    map.put(channel.getLanguage(),getAvailableContent(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableContentML() {
    if (theContent != null && isFieldMissing("content")) {
      return theContent.getContentML();
    }
    return contentML;
  }
  public String getAvailableContent(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(content, channel.getTypeFieldEntry(BlogPost.class, "content", true).getDefaultTextString())) {
          return content;
      	}
      } else {
      	if (contentML != null && Util.notEmpty(contentML.get(lang))) {
      	  return contentML.get(lang);
      	}
      }
      return Util.getString(theContent.getContent(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return content;
    }
    return contentML == null ? "" : Util.getString(contentML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry summaryTFE = channel.getTypeFieldEntry(BlogPost.class, "summary", true);
  protected String summary = channel.getTypeFieldEntry(BlogPost.class, "summary", true).getDefaultTextString();
  protected HashMap<String,String> summaryML = summaryTFE.getDefaultTextMap();
  public void setSummary(String[] v) {
    summary = getMultilingualMainValue(summaryTFE, v);
    summaryML = getMultilingualMLMap(summaryTFE, v);
  }
  public String getAvailableSummary() {
    if (theContent != null && isFieldMissing("summary")) {
     String objectValue = theContent.getSummary();
      return objectValue;
    }
    return summary;
  }
  
    
  public HashMap<String,String> getAllAvailableSummaryML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSummaryML());
    map.put(channel.getLanguage(),getAvailableSummary(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableSummaryML() {
    if (theContent != null && isFieldMissing("summary")) {
      return theContent.getSummaryML();
    }
    return summaryML;
  }
  public String getAvailableSummary(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(summary, channel.getTypeFieldEntry(BlogPost.class, "summary", true).getDefaultTextString())) {
          return summary;
      	}
      } else {
      	if (summaryML != null && Util.notEmpty(summaryML.get(lang))) {
      	  return summaryML.get(lang);
      	}
      }
      return Util.getString(theContent.getSummary(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return summary;
    }
    return summaryML == null ? "" : Util.getString(summaryML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // blog
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry blogTFE = channel.getTypeFieldEntry(BlogPost.class, "blog", true);
  protected boolean isBlogValidated = true;
  protected generated.Blog blog;
  String __blogStr = null;
  public void setBlog(String v) {
    __blogStr = v;
  }
  public generated.Blog getAvailableBlog() {
    if (theContent != null && isFieldMissing("blog")) {
     generated.Blog objectValue = theContent.getBlog();
      return objectValue;
    }
    return blog;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // featuredImage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry featuredImageTFE = channel.getTypeFieldEntry(BlogPost.class, "featuredImage", true);
  protected String featuredImage = channel.getTypeFieldEntry(BlogPost.class, "featuredImage", true).getDefaultTextString();
  public void setFeaturedImage(String[] v) {
    featuredImage = getMonolingualValue(featuredImageTFE, v);
  }
  public String getAvailableFeaturedImage() {
    if (theContent != null && isFieldMissing("featuredImage")) {
     String objectValue = theContent.getFeaturedImage();
      return objectValue;
    }
    return featuredImage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // featuredImageAlt
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry featuredImageAltTFE = channel.getTypeFieldEntry(BlogPost.class, "featuredImageAlt", true);
  protected String featuredImageAlt = channel.getTypeFieldEntry(BlogPost.class, "featuredImageAlt", true).getDefaultTextString();
  protected HashMap<String,String> featuredImageAltML = featuredImageAltTFE.getDefaultTextMap();
  public void setFeaturedImageAlt(String[] v) {
    featuredImageAlt = getMultilingualMainValue(featuredImageAltTFE, v);
    featuredImageAltML = getMultilingualMLMap(featuredImageAltTFE, v);
  }
  public String getAvailableFeaturedImageAlt() {
    if (theContent != null && isFieldMissing("featuredImageAlt")) {
     String objectValue = theContent.getFeaturedImageAlt();
      return objectValue;
    }
    return featuredImageAlt;
  }
  
    
  public HashMap<String,String> getAllAvailableFeaturedImageAltML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableFeaturedImageAltML());
    map.put(channel.getLanguage(),getAvailableFeaturedImageAlt(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableFeaturedImageAltML() {
    if (theContent != null && isFieldMissing("featuredImageAlt")) {
      return theContent.getFeaturedImageAltML();
    }
    return featuredImageAltML;
  }
  public String getAvailableFeaturedImageAlt(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(featuredImageAlt, channel.getTypeFieldEntry(BlogPost.class, "featuredImageAlt", true).getDefaultTextString())) {
          return featuredImageAlt;
      	}
      } else {
      	if (featuredImageAltML != null && Util.notEmpty(featuredImageAltML.get(lang))) {
      	  return featuredImageAltML.get(lang);
      	}
      }
      return Util.getString(theContent.getFeaturedImageAlt(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return featuredImageAlt;
    }
    return featuredImageAltML == null ? "" : Util.getString(featuredImageAltML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // thumbnailImage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry thumbnailImageTFE = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImage", true);
  protected String thumbnailImage = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImage", true).getDefaultTextString();
  public void setThumbnailImage(String[] v) {
    thumbnailImage = getMonolingualValue(thumbnailImageTFE, v);
  }
  public String getAvailableThumbnailImage() {
    if (theContent != null && isFieldMissing("thumbnailImage")) {
     String objectValue = theContent.getThumbnailImage();
      return objectValue;
    }
    return thumbnailImage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // thumbnailImageAlt
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry thumbnailImageAltTFE = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImageAlt", true);
  protected String thumbnailImageAlt = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImageAlt", true).getDefaultTextString();
  protected HashMap<String,String> thumbnailImageAltML = thumbnailImageAltTFE.getDefaultTextMap();
  public void setThumbnailImageAlt(String[] v) {
    thumbnailImageAlt = getMultilingualMainValue(thumbnailImageAltTFE, v);
    thumbnailImageAltML = getMultilingualMLMap(thumbnailImageAltTFE, v);
  }
  public String getAvailableThumbnailImageAlt() {
    if (theContent != null && isFieldMissing("thumbnailImageAlt")) {
     String objectValue = theContent.getThumbnailImageAlt();
      return objectValue;
    }
    return thumbnailImageAlt;
  }
  
    
  public HashMap<String,String> getAllAvailableThumbnailImageAltML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableThumbnailImageAltML());
    map.put(channel.getLanguage(),getAvailableThumbnailImageAlt(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableThumbnailImageAltML() {
    if (theContent != null && isFieldMissing("thumbnailImageAlt")) {
      return theContent.getThumbnailImageAltML();
    }
    return thumbnailImageAltML;
  }
  public String getAvailableThumbnailImageAlt(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(thumbnailImageAlt, channel.getTypeFieldEntry(BlogPost.class, "thumbnailImageAlt", true).getDefaultTextString())) {
          return thumbnailImageAlt;
      	}
      } else {
      	if (thumbnailImageAltML != null && Util.notEmpty(thumbnailImageAltML.get(lang))) {
      	  return thumbnailImageAltML.get(lang);
      	}
      }
      return Util.getString(theContent.getThumbnailImageAlt(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return thumbnailImageAlt;
    }
    return thumbnailImageAltML == null ? "" : Util.getString(thumbnailImageAltML.get(lang), "");
  }
  
  
  public void setCategory(String[] v) {
    updateCids(v);
  }
  public Category getCategoryRoot() {
    return channel.getCategory("j_3");
  }  
    
  public Set<Category> getCategoryCatSet() {
    Category rootCat = getCategoryRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 3ai5KPiwfA3wyeePS4Y20Q==
