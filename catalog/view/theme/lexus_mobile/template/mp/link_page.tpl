<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?> 

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
	
<div id="content" class="link_content"><?php echo $content_top; ?>
        
    <div class="horizontal-banner col-xs-12 image">
        <a href="/index.php?route=product/product&product_id=150" target="_blank"><img src="/image/data/banner/banner_top_shake-Ntake.jpg" /></a>
    </div>
   
    <div class="subcategory-title"><?php echo $pdata['link_name']; ?></div>
    <div>
        <p><?php echo html_entity_decode($pdata['link_value']['content']); ?></p>
    </div>

  <?php echo $content_bottom; ?>
</div>

</section>
 
<?php echo $footer; ?>