<?php
include 'connect.php';
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
    <div class="container my-5" style="text-`decoration:none">
        <button type="submit" class="btn btn-primary" name="submit"><a href="user.php" class="text-light">Add Customer</button>
        <table class="table table-hover" text-decoration= "none">
            <thead>
                <tr>
                <th scope="col">Customer ID</th>
                <th scope="col">Name</th>
                <th scope="col">Favourite Team</th>
                <th scope="col">Phone No</th>
                <th scope="col">Operations</th>
                </tr>
            </thead>
            <tbody>
            <?php
            $sql = "Select * from `customer`";
            $result=mysqli_query($con,$sql);
            if($result){
                while($row=mysqli_fetch_assoc($result)){
                    $customer_id=$row['customer_id'];
                    $Name=$row['Name'];
                    $Fav_team=$row['Fav_team'];
                    $phone_no=$row['phone_no'];
                    echo ' <tr>
                    <th scope="row">'.$customer_id.'</th>
                    <td>'.$Name.'</td>
                    <td>'.$Fav_team.'</td>
                    <td>'.$phone_no.'</td>
                    <td>
                    <button class = "btn btn-primary"><a href="update.php?
                    updateid='.$customer_id.'" class = "text-light">Update</a></button>
                    <button class = "btn btn-danger"><a href="delete.php? 
                    deleteid='.$customer_id.'" class = "text-light">Delete</a></button>
                    </td>
                    </tr>';
                }
            }
            ?>
            
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>