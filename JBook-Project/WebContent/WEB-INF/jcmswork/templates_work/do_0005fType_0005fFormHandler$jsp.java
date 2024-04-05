import com.jalios.util.*;
import  java.io.*;
import  java.util.*;
import  java.text.*;
import  java.net.*;
import  org.jdom.*;
import  com.jalios.jcms.*;
import  com.jalios.jcms.portlet.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jalios.jspengine.runtime.*;


public class do_0005fType_0005fFormHandler$jsp extends HttpJspBase {


    static {
    }
    public do_0005fType_0005fFormHandler$jsp( ) {
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

            // begin [file="/do_Type_FormHandler.jsp";from=(0,52);to=(1,0)]
                
            // end
            // begin [file="/do_Type_FormHandler.jsp";from=(1,149);to=(2,0)]
                
            // end
            // begin [file="/do_Type_FormHandler.jsp";from=(2,48);to=(10,0)]
                
                
                  request.setCharacterEncoding("UTF-8");
                  Element typeElt = (Element)session.getAttribute("typeElt");
                  
                  String className = typeElt.getAttributeValue("name");
                  String customFormHandler = Util.getString(typeElt.getAttributeValue("customformhandler"), "");
                  String formHandler = Util.getString(customFormHandler, "generated.Edit" + className + "Handler");
            // end
            // HTML // begin [file="/do_Type_FormHandler.jsp";from=(10,2);to=(11,54)]
                out.write("[[%@ include file='/jcore/doInitPage.jspf' %]][[%\n%]][[jsp:useBean id='formHandler' scope='page' class='");

            // end
            // begin [file="/do_Type_FormHandler.jsp";from=(11,57);to=(11,70)]
                out.print( formHandler );
            // end
            // HTML // begin [file="/do_Type_FormHandler.jsp";from=(11,72);to=(16,29)]
                out.write("']][[%\n  %]][[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]][[%\n  %]][[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]][[%\n  %]][[jsp:setProperty name='formHandler' property='*' /]][[%\n%]][[/jsp:useBean]][[%\n%]][[% request.setAttribute(\"");

            // end
            // begin [file="/do_Type_FormHandler.jsp";from=(16,32);to=(16,43)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FormHandler.jsp";from=(16,45);to=(16,77)]
                out.write(".formHandler\", formHandler); %]]");

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
