<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><? echo $title; ?></title>
                <?php if ($description) { ?>
                <meta name="description" content="<?php echo $description; ?>" />
                <?php } ?>
                <?php if ($keywords) { ?>
                <meta name="keywords" content="<?php echo $keywords; ?>" />
                <?php } ?>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

                <link href="/merchant/view/images/icons/favicon.png" rel="icon">
                
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/merchant/view/css/bootstrap.min.css" />
                <link rel="stylesheet" href="/merchant/view/css/font-awesome.min.css">
                
                <!-- ace styles -->
		<link rel="stylesheet" href="/merchant/view/css/ace.min.css">
                
                <!-- inline styles related to this page -->                
		<link rel="stylesheet" href="/merchant/view/css/ubib.css">
                <link href="/merchant/view/css/login_style.css" rel="stylesheet" type="text/css">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="/merchant/view/js/html5shiv.js"></script>
		<script src="/merchant/view/js/respond.min.js"></script>
		<![endif]-->
	</head>
<body>