<?php 
/******************************************************
 * @package Pav Category Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

$span = 12/$cols; 
$id = rand(1,9)+rand();	
$tabdefault = str_replace(' ', '', key($tabs).$id);
?>
<div class="box pav-product-tab producttabs">
	<?php if( !empty($module_description) ) { ?>
	<div class="module-desc">
		<?php echo $module_description;?>
	</div>
	<?php } ?>

	<div class="tab-nav">
		<?php $image = $this->model_tool_image->resize( $icon, 32,32 );?>

		<div class="category-name <?php echo $prefix_class;?>"><img src="<?php echo $image;?>"><?php echo $category_name;?></div>
		<?php if($flag == 0):?>
		<ul class="nav nav-tabs" id="producttabs<?php echo $id;?>">
			<?php $i = 0;?>
			<?php foreach( $tabs as $tab => $products ): if(empty($products)): continue; endif;  ?>
			<?php $i++;?>
			<?php if($i <= $limit_tabs):?>
			<?php $idtab = str_replace(' ', '', $tab.$id);?>
			<?php $active = ($idtab == $tabdefault)?'class="active"':'';?>
			<li <?php echo $active;?> >
				<a href="#tab-<?php echo str_replace(' ', '', $tab.$id);?>" data-toggle="tab" class="tab-link"><?php echo $tab;?></a>
			</li>
			<?php endif; ?>
			<?php endforeach; ?>
		</ul>
		<?php endif; ?>
	</div>	

	<div class="tab-content box-content">
		<?php $i = 0;?>
		<?php foreach( $tabs as $tab => $products ) {
			$i++;
			if($i <= $limit_tabs) {
			$idtab = str_replace(' ', '', $tab.$id);
			$active = ($idtab == $tabdefault)?'active':'';
			if( empty($products) ){ continue;}
			?>
			<div class="tab-pane box-products tabcarousel<?php echo $id; ?> slide <?php echo $active;?>" id="tab-<?php echo str_replace(' ', '', $tab.$id);?>">				
				<?php if($status_nav == 1) { ?>
				<?php if( count($products) > $itemsperpage ) { ?>
				<div class="carousel-controls">
					<a class="carousel-control left no-box" href="#tab-<?php echo str_replace(' ', '', $tab.$id);?>"   data-slide="prev">&lsaquo;</a>
					<a class="carousel-control right no-box" href="#tab-<?php echo str_replace(' ', '', $tab.$id);?>"  data-slide="next">&rsaquo;</a>
				</div>
				<?php } ?>
				<?php } ?>
				<div class="carousel-inner">					
					<?php 
					$pages = array_chunk( $products, $itemsperpage);
					//	echo '<pre>'.print_r( $pages, 1 ); die;
					?>	
					<?php foreach ($pages as  $k => $tproducts ) { ?>
					<div class="item <?php echo ($k==0)?'active':'';?> ">
						<div class="product-grid">
						<?php foreach( $tproducts as $i => $product ) { ?>
							<?php if( $i++%$cols == 0 ) { ?>
							  <div class="row-fluid box-product">
							<?php } ?>
								  <div class="span<?php echo $span;?> product-block">
									<div class="product-inner">
										<?php if ($product['thumb']) { ?>
										<div class="image">
											<?php if ($product['special']) { ?>
											<div class="product-label-special label">
												<span><?php echo $this->language->get( 'text_sale' ); ?></span>
											</div>
											<?php } ?>										
											<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
											<div class="group-action">
												<div class="btn-overlay cart">
													<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />									
												</div>
												<div class="btn-overlay wishlist">				
													<a class="pavicon-wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $this->language->get("button_wishlist"); ?></a>
												</div>
												<div class="btn-overlay compare">												
													<a class="pavicon-compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $this->language->get("button_compare"); ?></a>
												</div>
											</div>
										</div>
										<?php } ?>

										<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

										<!-- <p class="description">
											<?php // echo utf8_substr( strip_tags($product['description']),0,58);?>...
										</p> -->
										<?php if ($product['rating']) { ?>
										<div class="rating is-hover">
											<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
										</div>
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
										
									</div>
								</div>

								<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							</div>
							<?php } ?>
							<?php } //endforeach; ?>
						</div>
					</div>
						
					<?php } ?>					
					
				</div>  
			</div>
			<?php } // endif of limit_tab ?>
			<?php } // endforeach of tabs ?>	
		</div>
	</div>


	<script>
	$(function () {
		$('#producttabs<?php echo $id;?> a:first').tab('show');
	})
	$('.tabcarousel<?php echo $id;?>').carousel({interval:false,auto:false,pause:'hover'});
	</script>
