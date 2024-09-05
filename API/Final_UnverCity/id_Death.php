<?php
include "connect.php";
 $name=strip_tags($_POST["name"]);

 getAllData("death","death_Name	=?",array($name));