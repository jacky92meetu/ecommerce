<? echo $loginheader; ?>
    <div class="container container-fluid fullwidth">
        <div class="row">
            <div class="header">
                <div class="logo"><img src="/merchant/view/images/login_images/logo_ubib.png" /></div>
                <section>
                    <h1 class="hidden-xs">"We Want Your Stock"</h1>
                    <h2>Malaysia's Premier Platform for Merchant</h2>
                </section>
            </div>
        </div>
    </div>
    
    <div class="container container-fluid">
        <div class="row">
            <div class="widget-box main-login transparent">
                <div class="widget-body">                       
                    <div class="widget-main">
                        
                        <div class="flat-form">
                            
                            <div class="row">                                
                                
                                <div id="login" class="form-action">
                                    <h1>Reset Your Password Now!</h1>

                                    <form class="validation-form" action="/merchant/resetpassword" method="POST">
                                        <input type="hidden" name="form_action" value="resetpassword">
                                        <input type="hidden" name="code" value="<? echo $pdata['code']; ?>">
                                        <input type="hidden" name="email" value="<? echo $pdata['email']; ?>">
                                        <ul>
                                            <li>
                                                <label>
                                                    <span>
                                                        Email Address
                                                        <input type="text" class="form-control disabled" value="<? echo $pdata['email']; ?>" DISABLED="DISABLED" READONLY="READONLY" />
                                                    </span>                                
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <span>
                                                        Password
                                                        <input type="text" id="new_password" name="new_password" class="form-control" placeholder="Your New Password" />
                                                    </span>                                
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <span>
                                                        Confirm Password
                                                        <input type="text" name="new_password2" class="form-control" placeholder="Confirm New Password" />
                                                    </span>                                
                                                </label>
                                            </li>                        
                                            <li>
                                                <input type="submit" value="Reset Now" class="button" />
                                            </li>
                                        </ul>
                                    </form>
                                </div>

                            </div>
                        
                            <div class="row">
                                <div class="footer-link">Powered by <a href="http://www.hulala.com.my" target="_blank">Hulala Malaysia</a></div>
                            </div>
                        
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

<? echo $loginfooter; ?>

<!-- page specific plugin scripts -->
		
		<script src="/merchant/view/js/jquery.validate.min.js"></script>
                                
		<!-- inline scripts related to this page -->
                <script type="text/javascript">
			jQuery(function($) {                                
                                $('form.validation-form').each(function(){                                    
                                    $(this).validate({
                                            ignore:'',
                                            errorElement: 'div',
                                            errorClass: 'help-block',
                                            focusInvalid: true,
                                            rules: {                                                    
                                                    old_password: {
                                                            required: true
                                                    },
                                                    new_password: {
                                                            required: true,
                                                            minlength: 6
                                                    },
                                                    new_password2: {
                                                            required: true,							
                                                            equalTo: "#new_password"
                                                    }
                                            },

                                            messages: {
                                                    old_password: {
                                                            required: "Please provide your old password"
                                                    },
                                                    new_password: {
                                                            required: "Please specify a password.",
                                                            minlength: "Please specify a minimum 6 characters password."
                                                    }
                                            },

                                            highlight: function (e) {
                                                    $(e).closest('label').addClass('has-error');
                                            },

                                            success: function (e) {
                                                    $(e).closest('label').removeClass('has-error');                                                    
                                            },

                                            errorPlacement: function (error, element) {
                                                    if(element.is(':checkbox') || element.is(':radio')) {
                                                            error.insertAfter(element.parent());
                                                    }                                                    
                                                    else error.insertBefore(element.parent());
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
                        
                        jQuery(function($){
                            $('[data-rel="tooltip"]').tooltip();
                        });
		</script>
