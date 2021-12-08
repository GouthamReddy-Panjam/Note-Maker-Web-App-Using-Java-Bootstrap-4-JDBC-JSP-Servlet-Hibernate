package com.goutham.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vaibhavmojidra.entities.Note;
import com.vaibhavmojidra.helper.SessionFactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveNoteServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title=request.getParameter("title").trim();
			String content=request.getParameter("content").trim();
			Note note=new Note(title,content,new Date());
			Session session=SessionFactoryProvider.getSessionFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
			response.getWriter().print("<h1 style='text-align:center;'>Note is added sucessfully</h1>");
			response.getWriter().print("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");
			
		} catch (Exception e) {
			System.out.println("\n\n\n\n\n"+e.getMessage());
			response.getWriter().print("\n\n\n\n\n"+e.getMessage());
		}
	}

}
