<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="text-align: center; display:inline;">
<form name="search">
	<select name="searchMem" style="font-size:20px; text-align:center;">
		<option value="all">전체</option>
		<option value="rfid">RFID</option>
		<option value="mem_id">회원ID</option>
		<option value="name">이름</option>
	</select>
	
	<input type="text" name="result" style="width:500px;">
	<input style="background:#042759; color:#FFFFFF; border: none; font-size:20px; text-align:center;" 
	type="submit" value="search">
</form>
</div>
<br><br>