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
                    <? echo $title; ?> Page Link
                </h4>
            </div>
            <div class="widget-body">                       
                <div class="widget-main no-padding">                            
                    <form class="form-horizontal validation-form" role="form" action="/merchant/system/link_manage?link_type=<? echo $pdata['link_type']; ?>" method="POST">                                        
                        <input type="hidden" name="link_id" value="<? echo $pdata['link_id']; ?>">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Name </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <input type="text" name="link_name" class="form-control" placeholder="Link name"  value="<? echo $pdata['link_name']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Page Content </label>
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">                                                            
                                        <textarea name="link_value[content]" class="form-control ckeditor" placeholder="Page Content" style="height: 100px;"><? echo $pdata['link_value']['content']; ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Page Filter </label>
                                <div class="col-sm-9">
                                    <div class="row product_filter">                                        
                                        <div class="col-xs-12 col-sm-6 col-lg-4">
                                            <div class="input-group">
                                                <span class="filter_name input-group-addon">Floor Id</span>
                                                <input class="filter_value filter_value2" type="text" name="link_value[display_option][floor_id]" value="<? echo $pdata['link_value']['display_option']['floor_id']; ?>"/>
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
                                <label class="col-sm-3 control-label no-padding-right"> Link CSS Style </label>
                                <div class="col-sm-9 control-value">
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
                                <div class="col-sm-9 control-value">
                                    <div class="clearfix">
                                        <input type="text" name="sort_order" class="form-control" placeholder="Link sort order number"  value="<? echo $pdata['sort_order']; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Link Position </label>
                                <div class="col-sm-9 control-value">
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
                                <div class="col-sm-9 control-value">
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

<? echo $footer; ?>

<!-- page specific plugin scripts -->

<script src="/merchant/view/js/jquery.validate.min.js"></script>
<script src="/merchant/view/js/bootstrap-datepicker.min.js"></script>
<script src="/merchant/view/js/ckeditor/ckeditor.js"></script>

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
                    widget_toggle($('.widget-box'));
                    for (name in CKEDITOR.instances) {
                        $(form).find('textarea[name=' + name + ']').text(CKEDITOR.instances[name].getData());
                    }
                    ubib_ajax_submit(form);
                    return false;
                },
                invalidHandler: function(form) {
                }
            });
        });
    });
</script>