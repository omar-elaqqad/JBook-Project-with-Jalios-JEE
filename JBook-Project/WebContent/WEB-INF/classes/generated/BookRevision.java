package generated;

@SuppressWarnings({"unchecked", "unused"})
public class BookRevision extends com.jalios.jcms.db.DBDataRevision {
  public BookRevision() {
    revisionData = new Book();
  }

  public BookRevision(Book data, int op) {
    super(data, op);
    revisionData = data;
  }
  public String getDescription() {
    return ((Book)revisionData).getDescription();
  }

  public void setDescription(String v) {
    ((Book)revisionData).setDescription(v);
  }


  public String getDescriptionMLE() {
    return ((Book)revisionData).getDescriptionMLE();
  }
  public void setDescriptionMLE(String v) {
    ((Book)revisionData).setDescriptionMLE(v);
  }
  public String getImage() {
    return ((Book)revisionData).getImage();
  }

  public void setImage(String v) {
    ((Book)revisionData).setImage(v);
  }


  public String getImageMLE() {
    return ((Book)revisionData).getImageMLE();
  }
  public void setImageMLE(String v) {
    ((Book)revisionData).setImageMLE(v);
  }
  public String getIsbn() {
    return ((Book)revisionData).getIsbn();
  }

  public void setIsbn(String v) {
    ((Book)revisionData).setIsbn(v);
  }


  public String getIsbnMLE() {
    return ((Book)revisionData).getIsbnMLE();
  }
  public void setIsbnMLE(String v) {
    ((Book)revisionData).setIsbnMLE(v);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// SyliYQnDMhWkfXwjFeq9QQ==
