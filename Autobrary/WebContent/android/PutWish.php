<?php	//중복방지문
/*
 작성자: 장지은
 */

//***********************보안 정보 취급 유의********************************//
$con = mysqli_connect("www.slobrary.com", "slo", "legoslo2020", "slo");	//아이피,아이디,비번,디비이름
//***********************보안 정보 취급 유의********************************//


$applyUser = $_POST["applyUser"];
$bookTitle = $_POST["bookTitle"];
$bookAuthor = $_POST["bookAuthor"];
$bookPublish = $_POST["bookPublish"];

$response["success"] = false;


$statement = mysqli_prepare($con, "INSERT INTO wish_list(mem_id, book_name, book_author, publish) VALUES (?, ?, ?, ?)");
mysqli_stmt_bind_param($statement, "ssss", $applyUser, $bookTitle, $bookAuthor, $bookPublish);//ssss->string형으로 8개값받기
$result = mysqli_stmt_execute($statement);


$response = array();
$response["success"] = true;

if(!$result) $response["success"] = false;

echo json_encode($response);
mysqli_close($con);
?>