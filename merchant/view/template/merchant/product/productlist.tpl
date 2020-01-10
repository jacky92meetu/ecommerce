<? echo $header; ?>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box transparent">
            <div class="widget-header">
                <div class="pull-left"> 
                    <h4 class="widget-title">
                        <i class="ace-icon fa fa-info-circle bigger-110"></i>
                        <? echo $store['store_name']; ?>'s Product List
                    </h4>
                </div>                    
                <div class="pull-right">
                    <label class="pull-right inline">
                        <a id="btn-new-product" class="<? echo (sizeof($productlist)>=5)?'hide':''; ?> btn btn-bold ubib-green-btn" href="/merchant/product/categorygroup?merchant_id=<? echo $store['merchant_id']; ?>">
                            <i class="ace-icon fa fa-files-o"></i>
                            New Product
                        </a>
                    </label>
                </div>                    
            </div>

            <div class="widget-body">                       
                <div class="widget-main">
                    <div class="row product-list">
                        <?                        
                            foreach($data_list['data'] as $product){
                        ?>                            
                        <div class="col-xs-12" product_id="<? echo $product['product_id']; ?>">
                            <div class="widget-box main-widget-box">										
                                <div class="widget-body position-relative">
                                    <div class="widget-main">
                                        <div class="overlay <? echo ($product['status']=="1")?"hide":""; ?>"><table width="100%" height="100%"><tr><td align="center" valign="center"><button class="btn ace-icon fa fa-pause btn-play"></button></td></tr></table></div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-2 center">                                                                
                                                <img class="img-thumbnail" alt="<? echo $product['name']; ?>" src="<? echo $this->merchant->image_link($product['image']); ?>">
                                            </div>
                                            <div class="col-xs-12 col-sm-10">
                                                <a href="/product/product?product_id=<? echo $product['product_id']; ?>" target="_blank"><h2 class="product-name no-margin no-padding"><? echo $product['name']; ?></h2></a>                                                
                                                <h6><? echo $product['name']; ?></h6>
                                                Category: 
                                                <? 
                                                $temp = "";
                                                for($k=0; $k<sizeof($product['category_group']); $k++){ 
                                                $temp .= " ".$product['category_group'][$k]['name']." |";
                                                }
                                                echo rtrim($temp,"|");
                                                ?>
                                                <h6>Create Date: <? echo $product['date_added']; ?></h6>
                                            </div>                                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-toolbox">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="btn-toolbar no-margin no-padding no-border">
                                                <div class="btn-group">
                                                    <a href="/merchant/product/update?merchant_id=<? echo $store['merchant_id']; ?>&product_id=<? echo $product['product_id']; ?>" class="btn btn-sm btn-warning">
                                                        <i class="ace-icon fa fa-pencil icon-on-left bigger-125 line-height-125"></i>
                                                        Edit                                                                                                            
                                                    </a>
                                                    <button type="button" class="btn btn-sm btn-primary btn-pause <? echo ($product['status']=="1")?"":"hide"; ?>">
                                                        <i class="ace-icon fa fa-pause icon-on-left bigger-125 line-height-125"></i>
                                                        Pause                                                                                                            
                                                    </button>
                                                    <button type="button" class="btn btn-sm btn-success btn-play <? echo ($product['status']=="1")?"hide":""; ?>">
                                                        <i class="ace-icon fa fa-play icon-on-left bigger-125 line-height-125"></i>
                                                        Play                                                                                                            
                                                    </button>
                                                    <? /* ?>
                                                    <button type="button" class="btn btn-sm btn-danger btn-delete">
                                                        <i class="ace-icon fa fa-trash-o icon-on-left bigger-125 line-height-125"></i>
                                                        Delete                                                                  
                                                    </button>
                                                    <? */ ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 text-right">
                                            <ul class="list list-group list-inline no-margin no-padding bigger-125 line-height-150">
                                                <li class="">
                                                    <span class="key">Visits:</span>
                                                    <span class="list-group-item-success"><? echo $product['product_visit']; ?></span>
                                                </li>
                                                |
                                                <li class="">
                                                    <span class="key">Replies:</span>
                                                    <span class="list-group-item-success">0</span>
                                                </li>
                                                <!--
                                                |
                                                <li class="">
                                                    <span class="key">On Page:</span>
                                                    <span class="list-group-item-success">&gt; 10</span>                                                                
                                                </li>
                                                -->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <? } ?>
                    </div>
                    
                    <div class="hr"></div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="dataTables_info" id="sample-table-2_info">Showing <? echo $data_list['from_rec']; ?> to <? echo $data_list['to_rec']; ?> of <? echo $data_list['row']; ?> entries</div>
                        </div>
                        <div class="col-xs-6">
                            <div class="dataTables_paginate paging_bootstrap">
                                <ul class="pagination">                                        
                                <?
                                    echo ($data_list['pagination']['ppp']>0)?'<li class="prev"><a href="#" page="'.$data_list['pagination']['ppp'].'"><i class="fa fa-angle-double-left"></i></a></li>':'<li class="prev disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>';
                                    echo ($data_list['pagination']['pp']>0)?'<li class="prev"><a href="#" page="'.$data_list['pagination']['pp'].'"><i class="fa fa-angle-left"></i></a></li>':'<li class="prev disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>';
                                    foreach($data_list['pagination']['p'] as $value){
                                        echo ($value>0)?'<li><a href="#" page="'.$value.'">'.$value.'</a></li>':'';
                                    }
                                    echo ($data_list['pagination']['c']>0)?'<li class="active"><a href="#">'.$data_list['pagination']['c'].'</a></li>':'';
                                    foreach($data_list['pagination']['n'] as $value){
                                        echo ($value>0)?'<li><a href="#" page="'.$value.'">'.$value.'</a></li>':'';
                                    }
                                    echo ($data_list['pagination']['nn']>0)?'<li class="next"><a href="#" page="'.$data_list['pagination']['nn'].'"><i class="fa fa-angle-right"></i></a></li>':'<li class="next disabled"><a href="#"><i class="fa fa-angle-right"></i></a></li>';
                                    echo ($data_list['pagination']['nnn']>0)?'<li class="next"><a href="#" page="'.$data_list['pagination']['nnn'].'"><i class="fa fa-angle-double-right"></i></a></li>':'<li class="next disabled"><a href="#"><i class="fa fa-angle-double-right"></i></a></li>';                                                
                                ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>                
        </div>
    </div>
