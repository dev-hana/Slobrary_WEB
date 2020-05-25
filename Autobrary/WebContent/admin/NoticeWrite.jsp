<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.btn{background-color:#042759;font-weight:bold;color:#FFFFFF;border: none;
    border-radius:5px;padding-top:6px;
    padding-bottom:6px;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항등록</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "../SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>
 
</head>
<body>
<%@ include file="Top.jsp" %> 
<%@ include file="Setside.jsp" %>
<%@ include file="NoticeTop.jsp" %>
<br><br>
<%
String id = (String)session.getAttribute("adminKey");
%>
<form id="frm" action="NoticeWriteProc.jsp" method="post" >
<table style="margin-left:auto; margin-right:auto">
		<tr>
			<td style="color:#042759">작성자 : <%=id %></td>
		</tr>
        <tr>
            <td>제목 <input type="text" id="title" name="title" style="width:1450px"/></td>
        </tr>
        <tr>
            
            <td>
                <textarea rows="10" cols="30" id="ir1" name="content" style="width:1500px; height:500px; text-align:center; "></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input class="btn" type="button" id="save" value="저장"/>
                <input class="btn" type="button" value="취소"/>
            </td>
        </tr>
</table>
<input type="hidden" id="id" name="id" value=<%=id %> />
</form>
 
</body>
</html>


