
/**
 * sidebarEffects.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
 var SidebarMenuEffects = (function() {

    function hasParentClass( e, classname ) {
        if(e === document) return false;
        if( classie.has( e, classname ) ) {
            return true;
        }
        return e.parentNode && hasParentClass( e.parentNode, classname );
    }

    // http://coveroverflow.com/a/11381730/989439
    function mobilecheck() {
        var check = false;
        (function(a){if(/(android|ipad|playbook|silk|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
        return check;
    }

    function init() {
        
        $(document).ready( function(){

            var $mcontent = $('#pav-mainnav .navbar .navbar-nav');
            var $btn = $(".navbar-header .navbar-toggle");
            var effect = 5;

            var $offcmenu = $('<nav id="menu-offcanvas" class="offcanvas-menu offcanvas-effect-'+effect+' hidden-lg"><div class="menu-offcanvas-inner"></div></nav>');
            $(".menu-offcanvas-inner", $offcmenu ).append( $mcontent.clone() );

            $("body").append( $offcmenu ); 
             $(".navbar-nav", $offcmenu  ).removeClass("navbar-nav").removeClass("nav").addClass("menu-offcanvas-content");


             var eventtype = mobilecheck() ? 'touchstart' : 'click';  
                $($btn).bind( eventtype, function(e){  
                $("#offcanvas-container").toggleClass(  "offcanvas-menu-open" ).addClass( "offcanvas-effect-"+effect );
               
                 
                $("#page").bind( eventtype , function (){
                    $("#offcanvas-container").toggleClass(  "offcanvas-menu-open" );
                    $("#page").unbind( eventtype );
                } ); 
                e.stopPropagation();       
               return false;
            } );
        } );    
    }
    init();
})();

/* Offcanvas Sidebars */
$(document).ready( function (){  
    if( $("#columns").hasClass("offcanvas-siderbars") ) { 
        $('.offcanvas-sidebars-buttons button').hide();
        $( ".sidebar" ).parent().parent().find("section").addClass("main-column");
        $( ".sidebar" ).each( function(){ 
            $('[data-for="'+$(this).attr("id")+'"]').show();
            $(this).parent().attr("id","oc-"+$(this).attr("id") ).addClass("offcanvas-sidebar");
        } );
        $(".offcanvas-sidebars-buttons button").bind( "click", function(){
            if( $(this).data("for") == "column-right" ){
                 $(".offcanvas-siderbars").removeClass("column-left-active");
            }else {
                 $(".offcanvas-siderbars").removeClass("column-right-active");
            }
            $(".offcanvas-siderbars").toggleClass( $(this).data("for")+"-active" );
            $("#oc-"+$(this).data("for") ).toggleClass("canvas-show");
        } );
     }   
} ); 

$(window).ready( function(){
	/*  Fix First Click Menu */
	$(document.body).on('click', '.navbar-header [data-toggle="dropdown"]' ,function(){
		if(!$(this).parent().hasClass('open') && this.href && this.href != '#'){
			window.location.href = this.href;
		}

	});
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$(".quantity-adder .add-action").click( function(){
		if( $(this).hasClass('add-up') ) {  
			$("[name=quantity]",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) + 1 );
		}else {
			if( parseInt($("[name=quantity]",'.quantity-adder').val())  > 1 ) {
				$("input",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) - 1 );
			}
		}
	} );

} );

/*Adjustment*/
jQuery(function($){
    jQuery('.cart > a').addClass('fa fa-shopping-cart');
    jQuery('.compare').remove();
    jQuery('.product-filter .display').remove();
    jQuery('.image > a.product-zoom').remove();
});

