<?php 
// include database configuration file
include 'includes/init.php';
  if(empty($_SESSION['UserID'])){
    header('Location: admin/login.php');
  }
// initialize shopping cart class
include 'Cart.php';
$cart = new Cart;

// redirect to home if cart is empty
if($cart->total_items() <= 0){
    header("Location: index.php");
}
$query = $db->query("SELECT * FROM customers WHERE id=(SELECT MAX(id) FROM customers)");
$sql = mysqli_fetch_assoc($query);
echo $sql['id'];
// set customer ID in session
$_SESSION['sessCustomerID'] = $sql['id'];


$_SESSION['sessCustomerID'] = $_SESSION['UserID'];

// get customer details by session customer ID
$query = $db->query("SELECT * FROM customers WHERE id = ".$_SESSION['sessCustomerID']);
//$custRow = $query->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Fresh Farm - Check out</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    .container{padding: 50px;background-image:url("fruit1.jpg");min-width: 100%;height:900px; .topnav a:hover:before{visibility: visible;-webkit-transform:scaleX(1);transform: scaleX(1);}}
    .table{width: 65%;float: left;}
    .shipAddr{width: 30%;float: left;margin-left: 30px;}
    .footBtn{width: 95%;float: left;}
    .orderBtn {float: right;}
    </style>
</head>
<body>
<div class="container">
<!-- Top links -->
<?php include("toplinks.php") ?>
<ul>
<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hello <?php echo $_SESSION['UserID']; ?> !
  <span class="caret"></span>
  </a>
  <ul class="dropdown-menu" role="menu">
    <li><a href="admin/change_password.php" style="color:black;">Change Password</a></li>
    <li><a href="admin/logout.php" style="color:black;">Log Out</a></li>
  </ul>
</li>
</ul>
<!--End top links-->
<br>
<br>

    <h1>Order Preview</h1>
	<form name="frmconfirm" action="payment_confirm.php" method="post">
    <table class="table" style="color:white;">
    <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
        <?php
        if($cart->total_items() > 0){
            //get cart items from session
            $cartItems = $cart->contents();
            foreach($cartItems as $item){
        ?>
        <tr>
            <td><?php echo $item["name"]; ?></td>
            <td><?php echo 'Ksh'.$item["price"]; ?></td>
            <td><?php echo $item["qty"]; ?></td>
            <td><?php echo 'Ksh'.$item["subtotal"]; ?></td>
        </tr>
        <?php } }else{ ?>
        <tr><td colspan="4"><p>No items in your cart</p></td>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3"></td>
            <?php if($cart->total_items() > 0){ ?>
            <td class="text-center"><strong>Total <?php echo 'Ksh'.$cart->total(); ?></strong></td>
            <?php } ?>
        </tr>
    </tfoot>
    </table>
	

	<!--<table class="table" style="color:white;">
		<?
		//fetch user infor from customers table
		?>
		<tr> 
		  <td colspan="2" align="center" class="mytitle" style="color:#999999"> <font color="#ffffff" >Add 
			comments About your Order</font></td>
		</tr>
		<tr> 
			<td colspan="2" align="center" valign="top" bordercolor="#808080"><textarea name="address" cols="56" rows="5" wrap="VIRTUAL" id="address"></textarea></td>
		</tr>
		<tr> 
		  <td width="143" align="left" valign="top">Telephone</td>
		  <td width="317" align="left" valign="top"><input name="tel" type="text" id="tel"  /> 
			<input type="hidden" name="tel" /></td>
		</tr>
		<tr> 
		  <td align="center" valign="top">&nbsp;</td>
		  <td align="left" align="top"></td>
		</tr>
    </table>-->
	
	
	
	
	</form>
    <div class="footBtn">
        <a href="category.php" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Continue Shopping</a>

        <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#checkoutModal">
		<span class="glyphicon glyphicon-shopping-cart"></span>Enter Details>>
		</button>

<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="checkoutModalLabel">Confirm Order</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	    <div class="row">
        <form role="form" action="testr.php" method="POST">
		<!--<div class="form-group col-lg-6">
		<label for="firstname">FirstName</label>
		<input class="form-control" id="firstname" name="firstname" type="text" required>
		</div>
		<div class="form-group col-lg-6">
		<label for="lastname">LastName</label>
		<input class="form-control" id="lastname" name="lastname" type="text" required>
		</div>
		<div class="form-group col-lg-6">
		<label for="email">Email</label>
		<input class="form-control" id="email" name="email" type="email" required>
		</div>
		<div class="form-group col-lg-6">
		<label for="pnumber">Phone Number</label>
		<input class="form-control" id="pnumber" name="pnumber" type="text" required>
		</div>-->
		<div class="form-group col-lg-6">
		<label for="street1">Street Address</label>
		<input class="form-control" id="street" name="street1" type="text" required>
		</div>
		<div class="form-group col-lg-6">
		<label for="street2">Pick Up Point</label>
		<input class="form-control" id="street2" name="street2" type="text" required>
		</div>
		<div class="form-group col-lg-6">
		<textarea name="description" rows="4" col="90" style="height:59px;width:419px;" required>
		Add Comments on your order here
		</textarea>
		</div>
		<div class="form-group col-lg-6">
		<label for="street2">Grand Total</label>
		<input class="form-control" id="total" name="total" type="text" value="<?php echo 'Ksh'.$cart->total(); ?>" readonly>
		</div>
		<input type="submit" name="submit" value="Confirm Order">
		</form>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
      </div>
    </div>
  </div>
</div>

<a href="cartAction.php?action=placeOrder" class="btn btn-success orderBtn">Place Order<i class="glyphicon glyphicon-menu-right"></i></a>
        
    </div>
</div>
</body>
</html>