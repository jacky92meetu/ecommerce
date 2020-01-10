<link rel="stylesheet" href="/merchant/view/css/dropzone.css" />
<? echo $header; ?>

<div class="container">
	<div class="row">
      
        <div class="col-md-9">
					<div class="content-box">
						<div class="clear">						
							<input type="button" id="upload-btn" class="btn btn-primary btn-large clearfix" value="Choose file">
                                                        <span style="padding-left:5px;vertical-align:middle;"><i>PNG, JPG, or GIF (1MB max file size)</i></span>							
                                                </div>    
                                                <div class="static dropzone-previews">
                                                    <? foreach($files as $key => $value){ ?>
                                                    <div class="dz-preview dz-image-preview" style="margin:5px;" image_id="<? echo $key; ?>">
                                                        <div class="dz-details">
                                                          <div class="dz-filename"><span data-dz-name><? echo $key; ?></span></div>
                                                          <img data-dz-thumbnail src="<? echo $value; ?>" />
                                                        </div>                                                                    
                                                        <a class="remove" href="javascript:dropzone_image_delete('<? echo $key; ?>',true);" alt="Remove"  data-rel="tooltip" title="Remove">
                                                            <i class="ace-icon fa fa-trash-o icon-on-left bigger-125 line-height-125 red"></i>
                                                        </a>
                                                    </div>
                                                    <? } ?>
                                                </div>						
					</div>	
        </div>
        
	</div>
</div>

<? echo $footer; ?>

<script type="text/javascript" src="/merchant/view/js/SimpleAjaxUploader.js"></script>
<script>
jQuery(function($){
    var btn = document.getElementById('upload-btn');	
    var uploader = new ss.SimpleUpload({
        button: btn,
        url: '/merchant/product/imagetest',
        name: 'file',
        multiple: true,
        multipart: true,
        maxUploads: 1,
        queue: false,
        method: "POST",
        maxSize: 1024,
        data: {'isajax':1},
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
        accept: 'image/*',        
        disabledClass: 'disabled',
        responseType: 'json',
        onExtError: function(filename, extension) {
          alert(filename + ' is not a permitted file type.'+"\n\n"+'Only PNG, JPG, and GIF files are allowed in the demo.');
        },
        onSizeError: function(filename, fileSize) {
          alert(filename + ' is too big. (1024K max file size)');
        },        
        onSubmit: function(filename, ext) {           
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
                    .append($('<a class="remove" href="javascript:dropzone_image_delete(\''+data.id+'\',true);" alt="Remove" data-rel="tooltip" title="Remove"><i class="ace-icon fa fa-trash-o icon-on-left bigger-125 line-height-125 red"></i></a>'));
                $('.dz-preview[file_name="'+filename+'"]').find('img[data-dz-thumbnail]').attr('src',data.img_url);
                $('.dz-preview[file_name="'+filename+'"]').find('div.dz-filename span[data-dz-name]').html(filename);
                return;
            }            
            (function(filename){
                $('.dz-preview[file_name="'+filename+'"][image_id=""]').remove();                    
            })(filename);            
        }
    });
    
    $('[data-rel="tooltip"]').tooltip();
    
});

function dropzone_image_delete(id,del_obj){
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
                if(del_obj === true){
                    $('.dz-preview[image_id="'+id+'"]').remove();
                }
            }
        }
    });
}

</script>	