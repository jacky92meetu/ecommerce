<?php 
	$cols = 6;
	$span = 12/$cols; 
?>
<div class="box box-product featured highlight">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-product">
			  <?php foreach ($products as $i => $product) { $i=$i+1; ?>
				<?php if( $i%$cols == 1 && $cols > 1 ) { ?>
			<div class="row">
				<?php } ?> 
			  <div class="col-xs-6 col-lg-<?php echo $span;?> col-sm-<?php echo $small;?> col-xs-<?php echo $mini;?>" ><div class="product-block">
				<?php if ($product['thumb']) { ?>
				<div class="image">
				  <?php if( $product['special'] ) {   ?>
					<span class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?></span>
					<?php } ?>
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>

				</div>
				<?php } ?>
				<div class="product-meta">
					<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>

					<?php if( isset($product['description']) ) { ?>
					<div class="description"><?php echo utf8_substr( strip_tags($product['description']),0,150);?>...</div>
					<?php } ?>
					<?php if ($product['price']) { ?>
					<div class="price">
					  <?php if (!$product['special']) { ?>
					  <?php echo $product['price']; ?>
					  <?php } else { ?>
					  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
					  <?php } ?>
					</div>
					<?php } ?>
					<?php if ($product['rating']) { ?>
					<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
					</div>
					<?php } ?>
					<div class="cart">
						<a onclick="addToCart('<?php echo $product['product_id']; ?>');" data-hover="Add to cart"><span><?php echo $button_cart; ?></span></a>
				  	</div>
					<div class="wishlist">
					  <a class="fa fa-heart" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" ><span><?php echo $this->language->get("button_wishlist"); ?></span></a>
					</div>
					<div class="compare">
					  <a class="fa fa-retweet" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" ><span><?php echo $this->language->get("button_compare"); ?></span></a>
					</div>
			  </div>
			</div>
		</div>  
			<?php if( ($i%$cols == 0 || $i==count($products) ) && $cols > 1 ) { ?>
			</div>	 
			<?php } ?>
		
		  <?php } ?>

    
  </div>
   </div>
</div>