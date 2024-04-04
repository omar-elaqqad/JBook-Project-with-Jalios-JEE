<%--
  @Summary: Text search documentation
  @Category: Documentation
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%> <%@ page contentType="text/html; charset=UTF-8"%> <%@ include file='/jcore/doInitPage.jspf' %> <% 
  request.setAttribute("title","Text search help"); 
  request.setAttribute("zone","InternalUI");
  jcmsContext.addCSSHeader("css/jalios/textSearchHelp.css"); 
%> <%@ include file='/jcore/doEmptyHeader.jspf' %> <%
  boolean LUCENE_WILDCARD_ENABLED = channel.getBooleanProperty("query.lucene.wildcard.enabled", true);
  boolean LUCENE_FUZZY_ENABLED = channel.getBooleanProperty("query.lucene.fuzzy.enabled", true);
  boolean USE_RIGHT_TRUNCATION = channel.getBooleanProperty("query.lucene.use-right-truncation", false);
%><div id="toc"><% String curURL = ServletUtil.getUrl(request); %> <a href="<%= curURL %>#anchorMajMin" class="toc-h2">1. Gro&szlig;schreibung, Kleinschreibung und Diakritische Zeichen</a> <a href="<%= curURL %>#anchorSpecChar" class="toc-h2">2. Sonderzeichen</a> <a href="<%= curURL %>#anchorBool" class="toc-h2">3. Boolesche Operatoren<samp>AND, &amp;&amp;, OR, ||, NOT, !, +, -</samp></a> <a href="<%= curURL %>#anchorRechChamp" class="toc-h2">4. Feldsuche<samp>meinFeld:&quot;text&quot;</samp></a> <a href="<%= curURL %>#anchorGroup" class="toc-h2">5. Gruppen<samp>( )</samp></a> <a href="<%= curURL %>#anchorAvance" class="toc-h2">6. Fortgeschrittene Funktionen</a> <a href="<%= curURL %>#anchorWildcard" class="toc-h3">6.1 Platzhalter<samp>*, ?</samp></a> <a href="<%= curURL %>#anchorFuzzy" class="toc-h3">6.2 Fuzzy-Suche<samp>Wort~</samp></a> <a href="<%= curURL %>#anchorProximity" class="toc-h3">6.3 Ann&auml;hernde Suche<samp>Satz~7</samp></a> <a href="<%= curURL %>#anchorInterval" class="toc-h3">6.4 Bereichsuche<samp>meinFeld:[... TO&nbsp;...], meinFeld:{... TO&nbsp;...}</samp></a> <a href="<%= curURL %>#anchorBoost" class="toc-h3">6.5 Verst&auml;rkender Begriff<samp>Begriff^2</samp></a></div>
  
    <h1>Textsuche-Hilfe <a href="#" title="Drucken&nbsp;…" onclick="window.print();" ><jalios:icon src="printer" alt="Print...."/></a></h1>
    <p>In dieser Hilfe bedeutet <em>&bdquo;Begriff&ldquo;</em>:</p>
    <ul>
      <li>entweder ein einzelnes Wort in durchsuchten Text, auch <em>&laquo;einzelnes Wort&raquo;</em> genannt;</li>
      <li>oder eine Gruppe von W&ouml;rtern, die von Anf&uuml;hrungszeichen umgeben sind, auch <em>&laquo;Satz&raquo;</em> genannt.</li>
    </ul>
    <p>Wenn Sie zum Beispiel Folgendes suchen:</p>
    <pre style="display:inline;">Willkommen auf der &bdquo;Jalios JPlatform&ldquo;</pre>
    <ul>
      <li><em>&laquo;Willkommen&raquo;</em>, <em>&laquo;auf &raquo;</em> und <em>&laquo;der &raquo;</em>sind einzelne W&ouml;rter;</li>
      <li><em>&laquo;&bdquo;Jalios JPlatform&ldquo;&raquo;</em> ist ein Satz,</li>
      <li>alle 4 sind Begriffe.</li>
    </ul>
    
    <h2><a id="anchorMajMin"></a>1. Gro&szlig;schreibung, Kleinschreibung und diakritische Zeichen</h2>
    <p><strong>Gro&szlig;- und Kleinschreibung:</strong> Die Suche unterscheidet NICHT zwischen Gro&szlig;- und Kleinschreibung.</p>
    <p>Zum Beispiel ergeben &laquo;willkommen&raquo;, &laquo;Willkommen&raquo; oder &laquo;WILLKOMMEN&raquo; alle dieselben Treffer.</p>
    <p><strong>Diakritische Zeichen und Akzente:</strong> Die Suche ignoriert diakritische Zeichen und Aktzente (&eacute;, &ccedil;, usw.)</p>
    <p>Zum Beispiel ergeben &laquo;&auml;hnliche Treffer&raquo; oder &laquo;ahnliche Treffer&raquo; alle dieselben Treffer.</p>

    <h2><a id="anchorSpecChar"></a>2. Sonderzeichen</h2>
    <p>Einige Zeichen werden f&uuml;r die fortgeschrittenen Suchfunktionen verwendet. Wenn Sie nach diesen Zeichen suchen m&ouml;chten, m&uuml;ssen Sie sie mit dem Zeichen &laquo;\&raquo; (Backslash) auskommentieren. Aktuelle Sonderzeichen sind:</p>
    <pre>+ - &amp;&amp; || ! ( ) { } [ ] ^ &quot; ~ * ? : \</pre>
    <p>Um zum Beispiel nach <em>&laquo;3 * (5+9) = 42&raquo;</em> zu suchen, m&uuml;ssen Sie Folgendes eingeben:</p>
    <pre>3 \* \(5\+9\) = 42</pre>

    <h2><a id="anchorBool"></a>3. Boolesche Operatoren<samp>AND, &amp;&amp;, OR, ||, NOT, !, +, -</samp></h2>
    <p>Sie k&ouml;nnen die folgenden Schl&uuml;sselw&ouml;rter und Operatoren verwenden, um Begriffe Ihrer Suche mithilfe von logischen Operationen zu gruppieren. Sie m&uuml;ssen die Gro&szlig;- und Kleinschreibung beibehalten und sie immer in GROẞBUCHSTABEN eingeben.</p>
    <table class='layout'>
      <tr>
        <th>Keywords</th>
        <th>Operatoren</th>
        <th>Erkl&auml;rung</th>
        <th>Beispiel</th>
      </tr>
      <tr>
        <td class="text-center"><strong>AND</strong></td>
        <td class="text-center"><strong>&amp;&amp;</strong></td>
        <td>Eine Ver&ouml;ffentlichung wird nur ber&uuml;cksichtigt, wenn beide Begriffe um den Operator <em>&laquo;&amp;&amp;&raquo;</em> oder das Schl&uuml;sselwort <em>&laquo;AND&raquo;</em> im/in den Suchfeld(ern) existieren.<p>Es ist der Standardoperator in JPlatform (Option <em>&laquo;Alle W&ouml;rter&raquo;</em>).</p>
        </td>
        <td>
          <pre>&quot;wei&szlig;er Mantel&quot; AND&nbsp;Pferd</pre>
          <pre>&quot;wei&szlig;er Mantel&ldquo; &amp;&amp;&nbsp;Pferd</pre>Alle Ver&ouml;ffentlichungen suchen, die <em>&laquo;wei&szlig;er Mantel&raquo;</em> und <em>&laquo;Pferd&raquo;</em> enthalten.</td>
      </tr>
      <tr>
        <td class="text-center"><strong>OR</strong></td>
        <td class="text-center"><strong>||</strong></td>
        <td>Eine Ver&ouml;ffentlichung wird nur ber&uuml;cksichtigt, wenn mindestens einer der beiden Begriffe um den Operator <em>&laquo;||&raquo;</em> oder das Schl&uuml;sselwort <em>&laquo;OR&raquo;</em> im/in den Suchfeld(ern) existieren.</td>
        <td>
          <pre>reiten OR&nbsp;Pferd</pre>
          <pre>reiten ||&nbsp;Pferd</pre>Alle Ver&ouml;ffentlichungen suchen, die entweder <em>&laquo;reiten&raquo;</em> oder <em>&laquo;Pferd&raquo;</em>, (oder beides) enthalten.</td>
      </tr>
      <tr>
        <td class="text-center"><strong>NOT</strong></td>
        <td class="text-center"><strong>!</strong> oder <strong>-</strong></td>
        <td>Eine Ver&ouml;ffentlichung wird nur ber&uuml;cksichtigt, wenn der Begriff nach dem Schl&uuml;sselwort <em>&laquo;NOT&raquo;</em>, Operator <em>&laquo;!&raquo;</em> oder Operator <em>&laquo;-&raquo;</em> nicht im/in den Suchfeld(ern) existieren.<p>Die Operatoren <em>&laquo;!&raquo;</em> und <em>&laquo;-&raquo;</em> m&uuml;ssen direkt am auszuschlie&szlig;enden Begriff angef&uuml;gt werden.</p>
        </td>
        <td>
          <pre>&quot;wei&szlig;er Mantel&quot; NOT&nbsp;Kleidung</pre>
          <pre>&quot;wei&szlig;er Mantel&ldquo; !Kleidung</pre>
          <pre>&quot;wei&szlig;er Mantel&ldquo; -Pferd</pre>Alle Ver&ouml;ffentlichungen suchen, die <em>&laquo;</em>wei&szlig;er Mantel<em>&raquo;</em>, aber nicht <em>&laquo;</em>Kleidung<em>&raquo;</em> enthalten.</td>
      </tr>
      <tr>
        <td class="text-center"></td>
        <td class="text-center"><strong>+</strong></td>
        <td>Eine Ver&ouml;ffentlichung wird nur ber&uuml;cksichtigt, wenn der Begriff nach dem Operator <em>&laquo;+&raquo;</em> im/in den Suchfeld(ern) existiert.<p>Der Operator <em>&laquo;+&raquo;</em> muss direkt am einzuschlie&szlig;enden Begriff angef&uuml;gt werden.</p>
          <p>Da der AND-Operator der Standardoperator ist, wenn die Option &laquo;Alle W&ouml;rter&raquo; angegeben ist, sind auch andere Begriffe zwingend erforderlich. Daher ist dieser Operator m&ouml;glicherweise nur n&uuml;tzlich, wenn die Option &laquo;irgendein Wort&raquo; angegeben ist, wobei andere Begriffe optional sind.</p>
        </td>
        <td>
          <pre>+&ldquo;wei&szlig;er Mantel&quot; Pferd</pre>Alle Ver&ouml;ffentlichungen suchen, die <em>&laquo;wei&szlig;er Mantel&raquo;</em> und eventuell <em>&laquo;Pferd&raquo;</em> enthalten (wenn die Option <em>&laquo;Irgendein Wort&raquo;</em> verwendet wurde).</td>
      </tr>
    </table>

    <h2><a id="anchorRechChamp"></a>4. Feldsuche<samp>meinFeld:&quot;text&quot;</samp></h2>
    <p>Sie k&ouml;nnen in jedem Feld Ihrer Ver&ouml;ffentlichung suchen, indem Sie den Feldnamen gefolgt vom Zeichen &laquo;:&raquo; (Doppelpunkt) und dem Suchtext angeben.</p>
    <pre>feldname:text</pre>
    <p><strong>Titel und Zusammenfassung</strong>: Unabh&auml;ngig vom Ver&ouml;ffentlichungstyp oder der Seitensprache m&uuml;ssen Sie jeweils die Feldnamen <em>&laquo;title&raquo;</em> und <em>&laquo;abstract&raquo;</em> verwenden, um die Felder <em>Titel</em> und <em>Zusammenfassung</em> zu durchsuchen.</p>
    <p><strong>Andere Felder</strong>: F&uuml;r andere Felder, die f&uuml;r Ihre Typen spezifisch sind, m&uuml;ssen Sie den intern von JPlatform generierten Namen verwenden. Dieser interne Name ist im Allgemeinen die Feldbezeichnung in der Standardwebsitensprache, ohne Akzente oder diakritische Zeichen und beginnend mit einem Kleinbuchstaben. Zum Beispiel f&uuml;r ein Feld mit der Bezeichnung <em>&laquo;Franz&ouml;sisches Gebiet&raquo;</em> auf einer deutschen Website lautet der Name <em>&laquo;franzosischesGebiet&raquo;</em>.</p>
    <p><strong>Beispiel</strong>: Um in der Zusammenfassungsfeld nach dem Wort <em>&laquo;Restaurant&raquo;</em> und dem Wort <em>&laquo;gers&raquo;</em> im Feld <em>&laquo;Franz&ouml;sisches Gebiet&raquo;</em> des oben genannten Beispiels zu suchen, lautet die einzugebende Syntax:</p>
    <pre>abstract:restaurant franzosischesGebiet:gers</pre>

    <h2><a id="anchorGroup"></a>5. Gruppen<samp>( )</samp></h2>
    <p><strong>Logische Gruppe:</strong> Sie k&ouml;nnen runde Klammern verwenden, um einige Ihrer Suchbegriffe zu gruppieren. Dies wird oft verwendet, um den Umfang von booleschen Operatoren genau zu steuern.</p>
    <p>Um zum Beispiel alle Ver&ouml;ffentlichungen zu suchen, die entweder <em>&laquo;Pferd&raquo;</em> oder <em>&laquo;reiten&raquo;</em> und <em>&laquo;Mantel&raquo;</em> enthalten:</p>
    <pre>Mantel AND&nbsp;(Pferd OR&nbsp;reiten)</pre>
    <p><strong>Feldgruppen:</strong> Sie k&ouml;nnen runde Klammern auch verwenden, um nach mehr als nur einem Begriff in einem Feld zu suchen.</p>
    <p>Um zum Beispiel alle Ver&ouml;ffentlichungen zu suchen, deren Titelfeld sowohl <em>&laquo;Pferd&raquo;</em> und <em>&laquo;wei&szlig;er Mantel&raquo;</em> enth&auml;lt:</p>
    <pre>title:(+Pferd +&quot;wei&szlig;er Mantel&quot;)</pre>

    <h2><a id="anchorAvance"></a>6. Fortgeschrittene Funktionen</h2>

    <h3><a id="anchorWildcard"></a>6.1 Platzhalter<samp>*, ?</samp></h3>
    <p><strong>? :</strong> Verwenden Sie das Zeichen <em>&laquo;?&raquo;</em> (Fragezeichen), um mithilfe eines Ein-Zeichen-Platzhalters nach W&ouml;rtern zu suchen.</p>
    <p>Um zum Beispiel alle Ver&ouml;ffentlichungen zu suchen, die das Wort <em>&laquo;anbauen&raquo;</em> oder das Wort <em>&laquo;abbauen&raquo; enthalten:</em></p>
    <pre>a?bauen</pre>
    <p><strong>*:</strong> Verwenden Sie das Zeichen <em>&laquo;*&raquo;</em> (Asterisk, Sternchen), um mithilfe eines Mehrzeichen-Platzhalters nach W&ouml;rtern zu suchen.</p>
    <p>Um zum Beispiel alle Ver&ouml;ffentlichungen zu suchen, die mit <em>&laquo;Farb&raquo;</em> beginnen und auf <em>&laquo;n&raquo;</em> enden:</p>
    <pre>Fa*n</pre>
    <p>Diese Suche w&uuml;rde Ver&ouml;ffentlichungen mit den W&ouml;rtern <em>&laquo;Farben&raquo;</em> oder <em>&laquo;Farblehren&raquo;</em> finden.</p>
    <p>Weder <em>&laquo;?&raquo;</em> noch <em>&laquo;*&raquo;</em> d&uuml;rfen als erstes Zeichen eines Begriffs verwendet werden (<strike>*irgendwas</strike>).</p><% if (!LUCENE_WILDCARD_ENABLED) { %><p>Anmerkung: Diese Funktion ist zurzeit auf der Website deaktiviert.</p><% } %> <% if (USE_RIGHT_TRUNCATION) { %><p>Anmerkung: Rechts abschneiden, wodurch bei einfachen Suchen * automatisch hinzugef&uuml;gt wird, ist auf dieser Website aktiviert.</p><% } %><h3><a id="anchorFuzzy"></a>6.2 Fuzzy-Suche<samp>Wort~</samp></h3>
    <p>Verwenden Sie das Zeichen <em>&laquo;~&raquo;</em> (Tilde) direkt nach einem einzelnen Begriff, um nach W&ouml;rtern mit &auml;hnlicher Schreibweise zu suchen.</p>
    <p>Um zum Beispiel nach alle Ver&ouml;ffentlichungen zu suchen, die W&ouml;rter enthalten, die im britischen oder amerikanischen Englisch &auml;hnlich geschrieben werden, wie das Wort <em>&laquo;humour&raquo;</em> (<em>&laquo;humor&raquo; bzw. &laquo;humour&raquo;</em>):</p>
    <pre>humour~</pre><% if (!LUCENE_FUZZY_ENABLED) { %><p>Anmerkung: Diese Funktion ist zurzeit auf der Website deaktiviert.</p><% } %><h3><a id="anchorProximity"></a>6.3 Ann&auml;hernde Suche<samp>Satz~7</samp></h3>
    <p>Verwenden Sie das Zeichen <em>&laquo;~&raquo;</em> (Tilde) direkt nach einem Satz und geben Sie eine Distanz an, um alle W&ouml;rter anzuzeigen, die maximal diese Anzahl von W&ouml;rtern von einander entfernt sind.</p>
    <p>Um zum Beispiel nach <em>&laquo;Franz&raquo;</em>, <em>&laquo;Taxi&raquo;</em> und <em>&laquo;Bayern&raquo;</em> mit einer Entfernung von 8&nbsp;W&ouml;rtern von einander zu suchen:</p>
    <pre>&quot;Franz Taxi Bayern&quot;~8</pre>
    <p>Die Standarddistanz ist 0 und jeder Satz sucht entsprechend nach genauen Treffern.</p>

    <h3><a id="anchorInterval"></a>6.4 Bereichsuche<samp>meinFeld:[... TO&nbsp;...], meinFeld:{... TO&nbsp;...}</samp></h3>
    <p>Die Bereichsuche erm&ouml;glicht es Ihnen, nach Ver&ouml;ffentlichungen zu suchen, deren Feldwert(e) zwischen einem unteren und oberen Grenzwert, wie mithilfe dieser Syntax angegeben, liegen; <em>feldname:[untererGrenzwert TO obererGrenzwert]</em>. Verwenden Sie <em>&laquo;[&raquo;</em> <em>&laquo;]&raquo;</em> (eckige Klammern), um beide Grenzwerte einzuschlie&szlig;en, oder <em>&laquo;{&raquo;</em> <em>&laquo;}&raquo;</em> (geschwungene Klammern), um sie auszuschlie&szlig;en.</p>
    <p>Die Bereichsuche kann auf Text- und Datumfelder angewendet werden:</p>
    <p><strong>Textfeld:</strong> Um zum Beispiel nach B&uuml;chern zu suchen, deren Autor zwischen Apollinaire und Pascal liegt:</p>
    <pre>autor:[Apollinaire TO&nbsp;Pascal]</pre>
    <p><strong>datumfeld:</strong> Verwenden Sie immer das Format <em>JJJJMMTT</em> (Jahr, Monat, Tag). Um zum Beispiel nach allen B&uuml;chern zu suchen, deren Ver&ouml;ffentlichungsdatum zwingend nach dem <em>31.&nbsp;Dezember 1899</em> und zwingend vor dem <em>1.&nbsp;Januar 2000</em> liegt:</p>
    <pre>releaseDate:{18991231 TO&nbsp;20000101}</pre>

    <h3><a id="anchorBoost"></a>6.5 Verst&auml;rkender Begriff<samp>Begriff^2</samp></h3>
    <p>Wenn Sie die Relevanz von Ver&ouml;ffentlichungen verst&auml;rken m&ouml;chten, die einen Begriff Ihrer Suche gegen&uuml;ber anderen Begriffen enthalten, k&ouml;nnen Sie einen Begriff mithilfe des Zeichens <em>&laquo;^&raquo;</em> (Zirkumflex), gefolgt von einem Verst&auml;rkungsfaktor verst&auml;rken.</p>
    <p>Um zum Beispiel alle Ver&ouml;ffentlichungen zu suchen, die entweder den Satz <em>&laquo;blauer Mantel&raquo;</em> oder den Satz <em>&laquo;roter Manel&raquo;</em> enthalten, aber Ver&ouml;ffentlichungen vorreihen m&ouml;chten, die <em>&laquo;roter Mantel&raquo;</em> enthalten:</p>
    <pre>&bdquo;blauer Mantel&quot; OR &quot;roter Mantel&quot;^2</pre>
