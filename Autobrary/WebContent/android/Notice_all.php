<?php	//중복방지문
/*
 작성자: 장지은
 */

//***********************보안 정보 취급 유의********************************//
$con = mysqli_connect("www.slobrary.com", "slo", "legoslo2020", "slo");	//아이피,아이디,비번,디비이름
//***********************보안 정보 취급 유의********************************//


$num = $_POST["num"];
$name = $_POST["name"];
$admin_id = $_POST["admin_id"];
$date = $_POST["date"];

$response["success"] = false;

$statement = mysqli_prepare($con, "SELECT num, name, admin_id, date FROM notice ");
mysqli_stmt_bind_param($statement, "isss");
mysqli_stmt_execute($statement);
$result = mysqli_stmt_get_result($statement);


$response = array();
$response["success"] = false;
$count = 0;
$response_r = array();

while($row = mysqli_fetch_array($result)){
    $response["success"] = true;
    $response["num"]= $row["num"];
    $response["name"]= $row["name"];
    $response["admin_id"]= $row["admin_id"];
    $response["date"]= $row["date"];
    $response_r[$count] = $response;
    $count = $count + 1;
}

echo json_encode($response_r);
mysqli_close($con);
?>