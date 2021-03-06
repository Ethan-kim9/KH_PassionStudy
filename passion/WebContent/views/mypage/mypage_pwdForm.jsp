<%@page import="com.passionStudy.passion.member.model.vo.MemberVo"%>
<%@page import="com.passionStudy.passion.member.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<html>
  <head>
      <title>mypage-비밀번호 변경</title>
      <script src="https://code.jquery.com/jquery-3.5.1.js"  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
      <!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->
  </head>
  <body>


    <div class="cont_header">
      <div class="cont_wrapper">
        <h1>마이 페이지</h1>
      </div>
    </div>

    <div class="tabtype">
      <div class="tabtype_wrapper mypage_tabtype_wrapper">
          <ul>
            <li>
                <a href="Mypage.Info"><button class="btn1">나의 정보</button></a>
            </li>
            <li>
                <a href="MyReceipt"><button class="btn2">나의 예약 관리</button></a>
            </li>
            <li>
                <a href="MyPage1on1Proc.do"><button class="btn3">나의 활동</button></a>
            </li>
            <li>
              <a href="MyInfoEditProc"><button class="btn4 on">설정</button></a>
          </li>
          </ul>
      </div>
  </div>  

    <!-- 회원 정보수정 -->
    <section class="mypage-section">
      <div class="mypage-container">
        <!-- 예약확인, 취소내역 감싸는 div -->
        <div class="container_mypage-management edit_btns">
          <ul>
            <li>
                <button onclick="location.href='MyInfoEditProc'" class="edit-button1">회원정보 수정 </button>
            </li>
            <li>
                <button onclick="location.href='index.jsp?inc=./views/mypage/mypage_pwdForm.jsp'" class="edit-button2 on">비밀번호 변경 </button>
            </li>
          </ul>
        </div>
       </div>	<!--  -->
    </section>


    <!-- 비밀번호 변경 수정 -->

    <section class="member-edit-section member-edit-section2 member_password_edit">
        <div class="edit-pwd_wrap">
          <div class="edit-pwd-content">
            <h1 class="edit-pwd_title">비밀번호 변경</h1>
            
            <form action="renewPwd" method="post" class="edit-pwd-change">
              <div class="edit-pwd_form">
                <div class="edit-pwd_form_title">현재 비밀번호</div>
                <div class="edit-pwd_form-group">
                  <div class="edit-pwd_form-group_box">
                    <input name="inputPassword" id="input_pwd" class="mypage_in_pwd"
                      type="password"
                      placeholder="현재 사용하고 계시는 비밀번호를 입력해주세요." required/>
                     <span id="inputPwd-success" style="display:none; color: #2565AE; font-weight:bold;">비밀번호가 일치합니다.</span>
	                 <span id="inputPwd-fail" style="display:none; color: #db1a1a; font-weight:bold;">비밀번호가 일치하지 않습니다.</span>
                  </div>
                  <script>
			    	$('.mypage_in_pwd').focusout(function(){
				    	var settingPwd = "<%= loginMember.getMemPwd()%>";
				    	var inputPwd = $('#input_pwd').val();
				    	
				    	if(settingPwd != '' && inputPwd == ''){
				    		null;
				    	}else if(settingPwd != "" || inputPwd != ""){
				    		if(settingPwd == inputPwd) {
				    	    	$('#inputPwd-success').css('display', 'inline-block');
				    	    	$('#inputPwd-fail').css('display', 'none');
				    	    }else{
				    	    	$('#inputPwd-success').css('display', 'none');
				    	    	$('#inputPwd-fail').css('display', 'inline-block');
				    	    }
				    	}
			    	});
    			</script>
                  <div class="edit-pwd_form-group_warn">
                    필수 입력 항목입니다.
                  </div>
                </div>
              </div>
              <div class="edit-pwd_newform">
                <div class="edit-pwd_newform_title">새 비밀번호</div>
                <div class="edit-pwd_newform_sub-title">
                  12자 이상 입력해주세요.
                </div>
                <div class="edit-pwd_newform-group">
                  <div class="edit-pwd_newform-group_box">
                    <input name="newPassword1" id="new_pwd1" class="mypage_pwd"
                      	type="password" pattern=".{12,20}"
                      	placeholder="영문+숫자+특수문자 포함 12~20자" required/>
                  </div>
                  <div class="edit-pwd_newform-group_warn">
                    필수 입력 항목입니다.
                  </div>
                </div>
              </div>
              <div class="edit-pwd_newform">
                <div class="edit-pwd_newform_title">새 비밀번호 확인</div>
                <div class="edit-pwd_newform-confirm">
                  <div class="edit-pwd_newform-confirm_box">
                    <input name="newPassword2" id="new_pwd2" class="mypage_pwd"
                    	type="password" placeholder="새 비밀번호 확인" required/>
	                 <span id="pwd-success" style="display:none; color: #2565AE; font-weight:bold;">비밀번호가 일치합니다.</span>
	                 <span id="pwd-fail" style="display:none; color: #db1a1a; font-weight:bold;">비밀번호가 일치하지 않습니다.</span>
                  </div>
                  <div class="edit-pwd_newform-confirm_warn">
                    필수 입력 항목입니다.
                  </div>
                </div>
              </div>
              <input type="hidden" name="memId" value="<%= loginMember.getMemId()%>"/>
              <a href="/passion/index.jsp?inc=./views/mypage/mypage.jsp"><button class="edit-pwd-button">비밀번호 변경</button></a>
            </form>
          </div>
        </div>
      
    </section>
    
    

  </body>
  <script src="resources/JS/pagesjs/mypage_edit_click.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>