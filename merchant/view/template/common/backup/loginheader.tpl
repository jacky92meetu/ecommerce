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

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/merchant/view/css/bootstrap.min.css" />
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!-- ace styles -->
		<link rel="stylesheet" href="/merchant/view/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/merchant/view/css/ace-part2.min.css" />
		<![endif]-->		

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/merchant/view/css/ace-ie.min.css" />
		<![endif]-->
                
                <!-- inline styles related to this page -->                
		<link rel="stylesheet" href="/merchant/view/css/ubib.css">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="/merchant/view/js/html5shiv.js"></script>
		<script src="/merchant/view/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout light-login">
		<div class="main-container container">
			<div class="main-content">
                            <div class="center">
                                <h1>
                                        <i class="ace-icon fa fa-bar-chart-o green"></i>                                        
                                        <span class="white" id="id-text2">Merchant Control Panel</span>
                                </h1>                                
                        </div>
                        
                        <div class="space-6"></div>
                        
                            <? if(isset($notification)){ ?>
                                        <? foreach($notification as $key => $value){ 
                                            $type = $value['type'];
                                            if($type=="error"){
                                                $type="danger";
                                            }
                                        ?>
                                        <div class="login-container">
                                            <div class="alert alert-<? echo $type ?>">
                                                    <button type="button" class="close" data-dismiss="alert">
                                                            <i class="ace-icon fa fa-times"></i>
                                                    </button>
                                                    <strong><?
                                                        if($value['type']=="error"){
                                                            ?><i class="ace-icon fa fa-times"></i><?
                                                        }else if($value['type']=="success"){
                                                            ?><i class="ace-icon fa fa-check"></i><?
                                                        }
                                                    ?><? echo ucfirst($value['type']); ?>!</strong>
                                                    <? echo $value['text']; ?>
                                                    <br>
                                            </div>
                                        </div>
                                        <? } ?>                                        
                                    <? } ?>