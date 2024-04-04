<%--
  @Summary: Display information about JCMS in an XML form
            You can use this file to regularly retrieve status of JCMS.
  @Category: Admin
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Since: jcms-5.5
--%><%
%><%@ page import="com.jalios.jcms.quota.*" %><%
%><%
  if (!JcmsUtil.isAuthorizedToAccessStatusInfo(context, request)) {
    JcmsUtil.logSecurityIssue(logger, "Forbidden acces to statusXml.jsp from " + request.getRemoteAddr());
    response.sendError(403, "You are not allowed to access this resource.");
    return;
  }
  response.setContentType("text/xml; charset=UTF-8"); 
%><?xml version="1.0" encoding="UTF-8"?><%
%><%@ page import="com.jalios.jdring.*,java.lang.management.*,custom.*,generated.*, com.jalios.jcms.*, com.jalios.jcms.dbmember.*, com.jalios.jcms.policy.*, com.jalios.jcms.mail.*, com.jalios.jcms.archive.*, com.jalios.jcms.db.*, com.jalios.jcms.mashup.*, com.jalios.jcms.plugin.*, com.jalios.jcms.portlet.*, com.jalios.jcms.workspace.*, com.jalios.util.*, com.jalios.util.diff.*, java.io.*, java.util.*, java.text.*, java.net.*,org.apache.log4j.Logger, com.mchange.v2.c3p0.PooledDataSource" %><%
%><%@ taglib uri="jcms.tld" prefix="jalios" %><%!
  Channel channel;
  Logger logger;
  ServletContext context;
  public void jspInit() {
    context = getServletConfig().getServletContext();
    channel = Channel.getChannel();
    logger = Logger.getLogger("jsp.statusXml_jsp");
  }
  
  private String gp(String prop) {
    return channel.getProperty(prop, "");
  }
  
  private String gpe(String prop) {
    return escape(gp(prop));
  }
  private String escape(Object str) {
    return escape(String.valueOf(str));
  }
  private String escape(String str) {
    return XmlUtil.normalize(str);
  }
  private String encodeForXML(String input) {
    return HttpUtil.encodeForXML(input);
  }
  private String encodeForXMLAttribute(String input) {
    return HttpUtil.encodeForXMLAttribute(input);
  }
  
  private String toXmlString(MemoryUsage usage, String surroundingTag) {
    if (Util.isEmpty(usage)) {
      return "";
    }
    StringBuffer buffer = new StringBuffer();
    if (Util.notEmpty(surroundingTag)) {
      buffer.append('<').append(surroundingTag).append('>');
    }
    buffer.append(Util.surroundWithTag(Long.toString(usage.getCommitted()), "committed"))
          .append(Util.surroundWithTag(Long.toString(usage.getInit()),      "init"))
          .append(Util.surroundWithTag(Long.toString(usage.getMax()),       "max"))
          .append(Util.surroundWithTag(Long.toString(usage.getUsed()),      "used"));
    if (Util.notEmpty(surroundingTag)) {
      buffer.append("</").append(surroundingTag).append('>');
    }
    return buffer.toString();
  }

  /**
   * Check if the specified section should be displayed
   * @param sectionName the name of the section to display or not
   * @param sections a Set containing the section requested in parameters 
   * @param parentSections a Set containing the parent section deduced from explicitely specified section
   * @since JCMS-6724
   */
  private boolean showSection(final String sectionName, final Set<String> sections, final Set<String> parentSections) {
    // If no section was specified, display all, otherwise display only the requested sections
    if (Util.isEmpty(sections)) {
      return true;
    }
    
    if (sections.contains(sectionName)) {
      return true;
    }
    
    if (parentSections.contains(sectionName)) {
      return true;
    }
    
    // Support displaying section "foo/bar" if section "foo" was specified 
    String parent = sectionName;
    while (parent.contains("/")) {
      parent = org.apache.commons.lang3.StringUtils.substringBeforeLast(parent, "/");
      if (sections.contains(parent)) {
        return true;
      }
    }
    
    return false;
  }
  
%><%
ServletContext context = config.getServletContext();
long freeMemory = Runtime.getRuntime().freeMemory();
long totalMemory = Runtime.getRuntime().totalMemory();
int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);

// Set contextPath, baseURL and securedBaseURL if needed
if (channel != null && channel.isReverseProxyEnabled()) {
  channel.processReverseProxyRequest(request);
}

// Improvement JCMS-6724 : read section to display in statusXml from "section" parameter
// - explicitely requested sections
final Set<String> sections = Util.getTreeSet(HttpUtil.getStringParameterValues(request, "section", HttpUtil.PROPERTYNAME_REGEX));
// - authorized parent sections deduced from explicitely specified ones
final Set<String> parentSections = new TreeSet<String>();
for (String section : sections) {
  for (String parentSection = section; parentSection.contains("/"); ) {
    parentSection = org.apache.commons.lang3.StringUtils.substringBeforeLast(parentSection, "/");
    parentSections.add(parentSection);
  }
}

