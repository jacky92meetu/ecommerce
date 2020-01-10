<? echo $header; ?>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box transparent">										
                <div class="widget-header widget-header-small">
                        <h4 class="widget-title smaller">
                                <span class="col-sm-9"> 
                                    <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                    Product List
                                </span>
                                <span class="col-sm-3">
                                        <label class="pull-right inline">
                                            <a href="/merchant/product/create" class="btn btn-white btn-info btn-bold">
                                                <i class="ace-icon fa fa-files-o"></i>
                                                New Product
                                            </a>
                                        </label>
                                </span>
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main no-padding">
                            <div class="space-10"></div>
                            <? $len = 200;
                                $size = (sizeof($productlist)>3)?3:sizeof($productlist);
                                for($i=0; $i<$size; $i++){
                                $productlist[$i]['image'] = $this->merchant->image_link($productlist[$i]['image']);
                                $description = html_entity_decode($productlist[$i]['description'], ENT_QUOTES, 'UTF-8');                                
                                if(utf8_strlen($description)>$len){
                                    $pos = utf8_strrpos(utf8_substr($description,0,$len), " ");
                                    $description = utf8_substr($description,0,$pos)."<strong> ...</strong>";
                                }
                            ?>
                            <div class="row product-list" product_id="<? echo $productlist[$i]['product_id']; ?>">
                            <div class="col-xs-12 col-sm-12">
                                    <div class="widget-box main-widget-box">										
                                            <div class="widget-body position-relative">
                                                
                                                <div class="widget-box-overlay product-pause hidden"><table width="100%" height="100%" border="0"><tr><td align="center" valign="center"><div class="bigger-300 bg-primary width-20">PAUSE</div></td></tr></table></div>
                                                
                                                    <div class="widget-main">                                                        
                                                        <div class="row">                                                            
                                                            <div class="col-xs-12 col-sm-2 center">                                                                
                                                                <img class="img-thumbnail" alt="<? echo $productlist[$i]['name']; ?>" src="<? echo $productlist[$i]['image']; ?>">
                                                            </div>
                                                            <div class="col-xs-12 col-sm-6">
                                                                <h2 class="product-name"><? echo $productlist[$i]['name']; ?></h2>
                                                                <h6><? echo $description; ?></h6>
                                                                Category: 
                                                                <? 
                                                                    $temp = "";
                                                                    for($k=0; $k<sizeof($productlist[$i]['category_group']); $k++){ 
                                                                        $temp .= " ".$productlist[$i]['category_group'][$k]['name']." |";
                                                                    }
                                                                    echo rtrim($temp,"|");
                                                                ?>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-4">
                                                                <div class="widget-box promotion  transparent">
                                                                        <div class="widget-header widget-header-small lighter widget-header-flat">
                                                                                <h4 class="widget-title smaller">
                                                                                    <i class="ace-icon fa fa-bullhorn bigger-110"></i>
                                                                                    Promote your ads
                                                                                </h4>
                                                                        </div>
                                                                        <div class="widget-body">
                                                                                <div class="widget-main no-padding">
                                                                                    <div class="checkbox">
                                                                                            <label>
                                                                                                    <input type="checkbox" value="<? echo $productlist[$i]['product_id']; ?>_gallery" price="59.99" class="ace">
                                                                                                    <span class="lbl"> 
                                                                                                        Homepage Gallery RM 59.99 for 7 days
                                                                                                        <a href="#" data-rel="tooltip" title="Homepage Gallery is a section on the homepage where your Ads can be displayed for several days.">[?]</a>
                                                                                                    </span>
                                                                                            </label>
                                                                                    </div>
                                                                                    <div class="checkbox">
                                                                                            <label>
                                                                                                    <input type="checkbox" value="<? echo $productlist[$i]['product_id']; ?>_top" price="24.99" class="ace">
                                                                                                    <span class="lbl"> 
                                                                                                        Top Ad RM 24.99 for 7 days
                                                                                                        <a href="#" data-rel="tooltip" title="Top Ads are appear in a section at the top of a category's page for several days.">[?]</a>
                                                                                                    </span>                                                                                                    
                                                                                            </label>
                                                                                    </div>
                                                                                    <div class="checkbox">
                                                                                            <label>
                                                                                                    <input type="checkbox" value="<? echo $productlist[$i]['product_id']; ?>_urgent" price="17.99" class="ace">
                                                                                                    <span class="lbl"> 
                                                                                                        Urgent RM 17.99 for 7 days
                                                                                                        <a href="#" data-rel="tooltip" title="This lets buyers find sellers that want to sell their item quickly and may be willing to accept a lower than usual asking price. The urgent icon is available for purchase for Ads listed any categories.">[?]</a>
                                                                                                    </span>                                                                                                    
                                                                                            </label>
                                                                                    </div>
                                                                                    <div class="checkbox">
                                                                                            <label>
                                                                                                    <input type="checkbox" value="<? echo $productlist[$i]['product_id']; ?>_highlight" price="6.99" class="ace">
                                                                                                    <span class="lbl"> 
                                                                                                        Highlight RM 6.99 for 7 days
                                                                                                        <a href="#" data-rel="tooltip" title="Highlighted Ads have greater visibility and therefore receive more visits and replies than other Ads.">[?]</a>
                                                                                                    </span>                                                                                                    
                                                                                            </label>
                                                                                    </div>
                                                                                    <div class="checkbox">
                                                                                            <label>
                                                                                                    <input type="checkbox" value="<? echo $productlist[$i]['product_id']; ?>_bump" price="5.99" class="ace">
                                                                                                    <span class="lbl"> 
                                                                                                        Bump Up RM 5.99
                                                                                                        <a href="#" data-rel="tooltip" title="This feature moves the Ad from its current position in the listings back up to the top of the listings on the first page, just below any Top Ads.">[?]</a>
                                                                                                    </span>                                                                                                    
                                                                                            </label>
                                                                                    </div>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="widget-toolbox">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6">
                                                        <div class="btn-toolbar no-margin no-padding no-border">
                                                            <div class="btn-group">
                                                                <a href="/merchant/product/update?product_id=<? echo $productlist[$i]['product_id']; ?>" class="btn btn-sm btn-warning">
                                                                    <i class="ace-icon fa fa-pencil icon-on-left bigger-125 line-height-125"></i>
                                                                    Edit                                                                                                            
                                                                </a>
                                                                <!--
                                                                <button type="button" class="btn btn-sm btn-primary">
                                                                    <i class="ace-icon fa fa-pause icon-on-left bigger-125 line-height-125"></i>
                                                                    Pause                                                                                                            
                                                                </button>                                                                
                                                                <button type="button" class="btn btn-sm btn-success">
                                                                    <i class="ace-icon fa fa-play icon-on-left bigger-125 line-height-125"></i>
                                                                    Play                                                                                                            
                                                                </button>
                                                                -->
                                                                <button type="button" class="btn btn-sm btn-danger btn-delete">
                                                                    <i class="ace-icon fa fa-trash-o icon-on-left bigger-125 line-height-125"></i>
                                                                    Delete                                                                  
                                                                </button>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 text-right">
                                                        <ul class="list list-group list-inline no-margin no-padding bigger-125 line-height-150">
                                                            <li class="">
                                                                <span class="key">Visits:</span>
                                                                <span class="list-group-item-success">0</span>
                                                            </li>
                                                            |
                                                            <li class="">
                                                                <span class="key">Replies:</span>
                                                                <span class="list-group-item-success">0</span>
                                                            </li>
                                                            |
                                                            <li class="">
                                                                <span class="key">On Page:</span>
                                                                <span class="list-group-item-success">&gt; 10</span>                                                                
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                            </div>                                                                        
                            </div>
                            <div class="space-10"></div>
                            <? } ?>
                            <!--
                            <div class="hr"></div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="dataTables_info" id="sample-table-2_info">Showing 1 to 10 of 23 entries</div>                                                                               
                                </div>
                                <div class="col-xs-6">
                                    <div class="dataTables_paginate paging_bootstrap">
                                        <ul class="pagination">                                                                                
                                            <li class="prev disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                            <li class="active"><a href="#">1</a></li><li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li class="next"><a href="#"><i class="fa fa-angle-right"></i></a></li>                                                                                
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            -->
                        </div>
                </div>                
        </div>
    </div>
