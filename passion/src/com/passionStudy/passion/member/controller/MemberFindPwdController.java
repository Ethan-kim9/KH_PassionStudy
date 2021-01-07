package com.passionStudy.passion.member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.passionStudy.passion.member.model.service.MemberService;
import com.passionStudy.passion.member.model.vo.MemberVo;

@WebServlet("/findPwd.do")
public class MemberFindPwdController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public MemberFindPwdController() {
		super();
	}
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		String memName = request.getParameter("username");
		String memId = request.getParameter("userid");
		String memPhone = request.getParameter("userphnumber");
		
		MemberVo mv = new MemberVo();
		mv.setMemName(memName);
		mv.setMemId(memId);
		mv.setMemPhone(memPhone);

		int memNo = 0;
		try {
			memNo = new MemberService().findPwdMember(mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(memNo > 0) {
			request.setAttribute("result", "비밀번호 변경");
			request.setAttribute("memId", memId);
			request.getRequestDispatcher("views/member/member_find.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "찾기 실패!");
			request.getRequestDispatcher("views/member/member_find.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