%>
<status>
  <date><%= DateUtil.formatRfc822Date(new Date()) %></date>
  
  <% if (showSection("platform", sections, parentSections)) { %>
  <platform>
    <application-server><%= escape(context.getServerInfo()) %></application-server>
    <context-path><%= escape(request.getContextPath()) %></context-path>
    
    <% if (showSection("platform/jdk", sections, parentSections)) { %>
    <jdk>
      <version><%= escape(System.getProperty("java.version")) %></version>
      <vendor><%= escape(System.getProperty("java.vendor")) %></vendor>
    </jdk>
    <% } %>
    
    <% if (showSection("platform/jvm", sections, parentSections)) { %>
    <jvm>
      <name><%= escape(System.getProperty("java.vm.name")) %></name>
      <version><%= escape(System.getProperty("java.vm.version")) %></version>
      <vendor><%= escape(System.getProperty("java.vm.vendor")) %></vendor>
      <memory>
        <!-- Memory unit: bytes -->
        <total><%= totalMemory %></total>
        <free><%= freeMemory %></free>
        <used><%= totalMemory-freeMemory %></used>
        <percent-used  unit='%'><%= percentMemory %></percent-used>
        <garbage-collectors>
          <jalios:foreach name="gcMXBean" collection="<%= ManagementFactory.getGarbageCollectorMXBeans() %>" type="GarbageCollectorMXBean">
          <garbage-collector name="<%= gcMXBean.getName() %>"></garbage-collector> 
          </jalios:foreach>
        </garbage-collectors>
        <jmx-monitoring>
          <heap><%= toXmlString(ManagementFactory.getMemoryMXBean().getHeapMemoryUsage(), null) %></heap>
          <non-heap><%= toXmlString(ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage(), null) %></non-heap>
          <mxbeans-pool>
          <% for (MemoryPoolMXBean bean : ManagementFactory.getMemoryPoolMXBeans()) { %>
            <mxbean name="<%= escape(bean.getName()) %>" type="<%= escape(bean.getType().toString()) %>">
              <%= toXmlString(bean.getUsage(),           "usage") %>
              <%= toXmlString(bean.getPeakUsage(),       "peak-usage") %>
              <%= toXmlString(bean.getCollectionUsage(), "collection-usage") %>
            </mxbean> 
          <% } %>
          </mxbeans-pool>
        </jmx-monitoring>
      </memory>
      <java-home><%= escape(System.getProperty("java.home")) %></java-home>
      <tmp-dir><%= escape(System.getProperty("java.io.tmpdir")) %></tmp-dir>
      <input-arguments>
        <jalios:foreach name="inputArgument" collection="<%= ManagementFactory.getRuntimeMXBean().getInputArguments() %>" type="String">
        <input-argument><%= escape(inputArgument) %></input-argument> 
        </jalios:foreach>      
      </input-arguments>
    </jvm>
    <% } %>
    
    <% if (showSection("platform/os", sections, parentSections)) { %>
    <os>
      <name><%= escape(System.getProperty("os.name")) %></name>
      <version><%= escape(System.getProperty("os.version")) %></version>
      <arch><%= escape(System.getProperty("os.arch")) %></arch>
    </os>
    <% } %>

    <% if (showSection("platform/network", sections, parentSections)) { %>
    <network>
    <%
      for (Enumeration niEnum = NetworkInterface.getNetworkInterfaces(); niEnum.hasMoreElements() ;) {
        NetworkInterface ni = (NetworkInterface) niEnum.nextElement();
    %>
      <interface name="<%= escape(ni.getName()) %>"><%
         for (Enumeration inetAddrEnum = ni.getInetAddresses(); inetAddrEnum.hasMoreElements() ;) {
           InetAddress inetAddr = (InetAddress) inetAddrEnum.nextElement(); %>
        <inet-address><%= escape(inetAddr.getHostAddress()) %></inet-address><%
      } %>
      </interface>
    <% } %>
    </network>
    <% } %>

  </platform>
  <% } %>
<% 

 String failureExplanation = (String) context.getAttribute("failureExplanation"); 
 boolean isRunning = Util.isEmpty(failureExplanation);

