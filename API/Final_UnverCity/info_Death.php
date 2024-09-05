<?php 
include "connect.php";

$name=strip_tags($_POST["name"]);
$sex=strip_tags($_POST["sex"]);


insertData("death",array(
    "death_Name"=>"$name",
    "death_Sex"=>"$sex"
));



