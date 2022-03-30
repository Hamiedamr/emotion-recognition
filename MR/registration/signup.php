<?php

$data = $_POST;

$firstName = $_POST['first-name'];
$lastName = $_POST['last-name'];
$email = $_POST['email'];
$phone=$_POST['phone'];
$dateOfBirth=$_POST['date-of-birth'];
$password = $_POST['password'];
$passwordConfirm = $_POST['confirm-password'];
$city= $_POST['city'];
$address= $_POST['address'];



if (empty($data['first-name']) || 

    empty($data['last-name']) ||

    empty($data['email']) ||

    empty($data['phone']) || 

    empty($data['date-of-birth']) || 

    empty($data['password']) ||  

    empty($data['confirm-password']) || 

    empty($data['city']) ||

    empty($data['address'])){

      echo "Please fill all required fields";
    
}
else{
	
    if ( $data['password'] !== $data['confirm-password']) {

        echo "Not a matched password";
    }
    else {

      $host = "127.0.0.1"; /* Host name */
      $user = "root"; /* User */
      $dbpassword = ""; /* Password */
      $dbname = "cakebake"; /* Database name */

      $connection = mysqli_connect($host, $user, $dbpassword,$dbname);

      if (!$connection) {

        echo "Connection error: " . mysqli_connect_error();

      }
      else{
        
      $check= "SELECT * FROM `customerdata` where `email`='${email}' AND `password` = '${password}';";
      $sql = "INSERT INTO `customerdata` (`firstName`, `lastName`, `email`, `phone`, `dateOfBirth`, `password`, `city`, `address`) VALUES ('${firstName}', '${lastName}', '${email}', '${phone}', '${dateOfBirth}', '${password}', '${city}', '${address}');";

      if($connection->query($check) === TRUE){}
      #$result=mysqli_query($con,$sql);
      if ($connection->query($sql) === TRUE) {
        
        echo "New record created successfully";
      } else {
        echo "Error: " . $sql . "<br>" . $connection->error;
      }

     // header('Location: http://127.0.0.1/web_project/b&c/index.html');

      }}}



?>