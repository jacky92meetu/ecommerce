<? echo $header; ?>
<link rel="stylesheet" href="/merchant/view/css/datepicker.css" />
<link rel="stylesheet" href="/merchant/view/css/dropzone.css" />
<link rel="stylesheet" href="/merchant/view/css/jquery-ui.custom.min.css" />
<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
                <div class="widget-header">
                        <h4 class="widget-title">
                            <i class="ace-icon fa fa-info-circle bigger-110"></i>
                            Edit Product
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main no-padding">                            
                            <form class="form-horizontal validation-form" role="form" action="/merchant/product/update?merchant_id=<? echo $this->merchant->getId(); ?>" method="POST">
                                <input type="hidden" name="form_action" value="update">
                                <input type="hidden" name="product_id" value="<? echo $pdata['product_id']; ?>">
                                <input type="hidden" name="default_image" value="<? echo $pdata['default_image']; ?>">
                                <input type="hidden" name="category_group">
                                <fieldset>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> Category </label>
                                            <div class="col-sm-9 control-value">
                                                <div class="clearfix">
                                                    <button type="button" class="btn btn-white btn-success add_category_btn">Add Category</button>
                                                    <div class="category_name_label"></div>
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
                                            <label class="col-sm-3 control-label no-padding-right"> Description <br><a class="product_desc_sample" href="javascript:void(0);">view sample</a></label>
                                            <div class="col-sm-9 control-value">
                                                <div class="clearfix">                                                            
                                                    <textarea name="description" class="form-control ckeditor" placeholder="Product Description" style="height: 100px;"><? echo $pdata['description']; ?></textarea>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> Image </label>
                                            <div class="col-sm-9 control-value">
                                                <div class="clearfix">
                                                    <div class="row">
                                                        <div class="col-xs-12">
                                                            <div class="clear">
                                                                    <input type="button" id="upload-btn" class="btn btn-primary btn-large clearfix" value="Choose file">
                                                                    <span style="padding-left:5px;vertical-align:middle;"><i>PNG, JPG, or GIF (<? echo $max_file_size; ?>MB max file size | image must in square size | image size must equal or greater than 640px X 640px)</i></span>
                                                            </div>
                                                            <div id="image_error_msg" class="clear help-block red"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12">
                                                            <div class="static dropzone-previews">
                                                                <? foreach($files as $file){ ?>
                                                                <div class="dz-preview dz-image-preview" style="margin:5px;" image_id="<? echo $file['name']; ?>">
                                                                    <div class="dz-details">
                                                                      <div class="dz-filename"><span data-dz-name><? echo $file['name']; ?></span></div>
                                                                      <img data-dz-thumbnail src="<? echo $this->merchant->image_link($file['thumb']); ?>" />
                                                                    </div>                                                                    
                                                                    <a class="remove pull-left" href="javascript:dropzone_image_delete('<? echo $file['name']; ?>',true);" alt="Remove"  data-rel="tooltip" title="Remove">
                                                                        <i class="ace-icon fa fa-trash-o icon-on-left bigger-125 line-height-125 red"></i>
                                                                    </a>
                                                                    <a class="set_default pull-right" href="javascript:image_set_default('<? echo $file['name']; ?>');" alt="Set as default"  data-rel="tooltip" title="Set as default">
                                                                        <i class="ace-icon fa fa-square-o icon-on-left bigger-125 line-height-125 blue"></i>
                                                                    </a>
                                                                </div>
                                                                <? } ?>
                                                            </div>	
                                                        </div>
                                                    </div>
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
                                                    <input type="text" id="price" name="price" class="form-control" placeholder="Product Price"  value="<? echo $pdata['price']; ?>"/>
                                                </div>
                                            </div>
                                    </div>

                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> Discount Price </label>
                                            <div class="col-sm-9 control-value">
                                                <div class="clearfix">
                                                    <input type="text" id="discount_price" name="discount_price" class="form-control" placeholder="Discount Price"  value="<? echo $pdata['discount_price']; ?>"/>
                                                </div>
                                                <div><i>Selling price minimum RM10 | Selling price should included delivery charges</i></div>
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
                                            <label class="col-sm-3 control-label no-padding-right"> Product Option </label>
                                            <div class="col-sm-9 control-value">
                                                <div class="clearfix">
                                                    <div class="row">
                                                        <div class="col-xs-12">
                                                            <a href="javascript:void(0);" onClick="option_add();" type="button" class="btn btn-white btn-success">Add Option</a>
                                                        </div>                                                                
                                                    </div>
                                                    <div class="row product_option_container">
                                                        <?
                                                            if(isset($main_option_list)){
                                                                foreach($main_option_list as $key => $value){                                                                
                                                        ?>
                                                        <div class="product_option main_product_option col-xs-12 col-sm-4" option_id="0">
                                                            <div>
                                                                <label class="label_name"> <? echo $value['name']; ?> </label>
                                                                <div class="option_list">
                                                                    <?
                                                                        foreach($value['option'] as $option){
                                                                            $selected = "";
                                                                            $value = "";
                                                                            if(isset($option_data[$key]) && isset($option_data[$key]['data'][$option['option_value_id']])){
                                                                                $selected = "checked";
                                                                                $value = $option_data[$key]['data'][$option['option_value_id']]['actual_price'];
                                                                            }
                                                                    ?>
                                                                    <div class="option_value_desc">
                                                                        <div>
                                                                            <label>
                                                                                <input name="main_product_option_vchecked[<? echo $key; ?>][<? echo $option['option_value_id']; ?>]" type="checkbox" class="ace" <? echo $selected; ?>>
                                                                                <span class="lbl"> <? echo $option['option_value']; ?></span>
                                                                            </label>
                                                                        </div>                                                                        
                                                                        <div class="input-group">                                                                            
                                                                            <input class="form-control option_value_price" type="text" placeholder="0.00" value="<? echo $value; ?>" name="main_product_option_vprice[<? echo $key; ?>][<? echo $option['option_value_id']; ?>]">
                                                                        </div>                                                                        
                                                                    </div>
                                                                    <?
                                                                        }
                                                                    ?>
                                                                </div>                                                                
                                                            </div>
                                                        </div>
                                                        <?
                                                                }
                                                            }
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>

                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> Out of Stock Status </label>
                                            <div class="col-sm-9 control-value">
                                                <div class="clearfix">
                                                    <select class="form-control" name="stock_status_id">
                                                        <? foreach($stock_status_list as $key => $value){ ?>
                                                        <option value="<? echo $key; ?>" <? echo ($pdata['stock_status_id']==$key)?"selected":""; ?>><? echo $value; ?></option>
                                                        <? } ?>
                                                    </select>                                                                                                             
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
                                                <button class="btn btn_reset" type="reset">
                                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                                        Reset
                                                </button>
                                        </div>
                                </div> 
                            </form>

                            <div class="option_value_desc default_option hide">
                                <div class="row">
                                    <div class="col-xs-7">
                                        <input class="form-control option_value_name" type="text" placeholder="Sample: Blue">
                                    </div>
                                    <div class="col-xs-5">
                                        <input class="form-control option_value_price" type="text" placeholder="0.00" value="0.00">                                        
                                    </div>                                    
                                </div>
                                <? /* ?>
                                <div class="input-group">
                                    <input class="form-control option_value_name" type="text" placeholder="Sample: Blue">
                                    <span class="input-group-addon">:</span>
                                    <input class="form-control option_value_price" type="text" placeholder="0.00" value="0.00">
                                </div>
                                <? */ ?>
                                <div class="option_menu2">
                                    <a href="javascript:void(0);" onClick="option_value_remove(this);" alt="Remove" data-rel="tooltip" title="" data-original-title="Remove" class="option_value_remove">
                                        <div>X</div>
                                    </a>
                                </div>                                
                            </div>
                            <div class="product_option col-xs-12 col-sm-4 default_option hide">
                                <div>
                                    <label class="label_name">
                                        <span>Name</span>
                                        <div class="option_menu">
                                            <a  href="javascript:void(0);" onClick="option_remove(this);" alt="Remove" data-rel="tooltip" title="" data-original-title="Remove" class="option_remove">
                                                <i class="ace-icon fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                    </label>
                                    <div class="option_desc">
                                        <div>                                                                        
                                            <div class="clearfix">                                                
                                                <input type="text" class="form-control option_name" placeholder="Sample: Color" />
                                            </div>
                                        </div>
                                    </div>
                                    <label class="label_option">Option [Value Name : Price]</label>
                                    <div class="option_list">
                                        <button type="button" class="btn btn-white btn-info option_value_add" onClick="option_value_add(this);">Add Value</button>
                                    </div>                                    
                                </div>
                            </div>
                            
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
		<script src="/merchant/view/js/jquery.maskedinput.min.js"></script>
                <script src="/merchant/view/js/bootstrap-datepicker.min.js"></script>
                <script src="/merchant/view/js/jquery-ui.custom.min.js"></script>
                <script src="/merchant/view/js/ckeditor/ckeditor.js"></script>
                <script src="/merchant/view/js/SimpleAjaxUploader.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
                                $.mask.definitions['~']='[+-]';
				$('input[name=start_date]').mask('99-99-9999');
                                
                                $.mask.definitions['~']='[+-]';
				$('input[name=end_date]').mask('99-99-9999');
                            
                                jQuery.validator.addMethod("start_date", function (value, element) {
					return /^\d{2}-\d{2}-\d{4}$/.test(value);
				}, "Please enter valid product start date");
                                
                                jQuery.validator.addMethod("end_date", function (value, element) {
					return /^\d{2}-\d{2}-\d{4}$/.test(value);
				}, "Please enter valid product end date");
                                
                                jQuery.validator.addMethod("greaterThan", 
                                function(value, element, params) {
                                    if( value==="" || $(params[0]).val()==="" ){
                                        return true;
                                    }
                                    if(/^\d{2}-\d{2}-\d{4}$/.test(value)){
                                        var $temp = value.split("-");                                        
                                        if (!/Invalid|NaN/.test(new Date($temp[2],$temp[1],$temp[0]))) {
                                            var $temp2 = $(params[0]).val().split("-");                                            
                                            return new Date($temp[2],$temp[1],$temp[0]) > new Date($temp2[2],$temp2[1],$temp2[0]);
                                        }
                                    }else{
                                        return (!isNaN(value) && !isNaN($(params[0]).val()) && value>0 && $(params[0]).val()>0
                                            && (Number(value) > Number($(params[0]).val()))); 
                                    }
                                    return false;
                                },'Must be greater than {1}.');
                                
                                $('form.validation-form').each(function(){                                    
                                    var $validator = $(this).validate({
                                            ignore:'',
                                            errorElement: 'div',
                                            errorClass: 'help-block',
                                            focusInvalid: true,
                                            rules: {
                                                    name: {
                                                            required: true,
                                                            minlength: 6
                                                    },                                                    
                                                    price: {
                                                            required: true,
                                                            number: true,
                                                            min: 10,
                                                            greaterThan: ["input[name=discount_price]","discount price"]
                                                    },
                                                    discount_price: {
                                                            required: true,
                                                            number: true,
                                                            min: 10
                                                    },
                                                    quantity: {
                                                            required: true,
                                                            digits: true
                                                    },                                                    
                                                    start_date: {},
                                                    end_date: {                                                            
                                                            greaterThan: ["input[name=start_date]","start date"]
                                                    },
                                                    
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
                                                //set catetory_group
                                                var $temp = [];
                                                $('.category_name_label > [category_id]').each(function(){
                                                    $temp[$temp.length] = $(this).attr('category_id').toString();
                                                });
                                                $(form).find('input[name="category_group"]').val(JSON.stringify($temp));
                                                ubib_ajax_submit(form);
                                                return false;
                                            },
                                            invalidHandler: function (form) {
                                            }
                                    });
                                    $(this).find('input[name=start_date], input[name=end_date]').change(function(){
                                        $validator.element('input[name=end_date]');
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
                                /*
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
                    */
                                
                                var max_image = <? echo $max_file_upload; ?>;
                                var max_size = <? echo $max_file_size; ?> * 1024;
                                var btn = document.getElementById('upload-btn');	
                                var uploader = new ss.SimpleUpload({
                                    button: btn,
                                    url: '/merchant/product/ajaximageupload?merchant_id=<? echo $this->merchant->getId(); ?>&product_id=<? echo $product_id; ?>',
                                    name: 'file',
                                    multiple: true,
                                    multipart: true,
                                    maxUploads: 1,
                                    queue: false,
                                    method: "POST",
                                    maxSize: max_size,
                                    data: {'isajax':1},
                                    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                                    accept: 'image/*',
                                    responseType: 'json',
                                    onExtError: function(filename, extension) {
                                      alert(filename + ' is not a permitted file type.'+"\n\n"+'Only PNG, JPG, and GIF files are allowed.');
                                    },
                                    onSizeError: function(filename, fileSize) {
                                      alert(filename + ' is too big. ('+max_size+'K max file size)');
                                    },
                                    onSubmit: function(filename, ext) {
                                        if($('.dz-preview[image_id]').length>=max_image){                                            
                                            var err_msg = "Maximum "+max_image+" images!";
                                            $('#image_error_msg').html(err_msg);
                                            this.removeCurrent();                                            
                                            return false;
                                        }
                                        if($('.dz-preview[image_id="'+filename+'"],.dz-preview[file_name="'+filename+'"]').length>0){
                                            var err_msg = "Image exists!";
                                            $('#image_error_msg').html(err_msg);
                                            this.removeCurrent();
                                            return false;
                                        }
                                        
                                        var prog = document.createElement('div'),
                                           outer = document.createElement('div'),
                                           bar = document.createElement('div'),
                                           size = document.createElement('div');

                                        prog.className = 'prog';
                                        size.className = 'size';
                                        outer.className = 'progress progress-striped active';
                                        bar.className = 'progress-bar progress-bar-success';

                                        outer.appendChild(bar);            
                                        /*prog.appendChild(size);*/
                                        prog.appendChild(outer);            

                                        temp = $('<div class="dz-preview dz-image-preview" style="margin:5px;" image_id="" file_name="'+filename+'"><div class="dz-details"><div class="dz-filename"><span data-dz-name></span></div><img data-dz-thumbnail src="" /></div></div>').appendTo($('div.dropzone-previews'));
                                        temp.find('.dz-details').after(prog);

                                        this.setProgressBar(bar);
                                        this.setProgressContainer(prog);
                                        this.setFileSizeBox(size);
                                      },
                                    onComplete: function(filename, data) {
                                        try{
                                            if(typeof data !== 'object'){
                                                data = JSON.parse(data);
                                            }                
                                        }catch(e){
                                            data = {};
                                            if(typeof bootbox === 'object'){                                                        
                                                bootbox.alert("Server Error!");
                                            }else{
                                                alert("Submission Error!");
                                            }                
                                        }
                                        if(typeof data.status === 'string' && data.status=="success"){                                            
                                            $('.dz-preview[file_name="'+filename+'"]')
                                                .attr('image_id',data.id)
                                                .append($('<a class="remove pull-left" href="javascript:dropzone_image_delete(\''+data.id+'\',true);" alt="Remove" data-rel="tooltip" title="Remove"><i class="ace-icon fa fa-trash-o icon-on-left bigger-125 line-height-125 red"></i></a><a class="set_default pull-right" href="javascript:image_set_default(\''+data.id+'\');" alt="Set as default"  data-rel="tooltip" title="Set as default"><i class="ace-icon fa fa-square-o icon-on-left bigger-125 line-height-125 blue"></i></a>'));
                                            $('.dz-preview[file_name="'+filename+'"]').find('img[data-dz-thumbnail]').attr('src',data.img_url);
                                            $('.dz-preview[file_name="'+filename+'"]').find('div.dz-filename span[data-dz-name]').html(filename);
                                            image_set_default();
                                            return;
                                        }else if(typeof data.status === 'string' && data.status=="error"){
                                            if(typeof data.text==='string' && data.text.length>0){
                                                if(typeof bootbox === 'object'){                                                        
                                                    bootbox.alert(data.text);
                                                }else{
                                                    alert(data.text);
                                                }
                                            }
                                        }
                                        (function(filename){
                                            $('.dz-preview[file_name="'+filename+'"][image_id=""]').remove();                    
                                        })(filename);
                                    }
                                });

                                $('[data-rel="tooltip"]').tooltip();
                                
                                image_set_default();
			});
                        
                        function dropzone_image_delete(id,del_obj){
                            $.ajax({
                                type: 'POST',
                                url: '/merchant/product/ajaximageremove?merchant_id=<? echo $this->merchant->getId(); ?>',
                                data: {'product_id':'<? echo $product_id; ?>','image_id':id},
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
                                        if(del_obj === true){
                                            $('.dz-preview[image_id="'+id+'"]').remove();
                                        }
                                    }
                                    image_set_default();
                                }
                            });
                        }
                        
                        function image_set_default(id){
                            $('.dz-preview a.set_default i').removeClass('fa-check-square-o').addClass('fa-square-o');
                            if($('.dz-preview[image_id]').length>0){                                
                                if($('.dz-preview[image_id="'+id+'"]').length==0){
                                    if($('input[name="default_image"]').length){
                                        id = $('input[name="default_image"]').val();
                                    }
                                    if($('.dz-preview[image_id="'+id+'"]').length==0){
                                        id = $('.dz-preview[image_id]').first().attr('image_id');                                    
                                    }
                                }                                
                                if($('input[name="default_image"]').length){
                                    $('input[name="default_image"]').val(id);
                                }
                                $('.dz-preview[image_id="'+id+'"] a.set_default i').removeClass('fa-square-o').addClass('fa-check-square-o');
                            }else{
                                $('input[name="default_image"]').val("");
                            }
                            reset_ckeditor_image_list();
                        }
                        
                        function reset_ckeditor_image_list(){
                            var vTypeOf = typeof(CKEDITOR);
                            if(vTypeOf == 'object' && typeof jQuery == 'function') {    
                                var image = [];                                        
                                if(jQuery('.dz-preview[image_id]').length){
                                    jQuery('.dz-preview[image_id]').each(function(){
                                        var url = "/image/product/<? echo $product_id; ?>/"+jQuery(this).attr('image_id');
                                        image[image.length] = url;                                                
                                    });
                                }
                                CKEDITOR.config.tabbedimages  = image;
                                CKEDITOR.config.tabbedthumbimages = image;
                                if (typeof ReplaceDSbrowserHTML == 'function') { 
                                     ReplaceDSbrowserHTML(); 
                                }
                            }
                        }

		</script>
