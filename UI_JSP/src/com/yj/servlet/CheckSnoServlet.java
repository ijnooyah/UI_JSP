package com.yj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yj.db.StudentDao;

@WebServlet("/checkSno")
public class CheckSnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String sno = request.getParameter("sno");
		StudentDao dao = StudentDao.getInstance();
		int count = dao.checkSno(sno);
		System.out.println("count" + count);
		boolean result = false;
		//등록된학번있으면 count == 1, 없으면 0, 오류나면 -1
		if (count == 0) {
			result = true;
		}
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
