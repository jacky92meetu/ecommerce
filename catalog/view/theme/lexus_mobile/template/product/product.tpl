<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" );

  $themeConfig = $this->config->get('themecontrol');
  $productConfig = array(
      'product_enablezoom'         => 1,
      'product_zoommode'           => 'basic',
      'product_zoomeasing'         => 1,
      'product_zoomlensshape'      => "round",
      'product_zoomlenssize'       => "150",
      'product_zoomgallery'        => 0,
      'enable_product_customtab'   => 0,
      'product_customtab_name'     => '',
      'product_customtab_content'  => '',
        
  );
  $languageID = $this->config->get('config_language_id');
  $productConfig = array_merge( $productConfig, $themeConfig ); 
  
  $listConfig = array( 
    
    'category_pzoom' => 0
  ); 

  $listConfig = array_merge( $listConfig, $themeConfig ); 
  $categoryPzoom = $listConfig['category_pzoom'];  

?>
<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>  

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
<div id="content"><?php echo $content_top; ?>
  
    
 
  <div class="product-info">
      <div class="row">
        <div class="col-xs-12">
            <div class="product-title"><?php echo $heading_title; ?></div>
            <? if(isset($merchant_detail)){ ?>
            <div class="product-by">by <a href="<? echo $merchant_detail['merchant_url']; ?>"><? echo $merchant_detail['name']; ?></a></div>
            <? } ?>
        </div>
      </div>
      
	<div class="row">
	
    <div class="col-xs-12 col-sm-7 image-container">        
		<?php if ($thumb || $images) { ?>    
        <div>
            <div class="tips visible-xs">Tips: Touch the image to zoom.</div>
            <div class="image">
                <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"  data-zoom-image="<?php echo $zoom_image; ?>" />
            </div>
            <div class="tips visible-xs">Tips: Touch the image to zoom.</div>
            <div class="row image-additional" id="image-additional">
            <?php
            if($images) {
                $eimages = array(0=>array( 'popup'=>$popup,'thumb'=>$thumb,'zoom_image'=>$zoom_image)); 
                $images = array_merge( $eimages, $images );            
                foreach ($images as  $image) { ?>
                    <div class="col-xs-2 col-sm-2">
                        <a href="#" title="<?php echo $heading_title; ?>" class="colorbox" data-zoom-image="<?php echo $image['zoom_image']; ?>" data-image="<?php echo $image['popup']; ?>">
                          <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                        </a>
                    </div>
                <? } ?>
            <? } ?>
            </div>
        </div>
		<?php } ?>
        <div class="tabs-group">
            <div id="tabs" class="htabs clearfix"><a href="#tab-description"><?php echo $tab_description; ?></a>
                  <?php if ($attribute_groups) { ?>
                  <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
                  <?php } ?>
                  <?php if ($review_status) { ?>
                  <a href="#tab-review"><?php echo $tab_review; ?></a>
                  <?php } ?>
                  <?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_name'][$languageID]) ) { ?>
                   <a href="#tab-customtab"><?php echo $productConfig['product_customtab_name'][$languageID]; ?></a>
             <?php } ?>
            </div>
            <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div id="tab-attribute" class="tab-content">
                  <table class="attribute">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <thead>
                          <tr>
                            <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                          </tr>
                    </thead>
                    <tbody>
                          <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                          <tr>
                            <td><?php echo $attribute['name']; ?></td>
                            <td><?php echo $attribute['text']; ?></td>
                          </tr>
                          <?php } ?>
                    </tbody>
                    <?php } ?>
                  </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
              <div id="tab-review" class="tab-content">
                  <div id="review"></div>
                  <h2 id="review-title"><?php echo $text_write; ?></h2>
                  <div class="form-review">
                      <div class="option"><label><?php echo $entry_name; ?></label>
                      <input class="form-control" type="text" name="name" value="" />
                      </div>
                      <div class="option">
                      <label><?php echo $entry_review; ?></label>
                      <textarea class="form-control" name="text" cols="40" rows="8"></textarea>
                      <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
                      </div>

                      <div class="option">
                      <label><?php echo $entry_rating; ?></label> <span><?php echo $entry_bad; ?></span>&nbsp;
                      <input type="radio" name="rating" value="1" />
                      &nbsp;
                      <input type="radio" name="rating" value="2" />
                      &nbsp;
                      <input type="radio" name="rating" value="3" />
                      &nbsp;
                      <input type="radio" name="rating" value="4" />
                      &nbsp;
                      <input type="radio" name="rating" value="5" />
                      &nbsp;<span><?php echo $entry_good; ?></span><br />
                      </div>
                      <div class=" option form-inline">
                      <label><?php echo $entry_captcha; ?></label> 
                        <span class="form-group"><img src="index.php?route=product/product/captcha" alt="" id="captcha" /></span>
                      <span class="form-group"><input class="form-control" type="text" name="captcha" value="" /></span>
                      </div>
                        <div><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
                  </div>
              </div>
            <?php } ?>		  
                  <?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_content'][$languageID]) ) { ?>
                   <div id="tab-customtab" class="tab-content custom-tab">
                    <div class="inner">
                          <?php echo html_entity_decode( $productConfig['product_customtab_content'][$languageID], ENT_QUOTES, 'UTF-8'); ?>
                    </div></div>
             <?php } ?> 
        </div>
    </div>    
    <div class="col-xs-12 col-sm-5">
        <div class="price-container">
            <div class="price">
                <?php if (!$special) { ?>
                <?php echo $price; ?>
                <?php } else { ?>          
                <div class="price-new"><?php echo $special; ?></div>
                <div class="price-old"><?php echo $price; ?></div> 
                <?php } ?>          
            </div>
            <div class="quantity-field">
                <span class="divider">X</span>
                <select name="quantity">
                    <? $quantity = ($quantity>0 && $quantity<20)?$quantity:20;
                        for($i=1; $i<=$quantity; $i++){ 
                    ?>
                    <option value="<? echo $i; ?>"><? echo $i; ?></option>
                    <? } ?>                    
                </select>
            </div>
        </div>
      
        <div class="description">        
          <span><?php echo $text_stock; ?></span> <?php echo $stock; ?>
        </div>

        <div class="product-extra">
            <?php if ($options) { ?>
            <div class="options">
              <h2><?php echo $text_option; ?></h2>
              <?php foreach ($options as $option) { ?>
              
				<?php /* if (strtolower($option['name']) == 'color') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option color_options">
						<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<label><?php echo $option['name']; ?>: <span class="color_value_label"></span></label>
						<div class="color_container">
						<?php foreach ($option['option_value'] as $option_value) { ?>
							<div class="color_choice" option_value="<?php echo $option_value['name']; ?>" option_value_id="<?php echo $option_value['product_option_value_id']; ?>">
								<div class="color_value" style="background-color:<?php echo $option_value['name']; ?>"></div>                                                                
								<?php if ($option_value['price']) { ?>
									<div class="color_price">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</div>
								<?php } ?>
							</div>
						<?php } ?>							
						</div>						
					</div>
				<? 
                                    }else{ 
                                    */
                                    if(true){
                                ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<label><?php echo $option['name']; ?>:</label>
						<select class="form-control" name="option[<?php echo $option['product_option_id']; ?>]">
						  <option value=""><?php echo $text_select; ?></option>
						  <?php foreach ($option['option_value'] as $option_value) { ?>
						  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
						  <?php if ($option_value['price']) { ?>
						  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
						  <?php } ?>
						  </option>
						  <?php } ?>
						</select>
					</div>
				<? } ?>
              
              <?php } ?>
            </div>
            <?php } ?>
            <div>
                <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                <span class="cart">
                    <div  id="button-cart" class="fa fa-shopping-cart button2"><span class="span-text"><?php echo $button_cart; ?></span></div>
                    <!--<div  id="button-buynow" class="button2"><span class="span-text">Buy Now</span></div>-->
                </span>          
                <span class="wishlist">
                  <a class="fa fa-heart" onclick="addToWishList('<?php echo $product_id; ?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_wishlist; ?>"><span><?php echo $button_wishlist; ?></span></a></span>
            </div>
            <div class="urp_btn">
                <a href="/mp/link/spage?page=ubibrewardpoints"><div id="button-urp">Earn UBIB Reward Points: <strong><?php echo $reward; ?></strong> <i>points</i><img src="/image/data/ico_question.png"></div></a>                
            </div>
        </div>
      
        <div class="share clearfix"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> 
        </div>
        <?/*
        <div class="small-container">
            <div class="title">SHARE TO EARN MONEY</div>
            <div class="content">
                <span class="link-title">LINK: </span><a class="link-url">http://www.ubib.my</a>
            </div>            
        </div>
        */?>
        <? if(isset($merchant_detail)){ ?>
        <div class="merchant-container small-container">
            <div class="title"><a href="<? echo $merchant_detail['merchant_url']; ?>"><span class="fa fa-info-circle"> Store Information</span></a></div>
            <div class="content">
                <div class="merchant-profile">
                    <div class="merchant-image">
                        <a href="<? echo $merchant_detail['merchant_url']; ?>">
                            <img class="img-responsive" src="<? echo $merchant_detail['thumb']; ?>">
                        </a>
                    </div>
                    <div class="merchant-detail">
                        <div class="merchant-name"><a href="<? echo $merchant_detail['merchant_url']; ?>"><? echo $merchant_detail['name']; ?></a>
						<? if($merchant_detail['package']!=0){ ?>
							<span class="merchant-verified">(<span>Verified Store <img src="/image/data/icons/ico_verifiedstore.png" /></span>)</span>
						<? }else{ ?>
							<span class="merchant-verified">(<span>Non Verified Store</span>)</span>
						<? } ?>
						</div>
                        <div class="detail-list">
                            <div class="detail-row">
                                <div class="detail-name">Address: </div>
                                <div class="detail-value"><? echo $merchant_detail['address']; ?></div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-name">Contact No.: </div>
                                <div class="detail-value"><? echo $merchant_detail['contact_no']; ?></div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-name">Website: </div>
                                <div class="detail-value"><? echo $merchant_detail['website']; ?></div>
                            </div>
                        </div>                        
                    </div>
                </div>
                <div class="merchant-products">
                    <div class="col-xs-12">
                        <div class="row">
                            <div id="merchant-special-product" class="col-xs-12 javascript-carousel fixed-3">
                                <? foreach($merchant_products as $merchant_product){ ?>
                                    <div class="javascript-carousel-item product-block">	
                                        <div class="image img-thumbnail">
                                            <a href="<? echo $merchant_product['href']; ?>"><img src="<? echo $merchant_product['thumb']; ?>" title="<? echo $merchant_product['name']; ?>" alt="<? echo $merchant_product['name']; ?>"></a>                            
                                        </div>                                        
                                    </div>
                                <? } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div class="space-12"></div>
        <div class="merchant-container small-container">
            <div class="title"><a href="<? echo $merchant_detail['merchant_url']; ?>"><span class="fa fa-question-circle"> Ask Store</span></a></div>
            <div class="content">
                <form class="form-horizontal skip-auto-focus" role="form" novalidate="novalidate" onsubmit="return false;">                    
                    <input type="hidden" name="selected_product_id" value="<?php echo $product_id; ?>" />
                    <fieldset>                                            
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Email </label>
                            <div class="col-sm-9 control-value">
                                <div class="clearfix">
                                    <input type="text" class="form-control" name="email"  placeholder="Please enter your email here" value="<? echo $this->customer->getEmail(); ?>"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Question </label>
                            <div class="col-sm-9 control-value">
                                <div class="clearfix">
                                    <textarea class="form-control" name="question" style="height:100px;" placeholder="Please enter your question here"></textarea>
                                </div>
                            </div>
                        </div>
                    </fieldset>

                    <div class="clearfix">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info ask_store_btn" type="button">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Submit
                                </button>
                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Reset
                                </button>
                            </div>
                    </div> 
                </form>
            </div>            
        </div>
        <? } ?>
  
  <?php if ($tags) { ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  

    </div>
            
	</div>
  </div>
   
<?php if ($products) { ?>  
  <div class="product-related">
   <div class="box-heading"><span>Other things you might ubib (<?php echo count($products); ?>)</span></div>
    <div id="related-product" class="javascript-carousel">
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
<?php } ?>
  
  
  <?php echo $content_bottom; ?></div>
<? /* ?>
<script type="text/javascript" src="/catalog/view/javascript/jquery/elevatezoom/elevatezoom-min.js"></script>
<script type="text/javascript">
 $(document).ready(function () {
    $("#image").elevateZoom({zoomType: "lens", containLensZoom: true, gallery:'image-additional', cursor: 'pointer', galleryActiveClass: "active", cursor:"none"});     
});
</script>
<? */ ?>
<script type="text/javascript">
    jQuery(function($){
        $('.image-additional a[data-image]').click(function(e){
            e.preventDefault();
            $('#image').attr({'data-zoom-image':$(this).attr('data-zoom-image'),'src':$(this).attr('data-image')});
        });
    });
</script>

<? if($merchant_detail['package']==0){ ?>
<script type="text/javascript">    
$('#button-cart').bind('click', function() {    
    bootbox.alert("<div style='font-size:18px;'>This is non-verified store, therefore you are unable to purchase this product.</div>");
});
</script>
<? }else{ ?>
 <script type="text/javascript"><!--
   
$('#button-cart').bind('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
    dataType: 'json',
    success: function(json) {
      $('.success, .warning, .attention, information, .error').remove();
      
      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
          }
        }
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
      } 
      
      if (json['success']) {
        $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
        $('.success').fadeIn('slow');
        
        refresh_cart(true);
      } 
    }
  });
});
//--></script>
<? } ?>

