

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class MarksCalDelete
 */
@WebServlet("/MarksCalDelete")
public class MarksCalDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarksCalDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		try
		  {
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/markstest","root","");
			  Statement st = conn.createStatement();
			  int x = st.executeUpdate("DELETE FROM student WHERE studentid='"+request.getParameter("txtid")+"'");
			  conn.close();
			  if(x!=0)
			  {
				   response.sendRedirect("ViewMarks.jsp");
			  }
			  else
			  {
				  response.sendRedirect("ViewMarks.jsp?q=data not inserted successfully");
			  }
		  }
		  catch(Exception ex)
		  {
			 out.print(ex.getMessage().toString()); 
		  }
	}

}
