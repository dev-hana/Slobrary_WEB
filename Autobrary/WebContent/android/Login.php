<?php	//중복방지문

	$con = mysqli_connect("www.slobrary.com", "slo", "legoslo2020", "slo");	//아이피,아이디,비번,디비이름
	
	$ID = $_POST["ID"];
	
	
	$statement = mysqli_prepare($con, "SELECT * FROM member WHERE MEM_ID = ?");	//테이블안아이디확인
	mysqli_stmt_bind_param($statement, "s", $ID);	
	mysqli_stmt_execute($statement);
    $result = mtsqli_stmt_get_result($statement);

	$response = array();	
	$response["success"] = false;

	while($row = mysqli_fetch_assoc($result)){
		$response["success"] = true;
		$response["MEM_ID"] = $ID;
		$response["PASSWD"]= $row["PASSWD"];
	}
	
	
	echo json_encode($response);
	mysqli_close($con);
?>