<script>
    var $selected_category = <? echo $selected_category; ?> || {};
    jQuery(function($){
        $('.add_category_btn').click(function(){
            select_category('',true);
            $('#myModal').modal('show');
        });
        $('.categorygroup a').click(function(){
            select_category($(this));
        });
        $('.btn_reset').click(function(){
            init_category();
        });
        init_category();
    });
    
    function init_category(){
        $('.category_name_label > [category_id]').remove();
        for(var i in $selected_category){
            check_category($selected_category[i]['category_id']);
        }
    }
    
    function check_category(id,display){
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
        }else if(display!==true){
            if($('.category_name_label > [category_id="'+obj.attr('category_id')+'"]').length==0){
                var $temp = $('<div class="btn btn-info" data-rel="tooltip" title="Click to remove!" category_id="'+obj.attr('category_id')+'">'+obj.text()+' <i class="fa fa-trash-o"></i></div>').click(function(){
                    $(this).tooltip('hide');
                    $(this).remove();
                });
                $temp.tooltip();
                $('.category_name_label').append($temp);
            }
            $('#myModal').modal('hide');
        }        
        
        if($('.categorygroup a[category_id="'+parent_id+'"]').length){
            check_category(parent_id);
        }
    }
    
    function select_category(id,display){
        if(typeof id === 'object' && id.hasClass('category_close')){            
            id = id.closest('.categorygroup').prev('.categorygroup').first().find('a.active').attr('category_id');
            display = true;
        }
        
        $('.categorygroup').addClass('hide');
        $('.categorygroup a').removeClass('active');        
        $('.categorygroup .widget-toolbar').addClass('hide');
        
        check_category(id,display);
    }