</div>

<div id="bottom_navbar" class="navbar navbar-default navbar-fixed-bottom" style="background: #ff9999; display:none;">
        <div class="navbar-container container">
            <div class="row">
                <div class="col-xs-12 text-right">                    
                    <span id="price" class="bigger-200 line-height-150">Total(1): RM 300</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button id="btn_checkout" type="button" class="btn btn-sm btn-danger bigger-150 line-height-150 pull-right">
                            <i class="ace-icon fa fa-dollar icon-on-left"></i>
                            Proceed to payment
                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                        </button>
                </div>                
            </div>
            <!--
                <div class="navbar-header floatRight">RM 250</div>                
                <div class="navbar-buttons navbar-header floatRight" >
                    <ul class="nav ace-nav">                        
                        <li class="red">
                                <a href="#">
                                        <i class="ace-icon fa fa-dollar"></i>
                                        Checkout
                                </a>
                        </li>
                    </ul>
                </div>                
            -->
        </div>
</div>
                                                        
<? echo $footer; ?>

<!-- page specific plugin scripts -->                
		<script src="/merchant/view/js/jquery.dataTables.min.js"></script>
		<script src="/merchant/view/js/jquery.dataTables.bootstrap.js"></script>

<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
                                $('.promotion input:checkbox[price]').click(function(){                                    
                                    var amount = 0;
                                    var item = 0;
                                    $('.promotion input:checkbox[price]:checked').each(function(){
                                        item += 1;
                                        amount += ($(this).attr('price'))*1;
                                    });
                                    var navbar = $('#bottom_navbar');
                                    if(item>0){                                        
                                        navbar.find('span#price').html("Total("+item+"): RM "+amount.toFixed(2));
                                        navbar.show();
                                    }else{
                                        navbar.find('span#price').html();
                                        navbar.hide();
                                    }
                                });
                                
                                $('[data-rel=tooltip]').tooltip();
				$('[data-rel=popover]').popover({html:true});
                                
                                $('.product-list[product_id] .btn-delete').click(function(){
                                    var $parent = $(this).closest('.product-list[product_id]');
                                    var $product_id = $parent.attr('product_id');
                                    var $product_name = $parent.find('.product-name').html();
                                    bootbox.confirm("Are you confirm to delete "+$product_name+"?",function(result){
                                        if(result){
                                            product_delete($product_id,$parent);
                                        }
                                    });
                                });
                                
                                function product_delete(id,obj){
                                    if(typeof obj == 'object'){
                                        $(obj).find('.widget-box.main-widget-box').widget_box('reload');
                                    }                                    
                                    $.ajax({
                                        type: 'POST',
                                        url: '/merchant/product/ajaxproductremove',
                                        data: {'product_id':id},
                                        success: function(data,status,xhr){
                                            try{
                                                data = JSON.parse(data);
                                            }catch(e){
                                                data = {};
                                                if(typeof bootbox === 'object'){                                                        
                                                    bootbox.alert("Server Error!");
                                                }else{
                                                    alert("Submission Error!");
                                                }
                                            }
                                            if(typeof data.status === 'string' && data.status=='success'){
                                                if(typeof obj == 'object'){
                                                    $(obj).remove();
                                                }                                                
                                            }
                                        }
                                    });
                                }
			
			})
		</script>