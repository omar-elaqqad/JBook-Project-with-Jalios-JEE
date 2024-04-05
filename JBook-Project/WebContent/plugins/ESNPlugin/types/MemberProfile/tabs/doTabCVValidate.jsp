<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

// Only for accounts (For contacts case, see doTabInformations.jsp)
if (isContact) {
  uiTab.disable(request);
  return;
}
// Asked by target
if (showTabForTarget) {
  return;
}

// Native conditions
List<MemberEducation> educationList = esnMgr.getMemberEducationList(member); 
boolean hasEducations = Util.notEmpty(educationList);
boolean canPublishEducation = esnProfileDisplayHandler.canPublishMemberEducation();
boolean showEducations = hasEducations || canPublishEducation;

List<MemberJob> jobList = esnMgr.getMemberJobList(member);
boolean hasJobs = Util.notEmpty(jobList);
boolean canPublishJob = esnProfileDisplayHandler.canPublishMemberJob();
boolean showJobs = hasJobs || canPublishJob;

boolean hasLinks = Util.notEmpty(esnMgr.getMemberLinkList(member));
boolean canEditLinks = canEdit;
boolean showLinks = hasLinks || canEditLinks;

// Tests synced with doPresentation.jsp
boolean showPresentation;
{
  String introduction = profile.getIntroduction();
  boolean hasIntroduction = Util.notEmpty(introduction);
  List<String> interest = profile.getInterest();
  boolean showManager = esnProfileDisplayHandler.showManager(); 
  showManager = member.getManager() != null;
  boolean hasDateOfBirth = Util.notEmpty(profile.getDateOfBirth());
  boolean hasDateOfArrival = Util.notEmpty(profile.getDateOfArrival());
  boolean hasInterest = Util.notEmpty(interest);
  showPresentation = hasIntroduction
      || showManager
      || hasDateOfBirth
      || hasDateOfArrival
      || hasInterest;
}

boolean show = showEducations
  || showJobs
  || showLinks
  || showPresentation;
if (!show) {
  uiTab.disable(request);
}
%>
