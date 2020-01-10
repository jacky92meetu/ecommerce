<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset="utf-8">
		<title><? echo $title; ?></title>
                <?php if ($description) { ?>
                <meta name="description" content="<?php echo $description; ?>" />
                <?php } ?>
                <?php if ($keywords) { ?>
                <meta name="keywords" content="<?php echo $keywords; ?>" />
                <?php } ?>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
                
                <link href="/merchant/view/images/icons/favicon.png" rel="icon">

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/merchant/view/css/bootstrap.min.css">
		<link rel="stylesheet" href="/merchant/view/css/font-awesome.min.css">

		<!-- page specific plugin styles -->
                <link rel="stylesheet" href="/merchant/view/css/datepicker.css" />
                <!--                
                <link rel="stylesheet" href="/merchant/view/css/jquery-ui.custom.min.css" />
                <link rel="stylesheet" href="/merchant/view/css/jquery.gritter.css" />
                <link rel="stylesheet" href="/merchant/view/css/select2.css" />
		<link rel="stylesheet" href="/merchant/view/css/bootstrap-editable.css" />
                -->
		<!-- text fonts -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300">

		<!-- ace styles -->
		<link rel="stylesheet" href="/merchant/view/css/ace.min.css">

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/merchant/view/css/ace-part2.min.css" />
		<![endif]-->                

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/merchant/view/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->
                <link rel="stylesheet" href="/merchant/view/css/icomoon.css">
		<link rel="stylesheet" href="/merchant/view/css/ubib.css">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/merchant/view/js/html5shiv.js"></script>
		<script src="/merchant/view/js/respond.min.js"></script>
		<![endif]-->
	<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>

	<body class="no-skin"><div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" style="padding-bottom: 95px; padding-right: 28px; display: none;"><div id="cboxWrapper"><div id="false"><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div id="false" style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxLoadedContent" class="" style="width: 0px; height: 0px; overflow: hidden;"></div><div id="cboxLoadingOverlay" class=""></div><div id="cboxLoadingGraphic" class=""></div><div id="cboxTitle" class=""></div><div id="cboxCurrent" class=""></div><div id="cboxNext" class=""></div><div id="cboxPrevious" class=""></div><div id="cboxSlideshow" class=""></div><div id="cboxClose" class=""></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div id="false" style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div id="false" style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div>
		<div id="navbar" class="navbar navbar-default navbar-fixed-top">			

			<div class="navbar-container" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left fixed" id="menu-toggler">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="/merchant/" class="navbar-brand">
						<small>
                                                    <i><img src="/merchant/view/images/icons/ico_ubibmerchant.png"/></i>
							Administrator (ID: <? echo $this->merchant->getInfo('merchant_id'); ?>)
						</small>
					</a>
				</div>                                
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
                                                <? if($message_count>0){ ?>
						<li class="green">
                                                        <a href="/merchant/message">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success"><? echo $message_count; ?></span>
							</a>
                                                        <!--
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">1</span>
							</a>                                                        
							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-envelope-o"></i>
									1 Message
								</li>

								<li class="dropdown-content ace-scroll" style="position: relative;"><div class="scroll-track" style="display: none;"><div class="scroll-bar"></div></div><div class="scroll-content" style="max-height: 200px;">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#">
												<img src="/merchant/view/images/avatar.png" class="msg-photo" alt="Alex&#39;s Avatar">
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Ciao sociis natoque penatibus et auctor ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>a moment ago</span>
													</span>
												</span>
											</a>
										</li>
									</ul>
								</div></li>

								<li class="dropdown-footer">
									<a href="/merchant/message">
										See all messages
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
                                                        -->
						</li>
                                                <? } ?>
						<li class="grey">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                                            <img class="nav-user-photo" src="<? echo $store_image; ?>" />
                                                            <i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">								

								<li>
									<a href="/merchant/profile">
										<i class="ace-icon fa fa-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
                                                                    <a href="/merchant/logout">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div class="main-container" id="main-container">			

			<div id="sidebar" class="sidebar responsive sidebar-fixed sidebar-scroll">
				
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
                                    
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="<?php echo ($this->request->get['route']=='merchant/dashboard')?'active':''; ?>">
						<a href="/merchant/dashboard">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>
						<b class="arrow"></b>
					</li>                                        
                                        <li class="<?php echo (in_array($this->request->get['route'],array('merchant/message','merchant/message/view')))?'active':''; ?>">
						<a href="/merchant/message">
							<i class="menu-icon fa fa-envelope"></i>
							<span class="menu-text"> Message </span>
                                                        <? if($message_count>0){ ?>
                                                        <span class="badge badge-success"><? echo $message_count; ?></span>
                                                        <? } ?>
						</a>
						<b class="arrow"></b>
					</li>
					
					<li class="<?php echo (stristr($this->request->get['route'],"merchant/profile")!==FALSE || stristr($this->request->get['route'],"merchant/merchant")!==FALSE)?'active open':''; ?>">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-building-o"></i>
							<span class="menu-text"> Merchant </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						<li class="<?php echo (in_array($this->request->get['route'],array('merchant/profile','merchant/profile/editprofile','merchant/profile/changepassword','merchant/merchant','merchant/merchant/index')))?'active':''; ?>">
								<a href="/merchant/merchant">
									<i class="menu-icon fa fa-caret-right"></i>
									merchant list
								</a>

								<b class="arrow"></b>
							</li>                             
						</ul>
					</li>
                                        
					<li class="<?php echo (stristr($this->request->get['route'],"merchant/customer")!==FALSE)?'active open':''; ?>">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text"> Customer </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						<li class="<?php echo (in_array($this->request->get['route'],array('merchant/customer','merchant/customer/index')))?'active':''; ?>">
								<a href="/merchant/customer">
									<i class="menu-icon fa fa-caret-right"></i>
									Customer List
								</a>

								<b class="arrow"></b>
							</li>                             
						</ul>
					</li>
					
					<li class="<?php echo (stristr($this->request->get['route'],"merchant/sales")!==FALSE)?'active open':''; ?>">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-dollar"></i>
							<span class="menu-text"> Sales </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						<li class="<?php echo (in_array($this->request->get['route'],array('merchant/sales/admin_order_list')))?'active':''; ?>">
								<a href="/merchant/sales/admin_order_list">
									<i class="menu-icon fa fa-caret-right"></i>
									Orders
								</a>

								<b class="arrow"></b>
							</li>                             
						</ul>
					</li>
                                        
					<li class="<?php echo (stristr($this->request->get['route'],"merchant/system")!==FALSE)?'active open':''; ?>">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-cogs"></i>
							<span class="menu-text"> System </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						<li class="<?php echo (in_array($this->request->get['route'],array('merchant/system/index','merchant/system/link_manage')))?'active':''; ?>">
                                                        <a href="/merchant/system/link">
                                                                <i class="menu-icon fa fa-caret-right"></i>
                                                                Link / URL
                                                        </a>
                                                        <b class="arrow"></b>
                                                </li>
                                                <li class="<?php echo (in_array($this->request->get['route'],array('merchant/system/floor','merchant/system/floor_manage')))?'active':''; ?>">
                                                        <a href="/merchant/system/floor">
                                                                <i class="menu-icon fa fa-caret-right"></i>
                                                                Floor
                                                        </a>
                                                        <b class="arrow"></b>
                                                </li>
						</ul>
					</li>
                                        
					<li class="<?php echo ($this->request->get['route']=='merchant/logout')?'active':''; ?>">
						<a href="/merchant/logout">
							<i class="menu-icon fa fa-power-off"></i>
							<span class="menu-text"> Logout </span>
						</a>
						<b class="arrow"></b>
					</li>
				</ul><!-- /.nav-list -->

			</div>

			<div class="main-content">
                                <div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">					

					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
                                                        <a href="<? echo $home_url; ?>">Home</a>
						</li>
						<li class="active"><? echo $page_title; ?></li>
					</ul><!-- /.breadcrumb -->
				</div>
                                <div class="page-content">                                    
					<div class="page-header">
						<h1>
							<? echo $page_title; ?>
                                                        <? if(isset($page_subtitle)){ ?>							
                                                            <? foreach($page_subtitle as $subtitle){ ?>
                                                            <small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								<? echo $subtitle; ?>
                                                            </small>
                                                            <? } ?>							
                                                        <? } ?>
						</h1>
					</div><!-- /.page-header -->
                                        
                                        <div class="alert alert-info">
                                                <button type="button" class="close" data-dismiss="alert">
                                                        <i class="ace-icon fa fa-times"></i>
                                                </button>
                                                <strong>Notice!</strong>

                                                Information below are the examples of your online store for your reference purposes. All numbers and statistics shall be reseted to zero once <font style="font-weight:bold;">ubib.my</font> go live.
                                                <br>
                                        </div>                                        
                                    
                                    <? if(isset($notification)){ ?>
                                        <? foreach($notification as $key => $value){ 
                                            $type = $value['type'];
                                            if($type=="error"){
                                                $type="danger";
                                            }
                                        ?>
                                            <div class="alert alert-<? echo $type; ?>">
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
                                        <? } ?>                                        
                                    <? } ?>