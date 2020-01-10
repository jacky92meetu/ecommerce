<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?> 

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
	
<div id="content" class="merchant_content"><?php echo $content_top; ?>
    <?
        if(isset($pdata['store_image']) || isset($pdata['store_image_cover'])){            
            if(isset($pdata['store_image_cover'])){
                $img_class = "col-xs-12";                
                $image = $pdata['store_image_cover'];
                $desc = "";
                $class = "";
            }else{
                $img_class = "col-xs-3";                
                $image = $pdata['store_image'];
                $desc = $pdata['store_image_desc'];
                $class = "cover_desc";
            }
    ?>
    <div class="merchant_cover <? echo $class; ?>">
        <div class="row">
            <div class="<? echo $img_class; ?>">
                <img src="<? echo $image; ?>" />
            </div>
        <? if(strlen($desc)>0){ ?>
            <div class="col-xs-9">
                <h3><? echo $pdata['store_name']; ?></h3>
                <p><? echo $desc; ?></p>
            </div>
        <? } ?>
        </div>
    </div>
    <div class="hr"></div>
    <?
        }
    ?>
    <div class="row merchant_title">
        <div class="col-xs-12">
            <div class="subcategory-title pull-left"><?php echo $pdata['store_name']; ?></div>
            <div class="pull-right">
                <div class="dropdown merchant_filter_option">                    
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                      <? echo $data_header_selected['display_name']; ?>
                      <span class="fa fa-chevron-down"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">                    
                    <?  
                        foreach($data_header as $key => $value){                            
                    ?>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#" sort_name="<? echo $value['sort_name']; ?>" sort_order="<? echo $value['sort_order']; ?>"><? echo $value['display_name']; ?></a></li>
                      <li role="presentation" class="divider"></li>
                    <? } ?>                      
                    </ul>
                </div>
            </div>            
        </div>        
        <? if(isset($pdata['store_cover_desc']) && strlen($pdata['store_cover_desc'])>0){ ?>
        <div class="col-xs-12 pull-left">
            <p><? echo $pdata['store_cover_desc']; ?></p>
            <div class="hr"></div>
        </div>        
    <? } ?>
    </div>    
  
  <?php if ($products) { ?>  
  
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
  
   <div class="pagination">
       <div class="links"> 
           <?   
                if($data_list['total_page']>1){
                    echo ($data_list['pagination']['c']>1)?'<a href="#" page="1">|&lt;</a> ':'';
                    echo ($data_list['pagination']['c']>1)?'<a href="#" page="'.$data_list['pagination']['pp']['1'].'">&lt;</a> ':'';
                    foreach($data_list['pagination']['p'] as $value){
                        echo ($value>0)?'<a href="#" page="'.$value.'">'.$value.'</a> ':'';
                    }
                    echo ($data_list['pagination']['c']>0)?'<b>'.$data_list['pagination']['c'].'</b> ':'';
                    foreach($data_list['pagination']['n'] as $value){
                        echo ($value>0)?'<a href="#" page="'.$value.'">'.$value.'</a> ':'';
                    }
                    echo ($data_list['pagination']['c']<$data_list['total_page'])?'<a href="#" page="'.$data_list['pagination']['n']['1'].'">&gt;</a> ':'';
                    echo ($data_list['pagination']['c']<$data_list['total_page'])?'<a href="#" page="'.$data_list['total_page'].'">&gt;|</a> ':'';
                }
            ?>
       </div>
       <div class="results">Showing <? echo $data_list['from_rec']; ?> to <? echo $data_list['to_rec']; ?> of <? echo $data_list['row']; ?> (<? echo $data_list['total_page']; ?> Pages)</div>           
   </div>
   
   <div class="horizontal-banner col-xs-12 image">
        <img src="/image/data/banner/banner_bottom_advertise.jpg" />
    </div>
   
  <?php } ?>
  
  <?php if (!$categories && !$products) { ?>
  <div class="content">There are no products to list in this page.</div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button">Continue</a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
    
</section>
 
<?php echo $footer; ?>

<script type="text/javascript">
    function change_location(url){
        if(url.length>0){
            location = url;            
        }
    }    
    var $url_filter = "<? echo $data_list['filter']['route']."&filter=".urlencode(urlencode(serialize($data_list['filter']))); ?>";
    jQuery(function($) {
        $('[data-rel="tooltip"]').tooltip({container:'body'});
        
        $('.merchant_filter_option a').click(function(e){
            e.preventDefault();
            var $sort_name = $(this).attr('sort_name');
            var $sort_order = $(this).attr('sort_order');
            change_location($url_filter+"&filter_sort_name="+$sort_name+"&filter_sort_order="+$sort_order);
        });
        
        $('.pagination a[page]').click(function(e){
            e.preventDefault();
            var $value = $(this).attr('page');
            if($value.length>0){
                change_location($url_filter+"&filter_page="+$value);
            }
        });
    });
</script>