</script>

<script>
    var $option_count = 200;
    var $option_value_count = 0;    
    var $default_data = <? echo ($option_data)?json_encode($option_data):"{}"; ?>;
    
    jQuery(function($){
        $('.btn_reset').click(function(){
            option_init();
        });
        option_init();
    });
    
    function option_init(){
        $('.product_option_container .product_option').not('.main_product_option').remove();
        $option_count = 0;
        $option_value_count = 0;
        for($i in $default_data){
            if(typeof $default_data[$i]['main_option'] == 'undefined'){
                var $option = option_add();            
                $($option).find('.option_name').attr('value',$default_data[$i]['option_name']);
                for($j in $default_data[$i]['data']){
                    var $value = option_value_add($option);
                    $($value).find('.option_value_name').attr('value',$default_data[$i]['data'][$j]['value_name']);
                    $($value).find('.option_value_price').attr('value',$default_data[$i]['data'][$j]['actual_price']);
                }
            }
        }
    }
    
    function option_add(){
        var $temp = $('.product_option.default_option').clone().removeClass('hide default_option');        
        $temp.attr('option_id',$option_count);
        $temp.find('.option_name').attr({'option_id':$option_count,'name':'product_option["'+$option_count+'"]'});
        $('.product_option_container').append($temp);
        $option_count += 1;
        return $temp;
    }
    
    function option_value_add(obj){
        if(!$(obj).hasClass('product_option')){
            obj = $(obj).closest('.product_option');
        }
        if(!$(obj).hasClass('product_option')){
            return false;
        }
        var $temp = $('.option_value_desc.default_option').clone().removeClass('hide default_option');
        var $option_id = $(obj).attr('option_id');
        $temp.find('.option_value_name').attr('name','product_option_vname["'+$option_id+'"]["'+$option_value_count+'"]');
        $temp.find('.option_value_price').attr('name','product_option_vprice["'+$option_id+'"]["'+$option_value_count+'"]');        
        $(obj).find('button.option_value_add').before($temp);
        $option_value_count += 1;
        return $temp;
    }
    
    function option_remove(obj){
        $(obj).closest('.product_option').remove();
    }

    function option_value_remove(obj){
        $(obj).closest('.option_value_desc').remove();
    }
</script>

<style>
   .bootbox.modal{text-align:center;}
   .bootbox.modal > .modal-dialog {max-width:100% !important;width:auto;display:inline-block;}
   .bootbox.modal > .modal-dialog .bootbox-body img{max-width:100% !important;}
</style>
<script type="text/javascript">
jQuery(function($){
    $('.product_desc_sample').click(function(){
        bootbox.alert("<img class='img-responsive' src='/image/data/merchant/product_description_sample.jpg'>");
    });
});
</script>