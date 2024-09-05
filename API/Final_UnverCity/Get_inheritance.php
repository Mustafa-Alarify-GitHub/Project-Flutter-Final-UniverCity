<?php
include "connect.php";

 $id=strip_tags($_POST["id"]);

getAllData("inheritance","Inh_name_death =?",array($id));