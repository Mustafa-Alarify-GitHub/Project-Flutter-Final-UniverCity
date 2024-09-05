<?php 
include "connect.php";

$Inh_name =strip_tags($_POST["Inh_name"]);
$Inh_name_death =strip_tags($_POST["Inh_name_death"]);
$type =strip_tags($_POST["type"]);

insertData("inheritance",array(
    "Inh_name"=>"$Inh_name",
    "Inh_name_death"=>"$Inh_name_death",
    "type"=>"$type"
));

