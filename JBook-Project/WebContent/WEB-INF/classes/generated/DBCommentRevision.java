package generated;
import com.jalios.jcms.JcmsUtil;
@SuppressWarnings({"unchecked", "unused"})
public class DBCommentRevision extends com.jalios.jcms.db.DBDataRevision {
  public DBCommentRevision() {
    revisionData = new DBComment();
  }

  public DBCommentRevision(DBComment data, int op) {
    super(data, op);
    revisionData = data;
  }
  public String getName() {
    return ((DBComment)revisionData).getName();
  }

  public void setName(String v) {
    ((DBComment)revisionData).setName(v);
  }


  public String getEmail() {
    return ((DBComment)revisionData).getEmail();
  }

  public void setEmail(String v) {
    ((DBComment)revisionData).setEmail(v);
  }


  public String getWebSite() {
    return ((DBComment)revisionData).getWebSite();
  }

  public void setWebSite(String v) {
    ((DBComment)revisionData).setWebSite(v);
  }


  public String getDescription() {
    return ((DBComment)revisionData).getDescription();
  }

  public void setDescription(String v) {
    ((DBComment)revisionData).setDescription(v);
  }


  public com.jalios.jcms.Publication getTargetContent() {
    return ((DBComment)revisionData).getTargetContent();
  }

  public void setTargetContent(com.jalios.jcms.Publication v) {
    ((DBComment)revisionData).setTargetContent(v);
  }

  public String getTargetContentId() {
    return JcmsUtil.getId(getTargetContent());
  }
  public void setTargetContentId(String v) {
    ((DBComment)revisionData).setTargetContent(channel.getData(com.jalios.jcms.Publication.class, v));
  }

  public String getIpAddress() {
    return ((DBComment)revisionData).getIpAddress();
  }

  public void setIpAddress(String v) {
    ((DBComment)revisionData).setIpAddress(v);
  }


  public String getUserAgent() {
    return ((DBComment)revisionData).getUserAgent();
  }

  public void setUserAgent(String v) {
    ((DBComment)revisionData).setUserAgent(v);
  }


  public String getReferer() {
    return ((DBComment)revisionData).getReferer();
  }

  public void setReferer(String v) {
    ((DBComment)revisionData).setReferer(v);
  }


  public boolean getPrivateComment() {
    return ((DBComment)revisionData).getPrivateComment();
  }

  public void setPrivateComment(Boolean v) {
    ((DBComment)revisionData).setPrivateComment(v == null ? false : v.booleanValue());
  }


}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// DidvgC1YP0xCrVTb11qoOQ==
