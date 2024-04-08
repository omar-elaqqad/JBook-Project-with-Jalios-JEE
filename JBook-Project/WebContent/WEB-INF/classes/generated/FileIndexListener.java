// This file was automatically generated. Please, do not edit.
package generated;

import java.util.HashMap;
import java.util.TreeSet;

import com.jalios.jcms.AbstractFileIndexListener;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jstore.Storable;
import com.jalios.util.Util;

@SuppressWarnings({"unused"})
public class FileIndexListener extends AbstractFileIndexListener {

  public FileIndexListener(HashMap<String,TreeSet<Data>> index) {
    super(index);
  }

  @Override
public void handleCreate(Storable storable, boolean firstTime) {
    if (storable instanceof FileDocument) {
      FileDocument obj = (FileDocument)storable;
      add(obj.getFilename(), obj);
    }


    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
    }

    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof Article) {
      Article obj = (Article)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPicture(), obj);
    }

    if (storable instanceof CollaborativeSpace) {
      CollaborativeSpace obj = (CollaborativeSpace)storable;
      String[] array = null;

      // file/image/media
      add(obj.getHeader(), obj);
      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof Interview) {
      Interview obj = (Interview)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPhoto(), obj);
    }

    if (storable instanceof JPortal) {
      JPortal obj = (JPortal)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
    }

    if (storable instanceof Poll) {
      Poll obj = (Poll)storable;
      String[] array = null;

      // file/image/media
      add(obj.getImage(), obj);
    }

    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletBirthday) {
      PortletBirthday obj = (PortletBirthday)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletBlog) {
      PortletBlog obj = (PortletBlog)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletBookmarks) {
      PortletBookmarks obj = (PortletBookmarks)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletCarousel) {
      PortletCarousel obj = (PortletCarousel)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletCollaborativeSpaceSuggestion) {
      PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      String[] array = null;

      // file[]/image[]/media[]
      array = obj.getBackgroundImage();
      if (array != null) {
	for (String element : array) {
	  add(element, obj);
	}
      }
      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      String[] array = null;

      // file/image/media
      add(obj.getImage(), obj);
      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletIndicator) {
      PortletIndicator obj = (PortletIndicator)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPicture(), obj);
      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletMemberActivity) {
      PortletMemberActivity obj = (PortletMemberActivity)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletMemberProfile) {
      PortletMemberProfile obj = (PortletMemberProfile)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletMemberStatus) {
      PortletMemberStatus obj = (PortletMemberStatus)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      String[] array = null;

      // file/image/media
      add(obj.getItemSeparaor(), obj);
      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletMyCollaborativeSpaces) {
      PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletPoll) {
      PortletPoll obj = (PortletPoll)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
    }

    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
    }

    if (storable instanceof PortletPublication) {
      PortletPublication obj = (PortletPublication)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletQueryForeachCards) {
      PortletQueryForeachCards obj = (PortletQueryForeachCards)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      String[] array = null;

      // file[]/image[]/media[]
      array = obj.getBackgroundImage();
      if (array != null) {
	for (String element : array) {
	  add(element, obj);
	}
      }
      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof PortletWorkspaceBookmarks) {
      PortletWorkspaceBookmarks obj = (PortletWorkspaceBookmarks)storable;
      String[] array = null;

      // file/image/media
      add(obj.getPortletImage(), obj);
      // file/image/media
      add(obj.getBackImage(), obj);
    }

    if (storable instanceof Shortcut) {
      Shortcut obj = (Shortcut)storable;
      String[] array = null;

      // file/image/media
      add(obj.getImage(), obj);
      // file/image/media
      add(obj.getIcon(), obj);
    }
  }

  @Override
