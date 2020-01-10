<?php 
require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); 
?>
<?php echo $header; ?>

<div class="col-xs-12">
    <section id="pav-slideshow" class="pav-slideshow">
            <div class="container">
                <div class="row subcategory">

                        <div class="hidden-xs col-sm-3">
                            <div class="list-group">                                
                                <?
                                foreach($link_7 as $value){
                                    if(isset($value['link_value']['link_class']) && $value['link_value']['link_class']=="title"){
                                ?>                                
                                <a href="<? echo $value['href']; ?>" class="list-group-item title" style="<? echo $value['link_value']['link_style']; ?>"><? echo $value['link_name']; ?></a>
                                <div class="hr"></div>
                                <?  }else{ ?>
                                <a href="<? echo $value['href']; ?>" class="list-group-item" style="<? echo $value['link_value']['link_style']; ?>"><? echo $value['link_name']; ?></a>
                                <?
                                    }
                                }                                
                                ?>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <div class="row">
                                <div id="carousel-example-generic" class="col-xs-12 carousel slide" data-ride="carousel">
                                    <!-- Indicators -->
                                    <ol class="carousel-indicators">
                                      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                                      <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                                      <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                                    </ol>
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="/mp/link?link_id=102">
                                                <img class="img-responsive" src="/image/data/banner/carousel_736x280_contest.jpg">
                                            </a>
                                        </div>
                                        <div class="item">
                                            <img class="img-responsive" src="/image/data/banner/carousel_736x280_Aloe-Vera-Gel.jpg">
                                        </div>
                                        <div class="item">
                                            <img class="img-responsive" src="/image/data/banner/carousel_736x280_fibit.jpg">
                                        </div>
                                        <div class="item">
                                            <img class="img-responsive" src="/image/data/banner/carousel_736x280_homeNappliances_deal.jpg">
                                        </div>
                                        <div class="item">
                                            <img class="img-responsive" src="/image/data/banner/carousel_736x280_watches_gategory.jpg">
                                        </div>
                                        <div class="item">
                                            <img class="img-responsive" src="/image/data/banner/carousel_736x280_wewantyourstock.jpg">
                                        </div>
                                    </div>                            
                                    <!-- Controls -->
                                    <!--
                                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                      <span class="fa fa-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                      <span class="fa fa-chevron-right"></span>
                                    </a>
                                    -->
                                </div>
                            </div>                            
                        </div>

                </div>
            </div>
    </section>
</div>

<div class="row special_thumbnail_list">
    <div class="col-xs-12">
        <div class="special_thumbnail">
            <a href="/index.php?route=product/product&path=130&product_id=291" class="thumbnail">
                <img src="/image/link/top/TOP-6-DEALS_2.png" />
            </a>
        </div>
        <div class="special_thumbnail">
            <a href="/index.php?route=product/product&product_id=281" class="thumbnail">
                <img src="/image/link/top/TOP-6-DEALS_3.png" />
            </a>
        </div>
        <div class="special_thumbnail">
            <a href="/index.php?route=product/product&path=130&product_id=240" class="thumbnail">
                <img src="/image/link/top/TOP-6-DEALS_1.png" />
            </a>
        </div>
        <div class="special_thumbnail">
            <a href="/index.php?route=product/product&path=147&product_id=137" class="thumbnail">
                <img src="/image/link/top/TOP-6-DEALS_6.png" />
            </a>
        </div>
        <div class="special_thumbnail">
            <a href="/index.php?route=product/product&path=130&product_id=226" class="thumbnail">
                <img src="/image/link/top/TOP-6-DEALS_4.png" />
            </a>
        </div>
        <div class="special_thumbnail">
            <a href="/index.php?route=product/product&path=130&product_id=243" class="thumbnail">
                <img src="/image/link/top/TOP-6-DEALS_5.png" />
            </a>
        </div>
    </div>    
</div>

