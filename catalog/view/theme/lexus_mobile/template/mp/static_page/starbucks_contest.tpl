<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>  

<div class="col-xs-12">
    <link href="/page/starbucks_stylesheet.css" rel="stylesheet" />
    <link href="/catalog/view/theme/lexus_mobile/stylesheet/stylesheet.css" rel="stylesheet">

    <div class="promotion_popup_container" style="padding:20px 0;">
        <div class="starbucks_contest">

            <div class="starbucks_contest_like">
                <img src="/page/images/pop-up-contest_03.png">
            </div>
            <div class="content">
                <div class="intro1"> <h4>Ubib is Giving Away Fantastic Prizes!</h4></div>
                <div class="intro2"> <h3>Stand A Chance to Win RM30 Starbucks Card &amp; An iPhone 6 Plus!</h3></div>

                <div class="input_container">
                    <div class="input"> 
                        <input class="email_field" type="email" id="email" placeholder="Email Address" autocomplete="off">
                    </div>
                    <div class="formBtns">
                        <button class="btn join_btn" type="button">JOIN NOW</button>
                    </div>
                </div>

                <div class="response_container">
                    Thanks you for joining this contest. Please share this contest to your friends to double up your winning chance.
                </div>
            </div>
            <div class="horizontal-line"></div>
            <div class="content">                      
                <div class="facebook_like_btn">
                    <div class="description"></div>
                    <div class="facebook_image"><img class="img-responsive" src="/page/images/facebook_small.png"></div>                        
                    <div class="fb-like">
                        <a href="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.ubib.my%2Fmp%2Flink%3Flink_id%3D102','sharer','toolbar=0,status=0,width=626,height=436');" target="_blank" ><span class="fa fa-facebook-square"></span>Share</a>
                    </div>                    
                </div>

                <div class="policy">
                    By clicking "Join Now". You Accept Our <a href="/mp/link?link_id=24&category_id=&merchant_id=">Privacy Policy</a>.
                </div>
            </div>

        </div>
    </div>
    
    <div class="space-12"></div>
</div>

<?php echo $footer; ?>

<script type="text/javascript">
    jQuery(function($){        
        $('.promotion_popup_container .join_btn').click(function(e){
            e.preventDefault();
            if(!$('.promotion_popup_container .email_field').val().length){
                bootbox.alert("Please fill in the email!");
                return false;
            }                
            ubib_ajax($(this),"/module/merchant/promotion_subscribe",{'promotion_title':'starbucks_contest','email':$(this).parent().parent().find('#email').val()},function(){
                $('.promotion_popup_container .input_container').hide();
                $('.promotion_popup_container .response_container').show();                    
            },"Fail to subscribe Newsletter!");
        });
    });
</script>