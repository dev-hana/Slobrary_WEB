<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
 <%
    String mem_id = (String)session.getAttribute("loginKey");
 
 	if(mem_id == null) {
 		%><div></div><%
 	}
 	
 	else {
 	MemBean memBean = memMgr.getMember(mem_id);
 	
 	
  %>
  
  <div id="userinfo" class="col-md-3 p-0 pt-4 pb-4">
                    <div class='bg-white rounded  shadow'>
                        <div id="userinfo-status" class="p-4 mb-3">
                            <p><span id="status-emoji">🤔</span><br>
                                <span>'책이름'</span> 외 <span>n</span>권<br>
                                연체까지 <span>0</span>일 남았어요!</p><br>
                        </div>
                        <div class="img-wrapper">
                            <img id="userinfo-img" class="img-cover" src="img/default/userImg/girl1.png" alt="프로필사진">
                        </div>
                        <div class="row mb-3 mt-4 pl-3 pr-3">
                            <div class="mt-4" style="width: 100%; text-align: center;">
                                <div id="userinfo-name" class="mt-2 mb-2">
                                    <p>hana</p>
                                    <i class="fas fa-bell"> 0</i>
                                </div>
                                <div id="userinfo-btn" class="btn-group mb-3" role="group">
                                    <button type="button" class="btn">내 서재</button>
                                    <button type="button" class="btn ml-3"  onclick="location.href='LogoutProc.jsp'">로그아웃</button>
                                </div>
                            </div>
                        </div>

                        <div id="userinfo-history" class="row pl-3 pr-3">
                            <div class="col">
                                <p>읽는 중</p>
                                <p id="history-reading" class="history-num">3</p>
                            </div>
                            <div class="col">
                                <p>읽은 책</p>
                                <p id="history-read" class="history-num">9</p>
                            </div>
                            <div class="col">
                                <p>읽고싶어요</p>
                                <p id="history-wish" class="history-num">9</p>
                            </div>
                        </div>
                    </div>
                </div>
  <%}%>