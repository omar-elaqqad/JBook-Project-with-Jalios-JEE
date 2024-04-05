// This file was automatically generated. Please, do not edit.
package generated;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import com.jalios.jcms.AbstractLinkIndexListener;
import com.jalios.jcms.Data;
import com.jalios.jstore.Storable;
public class LinkIndexListener extends AbstractLinkIndexListener {
  public LinkIndexListener(
      TreeMap<Data,Map<Class<? extends Data>,Map<String,TreeSet<Data>>>> jstoreIndex,
      TreeMap<String,Map<Class<? extends Data>,Map<String,TreeSet<Data>>>> jcmsdbIndex) {
    super(jstoreIndex, jcmsdbIndex);
  }
  
  public void handleCreate(Storable storable, boolean firstTime) {
    // AbstractCollection
    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractParent
    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      
      // child
      add(obj, obj.getChild(), "child");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractPortal
    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      
      // child
      add(obj, obj.getChild(), "child");
    }
    // AbstractPortlet
    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractPortletSkinable
    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // Article
    if (storable instanceof Article) {
      Article obj = (Article)storable;
      
      // relatedContents
      add(obj, obj.getRelatedContents(false), "relatedContents");
      add(obj, obj.getRelatedContentsDBID(), "relatedContents");
    }
    // Blog
    if (storable instanceof Blog) {
      Blog obj = (Blog)storable;
      
      // bloggerGroup
      add(obj, obj.getBloggerGroup(), "bloggerGroup");
    }
    // CSRequest
    if (storable instanceof CSRequest) {
      CSRequest obj = (CSRequest)storable;
      
      // admins
      add(obj, obj.getAdmins(false), "admins");
      add(obj, obj.getAdminsDBID(), "admins");
      // groups
      add(obj, obj.getGroups(), "groups");
      // members
      add(obj, obj.getMembers(false), "members");
      add(obj, obj.getMembersDBID(), "members");
    }
    // CollaborativeSpace
    if (storable instanceof CollaborativeSpace) {
      CollaborativeSpace obj = (CollaborativeSpace)storable;
      
      // followersGroup
      add(obj, obj.getFollowersGroup(), "followersGroup");
      // jportal
      add(obj, obj.getJportal(), "jportal");
      // model
      add(obj, obj.getModel(), "model");
      // applications
      add(obj, obj.getApplications(), "applications");
      // mobilePortlets
      add(obj, obj.getMobilePortlets(), "mobilePortlets");
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // FaqEntry
    if (storable instanceof FaqEntry) {
      FaqEntry obj = (FaqEntry)storable;
      
      // faq
      add(obj, obj.getFaq(), "faq");
    }
    // GlossaryEntry
    if (storable instanceof GlossaryEntry) {
      GlossaryEntry obj = (GlossaryEntry)storable;
      
      // seeAlso
      add(obj, obj.getSeeAlso(), "seeAlso");
      // glossary
      add(obj, obj.getGlossary(), "glossary");
    }
    // JPortal
    if (storable instanceof JPortal) {
      JPortal obj = (JPortal)storable;
      
      // portlets
      add(obj, obj.getPortlets(), "portlets");
    }
    // PortalJspCollection
    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
      // child
      add(obj, obj.getChild(), "child");
    }
    // PortletBirthday
    if (storable instanceof PortletBirthday) {
      PortletBirthday obj = (PortletBirthday)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletBlog
    if (storable instanceof PortletBlog) {
      PortletBlog obj = (PortletBlog)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletBookmarks
    if (storable instanceof PortletBookmarks) {
      PortletBookmarks obj = (PortletBookmarks)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletCarousel
    if (storable instanceof PortletCarousel) {
      PortletCarousel obj = (PortletCarousel)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      add(obj, obj.getPublications(false), "publications");
      add(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletCollaborativeSpaceSuggestion
    if (storable instanceof PortletCollaborativeSpaceSuggestion) {
      PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletColumn
    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletDecorator
    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      
      // child
      add(obj, obj.getChild(), "child");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletFeed
    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      add(obj, obj.getPublications(false), "publications");
      add(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletIFrame
    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletImage
    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletIndicator
    if (storable instanceof PortletIndicator) {
      PortletIndicator obj = (PortletIndicator)storable;
      
      // publicationLink
      add(obj, obj.getPublicationLink(false), "publicationLink");
      add(obj, obj.getPublicationLinkDBID(), "publicationLink");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletJsp
    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletJspCollection
    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletLoggedMembers
    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletLogin
    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      
      // displayPortal
      add(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMemberActivity
    if (storable instanceof PortletMemberActivity) {
      PortletMemberActivity obj = (PortletMemberActivity)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMemberProfile
    if (storable instanceof PortletMemberProfile) {
      PortletMemberProfile obj = (PortletMemberProfile)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMemberStatus
    if (storable instanceof PortletMemberStatus) {
      PortletMemberStatus obj = (PortletMemberStatus)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMenu
    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMyCollaborativeSpaces
    if (storable instanceof PortletMyCollaborativeSpaces) {
      PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMyLocks
    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletNavigate
    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletNotification
    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletPoll
    if (storable instanceof PortletPoll) {
      PortletPoll obj = (PortletPoll)storable;
      
      // poll
      add(obj, obj.getPoll(), "poll");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletPortal
    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      
      // child
      add(obj, obj.getChild(), "child");
    }
    // PortletPortalRedirect
    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      
      // content
      add(obj, obj.getContent(false), "content");
      add(obj, obj.getContentDBID(), "content");
      // redirectPortlet
      add(obj, obj.getRedirectPortlet(), "redirectPortlet");
      // dispPortal
      add(obj, obj.getDispPortal(), "dispPortal");
    }
    // PortletPublication
    if (storable instanceof PortletPublication) {
      PortletPublication obj = (PortletPublication)storable;
      
      // pub
      add(obj, obj.getPub(false), "pub");
      add(obj, obj.getPubDBID(), "pub");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletQueryForeach
    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      add(obj, obj.getPublications(false), "publications");
      add(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletQueryForeachCards
    if (storable instanceof PortletQueryForeachCards) {
      PortletQueryForeachCards obj = (PortletQueryForeachCards)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      add(obj, obj.getPublications(false), "publications");
      add(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletQueryForeachDetail
    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      add(obj, obj.getPublications(false), "publications");
      add(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletRSS
    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletRecentHistory
    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletRow
    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletSearch
    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      
      // queryPortlet
      add(obj, obj.getQueryPortlet(), "queryPortlet");
      // displayPortal
      add(obj, obj.getDisplayPortal(false), "displayPortal");
      add(obj, obj.getDisplayPortalDBID(), "displayPortal");
      // advancedSearchPortlet
      add(obj, obj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletSelection
    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletSignUp
    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      
      // displayPortal
      add(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletTopMember
    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletWYSIWYG
    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletWorkflow
    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletWorkspaceBookmarks
    if (storable instanceof PortletWorkspaceBookmarks) {
      PortletWorkspaceBookmarks obj = (PortletWorkspaceBookmarks)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // Shortcut
    if (storable instanceof Shortcut) {
      Shortcut obj = (Shortcut)storable;
      
      // pub
      add(obj, obj.getPub(false), "pub");
      add(obj, obj.getPubDBID(), "pub");
    }
    // SmartPhonePortal
    if (storable instanceof SmartPhonePortal) {
      SmartPhonePortal obj = (SmartPhonePortal)storable;
      
      // portlets
      add(obj, obj.getPortlets(), "portlets");
    }
  }
  
  public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {
    // AbstractCollection    
    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      AbstractCollection oldObj = (AbstractCollection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractParent    
    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      AbstractParent oldObj = (AbstractParent)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractPortal    
    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      AbstractPortal oldObj = (AbstractPortal)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
    }
    // AbstractPortlet    
    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      AbstractPortlet oldObj = (AbstractPortlet)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractPortletSkinable    
    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      AbstractPortletSkinable oldObj = (AbstractPortletSkinable)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // Article    
    if (storable instanceof Article) {
      Article obj = (Article)storable;
      Article oldObj = (Article)oldStorable;
      
      // relatedContents
      if (obj.getRelatedContents(false) != oldObj.getRelatedContents(false)) {
        remove(obj, oldObj.getRelatedContents(false), "relatedContents");
        add(obj, obj.getRelatedContents(false), "relatedContents");
      }
      if (obj.getRelatedContentsDBID() != oldObj.getRelatedContentsDBID()) {
        remove(obj, oldObj.getRelatedContentsDBID(), "relatedContents");
        add(obj, obj.getRelatedContentsDBID(), "relatedContents");
      }
    }
    // Blog    
    if (storable instanceof Blog) {
      Blog obj = (Blog)storable;
      Blog oldObj = (Blog)oldStorable;
      
      // bloggerGroup
      if (obj.getBloggerGroup() != oldObj.getBloggerGroup()) {
        remove(obj, oldObj.getBloggerGroup(), "bloggerGroup");
        add(obj, obj.getBloggerGroup(), "bloggerGroup");
      }
    }
    // CSRequest    
    if (storable instanceof CSRequest) {
      CSRequest obj = (CSRequest)storable;
      CSRequest oldObj = (CSRequest)oldStorable;
      
      // admins
      if (obj.getAdmins(false) != oldObj.getAdmins(false)) {
        remove(obj, oldObj.getAdmins(false), "admins");
        add(obj, obj.getAdmins(false), "admins");
      }
      if (obj.getAdminsDBID() != oldObj.getAdminsDBID()) {
        remove(obj, oldObj.getAdminsDBID(), "admins");
        add(obj, obj.getAdminsDBID(), "admins");
      }
      // groups
      if (obj.getGroups() != oldObj.getGroups()) {
        remove(obj, oldObj.getGroups(), "groups");
        add(obj, obj.getGroups(), "groups");
      }
      // members
      if (obj.getMembers(false) != oldObj.getMembers(false)) {
        remove(obj, oldObj.getMembers(false), "members");
        add(obj, obj.getMembers(false), "members");
      }
      if (obj.getMembersDBID() != oldObj.getMembersDBID()) {
        remove(obj, oldObj.getMembersDBID(), "members");
        add(obj, obj.getMembersDBID(), "members");
      }
    }
    // CollaborativeSpace    
    if (storable instanceof CollaborativeSpace) {
      CollaborativeSpace obj = (CollaborativeSpace)storable;
      CollaborativeSpace oldObj = (CollaborativeSpace)oldStorable;
      
      // followersGroup
      if (obj.getFollowersGroup() != oldObj.getFollowersGroup()) {
        remove(obj, oldObj.getFollowersGroup(), "followersGroup");
        add(obj, obj.getFollowersGroup(), "followersGroup");
      }
      // jportal
      if (obj.getJportal() != oldObj.getJportal()) {
        remove(obj, oldObj.getJportal(), "jportal");
        add(obj, obj.getJportal(), "jportal");
      }
      // model
      if (obj.getModel() != oldObj.getModel()) {
        remove(obj, oldObj.getModel(), "model");
        add(obj, obj.getModel(), "model");
      }
      // applications
      if (obj.getApplications() != oldObj.getApplications()) {
        remove(obj, oldObj.getApplications(), "applications");
        add(obj, obj.getApplications(), "applications");
      }
      // mobilePortlets
      if (obj.getMobilePortlets() != oldObj.getMobilePortlets()) {
        remove(obj, oldObj.getMobilePortlets(), "mobilePortlets");
        add(obj, obj.getMobilePortlets(), "mobilePortlets");
      }
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // FaqEntry    
    if (storable instanceof FaqEntry) {
      FaqEntry obj = (FaqEntry)storable;
      FaqEntry oldObj = (FaqEntry)oldStorable;
      
      // faq
      if (obj.getFaq() != oldObj.getFaq()) {
        remove(obj, oldObj.getFaq(), "faq");
        add(obj, obj.getFaq(), "faq");
      }
    }
    // GlossaryEntry    
    if (storable instanceof GlossaryEntry) {
      GlossaryEntry obj = (GlossaryEntry)storable;
      GlossaryEntry oldObj = (GlossaryEntry)oldStorable;
      
      // seeAlso
      if (obj.getSeeAlso() != oldObj.getSeeAlso()) {
        remove(obj, oldObj.getSeeAlso(), "seeAlso");
        add(obj, obj.getSeeAlso(), "seeAlso");
      }
      // glossary
      if (obj.getGlossary() != oldObj.getGlossary()) {
        remove(obj, oldObj.getGlossary(), "glossary");
        add(obj, obj.getGlossary(), "glossary");
      }
    }
    // JPortal    
    if (storable instanceof JPortal) {
      JPortal obj = (JPortal)storable;
      JPortal oldObj = (JPortal)oldStorable;
      
      // portlets
      if (obj.getPortlets() != oldObj.getPortlets()) {
        remove(obj, oldObj.getPortlets(), "portlets");
        add(obj, obj.getPortlets(), "portlets");
      }
    }
    // PortalJspCollection    
    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      PortalJspCollection oldObj = (PortalJspCollection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
    }
    // PortletBirthday    
    if (storable instanceof PortletBirthday) {
      PortletBirthday obj = (PortletBirthday)storable;
      PortletBirthday oldObj = (PortletBirthday)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletBlog    
    if (storable instanceof PortletBlog) {
      PortletBlog obj = (PortletBlog)storable;
      PortletBlog oldObj = (PortletBlog)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletBookmarks    
    if (storable instanceof PortletBookmarks) {
      PortletBookmarks obj = (PortletBookmarks)storable;
      PortletBookmarks oldObj = (PortletBookmarks)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletCarousel    
    if (storable instanceof PortletCarousel) {
      PortletCarousel obj = (PortletCarousel)storable;
      PortletCarousel oldObj = (PortletCarousel)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      if (obj.getFirstPublicationsDBID() != oldObj.getFirstPublicationsDBID()) {
        remove(obj, oldObj.getFirstPublicationsDBID(), "firstPublications");
        add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      }
      // publications
      if (obj.getPublications(false) != oldObj.getPublications(false)) {
        remove(obj, oldObj.getPublications(false), "publications");
        add(obj, obj.getPublications(false), "publications");
      }
      if (obj.getPublicationsDBID() != oldObj.getPublicationsDBID()) {
        remove(obj, oldObj.getPublicationsDBID(), "publications");
        add(obj, obj.getPublicationsDBID(), "publications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletCollaborativeSpaceSuggestion    
    if (storable instanceof PortletCollaborativeSpaceSuggestion) {
      PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)storable;
      PortletCollaborativeSpaceSuggestion oldObj = (PortletCollaborativeSpaceSuggestion)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletColumn    
    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      PortletColumn oldObj = (PortletColumn)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletDecorator    
    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      PortletDecorator oldObj = (PortletDecorator)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletFeed    
    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      PortletFeed oldObj = (PortletFeed)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      if (obj.getFirstPublicationsDBID() != oldObj.getFirstPublicationsDBID()) {
        remove(obj, oldObj.getFirstPublicationsDBID(), "firstPublications");
        add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      }
      // publications
      if (obj.getPublications(false) != oldObj.getPublications(false)) {
        remove(obj, oldObj.getPublications(false), "publications");
        add(obj, obj.getPublications(false), "publications");
      }
      if (obj.getPublicationsDBID() != oldObj.getPublicationsDBID()) {
        remove(obj, oldObj.getPublicationsDBID(), "publications");
        add(obj, obj.getPublicationsDBID(), "publications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletIFrame    
    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      PortletIFrame oldObj = (PortletIFrame)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletImage    
    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      PortletImage oldObj = (PortletImage)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletIndicator    
    if (storable instanceof PortletIndicator) {
      PortletIndicator obj = (PortletIndicator)storable;
      PortletIndicator oldObj = (PortletIndicator)oldStorable;
      
      // publicationLink
      if (obj.getPublicationLink(false) != oldObj.getPublicationLink(false)) {
        remove(obj, oldObj.getPublicationLink(false), "publicationLink");
        add(obj, obj.getPublicationLink(false), "publicationLink");
      }
      if (obj.getPublicationLinkDBID() != oldObj.getPublicationLinkDBID()) {
        remove(obj, oldObj.getPublicationLinkDBID(), "publicationLink");
        add(obj, obj.getPublicationLinkDBID(), "publicationLink");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletJsp    
    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      PortletJsp oldObj = (PortletJsp)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletJspCollection    
    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      PortletJspCollection oldObj = (PortletJspCollection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletLoggedMembers    
    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      PortletLoggedMembers oldObj = (PortletLoggedMembers)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletLogin    
    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      PortletLogin oldObj = (PortletLogin)oldStorable;
      
      // displayPortal
      if (obj.getDisplayPortal() != oldObj.getDisplayPortal()) {
        remove(obj, oldObj.getDisplayPortal(), "displayPortal");
        add(obj, obj.getDisplayPortal(), "displayPortal");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMemberActivity    
    if (storable instanceof PortletMemberActivity) {
      PortletMemberActivity obj = (PortletMemberActivity)storable;
      PortletMemberActivity oldObj = (PortletMemberActivity)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMemberProfile    
    if (storable instanceof PortletMemberProfile) {
      PortletMemberProfile obj = (PortletMemberProfile)storable;
      PortletMemberProfile oldObj = (PortletMemberProfile)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMemberStatus    
    if (storable instanceof PortletMemberStatus) {
      PortletMemberStatus obj = (PortletMemberStatus)storable;
      PortletMemberStatus oldObj = (PortletMemberStatus)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMenu    
    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      PortletMenu oldObj = (PortletMenu)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMyCollaborativeSpaces    
    if (storable instanceof PortletMyCollaborativeSpaces) {
      PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)storable;
      PortletMyCollaborativeSpaces oldObj = (PortletMyCollaborativeSpaces)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMyLocks    
    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      PortletMyLocks oldObj = (PortletMyLocks)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletNavigate    
    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      PortletNavigate oldObj = (PortletNavigate)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletNotification    
    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      PortletNotification oldObj = (PortletNotification)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletPoll    
    if (storable instanceof PortletPoll) {
      PortletPoll obj = (PortletPoll)storable;
      PortletPoll oldObj = (PortletPoll)oldStorable;
      
      // poll
      if (obj.getPoll() != oldObj.getPoll()) {
        remove(obj, oldObj.getPoll(), "poll");
        add(obj, obj.getPoll(), "poll");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletPortal    
    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      PortletPortal oldObj = (PortletPortal)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
    }
    // PortletPortalRedirect    
    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      PortletPortalRedirect oldObj = (PortletPortalRedirect)oldStorable;
      
      // content
      if (obj.getContent(false) != oldObj.getContent(false)) {
        remove(obj, oldObj.getContent(false), "content");
        add(obj, obj.getContent(false), "content");
      }
      if (obj.getContentDBID() != oldObj.getContentDBID()) {
        remove(obj, oldObj.getContentDBID(), "content");
        add(obj, obj.getContentDBID(), "content");
      }
      // redirectPortlet
      if (obj.getRedirectPortlet() != oldObj.getRedirectPortlet()) {
        remove(obj, oldObj.getRedirectPortlet(), "redirectPortlet");
        add(obj, obj.getRedirectPortlet(), "redirectPortlet");
      }
      // dispPortal
      if (obj.getDispPortal() != oldObj.getDispPortal()) {
        remove(obj, oldObj.getDispPortal(), "dispPortal");
        add(obj, obj.getDispPortal(), "dispPortal");
      }
    }
    // PortletPublication    
    if (storable instanceof PortletPublication) {
      PortletPublication obj = (PortletPublication)storable;
      PortletPublication oldObj = (PortletPublication)oldStorable;
      
      // pub
      if (obj.getPub(false) != oldObj.getPub(false)) {
        remove(obj, oldObj.getPub(false), "pub");
        add(obj, obj.getPub(false), "pub");
      }
      if (obj.getPubDBID() != oldObj.getPubDBID()) {
        remove(obj, oldObj.getPubDBID(), "pub");
        add(obj, obj.getPubDBID(), "pub");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletQueryForeach    
    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      PortletQueryForeach oldObj = (PortletQueryForeach)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      if (obj.getFirstPublicationsDBID() != oldObj.getFirstPublicationsDBID()) {
        remove(obj, oldObj.getFirstPublicationsDBID(), "firstPublications");
        add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      }
      // publications
      if (obj.getPublications(false) != oldObj.getPublications(false)) {
        remove(obj, oldObj.getPublications(false), "publications");
        add(obj, obj.getPublications(false), "publications");
      }
      if (obj.getPublicationsDBID() != oldObj.getPublicationsDBID()) {
        remove(obj, oldObj.getPublicationsDBID(), "publications");
        add(obj, obj.getPublicationsDBID(), "publications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletQueryForeachCards    
    if (storable instanceof PortletQueryForeachCards) {
      PortletQueryForeachCards obj = (PortletQueryForeachCards)storable;
      PortletQueryForeachCards oldObj = (PortletQueryForeachCards)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      if (obj.getFirstPublicationsDBID() != oldObj.getFirstPublicationsDBID()) {
        remove(obj, oldObj.getFirstPublicationsDBID(), "firstPublications");
        add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      }
      // publications
      if (obj.getPublications(false) != oldObj.getPublications(false)) {
        remove(obj, oldObj.getPublications(false), "publications");
        add(obj, obj.getPublications(false), "publications");
      }
      if (obj.getPublicationsDBID() != oldObj.getPublicationsDBID()) {
        remove(obj, oldObj.getPublicationsDBID(), "publications");
        add(obj, obj.getPublicationsDBID(), "publications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletQueryForeachDetail    
    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      PortletQueryForeachDetail oldObj = (PortletQueryForeachDetail)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      if (obj.getFirstPublicationsDBID() != oldObj.getFirstPublicationsDBID()) {
        remove(obj, oldObj.getFirstPublicationsDBID(), "firstPublications");
        add(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      }
      // publications
      if (obj.getPublications(false) != oldObj.getPublications(false)) {
        remove(obj, oldObj.getPublications(false), "publications");
        add(obj, obj.getPublications(false), "publications");
      }
      if (obj.getPublicationsDBID() != oldObj.getPublicationsDBID()) {
        remove(obj, oldObj.getPublicationsDBID(), "publications");
        add(obj, obj.getPublicationsDBID(), "publications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletRSS    
    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      PortletRSS oldObj = (PortletRSS)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletRecentHistory    
    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      PortletRecentHistory oldObj = (PortletRecentHistory)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletRow    
    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      PortletRow oldObj = (PortletRow)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletSearch    
    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      PortletSearch oldObj = (PortletSearch)oldStorable;
      
      // queryPortlet
      if (obj.getQueryPortlet() != oldObj.getQueryPortlet()) {
        remove(obj, oldObj.getQueryPortlet(), "queryPortlet");
        add(obj, obj.getQueryPortlet(), "queryPortlet");
      }
      // displayPortal
      if (obj.getDisplayPortal(false) != oldObj.getDisplayPortal(false)) {
        remove(obj, oldObj.getDisplayPortal(false), "displayPortal");
        add(obj, obj.getDisplayPortal(false), "displayPortal");
      }
      if (obj.getDisplayPortalDBID() != oldObj.getDisplayPortalDBID()) {
        remove(obj, oldObj.getDisplayPortalDBID(), "displayPortal");
        add(obj, obj.getDisplayPortalDBID(), "displayPortal");
      }
      // advancedSearchPortlet
      if (obj.getAdvancedSearchPortlet() != oldObj.getAdvancedSearchPortlet()) {
        remove(obj, oldObj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
        add(obj, obj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletSelection    
    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      PortletSelection oldObj = (PortletSelection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletSignUp    
    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      PortletSignUp oldObj = (PortletSignUp)oldStorable;
      
      // displayPortal
      if (obj.getDisplayPortal() != oldObj.getDisplayPortal()) {
        remove(obj, oldObj.getDisplayPortal(), "displayPortal");
        add(obj, obj.getDisplayPortal(), "displayPortal");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletTopMember    
    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      PortletTopMember oldObj = (PortletTopMember)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletWYSIWYG    
    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      PortletWYSIWYG oldObj = (PortletWYSIWYG)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletWorkflow    
    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      PortletWorkflow oldObj = (PortletWorkflow)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletWorkspaceBookmarks    
    if (storable instanceof PortletWorkspaceBookmarks) {
      PortletWorkspaceBookmarks obj = (PortletWorkspaceBookmarks)storable;
      PortletWorkspaceBookmarks oldObj = (PortletWorkspaceBookmarks)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // Shortcut    
    if (storable instanceof Shortcut) {
      Shortcut obj = (Shortcut)storable;
      Shortcut oldObj = (Shortcut)oldStorable;
      
      // pub
      if (obj.getPub(false) != oldObj.getPub(false)) {
        remove(obj, oldObj.getPub(false), "pub");
        add(obj, obj.getPub(false), "pub");
      }
      if (obj.getPubDBID() != oldObj.getPubDBID()) {
        remove(obj, oldObj.getPubDBID(), "pub");
        add(obj, obj.getPubDBID(), "pub");
      }
    }
    // SmartPhonePortal    
    if (storable instanceof SmartPhonePortal) {
      SmartPhonePortal obj = (SmartPhonePortal)storable;
      SmartPhonePortal oldObj = (SmartPhonePortal)oldStorable;
      
      // portlets
      if (obj.getPortlets() != oldObj.getPortlets()) {
        remove(obj, oldObj.getPortlets(), "portlets");
        add(obj, obj.getPortlets(), "portlets");
      }
    }
  }
  
  public void handleDelete(Storable storable, boolean firstTime) {
    // AbstractCollection   
    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractParent   
    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractPortal   
    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
    }    
    // AbstractPortlet   
    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractPortletSkinable   
    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // Article   
    if (storable instanceof Article) {
      Article obj = (Article)storable;
    
      // relatedContents
      remove(obj, obj.getRelatedContents(false), "relatedContents");
      remove(obj, obj.getRelatedContentsDBID(), "relatedContents");
    }    
    // Blog   
    if (storable instanceof Blog) {
      Blog obj = (Blog)storable;
    
      // bloggerGroup
      remove(obj, obj.getBloggerGroup(), "bloggerGroup");
    }    
    // CSRequest   
    if (storable instanceof CSRequest) {
      CSRequest obj = (CSRequest)storable;
    
      // admins
      remove(obj, obj.getAdmins(false), "admins");
      remove(obj, obj.getAdminsDBID(), "admins");
      // groups
      remove(obj, obj.getGroups(), "groups");
      // members
      remove(obj, obj.getMembers(false), "members");
      remove(obj, obj.getMembersDBID(), "members");
    }    
    // CollaborativeSpace   
    if (storable instanceof CollaborativeSpace) {
      CollaborativeSpace obj = (CollaborativeSpace)storable;
    
      // followersGroup
      remove(obj, obj.getFollowersGroup(), "followersGroup");
      // jportal
      remove(obj, obj.getJportal(), "jportal");
      // model
      remove(obj, obj.getModel(), "model");
      // applications
      remove(obj, obj.getApplications(), "applications");
      // mobilePortlets
      remove(obj, obj.getMobilePortlets(), "mobilePortlets");
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // FaqEntry   
    if (storable instanceof FaqEntry) {
      FaqEntry obj = (FaqEntry)storable;
    
      // faq
      remove(obj, obj.getFaq(), "faq");
    }    
    // GlossaryEntry   
    if (storable instanceof GlossaryEntry) {
      GlossaryEntry obj = (GlossaryEntry)storable;
    
      // seeAlso
      remove(obj, obj.getSeeAlso(), "seeAlso");
      // glossary
      remove(obj, obj.getGlossary(), "glossary");
    }    
    // JPortal   
    if (storable instanceof JPortal) {
      JPortal obj = (JPortal)storable;
    
      // portlets
      remove(obj, obj.getPortlets(), "portlets");
    }    
    // PortalJspCollection   
    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
      // child
      remove(obj, obj.getChild(), "child");
    }    
    // PortletBirthday   
    if (storable instanceof PortletBirthday) {
      PortletBirthday obj = (PortletBirthday)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletBlog   
    if (storable instanceof PortletBlog) {
      PortletBlog obj = (PortletBlog)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletBookmarks   
    if (storable instanceof PortletBookmarks) {
      PortletBookmarks obj = (PortletBookmarks)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletCarousel   
    if (storable instanceof PortletCarousel) {
      PortletCarousel obj = (PortletCarousel)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      remove(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      remove(obj, obj.getPublications(false), "publications");
      remove(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletCollaborativeSpaceSuggestion   
    if (storable instanceof PortletCollaborativeSpaceSuggestion) {
      PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletColumn   
    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletDecorator   
    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletFeed   
    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      remove(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      remove(obj, obj.getPublications(false), "publications");
      remove(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletIFrame   
    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletImage   
    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletIndicator   
    if (storable instanceof PortletIndicator) {
      PortletIndicator obj = (PortletIndicator)storable;
    
      // publicationLink
      remove(obj, obj.getPublicationLink(false), "publicationLink");
      remove(obj, obj.getPublicationLinkDBID(), "publicationLink");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletJsp   
    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletJspCollection   
    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletLoggedMembers   
    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletLogin   
    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
    
      // displayPortal
      remove(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMemberActivity   
    if (storable instanceof PortletMemberActivity) {
      PortletMemberActivity obj = (PortletMemberActivity)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMemberProfile   
    if (storable instanceof PortletMemberProfile) {
      PortletMemberProfile obj = (PortletMemberProfile)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMemberStatus   
    if (storable instanceof PortletMemberStatus) {
      PortletMemberStatus obj = (PortletMemberStatus)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMenu   
    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMyCollaborativeSpaces   
    if (storable instanceof PortletMyCollaborativeSpaces) {
      PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMyLocks   
    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletNavigate   
    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletNotification   
    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletPoll   
    if (storable instanceof PortletPoll) {
      PortletPoll obj = (PortletPoll)storable;
    
      // poll
      remove(obj, obj.getPoll(), "poll");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletPortal   
    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
    }    
    // PortletPortalRedirect   
    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
    
      // content
      remove(obj, obj.getContent(false), "content");
      remove(obj, obj.getContentDBID(), "content");
      // redirectPortlet
      remove(obj, obj.getRedirectPortlet(), "redirectPortlet");
      // dispPortal
      remove(obj, obj.getDispPortal(), "dispPortal");
    }    
    // PortletPublication   
    if (storable instanceof PortletPublication) {
      PortletPublication obj = (PortletPublication)storable;
    
      // pub
      remove(obj, obj.getPub(false), "pub");
      remove(obj, obj.getPubDBID(), "pub");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletQueryForeach   
    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      remove(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      remove(obj, obj.getPublications(false), "publications");
      remove(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletQueryForeachCards   
    if (storable instanceof PortletQueryForeachCards) {
      PortletQueryForeachCards obj = (PortletQueryForeachCards)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      remove(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      remove(obj, obj.getPublications(false), "publications");
      remove(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletQueryForeachDetail   
    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      remove(obj, obj.getFirstPublicationsDBID(), "firstPublications");
      // publications
      remove(obj, obj.getPublications(false), "publications");
      remove(obj, obj.getPublicationsDBID(), "publications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletRSS   
    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletRecentHistory   
    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletRow   
    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletSearch   
    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
    
      // queryPortlet
      remove(obj, obj.getQueryPortlet(), "queryPortlet");
      // displayPortal
      remove(obj, obj.getDisplayPortal(false), "displayPortal");
      remove(obj, obj.getDisplayPortalDBID(), "displayPortal");
      // advancedSearchPortlet
      remove(obj, obj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletSelection   
    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletSignUp   
    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
    
      // displayPortal
      remove(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletTopMember   
    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletWYSIWYG   
    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletWorkflow   
    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletWorkspaceBookmarks   
    if (storable instanceof PortletWorkspaceBookmarks) {
      PortletWorkspaceBookmarks obj = (PortletWorkspaceBookmarks)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // Shortcut   
    if (storable instanceof Shortcut) {
      Shortcut obj = (Shortcut)storable;
    
      // pub
      remove(obj, obj.getPub(false), "pub");
      remove(obj, obj.getPubDBID(), "pub");
    }    
    // SmartPhonePortal   
    if (storable instanceof SmartPhonePortal) {
      SmartPhonePortal obj = (SmartPhonePortal)storable;
    
      // portlets
      remove(obj, obj.getPortlets(), "portlets");
    }    
  }
  
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// FXPTV1XcoG1Ek7cB1bygcQ==
