<?php 
include "connect.php";

$item_name=strip_tags($_POST["item_name"]);
$item_cat=strip_tags($_POST["item_cat"]);
$item_death=strip_tags($_POST["item_death"]);
$item_price=strip_tags($_POST["item_price"]);
$item_iadl=strip_tags($_POST["item_iadl"]);

$sql=$con->prepare(
    "INSERT INTO `items`(`item_name`, `item_cat`, `item_death`, `item_price`, `item_iadl`) VALUES(?,?,?,?,?)");
$sql->execute(array(
    $item_name,$item_cat,$item_death,$item_price,$item_iadl
));
$count=$sql->rowCount();
if($count>0){
    echo json_encode(array("status"=>"true"));
}else{echo json_encode(array("status"=>"false"));}

