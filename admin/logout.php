<?php
require_once '../includes/init.php';
unset($_SESSION['User']);
header('Location: login.php');
?>