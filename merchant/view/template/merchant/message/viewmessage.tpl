<? echo $header; ?>
                                            <div class="row">                                                                                           
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
                                                                <div class="message-container">                                                                        
                                                                        <div id="id-message-item-navbar" class="message-navbar clearfix">
                                                                                
                                                                                <div class="message-bar">
                                                                                        <div class="message-toolbar">
                                                                                                <!--
                                                                                                <button type="button" class="btn btn-xs btn-white btn-primary">
                                                                                                        <i class="ace-icon fa fa-trash-o bigger-125 orange"></i>
                                                                                                        <span class="bigger-110">Delete</span>
                                                                                                </button>
                                                                                                -->
                                                                                        </div>
                                                                                </div>
                                                                                
                                                                                <div>
                                                                                        <div class="messagebar-item-left">
                                                                                                <a href="#" class="btn-back-message-list">
                                                                                                        <i class="ace-icon fa fa-arrow-left blue bigger-110 middle"></i>
                                                                                                        <b class="bigger-110 middle">Back</b>
                                                                                                </a>
                                                                                        </div>

                                                                                        <div class="messagebar-item-right">
                                                                                                <i class="ace-icon fa fa-clock-o bigger-110 orange"></i>
                                                                                                <span class="grey"><? echo date("d M Y H:i",strtotime($message['date_added'])); ?></span>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                    
                                                                        <div class="message-list-container">
                                                                            <div class="message-content" id="id-message-content">
                                                                                    <div class="message-header clearfix">
                                                                                            <div class="pull-left">
                                                                                                    <span class="blue bigger-125"> <? echo $message['title']; ?> </span>
                                                                                            </div>
                                                                                            <!--
                                                                                            <div class="pull-right action-buttons">
                                                                                                    <a href="#">
                                                                                                            <i class="ace-icon fa fa-reply green icon-only bigger-130"></i>
                                                                                                    </a>

                                                                                                    <a href="#">
                                                                                                            <i class="ace-icon fa fa-mail-forward blue icon-only bigger-130"></i>
                                                                                                    </a>

                                                                                                    <a href="#">
                                                                                                            <i class="ace-icon fa fa-trash-o red icon-only bigger-130"></i>
                                                                                                    </a>
                                                                                            </div>
                                                                                            -->
                                                                                    </div>

                                                                                    <div class="hr hr-double"></div>

                                                                                    <div class="message-body">
                                                                                        <div class="prettyprint"><? echo $message['message']; ?></div>
                                                                                    </div>

                                                                                    <div class="hr hr-double"></div>
                                                                            </div>
                                                                        </div>
                                                                        <!--
                                                                        <div class="message-footer message-footer-style2 clearfix">
                                                                                <div class="pull-left"> simpler footer </div>

                                                                                <div class="pull-right">
                                                                                        <div class="inline middle"> message 1 of 2 </div>

                                                                                        &nbsp; &nbsp;
                                                                                        <ul class="pagination middle">
                                                                                                <li class="disabled">
                                                                                                        <span>
                                                                                                                <i class="ace-icon fa fa-angle-left bigger-150"></i>
                                                                                                        </span>
                                                                                                </li>

                                                                                                <li>
                                                                                                        <a href="#">
                                                                                                                <i class="ace-icon fa fa-angle-right bigger-150"></i>
                                                                                                        </a>
                                                                                                </li>
                                                                                        </ul>
                                                                                </div>
                                                                        </div>
                                                                        -->
                                                                </div>
                                                        
                                                                

							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div>
<? echo $footer; ?>

<!-- page specific plugin scripts -->
		<script src="/merchant/view/js/bootstrap-tag.min.js"></script>
		<script src="/merchant/view/js/jquery.hotkeys.min.js"></script>
		<script src="/merchant/view/js/bootstrap-wysiwyg.min.js"></script>
		<script src="/merchant/view/js/jquery-ui.custom.min.js"></script>
		<script src="/merchant/view/js/jquery.ui.touch-punch.min.js"></script>
		<script src="/merchant/view/js/jquery.slimscroll.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($){
				//back to message list
				$('.btn-back-message-list').on('click', function(e) {
					e.preventDefault();
					window.history.back();
				});
			});
		</script>
