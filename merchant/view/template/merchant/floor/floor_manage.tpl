<? echo $header; ?>
<link rel="stylesheet" href="/merchant/view/css/datepicker.css" />
<link rel="stylesheet" href="/merchant/view/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="/merchant/view/css/dropzone.css" />
<link rel="stylesheet" href="/merchant/view/css/jquery.minicolors.css" />

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-info-circle bigger-110"></i>
                    <?
                    $title = "Create New";
                    if(isset($pdata['floor_id'])){
                    $title = "Edit Existing";
                    }
                    ?>
                    <? echo $title; ?> Floor
                </h4>
            </div>
            <div class="widget-body">                       
                <div class="widget-main no-padding">                            
                    <form class="form-horizontal validation-form" role="form" action="/merchant/system/floor_manage" method="POST">
                        <input type="hidden" name="floor_id" value="<? echo $pdata['floor_id']; ?>">
                        <input type="hidden" name="floor_value[template_image]" value="<? echo $pdata['floor_value']['template_image']; ?>">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Floor Name </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <input type="text" name="floor_name" class="form-control" placeholder="Floor name"  value="<? echo $pdata['floor_name']; ?>"/>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Sub Title </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <input type="text" name="floor_value[floor_subtitle]" class="form-control" placeholder="Sub title"  value="<? echo $pdata['floor_value']['floor_subtitle']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Template </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <select class="form-control" name="floor_value[floor_template]">
                                                    <? foreach($available_template as $key => $value){ ?>
                                                    <option value="<? echo $key; ?>" <? echo ($pdata['floor_value']['floor_template']==$key)?"selected":""; ?>><? echo $value; ?></option>
                                                    <? } ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="widget-box transparent">
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <div class="row template_container"></div>
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Active Date </label>
                                <div class="col-sm-9 control-value">
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
                                <label class="col-sm-3 control-label no-padding-right"> CSS Style </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <input type="text" name="floor_value[floor_style]" class="form-control" placeholder="Custom CSS Style"  value="<? echo $pdata['floor_value']['floor_style']; ?>"/>
                                    </div>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Sort Order </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <input type="text" name="sort_order" class="form-control" placeholder="sort order number"  value="<? echo $pdata['sort_order']; ?>"/>
                                    </div>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Status </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <select class="form-control" name="floor_status">
                                            <? foreach($available_status as $key => $value){ ?>
                                            <option value="<? echo $key; ?>" <? echo ($pdata['floor_status']==$key)?"selected":""; ?>><? echo $value; ?></option>
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

<? echo $footer; ?>

<!-- page specific plugin scripts -->

<script src="/merchant/view/js/jquery.validate.min.js"></script>
<script src="/merchant/view/js/bootstrap-datepicker.min.js"></script>
<script src="/merchant/view/js/jquery-ui.custom.min.js"></script>
<script src="/merchant/view/js/file_browser.js"></script>
<script src="/merchant/view/js/image_transform.js"></script>
<script src="/merchant/view/js/jquery.minicolors.min.js"></script>

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
                    floor_name: {
                        required: true
                    },
                    'floor_value[floor_subtitle]': {
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

<script type="text/javascript">
    var $template_image_list = <? echo $pdata['floor_value']['stringify_template_image']; ?> || {};    
    function load_template($template){
        widget_toggle($('.template_container'),'show');
        $.ajax({
            type: 'POST',
            url: '/merchant/system/ajaxloadtemplate?template='+$template,
            complete: function(xhr,status){
                widget_toggle($('.template_container'),'hide');
            },
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
                    $('.template_container').html(data.html).find('.image[image_id] > a').each(function(e){
                        $(this).click(function(click_event){
                            click_event.preventDefault();
                        });
                        var obj = $(this).children('img');                        
                        if(typeof $template_image_list[obj.closest('[image_id]').attr('image_id')] === 'object' && $template_image_list[obj.closest('[image_id]').attr('image_id')]!==null && typeof $template_image_list[obj.closest('[image_id]').attr('image_id')]['temp_image_url'] === 'string'){
                            obj.attr('src',$template_image_list[obj.closest('[image_id]').attr('image_id')]['temp_image_url']+"?"+ new Date().getTime());
                        }
                        obj.image_transform({
                            debug:1,
                            extra_fields:{'image_price':'Price','image_link':'Link'},
                            data_callback: function(){
                                return $template_image_list[obj.closest('[image_id]').attr('image_id')];
                            },
                            image_class:obj.closest('[image_class]').attr('image_class'),
                            url:'/merchant/system/ajaxloadtemplateimage',
                            transform_callback:function(data){
                                widget_toggle($('.template_container'),'show');
                                data['image_id'] = obj.closest('[image_id]').attr('image_id');
                                data['image_class'] = obj.closest('[image_id]').attr('image_class');                                
                                if(typeof data['image_url']!=='string' || data['image_url'].length==0){
                                    delete $template_image_list[obj.closest('[image_id]').attr('image_id').toString()];
                                }else{                                    
                                    $template_image_list[obj.closest('[image_id]').attr('image_id').toString()] = data;
                                }
                                $.ajax({
                                    type: 'POST',
                                    url: '/merchant/system/ajaxuploadtemplateimage?floor_id=<? echo $pdata['floor_id']; ?>',
                                    data: data,
                                    complete: function(xhr,status){
                                        widget_toggle($('.template_container'),'hide');
                                    },
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
                                            if(typeof $template_image_list[obj.closest('[image_id]').attr('image_id')] === 'object'){
                                                $template_image_list[obj.closest('[image_id]').attr('image_id')]['temp_image_url'] = data.img_url;
                                            }                                            
                                            obj.attr('src',data.img_url+"?"+ new Date().getTime());
                                            $('[name="floor_value[template_image]"]').val(JSON.stringify($template_image_list));
                                        }
                                    }
                                });
                            }
                        });
                    });
                }
            }
        });
    }
    
    jQuery(function($){
        $('[name="floor_value[template_image]"]').val(JSON.stringify($template_image_list));        
        $('[name="floor_value[floor_template]"]').change(function(){
            load_template($(this).val());
        });        
        load_template($('[name="floor_value[floor_template]"]').val());
    });
</script>

<script type="text/javascript">
    jQuery(function($){
        $('[name="floor_value[floor_style]"]').minicolors();
    });
</script>