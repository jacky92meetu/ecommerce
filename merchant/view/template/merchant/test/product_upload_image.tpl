<link rel="stylesheet" href="/merchant/view/css/dropzone.css" />
<? echo $header; ?>
<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">										
                <div class="widget-header widget-header-small">
                        <h4 class="widget-title smaller">
                                <span class="col-sm-12"> 
                                    <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                    Product Image Upload
                                </span>                                
                        </h4>
                </div>
                <div class="widget-body">                       
                        <div class="widget-main">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="static dropzone-previews">
                                        <? foreach($files as $key => $value){ ?>
                                        <div class="dz-preview dz-image-preview" image_id="<? echo $key; ?>">
                                            <div class="dz-details">
                                              <div class="dz-filename"><span data-dz-name><? echo $key; ?></span></div>                                                                      
                                              <img data-dz-thumbnail src="<? echo $value; ?>" />
                                            </div>                                                                    
                                            <a class="dz-remove" href="javascript:undefined;" data-dz-remove="">Remove file</a>
                                        </div>
                                        <? } ?>
                                    </div>
                                </div>
                            </div>                            
                            <div class="row">
                                <div class="col-xs-12">
                                    <div id="dropzone" class="dropzone"></div>
                                </div>
                            </div>                            
                        </div>
                </div>
                <div class="widget-toolbox">
                    <div class="row">
                        <div class="col-xs-12 center">
                            <div class="btn-toolbar no-margin no-padding no-border">
                                <a href="/merchant/product" type="button" class="btn btn-sm btn-info">
                                    <i class="ace-icon fa fa-pencil icon-on-left bigger-125 line-height-125"></i>
                                    Back
                                </a>
                            </div>
                        </div>                        
                    </div>
                </div>
        </div>
    </div>
</div>                       
<? echo $footer; ?>

<!-- page specific plugin scripts -->
		
		<script src="/merchant/view/js/dropzone.min.js"></script>
                
                <!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {                                
                                $('.static.dropzone-previews a.dz-remove').click(function(){                                    
                                    $result = dropzone_image_delete($(this).closest('.dz-preview[image_id]').attr('image_id'),$(this));
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
                                                    if(typeof data.id === 'string'){
                                                        $(file.previewElement).attr('image_id',data.id);
                                                        return true;
                                                    }
                                                }
                                                this.removeFile(file);
                                            });
                                            this.on("error", function(file,errmsg,xhr) { if(xhr){errmsg="Server response error!";$(file.previewElement).find('span[data-dz-errormessage]').html(errmsg);}/*this.removeFile(file);*/});
                                        },
                                        url: "/merchant/product/ajaximageupload/?product_id=<? echo $product_id; ?>",
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
                                function dropzone_image_delete(id,obj){
                                    $.ajax({
                                        type: 'POST',
                                        url: '/merchant/product/ajaximageremove',
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
                                                if(typeof obj == 'object'){
                                                    $(obj).closest('.dz-preview').remove();
                                                }                                                
                                            }
                                        }
                                    });
                                }                               
                               
			});
		</script>
