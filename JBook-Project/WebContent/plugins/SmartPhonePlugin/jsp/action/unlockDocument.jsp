<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

if (!isLogged) {
  return;
}

FileDocument document = (FileDocument) getPublicationParameter("pubId");

if (document == null) {
  return;
}

if (!loggedMember.canUnlock(document)) {
  return;
}

document.unlock(loggedMember);
%>