</div>

<? echo $footer; ?>

<!-- page specific plugin scripts -->                
<script src="/merchant/view/js/jquery.dataTables.min.js"></script>
<script src="/merchant/view/js/jquery.dataTables.bootstrap.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
                        $('[data-rel=tooltip]').tooltip();
        $('[data-rel=popover]').popover({html:true});
<? /* ?>        
        $('.product-list div[product_id] .btn-delete').click(function() {
            var $parent = $(this).closest('.product-list div[product_id]');
            var $product_id = $parent.attr('product_id');
            var $product_name = $parent.find('.product-name').html();
            bootbox.confirm("Are you confirm to delete " + $product_name + "?", function(result) {
                if (result) {
                    product_delete($product_id, $parent);
                }
            });
        });
<? */ ?>        
        $('.product-list div[product_id] .btn-pause,.product-list div[product_id] .btn-play').click(function() {            
            var $parent = $(this).closest('.product-list div[product_id]');
            var $product_id = $parent.attr('product_id');            
            product_pause($product_id, $parent);            
        });

        var max_product = parseInt("<? echo $max_product; ?>");
        max_product = (isNaN(max_product) ? 5 : max_product);
        var max_5 = $('<div id="info-max-5" class="alert alert-info"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><strong>Info!</strong>Maximum ' + max_product + ' products are allow in pre-launch mode!<br></div>');
        function check_max() {
            if ($('.product-list > div[product_id]').length >= max_product) {
                $('#btn-new-product').addClass('hide');
                max_5.clone().insertAfter($('.page-header'));
            } else {
                $('#btn-new-product').removeClass('hide');
                $('#info-max-5').remove();
            }
        }
        check_max();
<? /* ?>
        function product_delete(id, obj) {
            widget_toggle($(obj).find('.widget-box'),'show');
            $.ajax({
                type: 'POST',
                url: '/merchant/product/ajaxproductremove?merchant_id=<? echo $store['merchant_id']; ?>',
                data: {'merchant_id':<? echo $store['merchant_id']; ?>,'product_id':id},
                complete:function(){
                    widget_toggle($(obj).find('.widget-box'),'hide');
                },
                success: function(data, status, xhr) {
                    widget_toggle($(obj).find('.widget-box'),'hide');
                    try {
                        data = JSON.parse(data);
                    } catch (e) {
                        data = {};
                        if (typeof bootbox === 'object') {
                            bootbox.alert("Server Error!");
                        } else {
                            alert("Submission Error!");
                        }
                    }
                    if (typeof data.status === 'string' && data.status == 'success') {
                        if (typeof obj == 'object') {
                            $(obj).remove();
                        }
                        check_max();
                    }
                }
            });
        }
<? */ ?>
        function product_pause(id, obj) {
            widget_toggle($(obj).find('.widget-box'),'show');
            $.ajax({
                type: 'POST',
                url: '/merchant/product/ajaxproductpause?merchant_id=<? echo $store['merchant_id']; ?>',
                data: {'merchant_id':<? echo $store['merchant_id']; ?>,'product_id':id},
                complete:function(){
                    widget_toggle($(obj).find('.widget-box'),'hide');
                },
                success: function(data, status, xhr) {
                    widget_toggle($(obj).find('.widget-box'),'hide');
                    try {
                        data = JSON.parse(data);
                    } catch (e) {
                        data = {};
                        if (typeof bootbox === 'object') {
                            bootbox.alert("Server Error!");
                        } else {
                            alert("Submission Error!");
                        }
                    }
                    if (typeof data.status === 'string' && data.status == 'success') {
                        if (data.result === '1') {
                            $(obj).find('.btn-pause').removeClass('hide');
                            $(obj).find('.btn-play').addClass('hide');
                            $(obj).find('.overlay').addClass('hide');
                        }else{
                            $(obj).find('.btn-play').removeClass('hide');
                            $(obj).find('.overlay').removeClass('hide');
                            $(obj).find('.btn-pause').addClass('hide');
                        }
                    }
                }
            });
        }

    })
</script>

<script type="text/javascript">
    function change_location(url){
        if(url.length>0){
            location = url;
            widget_toggle($('.dataTable').closest('.widget-box'));
        }
    }
    var $url_filter = "<? echo $this->merchant->link($data_list['filter']['route'], array("filter"=> urlencode(serialize($data_list['filter'])))); ?>";
    jQuery(function($) {
        $('.pagination a[page]').click(function(e){
            e.preventDefault();
            var $value = $(this).attr('page');
            if($value.length>0){
                change_location($url_filter+"&filter_page="+$value);
            }
        });
    });    
</script>