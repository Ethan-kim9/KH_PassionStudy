<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginFail = (String)request.getAttribute("loginFail");
	String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <title>Welcome Passion StudyCafe~!</title>
    <style>
    	#failmsg {font-size:12px; color:red;}
    </style>
  </head>
  <body>
    <!-- 로그인 -->
    <section>
      <div class="login_wrap">
        <form class="form_wrap_signup" onsubmit="return login();" action="<%= contextPath %>/login.do" method="post" >
          <h2 class="member_title">로그인</h2>
          	<div class="login_box">
              <div class="inpbx">
                <input
                  type="text"
                  id="userid"
                  placeholder="아이디 (이메일)"
                  name="userid"
                  autocapitalize="none"
                  class="login_main"
                  required
                />
              </div>
              <div class="inpbx">
                <input
                  type="password"
                  id="userpwd"
               	  name ="userpwd"
                  placeholder="비밀번호"
                  class="login_main"
                  required
                />
              </div>
              <div class = "inpbx">
             	    <!-- 로그인 오류시 출력문구 입력 -->
                   	<% if(loginFail != null){ %>
                   		<label id="failmsg"><%= loginFail %></label>
                   	<% } %>
              </div>
			  
              <button type="submit" class="btn_login">로그인하기 </button>
            

				<div class="inpbx"></div>
            <a href="index.jsp?inc=./views/member/member_signin.jsp" class="member_go">계정이 없으신가요? 간편가입하기</a>
            <ul class="linkarea">
              <li><a href="index.jsp?inc=./views/member/member_find.jsp">아이디 (이메일) 찾기</a></li>
              <li><a href="index.jsp?inc=./views/member/member_find.jsp">비밀번호 찾기</a></li>
            </ul>
          </div>
        </form>
      </div>
    </section>
  </body>
  	  <script src="resources/JS/pagesjs/member_login.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>