<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
  $('#review').fadeOut('slow');
    
  $('#review').load(this.href);
  
  $('#review').fadeIn('slow');
  
  return false;
});     

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
    beforeSend: function() {
      $('.success, .warning').remove();
      $('#button-review').attr('disabled', true);
      $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
    },
    complete: function() {
      $('#button-review').attr('disabled', false);
      $('.attention').remove();
    },
    success: function(data) {
      if (data['error']) {
        $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
      }
      
      if (data['success']) {
        $('#review-title').after('<div class="success">' + data['success'] + '</div>');
                
        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').attr('checked', '');
        $('input[name=\'captcha\']').val('');
      }
    }
  });
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript">
$(function(){
    $('.color_choice').click(function(){
        $('.color_choice').removeClass('active');
        $(this).addClass('active');
        $(this).closest('.color_options').find('.color_value_label').html($(this).attr('option_value'));
        $(this).closest('.color_options').find('input:hidden').val($(this).attr('option_value_id'));
    });
});
</script>

</section> 

<?php echo $footer; ?>

<script type="text/javascript">
    $('[data-rel="tooltip"]').tooltip({container:'body'});
</script>

<script type="text/javascript">
jQuery(function($){
    $('.ask_store_btn').click(function(e){
        var obj = $(this);
        e.preventDefault();
        ubib_ajax(obj,"/module/merchant/ask_question",obj.closest('form').serialize(),function(){obj.closest('form').find('[type="reset"]').click();bootbox.alert("Question submitted! Please check your PM box for the merchant reply.");},"We are sorry, please submit your question again later.");
    });
});
</script>