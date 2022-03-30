<?php
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["record"]["name"]).".wav";
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

    if (move_uploaded_file($_FILES["record"]["tmp_name"], $target_file)) {
        $command = escapeshellcmd('python test.py');
        $output = shell_exec($command);
        echo $output;
      } else {
        echo "Sorry, there was an error uploading your file.";
      }