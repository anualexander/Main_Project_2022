<?php session_start();
include_once('includes/config.php');
if(strlen($_SESSION['id'])==0)
{   header('location:logout.php');
}else{

// Code for Product deletion from  cart  
if(isset($_GET['del']))
{
$wid=intval($_GET['del']);
$query=mysqli_query($con,"delete from cart where id='$wid'");
 echo "<script>alert('Product deleted from cart.');</script>";
echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shopping Portal | My Cart</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="js/jquery.min.js"></script>
       <!--  <link href="css/bootstrap.min.css" rel="stylesheet" /> -->
    </head>
<style type="text/css"></style>
    <body>
<?php include_once('includes/header.php');?>    
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">


                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Cart</h1>
                </div>

            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4  mt-5">
     

    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="4"><h4>My Cart</h4></th>
                </tr>
            </thead>
            <tr>
                <thead>
                    <th>Product</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Quantity</th>
                    <th>Total Amount</th>
                    <th>Action</th>
                </thead>
            </tr>
            <tbody>
<?php
$uid=$_SESSION['id'];
$ret=mysqli_query($con,"select products.productName as pname,products.productName as proid,products.productImage1 as pimage,products.productPrice as pprice,cart.productId as pid,cart.id as cartid,products.productPriceBeforeDiscount,cart.productQty from cart join products on products.id=cart.productId where cart.userId='$uid'");
$num=mysqli_num_rows($ret);
    if($num>0)
    {
while ($row=mysqli_fetch_array($ret)) {

?>

                <tr>
                    <td class="col-md-2"><img src="admin/productimages/<?php echo htmlentities($row['pimage']);?>" alt="<?php echo htmlentities($row['pname']);?>" width="100" height="100"></td>
                    <td>
                       <a href="product-details.php?pid=<?php echo htmlentities($pd=$row['pid']);?>"><?php echo htmlentities($row['pname']);?></a>
  </td>
<td>
                           <span class="text-decoration-line-through">$<?php echo htmlentities($row['productPriceBeforeDiscount']);?></span>
                            <span>$<?php echo htmlentities($row['pprice']);?></span>
                    </td>
                    <td><?php echo htmlentities($row['productQty']);?></td>
                     <td><?php echo htmlentities($row['productQty']*$row['pprice']);?></td>
                    <td>
                        <a href="my-cart.php?del=<?php echo htmlentities($row['cartid']);?>" onClick="return confirm('Are you sure you want to delete?')" class="btn-upper btn btn-danger">Delete</a>
                    </td>
                </tr>
            
                <?php } ?>
    <tr>
                    <td colspan="6" style="text-align:right;">
<a href="shop-categories.php" class="btn-upper btn btn-warning">Continue Shopping</a>
                        <a href="checkout.php" class="btn-upper btn btn-primary">Procced for Checkout</a></td>
                </tr>
                <?php } else{ ?>
                <tr>
                    <td style="font-size: 18px; font-weight:bold ">Your Cart is Empty.&nbsp;
<a href="index.php" class="btn-upper btn btn-warning">Continue Shopping</a>
                    </td>

                </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
              
            </div>

 
</div>
        </section>
        <!-- Footer-->
   <?php include_once('includes/footer.php'); ?>
        <!-- Bootstrap core JS-->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
<?php } ?>
