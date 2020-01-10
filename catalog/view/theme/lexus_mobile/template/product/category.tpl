<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?> 

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
	
<div id="content"><?php echo $content_top; ?>
    
    <div>
        <section id="pav-slideshow" class="pav-slideshow">
                <div class="container">
                    <div class="row subcategory">

                            <div class="hidden-xs col-sm-3">
                                <div class="list-group">
                                    <a href="#" class="list-group-item title">SHOP BY CATEGORY</a>
                                    <? foreach($categories as $category){ ?>
                                        <a href="<? echo $category['href']; ?>" class="list-group-item"><? echo $category['name']; ?></a>
                                    <? } ?>
                                    <div class="hr"></div>                                    
                                    <?
                                    foreach($link_8 as $value){
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
                                    <div class="category-title col-xs-12">
                                        Recommend for <span><?php echo $heading_title; ?></span>
                                    </div>
                                </div>
                                <div class="row special-product">
                                    <div id="special-product2" class="col-xs-12 javascript-carousel">
                                        <? foreach ($products as $i => $product) { ?>                                            
                                            <div class="javascript-carousel-item product-block">
                                                <div class="image">	    	
                                                    <a href="<? echo $product['href']; ?>"><img src="<? echo $product['thumb']; ?>" title="<? echo $product['name']; ?>" alt="<? echo $product['name']; ?>"></a>                                
                                                </div>
                                                <div class="product-meta">
                                                    <div class="name" data-rel="tooltip" data-title="<? echo $product['full_name']; ?>"><a href="<? echo $product['href']; ?>"><? echo $product['name']; ?></a></div>
                                                    <div class="merchant">by <a href="<? echo $product['merchant_url']; ?>"><? echo $product['merchant_name']; ?></a></div>
                                                    <div class="description"><?php echo utf8_substr( strip_tags($product['description']),0,160);?>...</div>
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
                                        <?php } ?>                                        
                                    </div>
                                </div>                                
                            </div>

                    </div>
                </div>
        </section>
    </div>
    
    <div class="horizontal-banner col-xs-12 image">
        <a href="/index.php?route=product/product&product_id=150" target="_blank"><img src="/image/data/banner/banner_top_shake-Ntake.jpg" /></a>
    </div>
  <? /* ?> 
  <?php if ($categories) { ?>  
  <div class="subcategory-title"><?php echo $heading_title; ?> by Category</div>
  <div class="row category-list clearfix">
      <? foreach($categories as $category) { ?>
        <div class="col-xs-6 col-sm-3">
            <div class="image">
                <a href="<? echo $category['href']; ?>">
                    <div class="row">
                        <div class="col-xs-12">
                            <img src="<? echo $category['thumb']; ?>">
                        </div>
                        <div class="col-xs-12">
                            <div class="title-background"></div>
                            <div class="title"><? echo $category['name']; ?></div>
                        </div>
                    </div>
                </a>
            </div>            
        </div>
      <? } ?>
  </div>
  <?php } ?>  
  <? */ ?>
  
  <?php if ($products) { ?>
  <div class="hr"></div>
  <div class="product-filter clearfix">
    <div class="sort"><span><?php echo $text_sort; ?></span>
      <select onchange="location = this.value;" class="form-filter">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>    
    
    <div class="limit"><span><?php echo $text_limit; ?></span>
      <select onchange="location = this.value;" class="form-filter">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    
  </div>
  <div class="hr"></div>
  <div class="space20"></div>
  
<div class="product-grid"> <div class="products-block">
<div class="row">
    <? foreach ($products as $i => $product) { ?>
        <div class="col-xs-6 col-sm-3">
            <div class="product-block">	
                <div class="image">	    	
                    <a href="<? echo $product['href']; ?>"><img src="<? echo $product['thumb']; ?>" title="<? echo $product['name']; ?>" alt="<? echo $product['name']; ?>"></a>                                
                </div>
                <div class="product-meta">
                    <div class="name" data-rel="tooltip" data-title="<? echo $product['full_name']; ?>"><a href="<? echo $product['href']; ?>"><? echo $product['name']; ?></a></div>
                    <div class="merchant">by <a href="<? echo $product['merchant_url']; ?>"><? echo $product['merchant_name']; ?></a></div>
                    <div class="description"><?php echo utf8_substr( strip_tags($product['description']),0,160);?>...</div>
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
        </div>
    <?php } ?>
</div>
  </div>
  </div>
  
   <div class="pagination"><?php echo $pagination; ?></div>
   
   <div class="horizontal-banner col-xs-12 image">
        <img src="/image/data/banner/banner_bottom_advertise.jpg" />
    </div>
   
  <?php } ?>
  
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

</section>
 
<?php echo $footer; ?>

<script type="text/javascript">
    $('[data-rel="tooltip"]').tooltip({container:'body'});
</script>