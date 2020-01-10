<? echo $header; ?>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
                <div class="widget-header">
                        <h4 class="widget-title">
                            <i class="ace-icon fa fa-info-circle bigger-110"></i>
                            Edit Profile
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main no-padding">                            
                            <form class="form-horizontal validation-form" role="form" action="/merchant/profile/editprofile?merchant_id=<? echo $pdata['merchant_id']; ?>" method="POST">
                                        <input type="hidden" name="form_action" value="editprofile">
                                        <input type="hidden" name="merchant_id" value="<? echo $pdata['merchant_id']; ?>">
                                        <input type="hidden" name="store_id" value="<? echo $pdata['store_id']; ?>">
                                        <fieldset>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Email Address </label>
                                                    <div class="col-sm-9 control-value">
                                                            <input type="text" class="form-control" readonly="true" disabled="disabled" value="<? echo $pdata['email']; ?>">
                                                    </div>
                                            </div>

                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Full Name </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="name" class="form-control" placeholder="Fullname"  value="<? echo $pdata['name']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Birthday </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group">
                                                                <input class="form-control date-picker" name="birthday" type="text" placeholder="Your Birthday" data-date-format="dd-mm-yyyy" value="<? echo $pdata['birthday']; ?>">
                                                                <span class="input-group-addon">
                                                                        <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Gender </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <div class="control-group"> 
                                                                    <label for="gender_male" class="radio radio-inline">
                                                                            <input name="gender" id="gender_male" type="radio" value="1" class="ace" <? echo ($pdata['gender']==1)?"checked":""; ?> />
                                                                            <span class="lbl"> Male</span>
                                                                    </label>

                                                                    <label for="gender_female" class="radio radio-inline">
                                                                            <input name="gender" id="gender_female" type="radio" value="2" class="ace" <? echo ($pdata['gender']==2)?"checked":""; ?> />
                                                                            <span class="lbl"> Female</span>
                                                                    </label>                                                                    
                                                            </div>
                                                            
                                                        </div>                                                        
                                                    </div>                                                    
                                            </div>                                            
                                            
                                            <div class="hr"></div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Store URL </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group">
                                                                <span class="input-group-addon">http://</span>
                                                                <input class="form-control" type="text" name="store_short_url" placeholder="Your Store URL" value="<? echo $pdata['store_short_url']; ?>"/>
                                                                <span class="input-group-addon">.ubib.my</span>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Store Name </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="store_name" class="form-control" placeholder="Online Store Name"  value="<? echo $pdata['store_name']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Name </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="comp_name" class="form-control" placeholder="Company Name"  value="<? echo $pdata['comp_name']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Reg. No. </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="comp_reg_no" class="form-control" placeholder="Company Register No."  value="<? echo $pdata['comp_reg_no']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Website </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group">
                                                                <span class="input-group-addon">http://</span>
                                                                <input class="form-control" type="text" name="comp_website" placeholder="Company Website URL"  value="<? echo $pdata['comp_website']; ?>"/>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Facebook Link </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon">http://</span>
                                                                <input class="form-control" type="text" name="comp_facebook_link" placeholder="Company Facebook Link"  value="<? echo $pdata['comp_facebook_link']; ?>"/>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Twitter Link </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group">
                                                                <span class="input-group-addon">http://</span>
                                                                <input class="form-control" type="text" name="comp_twitter_link" placeholder="Company Twitter Link"  value="<? echo $pdata['comp_twitter_link']; ?>"/>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Tel. No. </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="comp_tel" class="form-control" placeholder="Company Tel. No."  value="<? echo $pdata['comp_tel']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Fax No. </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="comp_fax" class="form-control" placeholder="Company Tel. No."  value="<? echo $pdata['comp_fax']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Email </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="comp_email" class="form-control" placeholder="Company Email"  value="<? echo $pdata['comp_email']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Address </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <textarea name="comp_address" class="form-control" placeholder="Company Address" style="height: 100px;"><? echo $pdata['comp_address']; ?></textarea>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Company Description </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <textarea name="comp_desc" class="form-control ckeditor" placeholder="Company Description" style="height: 100px;"><? echo $pdata['comp_desc']; ?></textarea>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Operation Hours </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <textarea name="comp_operation_hour" class="form-control ckeditor" placeholder="Company Operation Hour" style="height: 100px;"><? echo $pdata['comp_operation_hour']; ?></textarea>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Store Shipment </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <textarea name="store_shipment" class="form-control ckeditor" placeholder="Store Shipment" style="height: 100px;"><? echo $pdata['store_shipment']; ?></textarea>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Store Policy </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <textarea name="store_policy" class="form-control ckeditor" placeholder="Store Policy" style="height: 100px;"><? echo $pdata['store_policy']; ?></textarea>
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

                <link rel="stylesheet" href="/merchant/view/css/datepicker.css" />
		
		<script src="/merchant/view/js/jquery.validate.min.js"></script>
		<script src="/merchant/view/js/jquery.maskedinput.min.js"></script>
                <script src="/merchant/view/js/bootstrap-datepicker.min.js"></script>
                <script src="/merchant/view/js/ckeditor_basic/ckeditor.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
                                $.mask.definitions['~']='[+-]';
				$('input[name=birthday]').mask('99-99-9999');

                                jQuery.validator.addMethod("birthday", function (value, element) {
					return /^\d{2}-\d{2}-\d{4}$/.test(value);
				}, "Please enter your valid birthday");

                                $('form.validation-form').each(function(){                                    
                                    $(this).validate({
                                            ignore:'',
                                            errorElement: 'div',
                                            errorClass: 'help-block',
                                            focusInvalid: true,
                                            rules: {
                                                    name: {
                                                            required: true,
                                                            minlength: 6
                                                    },
                                                    gender: {
                                                            required: true                                                    
                                                    },
                                                    store_short_url: {
                                                            required: true
                                                    },
                                                    store_name: {
                                                            required: true
                                                    },
                                                    comp_name: {
                                                            required: true
                                                    },
                                                    birthday: {
                                                            required: true
                                                    }
                                            },

                                            messages: {
                                                    birthday: "Please enter your valid birthday",
                                                    gender: "Please choose gender",
                                                    short_url: "Please enter your desire store url"                                                    
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
                                                for(name in CKEDITOR.instances){
                                                    $(form).find('textarea[name='+name+']').text(CKEDITOR.instances[name].getData());
                                                }
                                                ubib_ajax_submit(form);
                                                return false;
                                            },
                                            invalidHandler: function (form) {
                                            }
                                    });    
                                });
                                
                                $('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true
				})
				//show datepicker when clicking on the icon
				.next().on(ace.click_event, function(){
					$(this).prev().focus();
				});

                                // This code is generally not necessary, but it is here to demonstrate
                                // how to customize specific editor instances on the fly. This fits well
                                // this demo because we have editable elements (like headers) that
                                // require less features.

                                // The "instanceCreated" event is fired for every editor instance created.
                                CKEDITOR.on( 'instanceCreated', function( event ) {
                                        var editor = event.editor, element = editor.element;
                                        editor.on( 'configLoaded', function() {
                                                // Remove unnecessary plugins to make the editor simpler.
                                                editor.config.removePlugins = 'colorbutton,find,flash,font,' +
                                                        'forms,iframe,image,newpage,removeformat,' +
                                                        'smiley,specialchar,stylescombo,templates';

                                                // Rearrange the layout of the toolbar.
                                                editor.config.toolbarGroups = [
                                                        { name: 'editing',		groups: [ 'basicstyles', 'links' ] },
                                                        { name: 'undo' },
                                                        { name: 'clipboard',	groups: [ 'selection', 'clipboard' ] },
                                                        { name: 'about' }
                                                ];
                                        });
                                });
			});
		</script>