<? if(isset($products)){ ?>
<div class="col-xs-12 special-product">
    <div class="row">
        <div class="col-xs-12 title">
            <h1>New Recommend Products</h1>
        </div>
        <div class="col-xs-12">
            <div class="row">
                <div id="special-product1" class="col-xs-12 javascript-carousel">                        
                    <? foreach($products as $i => $product){ ?>
                        <div class="javascript-carousel-item product-block">	
                            <div class="image">	    	
                                <a href="<? echo $product['href']; ?>"><img src="<? echo $product['thumb']; ?>" title="<? echo $product['name']; ?>" alt="<? echo $product['name']; ?>"></a>                                
                            </div>
                            <div class="product-meta">
                                <div class="name" data-rel="tooltip" data-title="<? echo $product['full_name']; ?>"><a href="<? echo $product['href']; ?>"><? echo $product['name']; ?></a></div>
                                <div class="merchant">by <a href="<? echo $product['merchant_url']; ?>"><? echo $product['merchant_name']; ?></a></div>
                                <div class="description"><? echo $product['description']; ?></div>
                                <div class="price">
                                    <? if(!$product['special']){ ?>
                                        <?php echo $product['price']; ?>
                                    <? } else { ?>
                                        <div class="price-new"><?php echo $product['special']; ?></div>
                                        <div class="price-old"><?php echo $product['price']; ?></div>
                                    <? } ?>
                                </div>                                
                                <div class="cart">
                                    <a class="fa fa-shopping-cart" onclick="addToCart('<? echo $product['product_id']; ?>');" title="Add to Cart" data-hover="Add to cart"><span>Add to Cart</span></a>
                                </div>
                                <div class="wishlist">
                                    <a class="fa fa-heart" onclick="addToWishList('<? echo $product['product_id']; ?>');" title="Add to Wish List"><span>Add to Wish List</span></a>
                                </div>
                                <div class="compare">
                                    <a class="fa fa-retweet" onclick="addToCompare('<? echo $product['product_id']; ?>');" title="Add to Compare"><span>Add to Compare</span></a>
                                </div>
                            </div>
                        </div>                        
                    <? } ?>
                </div>
            </div>
        </div>
    </div>    
</div>
<? } ?>

<? if(false){ /* if(isset($merchants)){ */ ?>
<div class="col-xs-12 special-product">
    <div class="row">
        <div class="col-xs-12 title">
            <h1>Recommend New Merchants</h1>
        </div>
        <div class="col-xs-12">
            <div class="row">
                <div id="special-product3" class="col-xs-12 javascript-carousel">                        
                    <? foreach($merchants as $merchant){ ?>
                        <div class="javascript-carousel-item product-block">	
                            <div class="image">	    	
                                <a href="<? echo $merchant['href']; ?>"><img src="<? echo $merchant['thumb']; ?>" title="<? echo $merchant['store_name']; ?>" alt="<? echo $merchant['store_name']; ?>"></a>
                            </div>                            
                        </div>                        
                    <? } ?>
                </div>
            </div>
        </div>
    </div>    
</div>
<? } ?>

<?
    foreach($floor_list as $key => $pdata){
        ?><div class="product-floor-divider"></div><?
        require($pdata['template_path']);        
    }
?>

<div class="product-floor-divider"></div>

<div class="horizontal-banner col-xs-12 image">
    <a href="/mp/link?link_id=102">
        <img src="/image/data/banner/banner_starbucks_contest_980x260.gif" />
    </a>
</div>
	
<?php echo $footer; ?>

<script type="text/javascript">
    jQuery(function($){
        $('.product-floor-list img[src=""]').each(function(e){
            var image_class = $(this).closest('[image_class]').attr('image_class');
            if(typeof image_class === 'string'){
                image_class = image_class.split("_");                
                $(this).attr('src','/image/floor_template/default/blank_'+image_class[2]+'_'+image_class[3]+'.jpg');
            }
        });
    });
</script>

<script type="text/javascript">
    $('[data-rel="tooltip"]').tooltip({container:'body'});
</script>