%>
  <%-- ** SITE STATE ****************************************** --%>
  <% if (showSection("state", sections, parentSections)) { %>
  <state>
    <running><%= isRunning %></running><%
   if (!isRunning) { %>
    <failure-explaination><%= escape(failureExplanation) %></failure-explaination><%
   } else { 
      Date startDate = (Date)getServletConfig().getServletContext().getAttribute("channelLastRestart"); %>
    <last-start unit='unix-time'><%= startDate.getTime() %></last-start>
    <elapsed-time unit='ms'><%= System.currentTimeMillis() - startDate.getTime() %></elapsed-time><%
   } %>
  </state>
  <% } %>
  
  <%-- ** SITE INFO, only available when JCMS is started **************************************** --%>
  <% if (isRunning) { %>
  <% if (showSection("site", sections, parentSections)) { %>
  <site>
  
    <%-- -- VERSION ----------------------------------------- --%>
    <% if (showSection("site/version", sections, parentSections)) { %>
    <version>
      <full><%= escape(channel.getJcmsInfo().getVersion()) %></full>
      <release><%= escape(channel.getJcmsInfo().RELEASE) %></release>
      <build><%= escape(channel.getJcmsInfo().BUILD) %></build>    
      <svn-revision><%= escape(channel.getJcmsInfo().SVN_REVISION) %></svn-revision>    
    </version>
    <% } %>
    
    <%-- -- BUILD INFORMATION ----------------------------------------- --%>
    <% if (showSection("site/build-info", sections, parentSections)) { %>
    <build-info>
<%
	    String ident ="      ";
    	Map<String, String> buildMap =  channel.getJcmsInfo().getBuildPropertiesMap();
       	if(Util.isEmpty(buildMap)){
       	  %><%=ident%><%= gp("ui.adm.ch-status.ch.jcms.build-missing-file") +"\n" %><%
       	}
       	else{
        	for(Map.Entry<String, String> entry : buildMap.entrySet()){
        	    String xmlKey = entry.getKey().replaceFirst("build.", "").replaceAll("\\.", "-"); 
        		%><%=ident%><<%=encodeForXMLAttribute(xmlKey) %>><%=  escape(entry.getValue()) %></<%=xmlKey %>><%="\n"%><%    
        	}
       	}
%>    </build-info>
    <% } %>
    
    <%-- -- INFORMATION/CONFIGURATION ------------------------ --%>
    <% if (showSection("site/configuration", sections, parentSections)) { %>
    <configuration>
      <name><%= escape(channel.getName()) %></name>
      
      <urid><%= escape(channel.getUrid()) %></urid>
      
      <%-- -- ADD-PACK ------------------------ --%>
      <%
      LimitController limitController = channel.getLimitController();
      long wsCurrent = WorkspaceManager.getNonCollaborativeWorkspaceCount();
      long wsMax = limitController.getWorkspaceLimit();
      long wsPercent = wsMax <= 0 ? -1 : Math.round(100 * ((double)wsCurrent / (double)wsMax));
      
      long csCurrent = WorkspaceManager.getCollaborativeSpaceCount();
      long csMax = limitController.getCollaborativeSpaceLimit();
      long csPercent = csMax <= 0 ? -1 : Math.round(100 * ((double)csCurrent / (double)csMax));
      
      long mbrCurrent = limitController.getActiveMemberCount();
      long mbrMax = limitController.getMemberLimit();
      long mbrPercent = mbrMax <= 0 ? -1 : Math.round(100 * ((double)mbrCurrent / (double)mbrMax));
      
      long dbmbrCurrent = limitController.getActiveDBMemberCount();
      long dbmbrMax = limitController.getDBMemberLimit();
      long dbmbrPercent = dbmbrMax <= 0 ? -1 : Math.round(100 * ((double)dbmbrCurrent / (double)dbmbrMax));
      
      long guestCurrent = limitController.getGuestCount();
      long guestMax = limitController.getGuestLimit();
      long guestPercent = guestMax <= 0 ? -1 : Math.round(100 * ((double)guestCurrent / (double)guestMax));
      
      long dbdocCurrent = channel.getDataCount(DBFileDocument.class);
      long dbdocMax = limitController.getDBFileDocumentLimit();
      long dbdocPercent = dbdocMax <= 0 ? -1 : Math.round(100 * ((double)dbdocCurrent / (double)dbdocMax));    
      
      long langCurrent = channel.getLanguageList().size();
      long langMax = limitController.getLanguageLimit();
      long langPercent = langMax <= 0 ? -1 : Math.round(100 * ((double)langCurrent / (double)langMax)); 
      
      %>
      <% if (showSection("site/configuration/addpack", sections, parentSections)) { %>
      <addpack name="<%= channel.getJcmsInfo().getAddPackName() %>" expirationDate="<%= DateUtil.formatRfc822Date(channel.getJcmsInfo().getAddPackExpirationDate()) %>">
        <limits>
          <limit name="Workspace"          current="<%= wsCurrent %>"    max="<%= wsMax %>"    <% if (wsPercent    >= 0) { %> percent="<%= wsPercent %>"    <% } %>/>
          <limit name="CollaborativeSpace" current="<%= csCurrent %>"    max="<%= csMax %>"    <% if (csPercent    >= 0) { %> percent="<%= csPercent %>"    <% } %>/>
          <limit name="Member"             current="<%= mbrCurrent %>"   max="<%= mbrMax %>"   <% if (mbrPercent   >= 0) { %> percent="<%= mbrPercent %>"   <% } %>/>
          <limit name="DBMember"           current="<%= dbmbrCurrent %>" max="<%= dbmbrMax %>" <% if (dbmbrPercent >= 0) { %> percent="<%= dbmbrPercent %>" <% } %>/>
          <limit name="Guest"              current="<%= guestCurrent %>" max="<%= guestMax %>" <% if (guestPercent >= 0) { %> percent="<%= guestPercent %>" <% } %>/>
          <limit name="DBFileDocument"     current="<%= dbdocCurrent %>" max="<%= dbdocMax %>" <% if (dbdocPercent >= 0) { %> percent="<%= dbdocPercent %>" <% } %>/>
          <limit name="Languages"          current="<%= langCurrent %>"  max="<%= langMax %>"  <% if (langPercent  >= 0) { %> percent="<%= langPercent %>"  <% } %>/>
        </limits>
      </addpack>
      <% } %>

      <% if (showSection("site/configuration/languages", sections, parentSections)) { %>
      <languages main='<%= channel.getLanguage() %>'><%
        %><jalios:foreach name="itLang" type="String" collection="<%= channel.getLanguageList() %>">
          <language <%= (itLang.equals(channel.getLanguage())) ? "isMain='true'" : ""%>><%= itLang %></language><%
        %></jalios:foreach>
      </languages>
      <% } %>
      
      <% if (showSection("site/configuration/ldap", sections, parentSections)) { %>
      <ldap enabled="<%= channel.isLdapEnabled() %>">
        <server hostname="<%= gpe("ldap.server.hostname") %>" 
                port="<%= gpe("ldap.server.port") %>" 
                ssl="<%= gpe("ldap.server.ssl") %>"
                login="<%= gpe("ldap.server.login") %>"
                sizeLimit="<%= gpe("ldap.server.sizelimit") %>"
                timeLimit="<%= gpe("ldap.server.timelimit")  %>"
                version="<%= gpe("ldap.server.version") %>"/>
        <users suffix="<%= gpe("ldap.server.suffix") %>" filter="<%= gpe("ldap.server.userfilter") %>" objectClass="<%= gpe("ldap.server.userobjectclass") %>">
          <mapping>
            <field name="login" value="<%= gpe("ldap.mapping.login") %>"/>
            <field name="name" value="<%= gpe("ldap.mapping.name") %>"/>
            <field name="f-name" value="<%= gpe("ldap.mapping.f-name") %>"/>
            <field name="salut" value="<%= gpe("ldap.mapping.salut") %>"/>
            <field name="organization" value="<%= gpe("ldap.mapping.organization") %>"/>
            <field name="job" value="<%= gpe("ldap.mapping.job") %>"/>
            <field name="mail" value="<%= gpe("ldap.mapping.mail") %>"/>
            <field name="phone" value="<%= gpe("ldap.mapping.phone") %>"/>
            <field name="mobile" value="<%= gpe("ldap.mapping.mobile") %>"/>
            <field name="address" value="<%= gpe("ldap.mapping.address") %>"/>
            <field name="info" value="<%= gpe("ldap.mapping.info") %>"/>
          </mapping>
        </users>                
        <groups suffix="<%= gpe("ldap.server.groupsuffix") %>" filter="<%= gpe("ldap.server.groupfilter") %>" objectClass="<%= gpe("ldap.server.groupobjectclass") %>">
          <mapping>
            <field name="name" value="<%= gpe("ldap.grp-mapping.name") %>"/>
            <field name="member" value="<%= gpe("ldap.grp-mapping.member") %>"/>
          </mapping>
        </groups>        
      </ldap>
      <% } %>
      
    </configuration>
    <% } %>
    
    <%-- -- USERS ----------------------------------------- --%>
    <% if (showSection("site/users", sections, parentSections)) { %>
    <users>
      <authenticated-member-count><%= JcmsSessionTracker.getLoggedMemberSet().size() %></authenticated-member-count>
      <% if (Util.toBoolean(request.getParameter("workerCount"), false)) { // JspChecker.VERIFIED_FOR_SECURITY %>
      <worker-count><%= JcmsUtil.getWorkerCount() %></worker-count>
      <% } %>
      <sessions>
        <all><%= JcmsSessionTracker.getAllSessionCount() %></all>
        <authenticated-session-count><%= JcmsSessionTracker.getLoggedSessionCount()%></authenticated-session-count>
        <unauthenticated-session-count><%= JcmsSessionTracker.getUnauthenticatedCount()%></unauthenticated-session-count>
        <robot-count><%= JcmsSessionTracker.getUnauthenticatedRobotCount() %></robot-count>
        <max-inactive-interval unit='s'><%= request.getSession().getMaxInactiveInterval() %></max-inactive-interval>
      </sessions>
    </users>
    <% } %>
    
    <% if (showSection("site/data", sections, parentSections)) { %>
    <data write-enabled="<%= channel.isDataWriteEnabled() %>">
    
      <%-- -- DATA / STORE ----------------------------------------- --%>
      <% if (showSection("site/data/store", sections, parentSections)) { %>
      <store urid="<%= channel.getUrid() %>">
        <state>
          <store-size unit='byte'><%= new File(channel.getStore().getLogFilename()).length() %></store-size>
          <data-count><%= channel.getStoreSize() %></data-count>
          <create-count><%= channel.getStoreCreateCount() %></create-count>
          <update-count><%= channel.getStoreUpdateCount() %></update-count>
          <delete-count><%= channel.getStoreDeleteCount() %></delete-count>
          <progress-table><%= channel.getStore().getProgressTable() %></progress-table>
          <progress-stamp><%= channel.getStore().getProgressStamp() %></progress-stamp>
        </state>
        <load-report>
          <duration unit='ms'><%= channel.getStoreLoadReport().getDuration() %></duration>
          <memory unit='byte'><%= channel.getStoreLoadReport().getMemoryUsed() %></memory>
          <store-size unit='byte'><%= channel.getStoreLoadReport().getStoreSize() %></store-size>
          <create-count><%= channel.getStoreLoadReport().getCreateCount() %></create-count>
          <update-count><%= channel.getStoreLoadReport().getUpdateCount() %></update-count>
          <delete-count><%= channel.getStoreLoadReport().getDeleteCount() %></delete-count>
          <error-count><%= channel.getStoreLoadReport().getErrorCount() %></error-count>
          <progress-table><%= channel.getStoreLoadReport().getProgressTable() %></progress-table>
        </load-report>
        <classes>
          <class name="<%= Data.class.getName() %>" data-count="<%= channel.getDataCount(Data.class) %>" />
          <class name="<%= Member.class.getName() %>" data-count="<%= channel.getDataCount(Member.class) %>" />
          <class name="<%= Group.class.getName() %>" data-count="<%= channel.getDataCount(Group.class) %>" />
          <class name="<%= Category.class.getName() %>" data-count="<%= channel.getDataCount(Category.class) %>" />
          <class name="<%= Workspace.class.getName() %>" data-count="<%= channel.getDataCount(Workspace.class) %>" />
          <class name="<%= Publication.class.getName() %>" data-count="<%= channel.getDataCount(Publication.class) %>" />
          <class name="<%= Content.class.getName() %>" data-count="<%= channel.getDataCount(Content.class) %>" />
          <class name="<%= FileDocument.class.getName() %>" data-count="<%= channel.getDataCount(FileDocument.class) %>" />
          <class name="<%= UserContent.class.getName() %>" data-count="<%= channel.getDataCount(UserContent.class) %>" />
          <class name="<%= PortalElement.class.getName() %>" data-count="<%= channel.getDataCount(PortalElement.class) %>" />
          <class name="<%= Form.class.getName() %>" data-count="<%= channel.getDataCount(Form.class) %>" />
          <jalios:foreach collection='<%= channel.getSubTypeList(Data.class) %>' name='itClass' type='Class'><%
            boolean isDBData = DBData.class.isAssignableFrom(itClass);
            boolean alreadyPrinted = itClass.equals(FileDocument.class);
            boolean skip = isDBData || alreadyPrinted;
            if (!skip) { %>
              <class name="<%= itClass.getName() %>" data-count="<%= channel.getDataCount(itClass) %>" /><% 
            } %></jalios:foreach>
        </classes>
      </store>
      <% } %>
      
      <%-- -- DATA / DATABASE ----------------------------------------- --%><% 
      DerbyManager derbyMgr = DerbyManager.getInstance();
      HibernateManager hibernateMgr = HibernateManager.getInstance(); 
      DatabaseInfo dbInfo = hibernateMgr.getDatabaseInfo();
      String dbProductName = dbInfo.getProductName();
      String dbProductVersion = dbInfo.getProductVersion();    
      %>
      <% if (showSection("site/data/database", sections, parentSections)) { %>
      <database jcmsdb="<%= gpe("channel.jcmsdb")  %>" productName="<%= HttpUtil.encodeForXML(dbProductName) %>" productVersion="<%= HttpUtil.encodeForXML(dbProductVersion) %>">
        <derby started="<%= derbyMgr.isServerStarted() %>" host="<%= gpe("derby.drda.host") %>" port="<%= derbyMgr.getServerPort() %>" backup="<%= derbyMgr.isBackupEnabled() %>"/>
        <features 
          supportDateMillis="<%= HibernateUtil.supportDateMillis() %>" 
          supportFullJoin="<%= HibernateUtil.supportFullJoin() %>" 
          supportClobCollectionUpdate="<%= HibernateUtil.supportClobCollectionUpdate() %>" 
        />
        <hibernate>
          <configuration>
            <dialect><%= hibernateMgr.getDialect() %></dialect>
            <properties>
              <jalios:foreach collection="<%= hibernateMgr.getConfiguration().getProperties().entrySet() %>" type="Map.Entry<String,String>" name="itEntry">
                <% if (itEntry.getKey().startsWith("hibernate.") && !itEntry.getKey().startsWith("hibernate.connection.password")) { %>
                <property name="<%= itEntry.getKey() %>" value="<%= HttpUtil.encodeForXML(itEntry.getValue()) %>" />
                <% } %>
              </jalios:foreach>
            </properties>
            <connection>
              <% if (hibernateMgr.isJDBCConnection()) { %>
              <url><%= escape(hibernateMgr.getConnectionUrl()) %></url>
              <driver><%= hibernateMgr.getConnectionDriver() %></driver>
              <connection-pool enabled="<%= hibernateMgr.isConnectionPoolEnabled() %>" provider="<%= hibernateMgr.getConnectionPool() %>">              
                <properties>
                  <jalios:foreach collection="<%= com.mchange.v2.c3p0.cfg.C3P0ConfigUtils.extractC3P0PropertiesResources().entrySet() %>" type="Map.Entry<String,String>" name="itEntry">
                    <property name="<%= itEntry.getKey() %>" value="<%= HttpUtil.encodeForXML(itEntry.getValue()) %>" />
                  </jalios:foreach>
                </properties>
              </connection-pool>
              <% } else { %>
              <datasource><%= hibernateMgr.getConnectionDataSource() %></datasource>
              <% } %>
            </connection>
            <cache><%= hibernateMgr.isSecondLevelCacheEnabled() %></cache>
            <queryCache><%= hibernateMgr.isQueryCacheEnabled() %></queryCache>
          </configuration>
          <classes>
            <class name="<%= DBData.class.getName() %>" data-count="<%= HibernateUtil.queryCount(DBData.class) %>" />
            <class name="<%= Data.class.getName() %>" data-count="<%= HibernateUtil.queryCount(Data.class) %>" />
            <class name="<%= Publication.class.getName() %>" data-count="<%= HibernateUtil.queryCount(Publication.class) %>" />
            <class name="<%= UserContent.class.getName() %>" data-count="<%= HibernateUtil.queryCount(UserContent.class) %>" />
            <class name="<%= Form.class.getName() %>" data-count="<%= HibernateUtil.queryCount(Form.class) %>" />
            <class name="<%= DBFileDocument.class.getName() %>" data-count="<%= HibernateUtil.queryCount(DBFileDocument.class) %>" data-count-exact="<%= HibernateUtil.queryCountExact(DBFileDocument.class) %>" />
            <class name="<%= DBFileDocumentRevision.class.getName() %>" data-count="<%= HibernateUtil.queryCount(DBFileDocumentRevision.class) %>" />
            
            <jalios:foreach iterator="<%= hibernateMgr.getConfiguration().getClassMappings() %>" name="itPersistentClass" type="org.hibernate.mapping.PersistentClass"><%
              boolean alreadyPrinted = itPersistentClass.getMappedClass().equals(DBFileDocument.class) || itPersistentClass.getMappedClass().equals(DBFileDocumentRevision.class);
              boolean skip = alreadyPrinted;
              if (!skip) { %>
                <class name="<%= itPersistentClass.getClassName() %>" data-count="<%= HibernateUtil.queryCount(itPersistentClass.getMappedClass()) %>"  data-count-exact="<%= HibernateUtil.queryCountExact(itPersistentClass.getMappedClass()) %>"/><%
            } %></jalios:foreach>
          </classes>
        </hibernate>
      </database>
      <% } %>
      
      <%-- -- DATA / QUOTAS ----------------------------------------- --%>
      <% if (showSection("site/data/quotas", sections, parentSections)) { %>
      <quotas>
<%
{
  QuotaManager quotaMgr = QuotaManager.getInstance();
  if(quotaMgr.isQuotaFeatureEnabled()){
	  Map<Workspace, QuotaElement> elements = quotaMgr.getElements();
	  QuotaElement siteElement = elements.get(null);
	  if(siteElement != null){
	  %><site analyseInProgress="false" inAlert="<%=siteElement.isAlert()?"true":"false"%>" quota="<%=siteElement.getQuota() %>" maxQuota="<%=siteElement.getQuotaMaxValue() %>" alertThreshold="<%=siteElement.getAlertThreshold() %>" />
	  <%}else{ %>
	    <site analyseInProgress="true" inAlert="" quota="" limit="" alertThreshold=""/>
	  <%}
	  if(elements  != null){
	    for(QuotaElement elt : elements.values()){
	      if(elt == null || elt.getWorkspace() == null){
	        continue;
	      }
	      if(elt != null){
	      %><workspace id="<%=elt.getWorkspace().getId() %>" analyseInProgress="false" inAlert="<%=elt.isAlert()?"true":"false"%>" quota="<%=elt.getQuota() %>" maxQuota="<%=elt.getQuotaMaxValue() %>" alertThreshold="<%=elt.getAlertThreshold() %>" />
	      <%}else{ %>
	        <workspace id="<%=elt.getWorkspace().getId() %>" analyseInProgress="true" inAlert="" quota="" limit="" alertThreshold=""/>
	    <%}
	    }
	  }
  }
  else{
    %><%=escape(JcmsUtil.glp("en","ui.adm.quota-feature-disabled")) %><%
  }
} %>
      </quotas>
      <% } %>

    </data>
    <% } %>

    <%-- -- INCOMING MAIL ----------------------------------------- --%>
    <% if (showSection("site/mail", sections, parentSections)) { %>
    <% if (channel.isIncomingMailEnabled()) { %>
    <mail>
      <db-count><%= MailManager.getInstance().getDBMailMessageCount() %></db-count>
      <% MailAccount lastAccount = MailManager.getInstance().getMailFetcher().getLastFetchAccount(); %>
      <jalios:if predicate="<%= Util.notEmpty(lastAccount) %>">
      <last-fetch-account><%= lastAccount.getName() %></last-fetch-account>
      <last-fetch-date><%= lastAccount.getLastFetchDate().getTime() %></last-fetch-date>
      </jalios:if>
      
      <% Map<String, String> archiveMap = MailManager.getInstance().getMailFetcher().getIncomingMailListener().listAllPatterns(); %>
      <archives>
        <jalios:foreach collection="<%= archiveMap.entrySet() %>" name="itEntry" type="Map.Entry">
        <archive pattern="<%= itEntry.getKey() %>" check="<%= itEntry.getValue() %>" />
        </jalios:foreach>
      </archives>
      
      <accounts>
        <jalios:foreach collection="<%= MailManager.getInstance().getMailFetcher().getMailAccountMap().values() %>" name="account" type="com.jalios.jcms.mail.MailAccount">
        <account name="<%= account.getName() %>" enabled="<%= account.isEnabled() %>">
          <label><%= account.getLabel() %></label>
          <host><%= account.getHost() %></host>
          <port><%= account.getPort() %></port>
          <protocol><%= account.getProtocol() %></protocol>
          <mbox><%= account.getMbox() %></mbox>
          <expunged><%= account.isExpunged() %></expunged>
          <schedule><%= account.getSchedule() %></schedule>
          <author><%= account.getAuthor() != null ? account.getAuthor().getId() : "" %></author>
          <workspace><%= account.getWorkspace() != null ? account.getWorkspace().getId() : "" %></workspace>
          <jalios:if predicate="<%= Util.notEmpty(lastAccount) %>">
          	<last-fetch-date><%= lastAccount.getLastFetchDate() == null?"":lastAccount.getLastFetchDate().getTime() %></last-fetch-date>
          	<last-fetch-count><%= lastAccount.getLastFetchCount() %></last-fetch-count>
          </jalios:if>
          <db-count><%= account.getDBMailMessageCount() %></db-count>
        </account>
        </jalios:foreach>
      </accounts>
    </mail>
    <% } %>
    <% } %>
    
    <%-- -- JSYNC ----------------------------------------- --%>
    <% if (showSection("site/jsync", sections, parentSections)) { %>
    <% if (channel.isJSyncEnabled()) { %>
    <jsync>
      <replica-status><%= escape(channel.getJSyncReplica().getStatus()) %></replica-status>
      <replica-url><%= escape(channel.getJSyncReplicaUrl()) %></replica-url>
      <% if (Util.notEmpty(channel.getJSyncLeaderUrl())) { %>
      <leader-url><%= escape(channel.getJSyncLeaderUrl()) %></leader-url>
      <% } %>
    </jsync>
    <% } %>
    <% } %>
    
    <%-- -- PLUGINS ----------------------------------------- --%>
    <% if (showSection("site/plugins", sections, parentSections)) { %>
    <plugins><%
      %><jalios:foreach collection='<%= PluginManager.getPluginManager().getPlugins() %>' type='Plugin' name='itPlugin'>
      <plugin name='<%= escape(itPlugin.getName()) %>' initialized="<%= itPlugin.isInitialized() %>" enabled="<%= itPlugin.isEnabled() %>" active="<%= itPlugin.isActive() %>" version="<%= escape(itPlugin.getVersion()) %>" mainPlugin="<%= itPlugin.isMainPlugin() %>" svnRevision="<%= itPlugin.getSvnRevision() %>" jenkinsTag="<%= itPlugin.getJenkinsTag() %>" buildTime="<%= itPlugin.getBuildTime(null) %>" author="<%= encodeForXMLAttribute(itPlugin.getAuthor()) %>">
        <properties>
          <jalios:foreach collection='<%= itPlugin.getEditableProperties().entrySet() %>' name='itEntry' type='Map.Entry' counter="c2">
          <% String propName = (String)itEntry.getKey(); %>
          <% if (!propName.endsWith("password") && !propName.endsWith(".pwd") ) { %>
          <property name="<%= propName %>" value="<%= escape(channel.getProperty(propName)) %>"/>
          <% } %>
          </jalios:foreach>          
        </properties>
      </plugin><%
      %></jalios:foreach>
    </plugins>
    <% } %>
    
    <%-- -- CUSTOM HOOKS ----------------------------------------- --%>
    <% if (showSection("site/custom-hooks", sections, parentSections)) { %>
    <custom-hooks>
    
     <%-- -- Store Listener ----------------------------------------- --%>
     <jalios:foreach collection='<%= channel.getStoreListenerSet() %>' name='itStoreListener' type='com.jalios.jstore.StoreListener'><%
      if (!(itStoreListener.getClass().getName().startsWith("com.jalios.jcms."))) { %>
      <store-listener class='<%= itStoreListener.getClass().getName() %>' /><%
      }
     %></jalios:foreach>
    
     <jalios:foreach collection='<%= channel.getStoreListenerClassMap().entrySet() %>' name='itEntry' type='Map.Entry'><%
       %><jalios:foreach collection='<%= (Set)(itEntry.getValue()) %>' name='itStoreListener' type='com.jalios.jstore.StoreListener' counter='itCounter2'><%
       if (!(itStoreListener.getClass().getName().startsWith("com.jalios.jcms."))) { %>
      <store-listener class='<%= itStoreListener.getClass().getName() %>' listened-class='<%= ((Class)itEntry.getKey()).getName() %>' /><%
       } 
       %></jalios:foreach><%
     %></jalios:foreach>

     <%-- -- DB Listener ----------------------------------------- --%>
     <jalios:foreach collection='<%= JcmsHibernateEventListener.getInstance().getDBListenerSet() %>' name='itDBListener' type='com.jalios.jcms.db.DBListener'><%
      if (!(itDBListener.getClass().getName().startsWith("com.jalios.jcms."))) { %>
      <db-listener class='<%= itDBListener.getClass().getName() %>' /><%
      }
     %></jalios:foreach>
    
     <jalios:foreach collection='<%= JcmsHibernateEventListener.getInstance().getDBListenerClassMap().entrySet() %>' name='itEntry' type='Map.Entry'><%
       %><jalios:foreach collection='<%= (Set)(itEntry.getValue()) %>' name='itDBListener' type='com.jalios.jcms.db.DBListener' counter='itCounter2'><%
       if (!(itDBListener.getClass().getName().startsWith("com.jalios.jcms."))) { %>
      <db-listener class='<%= itDBListener.getClass().getName() %>' listened-class='<%= ((Class)itEntry.getKey()).getName() %>' /><%
       } 
       %></jalios:foreach><%
     %></jalios:foreach>

      <%-- -- Data Controller ----------------------------------------- --%><%
     %><jalios:foreach collection='<%= channel.getDataControllerMap().entrySet() %>' name='itEntry' type='Map.Entry'><%
       %><jalios:foreach collection='<%= (Set)(itEntry.getValue()) %>' name='itDataController' type='com.jalios.jcms.DataController' counter='itCounter2'><%
        if (!(itDataController.getClass().getName().startsWith("com.jalios.jcms."))) { %>
      <data-controller class='<%= itDataController.getClass().getName() %>' controlled-class='<%= ((Class)itEntry.getKey()).getName() %>' <% if (itDataController instanceof BasicDataController) { %>order="<%= ((BasicDataController)itDataController).getOrder() %>"<% } %>/><%
        }
       %></jalios:foreach><%
     %></jalios:foreach>

      <%-- -- Query Filter ----------------------------------------- --%><%
     %><jalios:foreach collection='<%= channel.getQueryManager().getQueryFilterSet() %>' name='itQueryFilter' type='com.jalios.jcms.QueryFilter'>
      <query-filter class='<%= itQueryFilter.getClass().getName() %>' order="<%= itQueryFilter.getOrder() %>"/><%
     %></jalios:foreach>
      
      <%-- -- Clean Filter ----------------------------------------- --%><%
     %><jalios:foreach collection='<%= channel.getCleanFilterList() %>' name='itCleanFilter' type='com.jalios.jstore.CleanFilter'>
      <clean-filter class='<%= itCleanFilter.getClass().getName() %>' /><%
     %></jalios:foreach>
      
      <%-- -- Authentication Handler ----------------------------------------- --%><%
     %><jalios:foreach collection='<%= channel.getAuthMgr().getAuthenticationHandlerSet() %>' name='itAuthHdlr' type='com.jalios.jcms.authentication.AuthenticationHandler'>
      <authentication-handler class='<%= itAuthHdlr.getClass().getName() %>' order='<%= itAuthHdlr.getOrder() %>' /><%
     %></jalios:foreach>
      
     <%-- -- Alarm Listener ----------------------------------------- --%><%
     %><jalios:foreach collection='<%= channel.getAllAlarmManager().entrySet() %>' name='itEntry' type='Map.Entry'><%
          %><% String managerName = (String)itEntry.getKey();
             AlarmManager mgr = (AlarmManager)itEntry.getValue();
             AlarmEntry nextAlarm = mgr.getNextAlarm();
          %><%
            %><alarm-manager name='<%= managerName%>' class='<%= mgr.getClass().getName() %>' nbEntries='<%=Util.getSize(mgr.getAllAlarms()) %>' nextAlarm='<%= nextAlarm == null?"":channel.getDateTimeFormat(channel.getCurrentUserLang()).format(nextAlarm.getNextAlarmDate()) %>' nextAlarmListener='<%=nextAlarm == null || nextAlarm.getListener() == null?"":nextAlarm.getListener().getClass().getName() %>' /><%
     %></jalios:foreach>

     <%-- -- All Policy Filter  ----------------------------------------- --%><%
     %><jalios:foreach collection='<%= PolicyManager.getPolicyFiltersMap().entrySet() %>' name='itPolicyFilterEntry' type='Map.Entry'><%
        String tagName = (String) itPolicyFilterEntry.getKey();
        Set<? extends PolicyFilter> itpolicyFilterSet = (Set<? extends PolicyFilter>) itPolicyFilterEntry.getValue();;
       %><jalios:foreach collection='<%= itpolicyFilterSet %>' name='itPolicyFilter' type='com.jalios.jcms.policy.PolicyFilter' counter='itCounter2'>
        <<%= tagName %> class='<%= itPolicyFilter.getClass().getName() %>'  <% if (itPolicyFilter instanceof AbstractPolicyFilter) { %>order="<%= ((AbstractPolicyFilter)itPolicyFilter).getOrder() %>"<% } %>/><%
       %></jalios:foreach><%
     %></jalios:foreach>      
      
    </custom-hooks>
    <% } %>
    
    <%-- -- DATA SOURCES ----------------------------------------- --%>
    <% if (showSection("site/data-sources", sections, parentSections)) { %>
    <data-sources>
      <jalios:foreach collection='<%= DBUtil.getDataSourceMap().keySet() %>' type='String' name='itDataSource'>
      <data-source><%= escape(itDataSource) %></data-source>
      </jalios:foreach>
    </data-sources>
    <% } %>

    <%-- -- IMPORT SOURCES ---------------------------------------- --%>
    <% if (showSection("site/import-sources", sections, parentSections)) { %>
    <% ImportManager importMgr = ImportManager.getInstance(); %>
    <import-sources>
      <jalios:foreach collection='<%= importMgr.getImportSourceMap().keySet() %>' type='String' name='itImportSourceId'>
      <% ImportSource itImportSource = importMgr.getImportSource(itImportSourceId); %>
      <import-source>
        <id><%= escape(itImportSourceId) %></id>
        <host><%= escape(itImportSource.getHost()) %></host>
        <name><%= escape(itImportSource.getName()) %></name>
        <schedulecron><%= escape(itImportSource.getScheduleCron()) %></schedulecron>
        <url><%= escape(itImportSource.getUrl()) %></url>
        <lastimport-date><jalios:date date="<%= (itImportSource.getLastImportDate()) %>" /></lastimport-date>
        <lastimport-time><jalios:time date="<%= (itImportSource.getLastImportDate()) %>" /></lastimport-time>
        <% if (itImportSource.getLastImportStatus() != null) { %>
        <lastimportstatus-success><%= Boolean.toString(itImportSource.getLastImportStatus().isSuccess()) %></lastimportstatus-success>
        <%   if (!itImportSource.getLastImportStatus().isSuccess()) { %>
        <lastimportstatus-errormsg><%= escape(itImportSource.getLastImportStatus().getErrorMsg()) %></lastimportstatus-errormsg>
        <%   } %>
        <% } %>
      </import-source>
      </jalios:foreach>
    </import-sources>    
    <% } %>
    
  </site>
  <% } %>
  <% } %>
  
  <%-- LOGGED MEMBER --%> 
  <% if (showSection("logged-member", sections, parentSections)) { %>
  <% 
   Member loggedMember = (Member) request.getAttribute("loggedMember");
   if (loggedMember != null) { %>
  <logged-member>
      <%= loggedMember.exportXml() %>
  </logged-member>
  <% } %>
  <% } %>
  
  <%-- REQUEST --%>  
  <% if (showSection("request", sections, parentSections)) { %>
  <request>
    <headers>
    <%
    for (Enumeration enu = request.getHeaderNames(); enu.hasMoreElements();) {
      String key = (String)enu.nextElement();
      String value = request.getHeader(key);
      %>
      <header>
        <header-name><%= escape(key) %></header-name>
        <header-value><%= escape(value) %></header-value>
      </header><%
    }
    %>
    </headers>
    <parameters>
    <%
    for (Iterator it = request.getParameterMap().entrySet().iterator(); it.hasNext();) { // JspChecker.VERIFIED_FOR_SECURITY
      Map.Entry entry = (Map.Entry)it.next();
      String key = (String)entry.getKey();
      String[] values = (String[])entry.getValue();
      %>
      <parameter>
        <parameter-name><%= encodeForXML(key) %></parameter-name>
        <% for (int i = 0; values != null && i < values.length; i++) { %>
        <parameter-value><%= encodeForXML(values[i]) %></parameter-value>
        <% } %>
      </parameter><%
    }
    %>
    </parameters>
    <auth-type><%= escape(request.getAuthType()) %></auth-type>
    <character-encoding><%= escape(request.getCharacterEncoding()) %></character-encoding>
    <content-length><%= request.getContentLength() %></content-length>
    <content-type><%= escape(request.getContentType()) %></content-type>
    <context-path><%= escape(request.getContextPath()) %></context-path>
    <cookies>
     <%
      Cookie[] cookies = request.getCookies();
      for (int i = 0; cookies != null && i < cookies.length; i++) {
      %>
       <cookie domain="<%= escape(cookies[i].getDomain()) %>"
               path="<%= escape(cookies[i].getPath()) %>"
               secure="<%= cookies[i].getSecure() %>"
               version="<%= cookies[i].getVersion() %>"
               max-age="<%= cookies[i].getMaxAge() %>"
               comment="<%= escape(cookies[i].getComment()) %>">
         <cookie-name><%= escape(cookies[i].getName()) %></cookie-name> 
         <cookie-value><%= escape(cookies[i].getValue()) %></cookie-value> 
       </cookie><%
      }
     %>
    </cookies>
    <locale><%= escape(request.getLocale().toString()) %></locale>
    <method><%= escape(request.getMethod()) %></method>
    <path-info><%= escape(request.getPathInfo()) %></path-info>
    <path-translated><%= escape(request.getPathTranslated()) %></path-translated>
    <protocol><%= escape(request.getProtocol()) %></protocol>
    <query-string><%= escape(request.getQueryString()) %></query-string>
    <remote-addr><%= escape(request.getRemoteAddr()) %></remote-addr>
    <remote-host><%= escape(request.getRemoteHost()) %></remote-host>
    <remote-user><%= escape(request.getRemoteUser()) %></remote-user>
    <requested-session-id><%= escape(request.getRequestedSessionId()) %></requested-session-id>
    <request-uri><%= escape(request.getRequestURI()) %></request-uri>
    <scheme><%= escape(request.getScheme()) %></scheme>
    <server-name><%= escape(request.getServerName()) %></server-name>
    <server-port><%= request.getServerPort() %></server-port>
    <servlet-path><%= escape(request.getServletPath()) %></servlet-path>
  </request>
  <% } %>
  
</status>
