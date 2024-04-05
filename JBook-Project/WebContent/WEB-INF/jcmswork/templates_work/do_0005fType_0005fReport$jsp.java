import com.jalios.util.*;
import  java.io.*;
import  java.util.*;
import  java.text.*;
import  java.net.*;
import  org.jdom.*;
import  com.jalios.jcms.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jalios.jspengine.runtime.*;


public class do_0005fType_0005fReport$jsp extends HttpJspBase {


    static {
    }
    public do_0005fType_0005fReport$jsp( ) {
    }

    private static boolean _jspx_inited = false;

    public final void _jspx_init() throws com.jalios.jspengine.runtime.JspException {
    }

    public void _jspService(HttpServletRequest request, HttpServletResponse  response)
        throws java.io.IOException, ServletException {

        JspFactory _jspxFactory = null;
        PageContext pageContext = null;
        HttpSession session = null;
        ServletContext application = null;
        ServletConfig config = null;
        JspWriter out = null;
        Object page = this;
        String  _value = null;
        try {

            if (_jspx_inited == false) {
                synchronized (this) {
                    if (_jspx_inited == false) {
                        _jspx_init();
                        _jspx_inited = true;
                    }
                }
            }
            _jspxFactory = com.jalios.jspengine.runtime.JspFactoryImpl.getInstance();
            response.setContentType("text/plain; charset=UTF-8");
            pageContext = _jspxFactory.getPageContext(this, request, response,
            			"", true, 8192, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/do_Type_Report.jsp";from=(0,50);to=(1,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(1,118);to=(2,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(2,44);to=(3,0)]
                out.write("\r\n");

            // end
            // begin [file="/do_Type_Report.jsp";from=(3,2);to=(15,0)]
                
                  request.setCharacterEncoding("UTF-8");
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                String className = typeElt.getAttributeValue("name");
                Attribute categorizableAtt = typeElt.getAttribute("categorizable");
                boolean categorizable = categorizableAtt != null && categorizableAtt.getBooleanValue();
                
                // Get the fields (and the inherited fields)
                ArrayList fieldList = new ArrayList();
                TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);
                
            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(15,2);to=(19,12)]
                out.write("\r\n[[%@ page contentType=\"text/html; charset=UTF-8\" %]]\r\n[[%-- This file was automatically generated. --%]]\r\n[[%--\r\n  @Summary: ");

            // end
            // begin [file="/do_Type_Report.jsp";from=(19,15);to=(19,26)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(19,28);to=(28,51)]
                out.write(" report page\r\n  @Category: Generated\r\n  @Author: JCMS Type Processor\r\n  @Customizable: True\r\n  @Requestable: True\r\n--%]]\r\n[[%@ include file='/jcore/doInitPage.jspf' %]]\r\n\r\n[[% \r\nSortedSet tmpResultSet = channel.getPublicationSet(");

            // end
            // begin [file="/do_Type_Report.jsp";from=(28,54);to=(28,65)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(28,67);to=(44,40)]
                out.write(".class, loggedMember, false);\r\nif (Util.isEmpty(tmpResultSet)) {\r\n  return;\r\n}\r\n//set are sorted by Cdate DESC\r\nSortedSet resultSet = new TreeSet(ComparatorManager.getComparator(Publication.class, \"cdate\", true));\r\nresultSet.addAll(tmpResultSet);\r\nDate firstDate = ((Data)resultSet.first()).getCdate();\r\nDate lastDate = ((Data)resultSet.last()).getCdate();\r\nint counter = 0;\r\nDecimalFormat decimalFormat = new DecimalFormat(\"#.##\");\r\nint tableWidth = 400;\r\nIntegerFormReport intReport;\r\nEnumerateFormReport enumReport;\r\n%]]\r\n\r\n<p class='t1'>[[%= channel.getTypeLabel(");

            // end
            // begin [file="/do_Type_Report.jsp";from=(44,43);to=(44,54)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(44,56);to=(70,0)]
                out.write(".class, userLang) %]]</p>\r\n\r\n[[%-- --- Summary ---------------------------------------------------------------------- --%]]\r\n<table class=\"table-data table-condensed\">\r\n  <tr>\r\n    <th colspan=\"2\">[[% /* %]]Summary[[% */ %]][[%= glp(\"ui.work.report.lbl.summary\") %]]</th>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]Submit count[[% */ %]][[%= glp(\"ui.work.report.lbl.nb-submit\") %]]</td>\r\n    <td align='right'>[[% /* %]]1234[[% */ %]][[%= resultSet.size() %]]</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]First submit[[% */ %]][[%= glp(\"ui.work.report.lbl.fst-submit\") %]]</td>\r\n    <td align='right'>[[jalios:date date='[[%= firstDate %]]' /]] [[jalios:time date='[[%= firstDate %]]' /]]</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]Last submit[[% */ %]][[%= glp(\"ui.work.report.lbl.lst-submit\") %]]</td>\r\n    <td align='right'>[[jalios:date date='[[%= lastDate %]]' /]] [[jalios:time date='[[%= lastDate %]]' /]]</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]Duration[[% */ %]][[%= glp(\"ui.work.report.lbl.duration\") %]]</td>\r\n    <td align='right'>[[jalios:duration begin='[[%= firstDate %]]' end='[[%= lastDate %]]' /]]</td>\r\n  </tr>\r\n</table>\r\n<br />\r\n  \r\n");

            // end
            // HTML // begin [file="/do_Type_Report.jsp";from=(70,52);to=(71,0)]
                out.write("\r\n");

            // end
            // begin [file="/do_Type_Report.jsp";from=(71,0);to=(71,85)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setCollection( fieldList );
                _jspx_th_jalios_foreach_0.setName("itField");
                _jspx_th_jalios_foreach_0.setType("org.jdom.Element");
                try {
                    int _jspx_eval_jalios_foreach_0 = _jspx_th_jalios_foreach_0.doStartTag();
                    if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        try {
                            if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_foreach_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_foreach_0.doInitBody();
                          }
                          do {
                              Integer itCounter = null;
                              itCounter = (Integer) pageContext.findAttribute("itCounter");
                              org.jdom.Element itField = null;
                              itField = (org.jdom.Element) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(71,85);to=(72,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(72,2);to=(108,0)]
                              
                                String name = itField.getAttributeValue("name");
                                String nameCap = Util.recapitalize(name);
                                String label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + name + "\", userLang) %]]";
                                String type = itField.getAttributeValue("type");
                                String editor = itField.getAttributeValue("editor");
                                if (editor == null) { editor = ""; }
                                Attribute ml = itField.getAttribute("ml");
                                boolean fieldML = ml != null && ml.getBooleanValue();
                              
                                Attribute searchable = itField.getAttribute("searchable");
                                boolean fieldSearchable = searchable != null && searchable.getBooleanValue();
                              
                                Attribute openWindowAttr = itField.getAttribute("openWindow");
                                boolean openWindow = openWindowAttr != null && openWindowAttr.getBooleanValue();
                              
                                String tmpStr = itField.getAttributeValue("dateOnly");
                                boolean isDateOnly = (tmpStr != null && tmpStr.equals("true")); 
                                String dateFormat = Util.getString(itField.getAttributeValue("dateFormat"), "short");
                              
                                String unit =       Util.getString(itField.getAttributeValue("unit"), "");
                                String unitPos =    Util.getString(itField.getAttributeValue("unitPos"), "after");
                                String unitBefore = Util.notEmpty(unit) && unitPos.equals("before") ? unit + "&nbsp;" : "";
                                String unitAfter =  Util.notEmpty(unit) && unitPos.equals("after") ? "&nbsp;" + unit : "";
                                int decimals = 2;
                                Attribute decimalsAtt = itField.getAttribute("decimals");
                                if (decimalsAtt != null) {
                                  decimals = decimalsAtt.getIntValue();
                                }
                                String rootCatId = itField.getAttributeValue("root");
                              
                                String arrayType = "";
                                if (type.endsWith("[]")) {
                                 arrayType = type.substring(0, type.length() - 2);
                                }
                              
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(108,2);to=(110,0)]
                              out.write("\r\n\r\n");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(110,0);to=(110,15)]
                              /* ----  jalios:select ---- */
                              com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_0 = new com.jalios.jtaglib.SelectTag();
                              _jspx_th_jalios_select_0.setPageContext(pageContext);
                              _jspx_th_jalios_select_0.setParent(_jspx_th_jalios_foreach_0);
                              try {
                              int _jspx_eval_jalios_select_0 = _jspx_th_jalios_select_0.doStartTag();
                              if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_select_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_select_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(110,15);to=(112,0)]
                              out.write("\r\n\r\n");

                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(112,63);to=(113,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(113,0);to=(113,57)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_0.setPageContext(pageContext);
                              _jspx_th_jalios_if_0.setParent(_jspx_th_jalios_select_0);
                              _jspx_th_jalios_if_0.setPredicate( editor.equals("enumerate") );
                              try {
                              int _jspx_eval_jalios_if_0 = _jspx_th_jalios_if_0.doStartTag();
                              if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(113,57);to=(115,10)]
                              out.write("\r\n  \r\n[[%-- --- ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(115,13);to=(115,22)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(115,24);to=(116,17)]
                              out.write(" ---------------------------------------------- --%]]\r\n[[% enumReport = ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(116,20);to=(116,31)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(116,33);to=(116,37)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(116,40);to=(116,49)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(116,51);to=(119,20)]
                              out.write("Report(resultSet); %]]\r\n<table class=\"table-data table-condensed\">\r\n  <tr>\r\n    <th colspan=\"2\">");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(119,23);to=(119,30)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(119,32);to=(124,33)]
                              out.write("</th>\r\n  </tr>\r\n  <tr bgcolor='white'>\r\n    <td class=\"formInfo\">\r\n      <table class='layout'>\r\n    [[jalios:foreach array='[[%= ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(124,36);to=(124,47)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(124,49);to=(124,53)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(124,56);to=(124,65)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(124,67);to=(147,0)]
                              out.write("Values() %]]' name='itKey' type='String']]\r\n    [[% int percent = (int)(enumReport.getPercent(itKey)); %]]\r\n    [[% double ratio = enumReport.getRatio(itKey); %]]\r\n    <tr>\r\n      <td nowrap=\"nowrap\" class=\"formInfo\" width='50%'>\r\n            [[jalios:truncate length='30' suffix='...']][[%= itKey %]][[/jalios:truncate]]\r\n          </td>\r\n      <td nowrap=\"nowrap\" class=\"formInfo\" width='5%' align='right'><strong>[[%= percent %]] %</strong></td>\r\n      <td width='45%' class=\"formInfo\" >\r\n        <table class='layout'>\r\n          <tr>\r\n            <td bgcolor='blue' width='[[%= percent %]]%'><img src='s.gif' width='[[%= percent %]]' height='12'></td>\r\n            <td bgcolor='lightblue' width='[[%= 100 - percent %]]%'><img src='s.gif' width='[[%= (int)((1 - ratio) * 100) %]]' height='12'></td>\r\n          </tr>\r\n        </table>\r\n      </td>\r\n    </tr>    \r\n        [[/jalios:foreach]]\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n<br />\r\n");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(147,0);to=(147,12)]
                          } while (_jspx_th_jalios_if_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_0.release();
              }
          // end
          // HTML // begin [file="/do_Type_Report.jsp";from=(147,12);to=(149,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/do_Type_Report.jsp";from=(149,61);to=(150,0)]
              out.write("\r\n");

          // end
          // begin [file="/do_Type_Report.jsp";from=(150,0);to=(150,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_1.setPageContext(pageContext);
              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_1.setPredicate( type.equals("boolean") );
              try {
                  int _jspx_eval_jalios_if_1 = _jspx_th_jalios_if_1.doStartTag();
                  if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_1.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(150,53);to=(152,10)]
                              out.write("\r\n  \r\n[[%-- --- ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(152,13);to=(152,22)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(152,24);to=(153,17)]
                              out.write(" ---------------------------------------------- --%]]\r\n[[% enumReport = ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(153,20);to=(153,31)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(153,33);to=(153,37)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(153,40);to=(153,49)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(153,51);to=(156,20)]
                              out.write("Report(resultSet); %]]\r\n<table class=\"table-data table-condensed\">\r\n  <tr>\r\n    <th colspan=\"2\">");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(156,23);to=(156,30)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(156,32);to=(164,55)]
                              out.write("</th>\r\n  </tr>\r\n  <tr bgcolor='white'>\r\n    <td class=\"formInfo\">\r\n      <table class='layout'>\r\n    [[jalios:foreach array='[[%= new Boolean[] {Boolean.TRUE, Boolean.FALSE} %]]' name='itKey' type='Boolean']]\r\n    [[% int percent = (int)(enumReport.getPercent(\"\" + itKey)); %]]\r\n    [[% double ratio = enumReport.getRatio(\"\" + itKey); %]]\r\n    [[% TypeFieldEntry tfe = channel.getTypeFieldEntry(");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(164,58);to=(164,69)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(164,71);to=(164,80)]
                              out.write(".class, \"");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(164,83);to=(164,89)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(164,91);to=(186,0)]
                              out.write("\", false); %]]\r\n    \r\n    <tr>\r\n      <td nowrap=\"nowrap\" class=\"formInfo\" width='50%'>\r\n        [[jalios:truncate length='30' suffix='...']][[%= itKey.booleanValue() ? tfe.getOnLabel(userLang) : tfe.getOffLabel(userLang) %]][[/jalios:truncate]]\r\n      </td>\r\n      <td nowrap=\"nowrap\" class=\"formInfo\" width='5%' align='right'><strong>[[%= percent %]] %</strong></td>\r\n      <td width='45%' class=\"formInfo\" >\r\n        <table class='layout'>\r\n          <tr>\r\n            <td bgcolor='blue' width='[[%= percent %]]%'><img src='s.gif' width='[[%= percent %]]' height='12'></td>\r\n            <td bgcolor='lightblue' width='[[%= 100 - percent %]]%'><img src='s.gif' width='[[%= (int)((1 - ratio) * 100) %]]' height='12'></td>\r\n          </tr>\r\n        </table>\r\n      </td>\r\n    </tr>    \r\n        [[/jalios:foreach]]\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n<br />\r\n");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(186,0);to=(186,12)]
                          } while (_jspx_th_jalios_if_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_1.release();
              }
          // end
          // HTML // begin [file="/do_Type_Report.jsp";from=(186,12);to=(188,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/do_Type_Report.jsp";from=(188,59);to=(189,0)]
              out.write("\r\n");

          // end
          // begin [file="/do_Type_Report.jsp";from=(189,0);to=(189,49)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_2.setPageContext(pageContext);
              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_2.setPredicate( type.equals("int") );
              try {
                  int _jspx_eval_jalios_if_2 = _jspx_th_jalios_if_2.doStartTag();
                  if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_2.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(189,49);to=(191,10)]
                              out.write("\r\n  \r\n[[%-- --- ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(191,13);to=(191,22)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(191,24);to=(192,16)]
                              out.write(" ---------------------------------------------------------------------- --%]]\r\n[[% intReport = ");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(192,19);to=(192,30)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(192,32);to=(192,36)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(192,39);to=(192,48)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(192,50);to=(195,20)]
                              out.write("Report(resultSet); %]]\r\n<table class=\"table-data table-condensed\">\r\n  <tr>\r\n    <th colspan=\"2\">");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(195,23);to=(195,30)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(195,32);to=(199,22)]
                              out.write("</th>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]Minimum[[% */ %]][[%= glp(\"ui.work.report.lbl.min\") %]]</td>\r\n    <td align='right'>");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(199,25);to=(199,37)]
                              out.print( unitBefore );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(199,39);to=(199,90)]
                              out.write("[[% /* %]]1234[[% */ %]][[%= intReport.getMin() %]]");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(199,93);to=(199,104)]
                              out.print( unitAfter );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(199,106);to=(203,22)]
                              out.write("</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]Maximum[[% */ %]][[%= glp(\"ui.work.report.lbl.max\") %]]</td>\r\n    <td align='right'>");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(203,25);to=(203,37)]
                              out.print( unitBefore );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(203,39);to=(203,66)]
                              out.write("[[%= intReport.getMax() %]]");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(203,69);to=(203,80)]
                              out.print( unitAfter );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(203,82);to=(207,22)]
                              out.write("</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[[% /* %]]Average[[% */ %]][[%= glp(\"ui.work.report.lbl.avrg\") %]]</td>\r\n    <td align='right'>");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(207,25);to=(207,37)]
                              out.print( unitBefore );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(207,39);to=(207,92)]
                              out.write("[[%= decimalFormat.format(intReport.getAverage()) %]]");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(207,95);to=(207,106)]
                              out.print( unitAfter );
                          // end
                          // HTML // begin [file="/do_Type_Report.jsp";from=(207,108);to=(211,0)]
                              out.write("</td>\r\n  </tr>\r\n</table>\r\n<br />\r\n");

                          // end
                          // begin [file="/do_Type_Report.jsp";from=(211,0);to=(211,12)]
                          } while (_jspx_th_jalios_if_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_2.release();
              }
          // end
          // HTML // begin [file="/do_Type_Report.jsp";from=(211,12);to=(213,0)]
              out.write("\r\n\r\n");

          // end
          // begin [file="/do_Type_Report.jsp";from=(213,0);to=(213,16)]
          } while (_jspx_th_jalios_select_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_select_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_select_0.release();
}
// end
// HTML // begin [file="/do_Type_Report.jsp";from=(213,16);to=(215,0)]
    out.write("\r\n\r\n");

// end
// begin [file="/do_Type_Report.jsp";from=(215,0);to=(215,17)]
} while (_jspx_th_jalios_foreach_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_foreach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_foreach_0.release();
}
// end
// HTML // begin [file="/do_Type_Report.jsp";from=(215,17);to=(217,0)]
    out.write("\r\n\r\n");

// end
// begin [file="/do_Type_Report.jsp";from=(217,2);to=(217,16)]
     out.flush(); 
// end
// HTML // begin [file="/do_Type_Report.jsp";from=(217,18);to=(218,0)]
    out.write("\r\n");

// end

} catch (Throwable t) {
    if (out != null && out.getBufferSize() != 0)
        out.clearBuffer();
    if (pageContext != null) pageContext.handlePageException(t);
} finally {
    if (_jspxFactory != null) _jspxFactory.releasePageContext(pageContext);
}
}
}
