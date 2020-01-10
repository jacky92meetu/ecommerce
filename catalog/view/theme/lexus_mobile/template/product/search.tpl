<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); 
	$themeConfig = $this->config->get('themecontrol');
	 
	 $categoryConfig = array( 
		'listing_products_columns' 		     => 0,
		'listing_products_columns_small' 	 => 2,
		'listing_products_columns_minismall' => 1,
		'cateogry_display_mode' 			 => 'grid',
		'category_pzoom'				     => 1,
	); 
	$categoryConfig  = array_merge($categoryConfig, $themeConfig );
	$DISPLAY_MODE 	 = $categoryConfig['cateogry_display_mode'];
	$MAX_ITEM_ROW 	 = $themeConfig['listing_products_columns']?$themeConfig['listing_products_columns']:4; 
	$MAX_ITEM_ROW_SMALL = $categoryConfig['listing_products_columns_small'] ;
	$MAX_ITEM_ROW_MINI  = $categoryConfig['listing_products_columns_minismall']; 
	$categoryPzoom 	    = $categoryConfig['category_pzoom'];  
?>

<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>
<div class="container">
<div class="row">

<?php if( $SPAN[0] ): ?>
	<aside class="col-lg-<?php echo $SPAN[0];?> col-md-<?php echo $SPAN[0];?> col-sm-12 col-xs-12">
		<?php echo $column_left; ?>
	</aside>
<?php endif; ?> 

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">  
	<div id="content">
		<?php echo $content_top; ?>  
		<div class="search">
			<h1><?php echo $heading_title; ?></h1>
			<h2><?php echo $text_critea; ?></h2>  
			<div class="content">
				<div class="pav-label">
					<div class="row">
						<div class="col-lg-6 col-sm-6 col-xs-12 sleft">		
							<div class="row">
								<div class="col-lg-2 col-sm-2 col-xs-12 control-label" for="search">
									<?php echo $entry_search; ?>
								</div>						
								<div class="col-lg-10 col-sm-10 col-xs-12">
									<?php if ($search) { ?>
									<input type="text" name="search" value="<?php echo $search; ?>" class="input-text form-control" />
									<?php } else { ?>
									<input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;"  class="input-text form-control" />
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-6 col-xs-12 sright">
							<div class="row">
								<div class="col-lg-6 col-sm-5 col-xs-12">
									<select name="category_id" class="form-control">
										<option value="0"><?php echo $text_category; ?></option>
										<?php foreach ($categories as $category_1) { ?>
										<?php if ($category_1['category_id'] == $category_id) { ?>
										<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
										<?php } ?>
										<?php foreach ($category_1['children'] as $category_2) { ?>
										<?php if ($category_2['category_id'] == $category_id) { ?>
										<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
										<?php } ?>
										<?php foreach ($category_2['children'] as $category_3) { ?>
										<?php if ($category_3['category_id'] == $category_id) { ?>
										<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
										<?php } ?>
										<?php } ?>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
								<div class="col-lg-6 col-sm-7 col-xs-12">
									<div class="checkbox">
										<label for="sub_category">
											<?php if ($sub_category) { ?>
											<input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
											<?php } else { ?>
											<input type="checkbox" name="sub_category" value="1" id="sub_category" />
											<?php } ?>
											<?php echo $text_sub_category; ?>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="pav-check-desc">
					<div class="checkbox">
						<label for="description">
							<?php if ($description) { ?>
							<input type="checkbox" name="description" value="1" id="description" checked="checked" />
							<?php } else { ?>
							<input type="checkbox" name="description" value="1" id="description" />
							<?php } ?>
							<?php echo $entry_description; ?>
						</label>
					</div>
				</div>
			</div>
  
			<div class="buttons">
				<div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
			</div>
  
			<h2><?php echo $text_search; ?></h2>
			
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
			<div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
			<div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
    
			<?php echo $content_bottom; ?>
		</div>
  
  
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}else{
		url += '&search_all=1';
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.products-block  .product-block').each(function(index, element) {
 
			 $(element).parent().addClass("col-fullwidth");
		});		
		
		$('.display').html('<span style="float: left; line-height: 33px; margin-right: 10px;"><?php echo $text_display; ?></span><a class="list active"><span class="glyphicon glyphicon-align-justify"></span><em><?php echo $text_list; ?></em></a><a class="grid"  onclick="display(\'grid\');"><span class="glyphicon glyphicon-th"></span><em><?php echo $text_grid; ?></em></a>');
	
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.products-block  .product-block').each(function(index, element) {
			 $(element).parent().removeClass("col-fullwidth");  
		});	
					
		$('.display').html('<span style="float: left; line-height: 33px; margin-right: 10px;"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"><span class="glyphicon glyphicon-align-justify"></span><em><?php echo $text_list; ?></em></a><a class="grid active"><span class="glyphicon glyphicon-th"></span><em><?php echo $text_grid; ?></em></a>');
	
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('<?php echo $DISPLAY_MODE;?>');
}
//-->
</script> 

<?php if( $categoryPzoom ) {  ?>
<script type="text/javascript">
<!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: false,
		onLoad:function(){
			$("#cboxNext").remove(0);
			$("#cboxPrenvious").remove(0);
			$("#cboxCurret").remove(0);
		}
	});	 
});
//-->
</script>
<?php } ?>

</section>
 
<?php if( $SPAN[2] ): ?>
<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12">	
	<?php echo $column_right; ?>
</aside>
<?php endif; ?>
</div></div>

<?php echo $footer; ?>

<script type="text/javascript">
    $('[data-rel="tooltip"]').tooltip({container:'body'});
</script>