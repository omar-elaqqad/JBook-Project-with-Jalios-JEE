package generated;

@SuppressWarnings({"unchecked", "unused"})
public class DBWebPageRevision extends com.jalios.jcms.db.DBDataRevision {
  public DBWebPageRevision() {
    revisionData = new DBWebPage();
  }

  public DBWebPageRevision(DBWebPage data, int op) {
    super(data, op);
    revisionData = data;
  }
  public String getUrl() {
    return ((DBWebPage)revisionData).getUrl();
  }

  public void setUrl(String v) {
    ((DBWebPage)revisionData).setUrl(v);
  }


  public String getUrlToShot() {
    return ((DBWebPage)revisionData).getUrlToShot();
  }

  public void setUrlToShot(String v) {
    ((DBWebPage)revisionData).setUrlToShot(v);
  }


  public String getDescription() {
    return ((DBWebPage)revisionData).getDescription();
  }

  public void setDescription(String v) {
    ((DBWebPage)revisionData).setDescription(v);
  }


  public String getDescriptionMLE() {
    return ((DBWebPage)revisionData).getDescriptionMLE();
  }
  public void setDescriptionMLE(String v) {
    ((DBWebPage)revisionData).setDescriptionMLE(v);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// tqN4wdV60G+9sIUMjYNanw==
