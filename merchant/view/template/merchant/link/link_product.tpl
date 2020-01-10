<? echo $header; ?>
<link rel="stylesheet" href="/merchant/view/css/datepicker.css" />

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-info-circle bigger-110"></i>
                    <?
                    $title = "Create New";
                    if(isset($pdata['link_id'])){
                    $title = "Edit Existing";
                    }
                    ?>
                    <? echo $title; ?> Product Link
                </h4>
            </div>
            <div class="widget-body">                       
                <div class="widget-main no-padding">                            
                    <form class="form-horizontal validation-form" role="form" action="/merchant/system/link_manage?link_type=<? echo $pdata['link_type']; ?>" method="POST">                                        
                        <input type="hidden" name="link_id" value="<? echo $pdata['link_id']; ?>">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Name </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <input type="text" name="link_name" class="form-control" placeholder="Link name"  value="<? echo $pdata['link_name']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Product Filter </label>
                                <div class="col-sm-9">                                    
                                    <div class="row product_filter">
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon">Category</span>
                                                <input class="filter_value filter_value2 disabled category_modal_btn" type="text" READONLY />
                                                <input type="hidden" class="category_id_value" name="link_value[filter_option][filter_option_value][category_id]" value="<? echo $pdata['link_value']['filter_option']['filter_option_value']['category_id']; ?>">
                                            </div>
                                        </div>                                        
                                        <?
                                            $filter_option_available = array('product_id'=>array('name'=>'Product Id'),'quantity'=>array('name'=>'Quantity'),'price'=>array('name'=>'Normal Price'),'date_added'=>array('name'=>'Date Added'),'viewed'=>array('name'=>'Viewed'),'discount_price'=>array('name'=>'Discount Price'),'date_start'=>array('name'=>'Start Date'),'date_end'=>array('name'=>'End Date'),'merchant_id'=>array('name'=>'Merchant Id'));
                                            foreach($filter_option_available as $option_key => $option_value){
                                                if(isset($option_value['status_value'])){
                                        ?>
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon"><? echo $option_value['name']; ?></span>                                                
                                                <select class="filter_value filter_value2" name="link_value[filter_option][filter_option_value][<? echo $option_key; ?>]">                                                    
                                                    <?                                                         
                                                        foreach($option_value['status_value'] as $key => $value){
                                                    ?>                                                    
                                                    <option value="<? echo $key; ?>" <? echo (isset($pdata['link_value']['filter_option']['filter_option_value'][$option_key]) && strcasecmp($pdata['link_value']['filter_option']['filter_option_value'][$option_key], $key)==0)?"selected":""; ?>><? echo $value; ?></option>
                                                    <? } ?>
                                                </select>                                                
                                            </div>
                                        </div>
                                        <?
                                                }else{
                                        ?>
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon"><? echo $option_value['name']; ?></span>
                                                <select class="filter_op" name="link_value[filter_option][filter_option_op][<? echo $option_key; ?>]">
                                                    <? 
                                                        $select_array = array("",">=",">","=","<","<=");
                                                        foreach($select_array as $value){
                                                    ?>
                                                    <option value="<? echo $value; ?>" <? echo (isset($pdata['link_value']['filter_option']['filter_option_op'][$option_key]) && strcasecmp($pdata['link_value']['filter_option']['filter_option_op'][$option_key],$value)==0)?"selected":""; ?>><? echo $value; ?></option>
                                                    <? } ?>
                                                </select>                                                
                                                <input class="filter_value" type="text" name="link_value[filter_option][filter_option_value][<? echo $option_key; ?>]" value="<? echo $pdata['link_value']['filter_option']['filter_option_value'][$option_key]; ?>"/>
                                            </div>
                                        </div>
                                        <?
                                                }                                        
                                            }
                                        ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Product IDs </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <input type="text" name="link_value[selected_product]" class="form-control" placeholder="Sample: 19,26,33,45"  value="<? echo $pdata['link_value']['selected_product']; ?>"/>
                                    </div>
                                    <div><i>Included product by key in product id</i></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Extra Filter </label>
                                <div class="col-sm-9">                                    
                                    <div class="row product_filter">                                        
                                        <?
                                            $filter_option_available = array('max_records'=>array('name'=>'Max. Records'),'campaign_id'=>array('name'=>'Campaign Id'));
                                            foreach($filter_option_available as $option_key => $option_value){                                                
                                        ?>
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon"><? echo $option_value['name']; ?></span>                                                
                                                <input class="filter_value filter_value2" type="text" name="link_value[extra_filter][<? echo $option_key; ?>]" value="<? echo $pdata['link_value']['extra_filter'][$option_key]; ?>"/>
                                            </div>
                                        </div>
                                        <?                                        
                                            }
                                        ?>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Product Order </label>
                                <div class="col-sm-9">
                                    <select class="filter_value filter_value2" name="link_value[filter_sort][filter_sort_name]">
                                    <?
                                        $filter_sort_available = array(''=>'','product_id'=>'Product Id','quantity'=>'Quantity','normal_price'=>'Normal Price','status'=>'Product Status','date_added'=>'Date Added','viewed'=>'Viewed','discount_price'=>'Discount Price','date_start'=>'Start Date','date_end'=>'End Date','merchant_id'=>'Merchant Id');
                                        foreach($filter_sort_available as $key => $value){
                                    ?>                                        
                                        <option value="<? echo $key; ?>" <? echo (isset($pdata['link_value']['filter_sort']['filter_sort_name']) && $pdata['link_value']['filter_sort']['filter_sort_name']==$key)?"selected":""; ?>><? echo $value; ?></option>
                                    <? } ?>                                    
                                    </select>
                                    <select class="filter_value filter_value2" name="link_value[filter_sort][filter_sort_order]">
                                    <?
                                        $filter_sort_available = array('asc'=>'Ascending','desc'=>'Descending');
                                        foreach($filter_sort_available as $key => $value){
                                    ?>
                                    <option value="<? echo $key; ?>" <? echo (isset($pdata['link_value']['filter_sort']['filter_sort_order']) && $pdata['link_value']['filter_sort']['filter_sort_order']==$key)?"selected":""; ?>><? echo $value; ?></option>
                                    <? } ?>
                                    </select>                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Page Filter </label>
                                <div class="col-sm-9">
                                    <div class="row product_filter">
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon">Visible in</span>
                                                <input class="filter_value filter_value2 disabled category_modal_btn" type="text" READONLY />
                                                <input type="hidden" class="category_id_value" name="link_value[display_option][visible_in]" value="<? echo $pdata['link_value']['display_option']['visible_in']; ?>">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon">Floor Id</span>
                                                <input class="filter_value filter_value2" type="text" name="link_value[display_option][floor_id]" value="<? echo $pdata['link_value']['display_option']['floor_id']; ?>"/>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <?
                                        $display_option_available = array('show_with_cat'=>'Search product with [category_id] provided in CATEGORY PAGE','show_with_merchant'=>'Search product with [merchant_id] provided in MERCHANT PAGE');
                                        if(isset($display_option_available)){
                                            foreach($display_option_available as $key => $value){
                                                $selected = "";                                                
                                                if(isset($pdata['link_value']['display_option']) && isset($pdata['link_value']['display_option'][$key])){
                                                    $selected = "checked";                                                    
                                                }
                                                    
                                    ?>
                                    <div>
                                        <label>
                                            <input name="link_value[display_option][<? echo $key; ?>]" type="checkbox" class="ace" <? echo $selected; ?>>
                                            <span class="lbl"> <? echo $value; ?></span>
                                        </label>
                                    </div>
                                    <?
                                            }
                                        }
                                    ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Active Date </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <div class="date-picker input-daterange input-group" data-date-format="dd-mm-yyyy">
                                            <input type="text" class="form-control" name="start_date" value="<? echo $pdata['start_date']; ?>" />
                                            <span class="input-group-addon">
                                                <i class="fa fa-exchange"></i>
                                            </span>
                                            <input type="text" class="form-control" name="end_date" value="<? echo $pdata['end_date']; ?>" />
                                        </div>
                                    </div>
                                </div>
                            </div>											
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link CSS Style </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <input type="text" name="link_value[link_style]" class="form-control" placeholder="Custom CSS Style"  value="<? echo $pdata['link_value']['link_style']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Class </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <input type="text" name="link_value[link_class]" class="form-control" placeholder="Link Class"  value="<? echo $pdata['link_value']['link_class']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Sort Order </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <input type="text" name="sort_order" class="form-control" placeholder="Link sort order number"  value="<? echo $pdata['sort_order']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Position </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <select class="form-control" name="link_position">
                                            <? foreach($available_position as $key => $value){ ?>                                            
                                            <option value="<? echo $key; ?>" <? echo ($pdata['link_position']==$key)?"selected":""; ?>><? echo $value['position_name']; ?></option>
                                            <? } ?>
                                        </select>                                                                                                             
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Status </label>
                                <div class="col-sm-9">
                                    <div class="clearfix">
                                        <select class="form-control" name="link_status">
                                            <? foreach($available_status as $key => $value){ ?>
                                            <option value="<? echo $key; ?>" <? echo ($pdata['link_status']==$key)?"selected":""; ?>><? echo $value; ?></option>
                                            <? } ?>
                                        </select>                                                                                                             
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info">
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
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Change Category</h4>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-xs-12">

                <div id="main-category" class="widget-box transparent">
                    <div class="widget-body">
                        <div class="widget-main no-padding">
                            <div class="row">
                                <? 
                                    $col = floor(12 / sizeof($category_list));                                                                                        
                                    for($i=0; $i<sizeof($category_list); $i++){
                                        $hide = "hide";                                                                                            
                                        if($i==0){
                                            $hide = "";
                                        }                                                                                            
                                ?>
                                <div class="categorygroup col-xs-12 col-sm-<? echo $col; ?> <? echo $hide; ?>">
                                    <div class="widget-box">
                                            <div class="widget-header widget-header-flat widget-header-small">
                                                    <? if($i==0){ ?>
                                                    <h4 class="widget-title text-success">Select a group</h4>
                                                    <? }else{ ?>
                                                    <h4 class="widget-title">                                                        
                                                        <div class="text-success pull-left"></div>
                                                    </h4>                                                                                                        
                                                    <? } ?>
                                                    <div class="pull-right hidden-sm hidden-md hidden-lg widget-toolbar hide">
                                                        <a class="category_close" href="javascript:void(0);">
                                                            <i class="ace-icon fa fa-times"></i>
                                                        </a>
                                                    </div>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">                                                    
                                                    <? foreach($category_list[$i] as $key => $value){ ?>
                                                    <div parent_id="<? echo $key; ?>" class="item-list list-group">
                                                        <? if($key=="0"){ ?>
                                                            <a href="javascript:void(0);" category_id="" class="list-group-item">All Categories</a>                                                    
                                                        <? } ?>
                                                        <? foreach($value as $value2){ ?>
                                                        <a href="javascript:void(0);" category_id="<? echo $value2['category_id']; ?>" class="list-group-item"><? echo $value2['name']; ?></a>
                                                        <? } ?>
                                                    </div>
                                                    <? } ?>
                                                </div>
                                            </div>
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
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>

<? echo $footer; ?>

<!-- page specific plugin scripts -->

<script src="/merchant/view/js/jquery.validate.min.js"></script>
<script src="/merchant/view/js/bootstrap-datepicker.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function($) {
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })

        $('form.validation-form').each(function() {
            $(this).validate({
                ignore: '',
                errorElement: 'div',
                errorClass: 'help-block',
                focusInvalid: true,
                rules: {
                    link_name: {
                        required: true
                    },
                    'link_value[link_url]': {
                        required: true
                    }
                },
                highlight: function(e) {
                    $(e).closest('.form-group').addClass('has-error');
                },
                success: function(e) {
                    $(e).closest('.form-group').removeClass('has-error');
                },
                errorPlacement: function(error, element) {
                    if (element.is(':checkbox') || element.is(':radio')) {
                        var controls = element.closest('div[class*="col-"]');
                        if (controls.find(':checkbox,:radio').length > 1)
                            controls.append(error);
                        else
                            error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                    }
                    else if (element.is('.select2')) {
                        error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                    }
                    else if (element.is('.chosen-select')) {
                        error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                    }
                    else
                        error.insertAfter(element.parent());
                },
                submitHandler: function(form) {
                    ubib_ajax_submit(form);
                    return false;
                },
                invalidHandler: function(form) {
                }
            });
        });
    });
