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

$statement = mysqli_prepare($con, "SELECT num, name, admin_id, date, content FROM notice ");
mysqli_stmt_bind_param($statement, "issss");
mysqli_stmt_execute($statement);
$result = mysqli_stmt_get_result($statement);


$response = array();
$response["success"] = true;


while($row = mysqli_fetch_array($result)){
    $arr_row = [];
    $arr_row['name']=$row['name'];
    $arr_row["admin_id"]= $row["admin_id"];
    $arr_row["date"]= $row["date"];
    $arr_row["content"] = $row["content"];
    $response[$row['num']] = $arr_row;
    
}

echo json_encode($response);
mysqli_close($con);
?>