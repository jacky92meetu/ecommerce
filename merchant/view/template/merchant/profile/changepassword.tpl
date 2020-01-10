<? echo $header; ?>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
                <div class="widget-header">
                        <h4 class="widget-title">
                                <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                Change Password
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main no-padding">                            
                                    <form class="form-horizontal validation-form" role="form" action="/merchant/profile/changepassword?merchant_id=<? echo $pdata['merchant_id']; ?>" method="POST">
                                        <input type="hidden" name="form_action" value="changepassword">
                                        <fieldset>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Old Password </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="old_password" class="form-control" placeholder="Your Old Password"  value="<? echo $pdata['old_password']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> New Password </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" id="new_password" name="new_password" class="form-control" placeholder="Your New Password"  value="<? echo $pdata['new_password']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Confirm Password </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="new_password2" class="form-control" placeholder="Confirm New Password"  value="<? echo $pdata['new_password2']; ?>"/>
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
                                                    old_password: {
                                                            required: true
                                                    },
                                                    new_password: {
                                                            required: true,
                                                            minlength: 6
                                                    },
                                                    new_password2: {
                                                            required: true,							
                                                            equalTo: "#new_password"
                                                    }
                                            },

                                            messages: {
                                                    old_password: {
                                                            required: "Please provide your old password"
                                                    },
                                                    new_password: {
                                                            required: "Please specify a password.",
                                                            minlength: "Please specify a minimum 6 characters password."
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