<link rel="stylesheet" href="/merchant/view/css/datepicker.css" />
<link rel="stylesheet" href="/merchant/view/css/dropzone.css" />

<? echo $header; ?>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
                <div class="widget-header">
                        <h4 class="widget-title">
                            <i class="ace-icon fa fa-info-circle bigger-110"></i>
                            Create Product
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main no-padding">                            
                            <form class="form-horizontal validation-form" role="form" action="/merchant/profile/editprofile" method="POST">
                                        <input type="hidden" name="form_action" value="editprofile">
                                        <fieldset>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Category </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <select class="form-control" name="category">
                                                                <option value="28">HTC</option>
                                                                <option value="32">Nokia</option>
                                                                <option value="30">Samsung</option>
                                                                <option value="29">Iphone</option>
                                                                <option value="26">Apple</option>
                                                                <option value="33">Cameras</option>
                                                                <option value="25">Mobile Phone</option>
                                                                <option value="20">Tablet</option>
                                                                <option value="18">Laptops</option>
                                                                <option value="27">Mac Book</option>
                                                                <option value="45">Windows</option>
                                                                <option value="46">Macs</option>
                                                                <option value="59">Smartphones</option>
                                                                <option value="60">Ipod</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Product Name </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="name" class="form-control" placeholder="Product Name"  value="<? echo $pdata['name']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Description </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            <textarea name="description" class="form-control ckeditor" placeholder="Product Description" style="height: 100px;"><? echo $pdata['desc']; ?></textarea>
                                                        </div>
                                                    </div>
                                            </div>
                                            <!--
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Option </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">                                                            
                                                            
                                                        </div>
                                                    </div>
                                            </div>
                                            -->

                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Price </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="price" class="form-control" placeholder="Product Price"  value="<? echo $pdata['price']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Discount Price </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="discount_price" class="form-control" placeholder="Discount Price"  value="<? echo $pdata['discount_price']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Quantity </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <input type="text" name="quantity" class="form-control" placeholder="Product Quantity"  value="<? echo $pdata['quantity']; ?>"/>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Out of Stock Status </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <select class="form-control" name="stock_status_id">                                                                
                                                                <option value="5" selected="selected">Out Of Stock</option>
                                                                <option value="7">In Stock</option>
                                                                <option value="8">Pre-Order</option>
                                                            </select>                                                                                                             
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Images </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="dropzone-previews">
                                                                <div class="dz-preview dz-image-preview" image_id="">
                                                                    <div class="dz-details">
                                                                      <div class="dz-filename"><span data-dz-name>testing</span></div>                                                                      
                                                                      <img data-dz-thumbnail src="/merchant/view/images/profile-pic.jpg" />
                                                                    </div>                                                                    
                                                                    <a class="dz-remove" href="javascript:undefined;" data-dz-remove="">Remove file</a>
                                                                </div>
                                                            </div>
                                                            <div id="dropzone" class="dropzone"></div>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> Start Date </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group">
                                                                <input class="form-control date-picker" name="start_date" type="text" placeholder="Start Date" data-date-format="dd-mm-yyyy" value="<? echo $pdata['start_date']; ?>">
                                                                <span class="input-group-addon">
                                                                        <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"> End Date </label>
                                                    <div class="col-sm-9 control-value">
                                                        <div class="clearfix">
                                                            <div class="input-group">
                                                                <input class="form-control date-picker" name="end_date" type="text" placeholder="End Date" data-date-format="dd-mm-yyyy" value="<? echo $pdata['end_date']; ?>">
                                                                <span class="input-group-addon">
                                                                        <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                                                            </div>
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
		<script src="/merchant/view/js/jquery.maskedinput.min.js"></script>
                <script src="/merchant/view/js/bootstrap-datepicker.min.js"></script>
                <script src="/merchant/view/js/ckeditor_basic/ckeditor.js"></script>
                <script src="/merchant/view/js/dropzone.min.js"></script>

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
                                
                                $('.dropzone-previews a.dz-remove').click(function(){
                                    dropzone_image_delete($(this).closest('.dz-preview[image_id]').attr('image_id'));
                                    $(this).closest('.dz-preview').remove();                                    
                                });
                                try{
                                    var maxFiles = 5;
                                    Dropzone.autoDiscover = false;
                                    $("#dropzone").dropzone({
                                        init: function(){
                                            this.on("addedfile", function(file){ if($('.dropzone, .dropzone-previews').find('.dz-preview').length>maxFiles){this.removeFile(file);} });
                                            this.on("removedfile", function(file) { if(file.status=="success"){dropzone_image_delete($(file.previewElement).attr('image_id')); } });
                                            this.on("success", function(file,data) {
                                                try{
                                                    data = JSON.parse(data);
                                                }catch(e){
                                                    data = {};
                                                    if(typeof bootbox === 'object'){                                                        
                                                        bootbox.alert("Server Error!");
                                                    }else{
                                                        alert("Submission Error!");
                                                    }
                                                    file.status = "error";                                                    
                                                }
                                                if(typeof data.status === 'string' && data.status=="success"){
                                                    if(typeof data.id === 'number' && data.id % 1 == 0){
                                                        $(file.previewElement).attr('image_id',data.id);
                                                    }
                                                }
                                                this.removeFile(file);
                                            });
                                            this.on("error", function(file,errmsg,xhr) { if(xhr){errmsg="Server response error!";$(file.previewElement).find('span[data-dz-errormessage]').html(errmsg);}/*this.removeFile(file);*/});
                                        },
                                        url: "/merchant/product/ajaximageupload/test?type=product",
                                        paramName: "file",
                                        maxFilesize: 1,
                                        method: "post",
                                        parallelUploads: 1,
                                        uploadMultiple: false,
                                        clickable: true,
                                        maxFiles: maxFiles,
                                        acceptedFiles: "image/*",
                                        autoProcessQueue: true,
                                        addRemoveLinks: true,
                                        dictDefaultMessage : '<span class="bigger-150 bolder"><i class="ace-icon fa fa-caret-right red"></i> Drop files</span> to upload \
                                            <span class="smaller-80 grey">(or click)</span> <br /> \
                                            <i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>',
                                        dictResponseError: 'Error while uploading file!',                                        
                                        previewTemplate: "<div class=\"dz-preview dz-file-preview\" image_id=\"\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
                                    });
                                } catch(e) {
                                    bootbox.alert('Dropzone.js does not support older browsers!');
                                }
                                function dropzone_image_delete(id){
                                    $.ajax({
                                        type: 'POST',
                                        url: '/merchant/product/ajaximageremove',
                                        data: {'id':id},
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
                                        }
                                    });
                                }                               
                               
			});
		</script>