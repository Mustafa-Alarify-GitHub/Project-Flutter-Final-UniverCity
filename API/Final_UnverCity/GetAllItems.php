<?php
include "connect.php";

 $name5=strip_tags($_POST["name"]);

getAllData("items","item_death=?",array($name5));