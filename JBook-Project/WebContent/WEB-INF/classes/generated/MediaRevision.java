package generated;

@SuppressWarnings({"unchecked", "unused"})
public class MediaRevision extends com.jalios.jcms.DBFileDocumentRevision {
  public MediaRevision() {
    revisionData = new Media();
  }

  public MediaRevision(Media data, int op) {
    super(data, op);
    revisionData = data;
  }
  @Override
public String getDescription() {
    return ((Media)revisionData).getDescription();
  }

  @Override
public void setDescription(String v) {
    ((Media)revisionData).setDescription(v);
  }


  @Override
public String getDescriptionMLE() {
    return ((Media)revisionData).getDescriptionMLE();
  }
  @Override
public void setDescriptionMLE(String v) {
    ((Media)revisionData).setDescriptionMLE(v);
  }
  public long getMediaWidth() {
    return ((Media)revisionData).getMediaWidth();
  }

  public void setMediaWidth(Long v) {
    ((Media)revisionData).setMediaWidth(v == null ? 0L : v.longValue());
  }


  public long getMediaHeight() {
    return ((Media)revisionData).getMediaHeight();
  }

  public void setMediaHeight(Long v) {
    ((Media)revisionData).setMediaHeight(v == null ? 0L : v.longValue());
  }


  public long getMediaDuration() {
    return ((Media)revisionData).getMediaDuration();
  }

  public void setMediaDuration(Long v) {
    ((Media)revisionData).setMediaDuration(v == null ? 0L : v.longValue());
  }


}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// BZEaEPjKq6NZ+FR2pROfgQ==