/*Bootstrap carousel resize auto adjust*/
jQuery(function($){
    function create_carousel(){        
        $('div.javascript-carousel').each(function(){
            var size = $(this).outerWidth();
            if(size<=0){
                size = $(window).width();
            }
            var datalength = 2;
            var classlist = "col-xs-6 col-sm-3";
            if($(this).hasClass('fixed-1')){
                datalength = 1;
                classlist = "col-xs-12";
            }else if($(this).hasClass('fixed-2')){
                datalength = 2;
                classlist = "col-xs-6";
            }else if($(this).hasClass('fixed-3')){
                datalength = 3;
                classlist = "col-xs-4";
            }else if($(this).hasClass('fixed-4')){
                datalength = 4;
                classlist = "col-xs-3";
            }else{
                if(size>=1200){
                    datalength = 4;
                    classlist = "col-xs-6 col-sm-3";
                }else if(size>=980){
                    datalength = 4;
                    classlist = "col-xs-6 col-sm-3";
                }else if(size>=768){
                    datalength = 3;
                    classlist = "col-xs-6 col-sm-3";
                }else if(size>=480){
                    datalength = 3;
                    classlist = "col-xs-4 col-sm-4";
                }
            }
            var firstitem = 0;
            $(this).removeClass('carousel slide').addClass('carousel slide').attr('data-ride','carousel');
            var $id = $(this).attr('id');
            var $temp = $('<div class="carousel-inner"></div>');
            while($(this).find("div.javascript-carousel-item").length>0){            
                var $temp3 = $('<div class="row"></div>');
                var $temp4 = $('<div class="item"></div>');
                if(firstitem==0){
                    $temp4.addClass('active');
                    firstitem = 1;
                }
                $(this).find("div.javascript-carousel-item:lt("+datalength+")").each(function(){
                    var $temp2 = $('<div class="'+classlist+'"></div>');
                    $(this).appendTo($temp2);
                    $temp2.appendTo($temp3);
                });            
                $temp3.appendTo($temp4);
                $temp4.appendTo($temp);
            }
            $(this).find('.carousel-inner, .carousel-control').remove();
            $(this).append($temp);
            $(this).append('<a class="left carousel-control" href="#'+$id+'" role="button" data-slide="prev"><span class="fa fa-chevron-left"></span></a><a class="right carousel-control" href="#'+$id+'" role="button" data-slide="next"><span class="fa fa-chevron-right"></span></a> ');
            $(this).carousel();
        });
    }
    $(window).resize(function(){
        create_carousel();
    });
    create_carousel();
});

if(typeof ubib_ajax === 'undefined'){
    function ubib_ajax(obj,url,data,success,fail){
        obj = $(obj);
        obj.addClass("disabled").attr("disabled","disabled");        
        $obj = $.ajax({
            type: 'POST',
            url: url,
            data: data,
            complete: function(xhr,status){
                obj.removeClass("disabled").removeAttr("disabled");
            },
            success: function(data,status,xhr){
                var msg = [];
                obj.removeClass("disabled").removeAttr("disabled");
                try{
                    data = JSON.parse(data);
                }catch(e){
                    data = {};
                    msg[msg.length] = "Submission Error!";
                }
                if(typeof data.text === 'string' && data.text.length>0){
                    msg[msg.length] = data.text;
                }
                if(typeof data.status === 'string' && data.status=="success"){
                    if(typeof success === 'function'){
                        success();
                    }else if(typeof success === 'string'){                        
                        msg[msg.length] = success;
                    }
                }else{
                    if(typeof fail === 'function'){
                        fail();
                    }else if(typeof fail === 'string'){                        
                        msg[msg.length] = fail;
                    }
                }
                if(msg.length>0){                    
                    if(typeof bootbox === 'object'){
                        msg = msg.join("<br><br>");
                        bootbox.alert(msg);
                    }else{
                        msg = msg.join("\n\n");
                        alert(msg);
                    }
                }
            }
        });
    }
}

/*Newsletter Subscribe Function*/
jQuery(function($){
    $('.newsletter_subscribe_btn').click(function(e){
        e.preventDefault();
        ubib_ajax($(this),"/module/merchant/newsletter_subscribe",{'subscribe_email':$(this).parent().parent().find('#newsletter_email').val()},"Newsletter subscribed!","Fail to subscribe Newsletter!");
    });
});

/*Starbucks Popup*/
jQuery(function($){
    if(window.location.hash=="#starbucks_contest" || typeof $.cookie('starbucks_popup')==='undefined'|| typeof $.cookie('starbucks_popup')!=='string'){
        $.removeCookie('starbucks_popup');
        $.cookie('starbucks_popup', '0', { domain:'.ubib.my', path: '/', expires: 1 });
        var div = $('<div class="starbucks_modal"></div>').appendTo('body');
        div.load("/page/starbucks_popup.html",function(){
            div.find('.promotion_popup_container .join_btn').click(function(e){
                e.preventDefault();
                if(!div.find('.promotion_popup_container .email_field').val().length){
                    bootbox.alert("Please fill in the email!");
                    return false;
                }                
                ubib_ajax($(this),"/module/merchant/promotion_subscribe",{'promotion_title':'starbucks_contest','email':$(this).parent().parent().find('#email').val()},function(){
                    div.find('.promotion_popup_container .input_container').hide();
                    div.find('.promotion_popup_container .response_container').show();                    
                },"Fail to subscribe Newsletter!");
            });

    //        FB.Event.subscribe('edge.create', function(url, html_element){
    //            console.log("facebook like button clicked");
    //        });
            div.find('.modal').modal('show');
        });
    }
    
});