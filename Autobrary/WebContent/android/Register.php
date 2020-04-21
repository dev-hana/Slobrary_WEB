<?php	//중복방지문
/*
 작성자: 장지은
 */

//***********************보안 정보 취급 유의********************************//
$con = mysqli_connect("www.slobrary.com", "slo", "legoslo2020", "slo");	//아이피,아이디,비번,디비이름
//***********************보안 정보 취급 유의********************************//


$mem_id = $_POST["mem_id"];
$passwd = $_POST["passwd"];
$name = $_POST["name"];
$gender = $_POST["gender"];
$phone = $_POST["phone"];
$birth = $_POST["birth"];
$adress = $_POST["adress"];
$email = $_POST["email"];
$response["success"] = false;

$statement = mysqli_prepare($con, "INSERT INTO member(mem_id, passwd, name, gender, phone, birth, adress, email)  VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
mysqli_stmt_bind_param($statement, "ssssssss", $mem_id, $passwd, $name, $gender, $phone, $birth, $adress, $email);//ssss->string형으로 8개값받기
mysqli_stmt_execute($statement);

$response = array();
$response["success"] = true;


echo json_encode($response);
mysqli_close($con);
?>