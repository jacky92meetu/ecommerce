<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?> 

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
	
<div id="content"><?php echo $content_top; ?>
        
    <div class="horizontal-banner col-xs-12 image">
        <a href="/index.php?route=product/product&product_id=150" target="_blank"><img src="/image/data/banner/banner_top_shake-Ntake.jpg" /></a>
    </div>
   
    <div class="subcategory-title">New Recommend Store</div>
  
    <div class="row">
        <?
            foreach($data_list['data'] as $store){
        ?>
        
        <div class="col-xs-12 col-sm-6">
            <div class="merchant-container small-container">            
                <div class="content">
                    <div class="merchant-profile">
                        <div class="merchant-image">
                            <a href="<? echo $store['merchant_url']; ?>">
                                <img class="img-responsive" src="<? echo $store['thumb']; ?>">
                            </a>
                        </div>
                        <div class="merchant-detail">
                            <div class="merchant-name"><a href="<? echo $store['merchant_url']; ?>"><? echo $store['store_name']; ?></a></div>
                            <div class="detail-list">
                                <div class="detail-row">
                                    <div class="detail-name">Address: </div>
                                    <div class="detail-value"><? echo $store['address']; ?></div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-name">Contact No.: </div>
                                    <div class="detail-value"><? echo $store['comp_tel']; ?></div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-name">Website: </div>
                                    <div class="detail-value"><? echo $store['comp_website']; ?></div>
                                </div>
                            </div>                        
                        </div>
                    </div>
                    <div class="merchant-products">
                        <div class="col-xs-12">
                            <div class="row">
                                <div id="merchant-special-product" class="col-xs-12 javascript-carousel fixed-3">
                                    <? foreach($store['product_list'] as $product){ ?>
                                        <div class="javascript-carousel-item product-block">	
                                            <div class="image img-thumbnail">
                                                <a href="<? echo $product['href']; ?>"><img src="<? echo $product['thumb']; ?>" title="<? echo $product['name']; ?>" alt="<? echo $product['name']; ?>"></a>                            
                                            </div>                                        
                                        </div>
                                    <? } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>            
            </div>
        </div>
        
        <? } ?>
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
       
        $('.pagination a[page]').click(function(e){
            e.preventDefault();
            var $value = $(this).attr('page');
            if($value.length>0){
                change_location($url_filter+"&filter_page="+$value);
            }
        });
    });
</script>