<?php
//require_once 'includes/init.php';
include 'Cart.php';
require_once 'includes/init.php';
?>
<!DOCTYPE html>
<html>
<head>
<title>Fresh Farm - Black Friday</title>
<link href ="style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">	
<style>
    .container5{padding: 50px;background-image:url("fruit1.jpg");min-width: 100%;height:1000px; .topnav a:hover:before{visibility: visible;-webkit-transform:scaleX(1);transform: scaleX(1);}}
    .cart-link{width: 100%;text-align: right;display: block;font-size: 22px;}
	.col-lg-3 {width: 27%;}
	.card{
    margin:4px -12px;
      -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1); 
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1); 
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1);
    transition: all 200ms ease-in;
    transform: scale(1);   
}
.card:hover{
    box-shadow: 0px 0px 150px rgba(0,0,0,0.4);
    z-index: 2;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1.5);
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1.5);   
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1.5);
    transition: all 200ms ease-in;
    transform: scale(1.1);
}
.rowz{
  padding:17px 98px;
  margin-right:-56px;
  margin-left:-12px;
}
.action{
  transition: .5s ease;
  opacity:0;
  position:absolute;
  top: 62%;
  height:60px;
  min-width:100%;
  background-color:white;
  border-radius:25px;
}
.card:hover .action{
 opacity:0.8;
}
.rows{
  margin:58px 20px;
}
h1{
	color: #fff;
	text-align:center;
	font-size:54px;
	letter-spacing:10px;
}
#del-countdown{
	width:850px;
	margin-top:0px;
	margin-left:228px;
}
#clock span{
	float:left;
	text-align:center;
	font-size:84px;
	margin:0 2.5%;
	color:white;
	padding:20px;
	width:20%;
	border-radius:15px;
	border:1px solid;
}
#clock span:nth-child(1){
	background:#fa5559;
}
#clock span:nth-child(2){
	background:#26c2b9;
}
#clock span:nth-child(3){
	background:#f6bc58;
}
#clock span:nth-child(4){
	background:#2dcb74;
}
#clock:after{
	content:"";
	display:block;
	clear:both;
}
#units span{
	float:left;
	width:25%;
	text-align:center;
	margin-top:30px;
	color:#ddd;
	text-transform:uppercase;
	font-size:13px;
	letter-spacing:2px;
	text-shadow:1px 1px 1px rgba(10,10,10,0.7);
}

span.turn{
	animation:turn 0.7s ease forwards; 
}
.clocksize{
	height:490px;
}
</style>
</head>
<body>
<div class="clocksize" style="background-color:black;">
<div id="del-countdown">
<h1>Black Friday Offers!</h1>
<h2 style="text-align:center;color:white;">ENDING DEC. 25TH</h2>
<div id="clock"></div>
<div id="units">
<span>Days</span>
<span>Hours</span>
<span>Minutes</span>
<span>Seconds</span>
</div>
</div>
</div>
<div class="container5">
<!-- Top links -->
<?php include("toplinks.php") ?>
<!--End top links-->

	<div class="title text-center">
		<h1 style="font-size:3.8em;color:white;"> Welcome to Fresh Farm</h1>
	</div>
    <h1 style="color:grey;text-align:center;font-size:30px;">Best Deals!</h1>
    
    <!--<div id="products" class="row list-group">
        <?php
        //get rows query
        //$query = $db->query("SELECT * FROM Products WHERE Featured = 1");
        //if($query->num_rows > 0){ 
          //  while($row = $query->fetch_assoc()){
        ?>
        <div class="item col-lg-3">
            <div class="thumbnail">
                <div class="caption">
				<img src="<?php echo $row['Image']; ?>" class="card-img-bottom img-fluid" alt="<?php echo $row['Name']; ?>" style="height:177px;"/>
                    <h4 class="list-group-item-heading"><?php echo $row["Name"]; ?></h4>
                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead"><?php echo 'Ksh'.$row["UnitPrice"]; ?></p>
                        </div>
                        <div class="col-md-6">
                            <a class="btn btn-success" href="cartAction.php?action=addToCart&id=<?php echo $row["Productid"]; ?>">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php// } }else{ ?>
        <p>Product(s) not found.....</p>
        <?php// } ?>
    </div>-->
	
	<div class="container text-muted">
<div class="row rows">
   <?php
        //get rows query
        $query = $db->query("SELECT * FROM Products WHERE Featured = 1");
        if($query->num_rows > 0){ 
            while($row = $query->fetch_assoc()){
        ?>
  <div class="col-md-6 col-lg-3">
  <div class="card">
  <div class="card-block">
  <h3 class="card-title text-center" style="font-size:25px;color:black;"><?php echo $row['Name']; ?></h3>
  <hr>
  <p class="text-center" style="font-size:15px;color:black;">Ksh.<?php echo $row['UnitPrice']; ?>/KG</p>
  </div>
  <img src="<?php echo $row['Image']; ?>" class="card-img-bottom img-fluid" alt="<?php echo $row['Name']; ?>" style="height:177px;"/>
   <div class="action">
  <div class="row rowz">
  <!--<span>&#124;</span>
  <div class="col-md-6 col-lg-4">
  <a href="#"><img src="bagg.svg" title="Add to Cart" alt="Shopping bag" style="height:30px;padding-left:100px;"/></a>
  </div><span>&#124;</span>-->
    <a href="cartAction.php?action=addToCart&id=<?php echo $row['Productid']?>" class="btn btn-success" style="height:30px;font-size:13px;">Add To Cart</a>    
  </div>
  </div>
     </div>
    </div>
      <?php } }else{ ?>
        <p>Product(s) not found.....</p>
        <?php } ?>
  </div>
</div>
	
</div>
<script src="countdown.js"></script>
</body>
</html>