public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {
    if (storable instanceof FileDocument) {
      FileDocument obj = (FileDocument)storable;
      FileDocument oldObj = (FileDocument)oldStorable;

      if (!Util.isSameContent(obj.getFilename(), oldObj.getFilename())) {
	remove(obj, oldObj.getFilename());
	add(obj.getFilename(), obj);
      }
    }


    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      AbstractCollection oldObj = (AbstractCollection)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      AbstractParent oldObj = (AbstractParent)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      AbstractPortal oldObj = (AbstractPortal)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
    }

    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      AbstractPortlet oldObj = (AbstractPortlet)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      AbstractPortletSkinable oldObj = (AbstractPortletSkinable)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof Article) {
      Article obj = (Article)storable;
      Article oldObj = (Article)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPicture(), oldObj.getPicture())) {
	remove(obj, oldObj.getPicture());
	add(obj.getPicture(), obj);
      }
    }

    if (storable instanceof CollaborativeSpace) {
      CollaborativeSpace obj = (CollaborativeSpace)storable;
      CollaborativeSpace oldObj = (CollaborativeSpace)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getHeader(), oldObj.getHeader())) {
	remove(obj, oldObj.getHeader());
	add(obj.getHeader(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof Interview) {
      Interview obj = (Interview)storable;
      Interview oldObj = (Interview)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPhoto(), oldObj.getPhoto())) {
	remove(obj, oldObj.getPhoto());
	add(obj.getPhoto(), obj);
      }
    }

    if (storable instanceof JPortal) {
      JPortal obj = (JPortal)storable;
      JPortal oldObj = (JPortal)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
    }

    if (storable instanceof Poll) {
      Poll obj = (Poll)storable;
      Poll oldObj = (Poll)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getImage(), oldObj.getImage())) {
	remove(obj, oldObj.getImage());
	add(obj.getImage(), obj);
      }
    }

    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      PortalJspCollection oldObj = (PortalJspCollection)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletBirthday) {
      PortletBirthday obj = (PortletBirthday)storable;
      PortletBirthday oldObj = (PortletBirthday)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletBlog) {
      PortletBlog obj = (PortletBlog)storable;
      PortletBlog oldObj = (PortletBlog)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletBookmarks) {
      PortletBookmarks obj = (PortletBookmarks)storable;
      PortletBookmarks oldObj = (PortletBookmarks)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletCarousel) {
      PortletCarousel obj = (PortletCarousel)storable;
      PortletCarousel oldObj = (PortletCarousel)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletCollaborativeSpaceSuggestion) {
      PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)storable;
      PortletCollaborativeSpaceSuggestion oldObj = (PortletCollaborativeSpaceSuggestion)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      PortletColumn oldObj = (PortletColumn)oldStorable;
      String[] array = null;

      // file[]/image[]/media[]
      array = oldObj.getBackgroundImage();
      if (array != null) {
	for (String element : array) {
	  remove(obj, element);
	}
      }
      array = obj.getBackgroundImage();
      if (array != null) {
	for (String element : array) {
	  add(element, obj);
	}
      }
      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      PortletDecorator oldObj = (PortletDecorator)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      PortletFeed oldObj = (PortletFeed)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      PortletIFrame oldObj = (PortletIFrame)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      PortletImage oldObj = (PortletImage)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getImage(), oldObj.getImage())) {
	remove(obj, oldObj.getImage());
	add(obj.getImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletIndicator) {
      PortletIndicator obj = (PortletIndicator)storable;
      PortletIndicator oldObj = (PortletIndicator)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPicture(), oldObj.getPicture())) {
	remove(obj, oldObj.getPicture());
	add(obj.getPicture(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      PortletJsp oldObj = (PortletJsp)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      PortletJspCollection oldObj = (PortletJspCollection)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      PortletLoggedMembers oldObj = (PortletLoggedMembers)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      PortletLogin oldObj = (PortletLogin)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletMemberActivity) {
      PortletMemberActivity obj = (PortletMemberActivity)storable;
      PortletMemberActivity oldObj = (PortletMemberActivity)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletMemberProfile) {
      PortletMemberProfile obj = (PortletMemberProfile)storable;
      PortletMemberProfile oldObj = (PortletMemberProfile)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletMemberStatus) {
      PortletMemberStatus obj = (PortletMemberStatus)storable;
      PortletMemberStatus oldObj = (PortletMemberStatus)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      PortletMenu oldObj = (PortletMenu)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getItemSeparaor(), oldObj.getItemSeparaor())) {
	remove(obj, oldObj.getItemSeparaor());
	add(obj.getItemSeparaor(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletMyCollaborativeSpaces) {
      PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)storable;
      PortletMyCollaborativeSpaces oldObj = (PortletMyCollaborativeSpaces)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      PortletMyLocks oldObj = (PortletMyLocks)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      PortletNavigate oldObj = (PortletNavigate)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      PortletNotification oldObj = (PortletNotification)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletPoll) {
      PortletPoll obj = (PortletPoll)storable;
      PortletPoll oldObj = (PortletPoll)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      PortletPortal oldObj = (PortletPortal)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
    }

    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      PortletPortalRedirect oldObj = (PortletPortalRedirect)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
    }

    if (storable instanceof PortletPublication) {
      PortletPublication obj = (PortletPublication)storable;
      PortletPublication oldObj = (PortletPublication)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      PortletQueryForeach oldObj = (PortletQueryForeach)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletQueryForeachCards) {
      PortletQueryForeachCards obj = (PortletQueryForeachCards)storable;
      PortletQueryForeachCards oldObj = (PortletQueryForeachCards)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      PortletQueryForeachDetail oldObj = (PortletQueryForeachDetail)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      PortletRSS oldObj = (PortletRSS)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      PortletRecentHistory oldObj = (PortletRecentHistory)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      PortletRow oldObj = (PortletRow)oldStorable;
      String[] array = null;

      // file[]/image[]/media[]
      array = oldObj.getBackgroundImage();
      if (array != null) {
	for (String element : array) {
	  remove(obj, element);
	}
      }
      array = obj.getBackgroundImage();
      if (array != null) {
	for (String element : array) {
	  add(element, obj);
	}
      }
      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      PortletSearch oldObj = (PortletSearch)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      PortletSelection oldObj = (PortletSelection)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      PortletSignUp oldObj = (PortletSignUp)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      PortletTopMember oldObj = (PortletTopMember)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      PortletWYSIWYG oldObj = (PortletWYSIWYG)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      PortletWorkflow oldObj = (PortletWorkflow)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof PortletWorkspaceBookmarks) {
      PortletWorkspaceBookmarks obj = (PortletWorkspaceBookmarks)storable;
      PortletWorkspaceBookmarks oldObj = (PortletWorkspaceBookmarks)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getPortletImage(), oldObj.getPortletImage())) {
	remove(obj, oldObj.getPortletImage());
	add(obj.getPortletImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getBackImage(), oldObj.getBackImage())) {
	remove(obj, oldObj.getBackImage());
	add(obj.getBackImage(), obj);
      }
    }

    if (storable instanceof Shortcut) {
      Shortcut obj = (Shortcut)storable;
      Shortcut oldObj = (Shortcut)oldStorable;
      String[] array = null;

      // file/image/media
      if (!Util.isSameContent(obj.getImage(), oldObj.getImage())) {
	remove(obj, oldObj.getImage());
	add(obj.getImage(), obj);
      }
      // file/image/media
      if (!Util.isSameContent(obj.getIcon(), oldObj.getIcon())) {
	remove(obj, oldObj.getIcon());
	add(obj.getIcon(), obj);
      }
    }
  }

  @Override
