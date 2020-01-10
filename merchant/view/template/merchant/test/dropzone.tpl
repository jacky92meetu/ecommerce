<? echo $header; ?>

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="alert alert-info">
								<i class="ace-icon fa fa-hand-o-right"></i>

								Please note that demo server is not configured to save uploaded files, therefore you may get an error message.
								<button class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
							</div>

							<div>
								<form action="../dummy.html" class="dropzone" id="dropzone">
									<div class="fallback">
										<input name="file" type="file" multiple="" />
									</div>
								</form>
							</div><!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->

<? echo $footer; ?>

<!-- page specific plugin styles -->
		<link rel="stylesheet" href="/merchant/view/css/dropzone.css" />


<!-- page specific plugin scripts -->
		<script src="/merchant/view/js/dropzone.min.js"></script>
                
<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($){
			
			Dropzone.autoDiscover = false;
			try {
			  var myDropzone = new Dropzone("#dropzone" , {
			    paramName: "file", // The name that will be used to transfer the file
			    maxFilesize: 0.5, // MB
			
				addRemoveLinks : true,
				dictDefaultMessage :
				'<span class="bigger-150 bolder"><i class="ace-icon fa fa-caret-right red"></i> Drop files</span> to upload \
				<span class="smaller-80 grey">(or click)</span> <br /> \
				<i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>'
			,
				dictResponseError: 'Error while uploading file!',
				
				//change the previewTemplate to use Bootstrap progress bars
				previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
			  });
			} catch(e) {
			  alert('Dropzone.js does not support older browsers!');
			}
			
			});
		</script>