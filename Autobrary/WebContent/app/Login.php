<?php	//중복방지문
/* 
	작성자: 장지은
 */

	//***********************보안 정보 취급 유의********************************//
	$con = mysqli_connect("www.slobrary.com", "slo", "legoslo2020", "slo");	//아이피,아이디,비번,디비이름
	//***********************보안 정보 취급 유의********************************//
	$ID = $_POST["ID"];
	
	
	$statement = mysqli_prepare($con, "SELECT passwd FROM member WHERE MEM_ID = ?");	//테이블안아이디확인
	mysqli_stmt_bind_param($statement, "s", $ID);	
	mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);

	$response = array();	
	$response["success"] = false;

	while($row = mysqli_fetch_assoc($result)){
		$response["success"] = true;
		$response["PASSWD"]= $row["passwd"];
	}
	
	
	echo json_encode($response);
	mysqli_close($con);
?>