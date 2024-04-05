package generated;
import java.util.*;
import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.util.*;
@SuppressWarnings({"unchecked", "unused"})
public class BlogPostRevision extends com.jalios.jcms.db.DBDataRevision {
  public BlogPostRevision() {
    revisionData = new BlogPost();
  }
  
  public BlogPostRevision(BlogPost data, int op) {
    super(data, op);
    revisionData = data;
  }
  public String getContent() {
    return ((BlogPost)revisionData).getContent();
  }
  
  public void setContent(String v) {
    ((BlogPost)revisionData).setContent(v);
  }
  
  
  public String getContentMLE() {
    return ((BlogPost)revisionData).getContentMLE();
  }
  public void setContentMLE(String v) {
    ((BlogPost)revisionData).setContentMLE(v);
  }
  public String getSummary() {
    return ((BlogPost)revisionData).getSummary();
  }
  
  public void setSummary(String v) {
    ((BlogPost)revisionData).setSummary(v);
  }
  
  
  public String getSummaryMLE() {
    return ((BlogPost)revisionData).getSummaryMLE();
  }
  public void setSummaryMLE(String v) {
    ((BlogPost)revisionData).setSummaryMLE(v);
  }
  public generated.Blog getBlog() {
    return ((BlogPost)revisionData).getBlog();
  }
  
  public void setBlog(generated.Blog v) {
    ((BlogPost)revisionData).setBlog(v);
  }
  
  public String getBlogId() { 
    return JcmsUtil.getId(getBlog());
  }
  public void setBlogId(String v) {
    ((BlogPost)revisionData).setBlog(channel.getData(generated.Blog.class, v));   
  }
  
  public String getFeaturedImage() {
    return ((BlogPost)revisionData).getFeaturedImage();
  }
  
  public void setFeaturedImage(String v) {
    ((BlogPost)revisionData).setFeaturedImage(v);
  }
  
  
  public String getFeaturedImageAlt() {
    return ((BlogPost)revisionData).getFeaturedImageAlt();
  }
  
  public void setFeaturedImageAlt(String v) {
    ((BlogPost)revisionData).setFeaturedImageAlt(v);
  }
  
  
  public String getFeaturedImageAltMLE() {
    return ((BlogPost)revisionData).getFeaturedImageAltMLE();
  }
  public void setFeaturedImageAltMLE(String v) {
    ((BlogPost)revisionData).setFeaturedImageAltMLE(v);
  }
  public String getThumbnailImage() {
    return ((BlogPost)revisionData).getThumbnailImage();
  }
  
  public void setThumbnailImage(String v) {
    ((BlogPost)revisionData).setThumbnailImage(v);
  }
  
  
  public String getThumbnailImageAlt() {
    return ((BlogPost)revisionData).getThumbnailImageAlt();
  }
  
  public void setThumbnailImageAlt(String v) {
    ((BlogPost)revisionData).setThumbnailImageAlt(v);
  }
  
  
  public String getThumbnailImageAltMLE() {
    return ((BlogPost)revisionData).getThumbnailImageAltMLE();
  }
  public void setThumbnailImageAltMLE(String v) {
    ((BlogPost)revisionData).setThumbnailImageAltMLE(v);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// rhN0CxTFcgIX/sLiQp444w==
