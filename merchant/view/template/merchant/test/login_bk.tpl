<? echo $loginheader; ?>
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="position-relative">
								<div id="login-box" class="login-box widget-box no-border <? echo ($pdata['form_action']=='login')?'visible':''; ?>">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-lock green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>

                                                                                        <form class="validation-form" action="/merchant/login" method="POST">
                                                                                            <input type="hidden" name="form_action" value="login">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" name="email" class="form-control" placeholder="Email address" value="<? echo $pdata['email']; ?>"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="loginpassword" class="form-control" placeholder="Password" value="<? echo $pdata['loginpassword']; ?>"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<button class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													forgot password
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border <? echo ($pdata['form_action']=='resetpassword')?'visible':''; ?>">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>
												Enter your email and to receive instructions
											</p>

											<form class="validation-form" action="/merchant/resetpassword" method="POST">
                                                                                            <input type="hidden" name="form_action" value="resetpassword">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="email" class="form-control" placeholder="Email" value="<? echo $pdata['email']; ?>"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Send Me!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border <? echo ($pdata['form_action']=='register')?'visible':''; ?>">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>

											<form class="validation-form" action="/merchant/register" method="POST">
                                                                                            <input type="hidden" name="form_action" value="register">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="email" class="form-control" placeholder="Email"  value="<? echo $pdata['email']; ?>"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="name" class="form-control" placeholder="Fullname"  value="<? echo $pdata['name']; ?>"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
                                                                                                    
                                                                                                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="store_name" class="form-control" placeholder="Your Store Name"  value="<? echo $pdata['store_name']; ?>"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password" id="password" class="form-control" placeholder="Password"  value="<? echo $pdata['password']; ?>"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password2" class="form-control" placeholder="Repeat password"  value="<? echo $pdata['password2']; ?>"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" name="agree" id="agree" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>                                                                                                                
													</label>
                                                                                                    
													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Register</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Back to login
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->

<? echo $loginfooter; ?>

<!-- page specific plugin scripts -->
		
		<script src="/merchant/view/js/jquery.validate.min.js"></script>
                                
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
                                $(target).find('input[type!=hidden]').first().focus();
			 });
			});
		</script>
                
                <script type="text/javascript">
			jQuery(function($) {                                
                                $('form.validation-form').each(function(){                                    
                                    $(this).validate({
                                            ignore:'',
                                            errorElement: 'div',
                                            errorClass: 'help-block',
                                            focusInvalid: true,
                                            rules: {
                                                    username: {
                                                            required: true
                                                    },
                                                    email: {
                                                            required: true,
                                                            email:true
                                                    },
                                                    loginpassword: {
                                                            required: true
                                                    },
                                                    password: {
                                                            required: true,
                                                            minlength: 6
                                                    },
                                                    password2: {
                                                            required: true,							
                                                            equalTo: "#password"
                                                    },
                                                    name: {
                                                            required: true,
                                                            minlength: 6
                                                    },
                                                    store_name: {
                                                            required: true,
                                                            minlength: 6
                                                    },
                                                    captcha: {
                                                            required: true
                                                    },
                                                    gender: {
                                                            required: true                                                    
                                                    },
                                                    agree: {
                                                            required: true
                                                    },
                                                    agree2: {
                                                            required: true
                                                    }
                                            },

                                            messages: {
                                                    email: {
                                                            required: "Please provide a valid email.",
                                                            email: "Please provide a valid email."
                                                    },
                                                    password: {
                                                            required: "Please specify a password.",
                                                            minlength: "Please specify a minimum 6 characters password."
                                                    },
                                                    subscription: "Please choose at least one option",
                                                    gender: "Please choose gender",
                                                    agree: "Please accept our policy"
                                            },


                                            highlight: function (e) {
                                                    $(e).closest('label').addClass('has-error');
                                            },

                                            success: function (e) {
                                                    $(e).closest('label').removeClass('has-error');                                                    
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
