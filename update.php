<?php
include 'connect.php';
$customer_id=$_GET['updateid'];
$sql = "Select * from `customer` where customer_id = $customer_id";
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_assoc($result);
$Name = $row['Name'];
$Fav_team = $row['Fav_team'];
$phone_no = $row['phone_no'];
if(isset($_POST['submit'])){
    //$customer_id=$_POST['customer_id'];
    $Name=$_POST['Name'];
    $Fav_team=$_POST['Fav_team'];
    $phone_no=$_POST['phone_no'];

    $sql="update `customer` set customer_id=$customer_id,Name='$Name',
    Fav_team='$Fav_team',phone_no=$phone_no
    where customer_id = $customer_id";
    $result=mysqli_query($con,$sql);
    if($result){
        //echo "Updated successfully";
        header('location:display.php');
    }else{
        die(mysqli_error($con));
    }   
}
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRICKET TBS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  </head>
  <body>
    <div class="container my-5">
        <form method = "post">
                <div class="mb-3">
                <!-- <label>Customer ID</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder = "Please enter customer_id" name = "customer_id" automcomplete = "off"> 
                </div> -->
                <div class="mb-3">
                <label>Name</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder = "Please enter your Name" name = "Name" automcomplete = "off" value = <?php
                echo $Name;?>>
                </div>
                <div class="mb-3">
                <label>Favourite Team</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder = "Please enter your Favourite Team" name = "Fav_team" automcomplete = "off" value = <?php
                echo $Fav_team;?>>
                </div>
                <div class="mb-3">
                <label>Phone No</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder = "Please enter your Phone no" name = "phone_no" automcomplete = "off" value = <?php
                echo $phone_no;?>>
                </div>

                <button type="submit" class="btn btn-primary" name="submit">Update</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>