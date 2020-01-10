<? echo $loginheader; ?>
<form id="validation-form" action="/merchant/register" method="POST">
    <input type="hidden" name="form_action" value="register">
    <div><span>email: </span><input type="text" name="email" value="<? echo $pdata['email']; ?>"></div>
    <div><span>name: </span><input type="text" name="name" value="<? echo $pdata['name']; ?>"></div>
    <div>
        <span>gender: </span>
        <input type="radio" name="gender" value="1" <? echo ($pdata['gender']==1)?"checked":""; ?>>Male
        <input type="radio" name="gender" value="2" <? echo ($pdata['gender']==2)?"checked":""; ?>>Female
    </div>
    <div for="gender" class="help-block" style="display:none;">Please select your gender.</div>
    <div><span>pass: </span><input type="password" name="password" id="password" value="<? echo $pdata['password']; ?>"></div>
    <div><span>retype pass: </span><input type="password" name="password2" value="<? echo $pdata['password2']; ?>"></div>
    <div><span>capcha: </span><input type="text" name="captcha"><img src="/merchant/captcha" alt="" /></div>
    <button>submit</button>
</form>

<? echo $loginfooter; ?>

<!-- page specific plugin scripts -->
		
		<script src="view/js/jquery.validate.min.js"></script>                
		<script src="view/js/jquery.maskedinput.min.js"></script>		

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
                                $.mask.definitions['~']='[+-]';
				$('#phone').mask('(999) 999-9999');
			
				jQuery.validator.addMethod("phone", function (value, element) {
					return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
				}, "Enter a valid phone number.");
			
				$('#validation-form').validate({
					errorElement: 'div',
					errorClass: 'help-block',
					focusInvalid: true,
					rules: {
						email: {
							required: true,
							email:true
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
						phone: {
							required: true,
							phone: 'required'
						},
						url: {
							required: true,
							url: true
						},
						comment: {
							required: true
						},
						date: {
							required: true,
							date: true
						},
						state: {
							required: true
						},
                                                captcha: {
                                                        required: true
                                                },
						platform: {
							required: true
						},
						subscription: {
							required: true
						},
						gender: {
                                                        required: true                                                    
                                                },
						agree: {
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
						$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
					},
			
					success: function (e) {
						$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
						$(e).remove();
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
                                            form.submit();
					},
					invalidHandler: function (form) {
					}
				});
				
				
			})
		</script>
