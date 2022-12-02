<?php
include 'connect.php';
if(isset($_GET['deleteid'])){
    $customer_id=$_GET['deleteid'];

    $sql = "delete from `customer` where customer_id=$customer_id";
    $result=mysqli_query($con,$sql);
    if($result){
        //echo "Customer deleted successfully";
        header('location:display.php');
    }else{
        die(mysqli_error($con)); 
    }
}
?>