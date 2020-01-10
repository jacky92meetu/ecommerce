<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?> 

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
	
<div id="content"><?php echo $content_top; ?>
        
    <div class="horizontal-banner col-xs-12 image">
        <a href="/index.php?route=product/product&product_id=150" target="_blank"><img src="/image/data/banner/banner_top_shake-Ntake.jpg" /></a>
    </div>
   
    <div class="subcategory-title"><?php echo $pdata['link_name']; ?></div>
  
  <?php if ($products) { ?>
  <div class="hr"></div>
  <div class="product-filter clearfix">
    <div class="sort"><span>Sort By: </span>
        <select size="1" class="form-filter table_sort_name">
            <option value=""> Default </option>
            <?
                foreach($data_header as $key => $value){
                    if(!isset($value['no_filter'])){
                        $selected = "";
                        if(isset($data_list['filter']['order']) && array_key_exists($key, $data_list['filter']['order'])!==FALSE){
                            $selected = 'selected="selected"';
                        }                                            
            ?>
            <option value="<? echo $key; ?>" <? echo $selected; ?>><? echo $value['display_name']; ?></option>
            <?      
                    }
                }
            ?>                                    
        </select>
        <select size="1" class="form-filter table_sort_order">
            <? 
                $option_list = array("asc"=>"Ascending","desc"=>"Descending");
                foreach($option_list as $key => $value){
                    $selected = "";
                    if(isset($data_list['filter']['order']) && array_search($key, $data_list['filter']['order'])!==FALSE){
                        $selected = 'selected="selected"';
                    }
            ?>
            <option value="<? echo $key; ?>" <? echo $selected; ?>><? echo $value; ?></option>
            <? } ?>                                    
        </select>      
    </div>    
    
    <div class="limit"><span>Show: </span>
        <select size="1" class="form-filter table_limit">
            <? 
                $option_list = array("10","25","50","100");
                foreach($option_list as $option){
                    $selected = "";
                    if(isset($data_list['filter']['limit']) && $data_list['filter']['limit']==$option){
                        $selected = 'selected="selected"';
                    }                                            
            ?>
            <option value="<? echo $option; ?>" <? echo $selected; ?>><? echo $option; ?></option>
            <? } ?>                                    
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
        
        if($('.table_sort_name :selected').val()!=""){
            $('.table_sort_order').show();
        }else{
            $('.table_sort_order').hide();
        }
        $('.table_sort_name, .table_sort_order').change(function(e){
            e.preventDefault();
            var $sort_name = $('.table_sort_name :selected').val();
            var $sort_order = "";
            if($sort_name.length>0){
                $sort_order = $('.table_sort_order :selected').val();
            }
            change_location($url_filter+"&filter_sort_name="+$sort_name+"&filter_sort_order="+$sort_order);
        });        
        
        $('select.table_limit').change(function(e){
            e.preventDefault();
            var $value = $(this).find(':selected').val();
            if($value.length>0){
                change_location($url_filter+"&filter_limit="+$value);
            }
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