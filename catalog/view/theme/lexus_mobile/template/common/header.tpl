<?php
$themeConfig = $this->config->get( 'themecontrol' );
$themeName =  $this->config->get('config_template');
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );

$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
$helper->setDirection( $direction );
/* Add scripts files */
$helper->addScript( 'catalog/view/javascript/jquery/jquery-1.7.1.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery/ui/external/jquery.cookie.js' );
$helper->addScript( 'catalog/view/javascript/common.js' );
$helper->addScript( 'catalog/view/theme/'.$themeName.'/javascript/common.js' );
$helper->addScript( 'catalog/view/javascript/jquery/bootstrap/bootstrap.min.js' );
$helper->addScript( 'catalog/view/javascript/bootbox.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery.cookie.js' );

$helper->addScriptList( $scripts );

$helper->addCss( 'catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css' );	
if( isset($themeConfig['customize_theme']) 
&& file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/customize/'.$themeConfig['customize_theme'].'.css') ) {  
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/customize/'.$themeConfig['customize_theme'].'.css'  );
}

$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/animation.css' );	
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/font-awesome.min.css' );	
$helper->addCssList( $styles );
$layoutMode = $helper->getParam( 'layout' );

?>
<!DOCTYPE html>
<html dir="<?php echo $helper->getDirection(); ?>" class="<?php echo $helper->getDirection(); ?>" lang="<?php echo $lang; ?>">
    <head>
        <? /* ?>
        <meta property="og:title" content="Nature Republic Soothing & Moisture Aloe Vera 92% Soothing Gel 300ml" /> 
        <meta property="og:description" content="Nature Republic Soothing & Moisture Aloe Vera 92% Soothing Gel 300ml" />  
        <meta property="og:image" content="http://www.ubib.my/image/cache/product/131/4-640x640.jpg" />
        <meta property="fb:app_id" content="315087005337571" />
        <? */ ?>
        <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <!-- Mobile viewport optimized: h5bp.com/viewport -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
        <?php } ?>
        <?php foreach ($metas as $key => $value) { ?>
        <meta property="<?php echo $key; ?>" content="<?php echo $value; ?>" />
        <?php } ?>
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <?php foreach ($helper->getCssLinks() as $link) { ?>

        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>

        <?php if( $themeConfig['theme_width'] &&  $themeConfig['theme_width'] != 'auto' ) { ?>
        <style> #page-container .container{max-width:<?php echo $themeConfig['theme_width'];?>; width:auto}</style>
        <?php } ?>

        <?php if( isset($themeConfig['use_custombg']) && $themeConfig['use_custombg'] ) {	?>
        <style> 
            body{
                background:url( "image/<?php echo $themeConfig['bg_image'];?>") <?php echo $themeConfig['bg_repeat'];?>  <?php echo $themeConfig['bg_position'];?> !important;
            }</style>
        <?php } ?>
        <?php 
        if( isset($themeConfig['enable_customfont']) && $themeConfig['enable_customfont'] ){
        $css=array();
        $link = array();
        for( $i=1; $i<=3; $i++ ){
        if( trim($themeConfig['google_url'.$i]) && $themeConfig['type_fonts'.$i] == 'google' ){
        $link[] = '<link rel="stylesheet" type="text/css" href="'.trim($themeConfig['google_url'.$i]) .'"/>';
        $themeConfig['normal_fonts'.$i] = $themeConfig['google_family'.$i];
        }
        if( trim($themeConfig['body_selector'.$i]) && trim($themeConfig['normal_fonts'.$i]) ){
        $css[]= trim($themeConfig['body_selector'.$i])." {font-family:".str_replace("'",'"',htmlspecialchars_decode(trim($themeConfig['normal_fonts'.$i])))."}\r\n"	;
        }
        }
        echo implode( "\r\n",$link );
        ?>
        <style>
            <?php echo implode("\r\n",$css);?>
        </style>
        <?php } else { ?>
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500italic,500,400italic,300italic,300,100italic' rel='stylesheet' type='text/css'>
        <?php } ?>
        <?php foreach ($styles as $style) { ?>
        <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <?php foreach( $helper->getScriptFiles() as $script )  { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
        <?php } ?>


        <?php if( isset($themeConfig['custom_javascript'])  && !empty($themeConfig['custom_javascript']) ){ ?>
        <script type="text/javascript"><!--
                $(document).ready(function() {
            < ?php echo html_entity_decode(trim($themeConfig['custom_javascript'])); ? >
            });
//--></script>
        <?php }	?>

        <!--[if lt IE 9]>
        <?php if( isset($themeConfig['load_live_html5'])  && $themeConfig['load_live_html5'] ) { ?>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <?php } else { ?>
        <script src="catalog/view/javascript/html5.js"></script>
        <?php } ?>
        <script src="catalog/view/javascript/respond.min.js"></script>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/ie8.css" />
        <![endif]-->

        <link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/ubib.css" />

        <?php if ( isset($stores) && $stores ) { ?>
        <script type="text/javascript"><!--
        $(document).ready(function() {
            < ?php foreach ($stores as $store) { ? >
                    $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
                    < ?php } ? >
                    });
        //--></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>
    <body id="offcanvas-container" class="offcanvas-container layout-<?php echo $layoutMode; ?> fs<?php echo $themeConfig['fontsize'];?> <?php echo $helper->getPageClass();?> <?php echo $helper->getParam('body_pattern','');?> lang-<?php echo $lang; ?>">

        <img class="hide" style="display:none;" src="/image/no_image.png" />
        
        <nav class="navbar navbar-default navbar-fixed-bottom visible-xs" role="navigation">
            <div class="container">
                <div class="bottom_fixed_cart left">
                    <a>
                        <span class="fa fa-shopping-cart"></span>            
                        <span class="badge red"><? echo $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0); ?></span>
                    </a>
                </div>
                <div class="button-search-small left">
                    <a href="/index.php?route=product/search"><span class="fa fa-search"></span></a>
                </div>
            </div>
        </nav>

        <section id="page" class="offcanvas-pusher" role="main">
            <section id="header">                
                <section id="topbar" class="hidden-xs">
                    <div class="container">                        
                        <div class="sidebar_banner">
                            <div class="sidebar_banner_container">
                                <a href="/mp/link?link_id=102"><img src="/image/data/banner/160x600_contest.jpg" /></a>
                            </div>
                        </div>                        
                        <div class="topbar"><div class="row">
                                <div class="pull-right hidden-xs">
                                    <ul class="links list-inline">
                                        <? /* ?>
                                        <li><a href="javascript:void(0);">
                                                <span class="text-link">Invite Friends & Get RM2</span></a>
                                        </li>
                                        <? */ ?>
                                        <? /*
                                        <li><a href="javascript:void(0);">
                                                <span class="fa fa-phone"></span>
                                                <span class="text-link">1700 81 5058</span></a>
                                        </li>
                                        */ ?>
                                        <li><a href="/index.php?route=information/contact">                                                
                                                <span class="text-link">Contact Customer Service</span></a>
                                        </li>
                                    </ul>
                                    <? /*
                                    <div class="login pull-left  hidden-xs">
                                            <?php if (!$logged) { ?>
                                            <?php echo $text_welcome; ?>
                                            <?php } else { ?>
                                            <?php echo $text_logged; ?>
                                            <?php } ?> 
                                    </div>
                                    */ ?>
                                </div>                                
                            </div>

                        </div></div>
                </section>                
                <section id="header-main">
                    <div class="container">
                        <div class="row header-wrap">
                            <div class="pull-left col-xs-3 visible-xs">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                            </div>

                            <div class="col-sm-2 col-xs-6 pull-left">
                                <?php if ($logo) { ?>
                                <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
                                <?php } ?>					
                            </div>

                            <div class="col-sm-6 hidden-xs inner">
                                <div>
                                    <div id="search" class="form-group has-feedback">
                                        <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
                                        <span class="icon fa fa-search form-control-feedback button-search"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4 col-xs-3 inner pull-right text-right">
                                <div class="menu-right">
                                    <ul class="list-inline">
                                        <!--<li><a class="first" href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>-->
                                        <li id="cart">
                                            <div class="heading"><a>
                                                    <span class="cart_icon"><img src="/image/data/ico_shoppingcart.png"></span>
                                                    <span class="text-link">Cart</span>
                                                    <span class="badge red"><? echo $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0); ?></span>
                                                </a></div>
                                        </li>                                                        
                                        <li class="dropdown-user-container">
                                            <?php if (!$logged) { ?>
                                            <a href="/index.php?route=account/login" alt="Login/Register">
                                                <span class="fa fa-user visible-xs"></span>
                                                <span class="text-link">Login</span>
                                            </a>
                                            <?php } else { ?>
                                            <a id="dropdown-user-menu" role="button" data-toggle="dropdown" data-target="#">
                                                <span class="fa fa-user visible-xs"></span>
                                                <span class="text-link"><? echo $this->customer->getFirstName(); ?></span>
                                                <span class="icon fa fa-chevron-down"></span>
                                            </a>
                                            <ul class="dropdown-menu pull-right text-left" role="menu" aria-labelledby="dropdown-user-menu">
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/account">My Account</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/edit">Edit Account</a></li>                                                
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/wishlist">Wish List</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/order">Order History</a></li>                                                
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/reward">UBIB Reward Points</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/return">Returns</a></li>                                                
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/transaction">My Credits</a></li>                                                
                                                <? /* ?>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/password">Password</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/address">Address Books</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/download">Downloads</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/recurring">Recurring payments</a></li>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/newsletter">Newsletter</a></li>
                                                <? */ ?>
                                                <li  role="presentation"><a role="menuitem" tabindex="-1" href="/index.php?route=account/logout">Logout</a></li>
                                            </ul>
                                            <?php } ?>
                                        </li>
                                        <?php if (!$logged) { ?>
                                        <li class="hidden-xs">
                                            <a href="/index.php?route=account/register" alt="Login/Register">                                                
                                                <span class="text-link">Register</span>
                                            </a>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                        </div>                                
                    </div>
                </section>
            </section>

            <section id="pav-mainnav" class="hidden-xs hidden-sm">
                <div class="container">
                    <div class="mainnav-wrap">
                        <div class="row">
                            <div class="col-xs-12">                                
                                <div class="row">
                                    <div class="col-xs-12">
                                        <ul class="nav navbar-nav special-menu">                                            
                                            <? foreach($link_1 as $value){ ?>
                                            <li ><a href="<? echo $value['href']; ?>" style="<? echo $value['link_value']['link_style']; ?>"><? echo $value['link_name']; ?></a></li>
                                            <? } ?>
                                        </ul>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="hr"></div>
                                <div class="navbar"> 
                                    <nav id="mainmenutop" role="navigation">
                                        <div class="pav-megamenu">						
                                            <div class="collapse navbar-collapse navbar-ex1-collapse">
                                                <? /*
                                                <ul class="nav navbar-nav fixed-width">
                                                <?php 
                                                $count = 0;                                                
                                                foreach ($categories as $category) {                                                
                                                $row_class = "list_row_".($count%4);
                                                $title_class = "title-".strtolower((stripos($category['name'],' ')>0)?substr($category['name'],0,stripos($category['name'],' ')):$category['name']);
                                                ?>
                                                <li class="<? echo $row_class; ?>"><a href="<? echo $category['href']; ?>"><span class="icon <? echo $title_class; ?>"><img src="<? echo $category['thumb']; ?>" /></span><span class="title-text"><? echo $category['name']; ?></span></a></li>
                                                <?
                                                $count += 1;
                                                } 
                                                ?>
                                                </ul>
                                                */ ?>
                                                <ul class="nav navbar-nav fixed-width">                                                    
                                                <?php
                                                $count = 1;
                                                $list_row = array('0'=>array(),'1'=>array(),'2'=>array(),'3'=>array());
                                                foreach ($categories as $category) {
                                                    $sort_order = (int)$category['sort_order'] % 4;
                                                    $list_row[$sort_order][] = $category;
                                                    $count++;
                                                }
                                                foreach($link_2 as $value){
                                                    $sort_order = $count % 4;
                                                    $list_row[$sort_order][] = array("href"=>$value['href'],"name"=>$value['link_name'],"style"=>$value['link_value']['link_style']);
                                                    $count++;
                                                }
                                                foreach($list_row as $key => $value){ ?>
                                                    <li class="list_row_<? echo $key; ?>"><ul>
                                                        <?
                                                            foreach($value as $category){                                                                
                                                                $title_class = "title-".strtolower((stripos($category['name'],' ')>0)?substr($category['name'],0,stripos($category['name'],' ')):$category['name']);
                                                        ?>
                                                            <li><a href="<? echo $category['href']; ?>"><span class="icon <? echo $title_class; ?>"><img src="<? echo $category['thumb']; ?>" /></span></span><span class="title-text" style="<? echo $category['link_style']; ?>"><? echo $category['name']; ?></span></a></li>
                                                        <?
                                                            }
                                                        ?>
                                                    </ul></li>
                                                <? } ?>
                                                </ul>
                                            </div>
                                        </div>
                                    </nav>
                                </div>
                                <div class="hr"></div>
                            </div>				
                        </div>
                    </div>
                </div>		
            </section>
            <section id="sys-notification">
                <div class="container">
                    <div id="notification"></div>
                </div>
            </section>

            <section id="columns"><div class="container">
                    <div class="row">