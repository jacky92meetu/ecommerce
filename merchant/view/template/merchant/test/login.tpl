<? echo $loginheader; ?>

	<div class="header">
	<div class="logo"><img src="/merchant/view/images/login_images/logo_ubib.png" /></div>
    	<section><h1>"We Want Your Stock"</h1><h2>Malaysia's Premier Platform for Merchant</h2></section>
	</div>
    
    <div class="container">
    	
        <div class="flat-form">
        
        
            <ul class="tabs">
                <li>
                    <a href="#register" class="active">Register</a>
                </li>
                <li>
                    <a href="#login">Login</a>
                </li>
                <li>
                    <a href="#reset">Reset Password</a>
                </li>
            </ul>
          <div id="register" class="form-action show">
                <h1>Register</h1>
                <p>
                    You should totally sign up for our super awesome service.
                    It's what all the cool kids are doing nowadays.
                </p>
                <form class="validation-form" action="/merchant/register" method="POST">
                    <input type="hidden" name="form_action" value="register">
                    <ul>
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="text" name="email" placeholder="Email" value="<? echo $pdata['email']; ?>" />
                                </span>                                
                            </label>
                        </li>
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="text" name="name" placeholder="Full name" value="<? echo $pdata['name']; ?>" />
                                </span>                                
                            </label>
                        </li>
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="text" name="store_name" placeholder="Your store name" value="<? echo $pdata['store_name']; ?>" />
                                </span>                                
                            </label>
                        </li>
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="password" name="password" placeholder="Password" value="<? echo $pdata['password']; ?>" />
                                </span>                                
                            </label>
                        </li>                        
                        <p>
                            <label>
                                <span>
                                    <input type="checkbox" name="know_more" value="1" />
                                    <span class="lbl">
                                        Yes, I want to know more, contact me.
                                    </span>
                                </span>                                
                            </label>
                        </p>
                        <p>
                            <label>
                                <span>
                                    <input type="checkbox" name="agree" id="agree" />
                                    <span class="lbl">
                                        I have read <a href="/page/policy.html">Private Policy</a>
                                    </span>
                                </span>                                
                            </label>
                        </p>                        
                        <li>
                            <input type="submit" value="Sign Up" class="button" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#register.form-action-->
            <div id="login" class="form-action hide">
                <h1>FREE for Limited time only!</h1>
                
                <form class="validation-form" action="/merchant/login" method="POST">
                    <input type="hidden" name="form_action" value="login">
                    <ul>                        
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="text" name="email" placeholder="Email" value="<? echo $pdata['email']; ?>" />
                                </span>                                
                            </label>
                        </li>
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="password" name="loginpassword" placeholder="Password" value="<? echo $pdata['loginpassword']; ?>" />
                                </span>                                
                            </label>
                        </li>                        
                        <li>
                            <input type="submit" value="Login" class="button" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#login.form-action-->
            
            <div id="reset" class="form-action hide">
                <h1>Reset Password</h1>
                <p>
                    To reset your password enter your email
                    and we'll send you a link to reset your password.
                </p>
                <form class="validation-form" action="/merchant/resetpassword/sendmail" method="POST">
                    <input type="hidden" name="form_action" value="resetpassword">
                    <ul>
                        <li>
                            <label>
                                <span>
                                    <input class="form-control" type="text" name="email" placeholder="Email" value="<? echo $pdata['email']; ?>" />
                                </span>                                
                            </label>
                        </li>                      
                        <li>
                            <input type="submit" value="Send" class="button" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#register.form-action-->
            
            <div class="footer-link">Powered by <a href="http://www.hulala.com.my" target="_blank">Hulala Malaysia</a></div>
        </div>        
    </div>

<? echo $loginfooter; ?>

<!-- page specific plugin scripts -->
		
		<script src="/merchant/view/js/jquery.validate.min.js"></script>
                                
		<!-- inline scripts related to this page -->
                <script type="text/javascript">
                        jQuery(function($){
                            // constants
                            var SHOW_CLASS = 'show',
                                HIDE_CLASS = 'hide',
                                ACTIVE_CLASS = 'active';

                            $( '.tabs' ).on( 'click', 'li a', function(e){
                              e.preventDefault();
                              var $tab = $( this ),
                                   href = $tab.attr( 'href' );

                               $( '.active' ).removeClass( ACTIVE_CLASS );
                               $tab.addClass( ACTIVE_CLASS );
                                /*
                               $( '.show' )
                                  .removeClass( SHOW_CLASS )
                                  .addClass( HIDE_CLASS )
                                  .hide();

                                $(href)
                                  .removeClass( HIDE_CLASS )
                                  .addClass( SHOW_CLASS )
                                  .hide()
                                  .fadeIn( 550 );
                                */
                                $(href).parent().children('div.form-action:visible')
                                  .removeClass( SHOW_CLASS )
                                  .addClass( HIDE_CLASS )
                                  .hide();

                                $(href)
                                  .removeClass( HIDE_CLASS )
                                  .addClass( SHOW_CLASS )
                                  .show();
                            });
                        });
                    
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
		</script>
