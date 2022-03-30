<?php

$data = $_POST;


$email = $_POST['email'];
$password=$_POST['password'];


if (empty($data['password']) || empty($data['email']) ) {

   echo "Please fill all required fields!" ;
    
}
else {

setcookie("email", $out['email']);

$host = "127.0.0.1"; /* Host name */
$user = "root"; /* User */
$dbpassword = ""; /* Password */
$dbname = "cakebake"; /* Database name */

$connection = mysqli_connect($host, $user, $dbpassword,$dbname);
// Check connection

if (!$connection) {

  die("Connection failed: " . mysqli_connect_error());

}
else{

$sql = "SELECT * FROM `customerdata` WHERE `email` = '${email}' AND `password` = '${password}';";

$result = $connection ->query($sql);



if ($result->num_rows == 1) {
 $out= $result->fetch_assoc();
 
 if($out['type']=="admin")

header('Location: http://127.0.0.1/web_project/Addproduct/index.php');
else 
	
	header('Location: http://127.0.0.1/web_project/b&c/index.html');

} 
else {
  
  echo ("<script > alert ('wrong user name or password');
  window.location.href='registration.html';
  </script>");
  
  
}


}}



?>