public void handleDelete(Storable storable, boolean firstTime) {
    if (storable instanceof FileDocument) {
      FileDocument obj = (FileDocument)storable;

      remove(obj, obj.getFilename());
    }


    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
    }

    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof Article) {
      Article obj = (Article)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPicture());
    }

    if (storable instanceof CollaborativeSpace) {
      CollaborativeSpace obj = (CollaborativeSpace)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getHeader());
      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof Interview) {
      Interview obj = (Interview)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPhoto());
    }

    if (storable instanceof JPortal) {
      JPortal obj = (JPortal)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
    }

    if (storable instanceof Poll) {
      Poll obj = (Poll)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getImage());
    }

    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletBirthday) {
      PortletBirthday obj = (PortletBirthday)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletBlog) {
      PortletBlog obj = (PortletBlog)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletBookmarks) {
      PortletBookmarks obj = (PortletBookmarks)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletCarousel) {
      PortletCarousel obj = (PortletCarousel)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletCollaborativeSpaceSuggestion) {
      PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      String[] array = null;

      // file[]/image[]/media[]
      array = obj.getBackgroundImage();
      if (array != null) {
        for (String element : array) {
          remove(obj, element);
        }
      }
      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getImage());
      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletIndicator) {
      PortletIndicator obj = (PortletIndicator)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPicture());
      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletMemberActivity) {
      PortletMemberActivity obj = (PortletMemberActivity)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletMemberProfile) {
      PortletMemberProfile obj = (PortletMemberProfile)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletMemberStatus) {
      PortletMemberStatus obj = (PortletMemberStatus)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getItemSeparaor());
      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletMyCollaborativeSpaces) {
      PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletPoll) {
      PortletPoll obj = (PortletPoll)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
    }

    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
    }

    if (storable instanceof PortletPublication) {
      PortletPublication obj = (PortletPublication)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletQueryForeachCards) {
      PortletQueryForeachCards obj = (PortletQueryForeachCards)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      String[] array = null;

      // file[]/image[]/media[]
      array = obj.getBackgroundImage();
      if (array != null) {
        for (String element : array) {
          remove(obj, element);
        }
      }
      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof PortletWorkspaceBookmarks) {
      PortletWorkspaceBookmarks obj = (PortletWorkspaceBookmarks)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getPortletImage());
      // file/image/media
      remove(obj, obj.getBackImage());
    }

    if (storable instanceof Shortcut) {
      Shortcut obj = (Shortcut)storable;
      String[] array = null;

      // file/image/media
      remove(obj, obj.getImage());
      // file/image/media
      remove(obj, obj.getIcon());
    }
  }

}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// AW45xMGVcGemiRlzIUYFaA==
