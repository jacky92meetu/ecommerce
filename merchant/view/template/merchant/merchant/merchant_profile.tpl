<? echo $header; ?>
                                
					<div>
												<div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="widget-box transparent">
                                                            <div class="widget-header">
                                                                <div class="pull-left"> 
                                                                    <h4 class="widget-title">
                                                                        <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                                                        General Information
                                                                    </h4>
                                                                </div>
                                                                <div class="pull-right">
                                                                        <label class="pull-right inline">
                                                                            <a class="btn btn-bold ubib-green-btn" href="/merchant/profile/editprofile">
                                                                                <i class="ace-icon fa fa-pencil"></i>
                                                                                Edit
                                                                            </a>
                                                                        </label>
                                                                </div>                                                                    
                                                            </div>

                                                            <div class="widget-body">
                                                                <div class="widget-main">
                                                                    <div class="row">
                                                                        <div class="col-xs-12 col-sm-3 center">
                                                                            <div class="widget-box transparent">
                                                                                <div class="widget-body">
                                                                                    <div class="widget-main no-padding">
                                                                                        <div class="profile-picture editable" id="image_upload">
                                                                                            <img class="img-responsive" id="avatar" src="<? echo $store_image; ?>">
                                                                                        </div>
                                                                                        <div class=" text-info text-center smaller-90">
                                                                                            Hints: Click image to change avatar.
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div><!-- /.col -->

                                                                        <div class="col-xs-12 col-sm-9">
                                                                                <h4 class="blue">
                                                                                        <span class="middle"><? echo $pdata['name']; ?></span>
                                                                                </h4>                                                                                                                                

                                                                                <div class="profile-user-info">
                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Email </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['email']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Birthday </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['birthday']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Gender </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['gender']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Store URL </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['store_short_url']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Store Name </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['store_name']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Name </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_name']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Reg. No. </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_reg_no']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Website </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_website']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Facebook Link </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_facebook_link']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Twitter Link </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_twitter_link']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Tel. No. </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_tel']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Fax No. </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_fax']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Email </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_email']; ?></span>
                                                                                                </div>
                                                                                        </div>

                                                                                        <div class="profile-info-row">
                                                                                                <div class="profile-info-name"> Company Address </div>

                                                                                                <div class="profile-info-value">
                                                                                                        <span><? echo $pdata['comp_address']; ?></span>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
													</div>
												</div><!-- /.row -->

												<div class="space-20"></div>

												<div class="row">
													<div class="col-xs-12 col-sm-6">
														<div class="widget-box transparent">
															<div class="widget-header widget-header-small">
																<h4 class="widget-title smaller">
                                                                                                                                        <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                                                                                                                            Company Description
																</h4>
															</div>

															<div class="widget-body">
																<div class="widget-main">
																	<? echo $pdata['comp_desc']; ?>
																</div>
															</div>
														</div>
													</div>

													<div class="col-xs-12 col-sm-6">
														<div class="widget-box transparent">
															<div class="widget-header widget-header-small">
																<h4 class="widget-title smaller">
                                                                                                                                        <i class="ace-icon fa fa-info-circle bigger-110"></i>
                                                                                                                                            Operation Hours
																</h4>
															</div>

															<div class="widget-body">
																<div class="widget-main">
                                                                                                                                    <? echo $pdata['comp_operation_hour']; ?>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
                                    
<? echo $footer; ?>

<script src="/merchant/view/js/SimpleAjaxUploader.js"></script>
<script type="text/javascript">
    jQuery(function($){
        var btn = $('#image_upload');
        var $widget = $(btn).closest('.widget-box');        
        var uploader = new ss.SimpleUpload({
            button: btn,
            url: '/merchant/profile/ajaximageupload',
            name: 'file',
            multiple: false,
            multipart: true,
            maxUploads: 1,
            queue: false,
            method: "POST",
            maxSize: 1024,
            allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
            accept: 'image/*',
            responseType: 'json',
            onExtError: function(filename, extension) {
              alert(filename + ' is not a permitted file type.'+"\n\n"+'Only PNG, JPG, and GIF files are allowed.');
            },
            onSizeError: function(filename, fileSize) {
              alert(filename + ' is too big. (1024K max file size)');
            },
            onSubmit: function(filename, ext) {
                if($widget.length){
                    $widget.widget_box('reload');
                }
            },
            onComplete: function(filename, data) {
                try{
                    if(typeof data !== 'object'){
                        data = JSON.parse(data);
                    }                
                }catch(e){
                    data = {};
                    var msg = "Submission Error!";
                    if(typeof bootbox === 'object'){                                                        
                        bootbox.alert(msg);
                    }else{
                        alert(msg);
                    }                
                }
                if(typeof data.status === 'string' && data.status=="success"){                    
                    $(btn).find('img').attr('src',data.img_url);
                    $('.nav.ace-nav img.nav-user-photo').attr('src',data.img_url);
                }
                if($widget.length){
                    $widget.trigger('reloaded.ace.widget');
                }
            },
            onError: function(){
                if($widget.length){
                    $widget.trigger('reloaded.ace.widget');
                }
                var msg = "Submission Error!";
                if(typeof bootbox === 'object'){                                                        
                    bootbox.alert(msg);
                }else{
                    alert(msg);
                }
            }
        });        
    });
</script>