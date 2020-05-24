<?php	//중복방지문
/*
 작성자: 장지은
*/

//***********************보안 정보 취급 유의********************************//
$con = mysqli_connect("www.slobrary.com", "slo", "legoslo2020", "slo");	//아이피,아이디,비번,디비이름
//***********************보안 정보 취급 유의********************************//


$mem_id = $_POST["mem_id"];


$response["success"] = false;

$statement = mysqli_prepare($con, "SELECT name, email FROM member WHERE mem_id = ? ");
mysqli_stmt_bind_param($statement, "s", $mem_id);
mysqli_stmt_execute($statement);
$result = mysqli_stmt_get_result($statement);


$response = array();

while($row = mysqli_fetch_array($result)){
	$response["success"] = true;
	$response["name"] = $row["name"];
 	$response["email"] = $row["email"];
    
}

echo json_encode($response, JSON_UNESCAPED_UNICODE);
mysqli_close($con);
?>