</script>

<script>
    var selected_category_id;
    
    jQuery(function($){
        $('.category_modal_btn').click(function(){
            selected_category_id = $(this).parent().find('.category_id_value');
            select_category(selected_category_id.val(),$(this).parent().find('.category_id_value'));
            $('#myModal').modal();
        });
        $('.categorygroup a').click(function(){            
            select_category($(this),selected_category_id);
        });
        $('.category_id_value').each(function(){
            selected_category_id = $(this);
            select_category($(this).val(),$(this));
        });
    });
    
    function check_category(id,referer_obj){
        var obj = id;
        if(typeof obj !== 'object'){
            obj = $('.categorygroup a[category_id="'+id+'"]');
            if(obj.length==0){
                $('.categorygroup').first().removeClass('hide').find('.widget-main').removeClass('hidden-xs');                
            }
        }        
        var cur_group = obj.closest('.categorygroup');
        var parent_id = obj.closest('div.list-group').attr('parent_id');
        var next_group = cur_group.next('.categorygroup').first();
        
        obj.closest('div.list-group').removeClass('hide');
        cur_group.removeClass('hide');
        cur_group.find('a').removeClass('active');
        obj.addClass('active');
        
        if(next_group.find('div[parent_id="'+obj.attr('category_id')+'"].list-group').length>0){            
            cur_group.find('.widget-toolbar').removeClass('hide');
            cur_group.find('.widget-main').addClass('hidden-xs');
            next_group.find('.text-success').html(obj.html());
            next_group.find('.list-group').addClass('hide');
            next_group.find('div[parent_id="'+obj.attr('category_id')+'"].list-group').removeClass('hide');
            next_group.removeClass('hide');
            if(!next_group.find('a.active').length){
                next_group.find('.widget-main').removeClass('hidden-xs');
            }
        }        
        $(referer_obj).val($('.categorygroup a.active').last().attr('category_id'));
        $(referer_obj).parent().find('.category_modal_btn').val($('.categorygroup a.active').last().text());
        if($('.categorygroup a[category_id="'+parent_id+'"]').length){
            check_category(parent_id,referer_obj);
        }
    }
    
    function select_category(id,referer_obj){
        if(typeof id === 'object' && id.hasClass('category_close')){            
            id = id.closest('.categorygroup').prev('.categorygroup').first().find('a.active').attr('category_id');
            display = true;
        }
        
        $('.categorygroup').addClass('hide');
        $('.categorygroup a').removeClass('active');        
        $('.categorygroup .widget-toolbar').addClass('hide');
        
        check_category(id,referer_obj);
    }
</script>