<? echo $header; ?>
                                            <div class="row">                                                                                           
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
                                                                <div class="message-container">
                                                                        <div id="id-message-list-navbar" class="message-navbar clearfix">
                                                                                <div class="message-bar">
                                                                                        <div class="message-infobar" id="id-message-infobar">
                                                                                                <span class="blue bigger-150">Message List</span>
                                                                                                <span class="grey bigger-110"><? echo "(".$message_count." unread message)"; ?></span>
                                                                                        </div>
                                                                                        <!--
                                                                                        <div class="message-toolbar hide">
                                                                                                <button type="button" class="btn btn-xs btn-white btn-primary">
                                                                                                        <i class="ace-icon fa fa-trash-o bigger-125 orange"></i>
                                                                                                        <span class="bigger-110">Delete</span>
                                                                                                </button>
                                                                                        </div>
                                                                                        -->
                                                                                </div>

                                                                                <div>
                                                                                        <div class="messagebar-item-left">
                                                                                                <label class="inline middle">
                                                                                                        <input type="checkbox" id="id-toggle-all" class="ace">
                                                                                                        <span class="lbl"></span>
                                                                                                </label>

                                                                                                &nbsp;
                                                                                                <div class="inline position-relative">
                                                                                                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                                                                                                                <i class="ace-icon fa fa-caret-down bigger-125 middle"></i>
                                                                                                        </a>

                                                                                                        <ul class="dropdown-menu dropdown-lighter dropdown-100">
                                                                                                                <li>
                                                                                                                        <a id="id-select-message-all" href="#">All</a>
                                                                                                                </li>

                                                                                                                <li>
                                                                                                                        <a id="id-select-message-none" href="#">None</a>
                                                                                                                </li>

                                                                                                                <li class="divider"></li>

                                                                                                                <li>
                                                                                                                        <a id="id-select-message-unread" href="#">Unread</a>
                                                                                                                </li>

                                                                                                                <li>
                                                                                                                        <a id="id-select-message-read" href="#">Read</a>
                                                                                                                </li>
                                                                                                        </ul>
                                                                                                </div>
                                                                                        </div>
                                                                                        <!--
                                                                                        <div class="messagebar-item-right">
                                                                                                <div class="inline position-relative">
                                                                                                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                                                                                                                Sort &nbsp;
                                                                                                                <i class="ace-icon fa fa-caret-down bigger-125"></i>
                                                                                                        </a>

                                                                                                        <ul class="dropdown-menu dropdown-lighter dropdown-menu-right dropdown-100">
                                                                                                                <li>
                                                                                                                        <a href="#">
                                                                                                                                <i class="ace-icon fa fa-check green"></i>
                                                                                                                                Date
                                                                                                                        </a>
                                                                                                                </li>

                                                                                                                <li>
                                                                                                                        <a href="#">
                                                                                                                                <i class="ace-icon fa fa-check invisible"></i>
                                                                                                                                From
                                                                                                                        </a>
                                                                                                                </li>

                                                                                                                <li>
                                                                                                                        <a href="#">
                                                                                                                                <i class="ace-icon fa fa-check invisible"></i>
                                                                                                                                Subject
                                                                                                                        </a>
                                                                                                                </li>
                                                                                                        </ul>
                                                                                                </div>
                                                                                        </div>
                                                                                        
                                                                                        <div class="nav-search minimized">
                                                                                                <form class="form-search">
                                                                                                        <span class="input-icon">
                                                                                                                <input type="text" autocomplete="off" class="input-small nav-search-input" placeholder="Search inbox ...">
                                                                                                                <i class="ace-icon fa fa-search nav-search-icon"></i>
                                                                                                        </span>
                                                                                                </form>
                                                                                        </div>
                                                                                        -->
                                                                                </div>
                                                                        </div>

                                                                        <div class="message-list-container">
                                                                            <div class="message-list" id="message-list">                                                                                
                                                                            <? foreach($message_list as $key => $value){ ?>
                                                                                    <div class="message-item <? echo ($value['status']=='' || (int)$value['status']==0)?"message-unread":""; ?>">
                                                                                            <label class="inline">
                                                                                                    <input type="checkbox" class="ace">
                                                                                                    <span class="lbl"></span>
                                                                                            </label>

                                                                                            <span class="sender" title="System Message">System Message</span>
                                                                                            <span class="time width-20 text-right"><? echo date("d M Y H:i",strtotime($value['date_added'])); ?></span>

                                                                                            <a href="/merchant/message/view?id=<? echo $value['id']; ?>" class="summary">
                                                                                                    <span class="text">
                                                                                                            <? echo $value['title']; ?>
                                                                                                    </span>
                                                                                            </a>
                                                                                    </div>                                                                                
                                                                                <? } ?>
                                                                                </div>
                                                                        </div>

                                                                        <div class="message-footer clearfix">
                                                                                <div class="pull-left"> <? echo $message_count; ?> message(s) total </div>
                                                                                
                                                                                <div class="pull-right">
                                                                                        <div class="inline middle"> page 1 of 1 </div>

                                                                                        &nbsp; &nbsp;
                                                                                        <ul class="pagination middle">
                                                                                                <li class="disabled">
                                                                                                        <span>
                                                                                                                <i class="ace-icon fa fa-step-backward middle"></i>
                                                                                                        </span>
                                                                                                </li>

                                                                                                <li class="disabled">
                                                                                                        <span>
                                                                                                                <i class="ace-icon fa fa-caret-left bigger-140 middle"></i>
                                                                                                        </span>
                                                                                                </li>

                                                                                                <li>
                                                                                                        <span>
                                                                                                                <input value="1" maxlength="3" type="text">
                                                                                                        </span>
                                                                                                </li>

                                                                                                <li class="disabled">
                                                                                                        <a href="#">
                                                                                                                <i class="ace-icon fa fa-caret-right bigger-140 middle"></i>
                                                                                                        </a>
                                                                                                </li>

                                                                                                <li class="disabled">
                                                                                                        <a href="#">
                                                                                                                <i class="ace-icon fa fa-step-forward middle"></i>
                                                                                                        </a>
                                                                                                </li>
                                                                                        </ul>
                                                                                </div>
                                                                        </div>
                                                                </div>
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
											
				//basic initializations
				$('.message-list .message-item input[type=checkbox]').removeAttr('checked');
				$('.message-list').on('click', '.message-item input[type=checkbox]' , function() {
					$(this).closest('.message-item').toggleClass('selected');
					if(this.checked) Inbox.display_bar(1);//display action toolbar when a message is selected
					else {
						Inbox.display_bar($('.message-list input[type=checkbox]:checked').length);
						//determine number of selected messages and display/hide action toolbar accordingly
					}		
				});			
			
				//check/uncheck all messages
				$('#id-toggle-all').removeAttr('checked').on('click', function(){
					if(this.checked) {
						Inbox.select_all();
					} else Inbox.select_none();
				});
				
				//select all
				$('#id-select-message-all').on('click', function(e) {
					e.preventDefault();
					Inbox.select_all();
				});
				
				//select none
				$('#id-select-message-none').on('click', function(e) {
					e.preventDefault();
					Inbox.select_none();
				});
				
				//select read
				$('#id-select-message-read').on('click', function(e) {
					e.preventDefault();
					Inbox.select_read();
				});
			
				//select unread
				$('#id-select-message-unread').on('click', function(e) {
					e.preventDefault();
					Inbox.select_unread();
				});			
				
				var Inbox = {
					//displays a toolbar according to the number of selected messages
					display_bar : function (count) {
						if(count == 0) {
							$('#id-toggle-all').removeAttr('checked');
							$('#id-message-list-navbar .message-toolbar').addClass('hide');
							$('#id-message-list-navbar .message-infobar').removeClass('hide');
						}
						else {
							$('#id-message-list-navbar .message-infobar').addClass('hide');
							$('#id-message-list-navbar .message-toolbar').removeClass('hide');
						}
					}
					,
					select_all : function() {
						var count = 0;
						$('.message-item input[type=checkbox]').each(function(){
							this.checked = true;
							$(this).closest('.message-item').addClass('selected');
							count++;
						});
						
						$('#id-toggle-all').get(0).checked = true;
						
						Inbox.display_bar(count);
					}
					,
					select_none : function() {
						$('.message-item input[type=checkbox]').removeAttr('checked').closest('.message-item').removeClass('selected');
						$('#id-toggle-all').get(0).checked = false;
						
						Inbox.display_bar(0);
					}
					,
					select_read : function() {
						$('.message-unread input[type=checkbox]').removeAttr('checked').closest('.message-item').removeClass('selected');
						
						var count = 0;
						$('.message-item:not(.message-unread) input[type=checkbox]').each(function(){
							this.checked = true;
							$(this).closest('.message-item').addClass('selected');
							count++;
						});
						Inbox.display_bar(count);
					}
					,
					select_unread : function() {
						$('.message-item:not(.message-unread) input[type=checkbox]').removeAttr('checked').closest('.message-item').removeClass('selected');
						
						var count = 0;
						$('.message-unread input[type=checkbox]').each(function(){
							this.checked = true;
							$(this).closest('.message-item').addClass('selected');
							count++;
						});
						
						Inbox.display_bar(count);
					}
				}
                                
			});
		</script>
