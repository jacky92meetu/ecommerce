<? echo $header; ?>
<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
                <div class="widget-header widget-header-small">
                        <h4 class="widget-title smaller">
                                <span class="col-sm-12"> 
                                    <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                    Contact Helpdesk
                                </span>                                
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main no-padding">                            
                                    <form class="form-horizontal validation-form" action="/merchant/contact" role="form">
                                        <input type="hidden" name="form_action" value="contact">
                                        <fieldset>                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Title </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <select class="form-control" name="title">
                                                                <option value='I want to know more'>I want to know more</option>
                                                                <option value='I need some help'>I need some help</option>
                                                                <option value='Payment'>Payment</option>
                                                                <option value='Dashboard Technical'>Dashboard Technical</option>
                                                                <option value='Products'>Products</option>
                                                                <option value='Customers'>Customers</option>
                                                                <option value='Others'>Others</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Comment </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <textarea class="form-control" name="comments" style="height:100px;" placeholder="Please enter your comment here"></textarea>
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
                                
		<!-- inline scripts related to this page -->

<script type="text/javascript">
			jQuery(function($) {                                
                                $('form.validation-form').each(function(){                                    
                                    $(this).validate({
                                            ignore:'',
                                            errorElement: 'div',
                                            errorClass: 'help-block',
                                            focusInvalid: true,
                                            rules: {                                                    
                                                    comments: {
                                                            required: true
                                                    }
                                            },
                                            
                                            highlight: function (e) {
                                                    $(e).closest('.form-group').addClass('has-error');
                                            },

                                            success: function (e) {
                                                    $(e).closest('.form-group').removeClass('has-error');                                                    
                                            },

                                            errorPlacement: function (error, element) {                                                    
                                                    if(element.is(':checkbox') || element.is(':radio')) {
                                                            var controls = element.closest('div[class*="col-"]');
                                                            if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                                                            else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                                                    }
                                                    else if(element.is('.select2')) {
                                                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                                                    }
                                                    else if(element.is('.chosen-select')) {
                                                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                                                    }
                                                    else error.insertAfter(element.parent());
                                            },

                                            submitHandler: function (form) {
                                                ubib_ajax_submit(form);
                                                return false;                                                
                                            },
                                            invalidHandler: function (form) {
                                            }
                                    });    
                                });
			});                        
		</script>
