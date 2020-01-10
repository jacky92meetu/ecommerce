<? echo $header; ?>

                                                        <div class="row">
								<div class="col-xs-12">
                                                                    
                                                                    <div id="main-category" class="widget-box transparent">
                                                                        <div class="widget-body">
                                                                            <div class="widget-main no-padding">
                                                                                <div class="row">
                                                                                    <? 
                                                                                        $col = floor(12 / sizeof($category));                                                                                        
                                                                                        for($i=0; $i<sizeof($category); $i++){
                                                                                            $hide = "hide";                                                                                            
                                                                                            if($i==0){
                                                                                                $hide = "";
                                                                                            }                                                                                            
                                                                                    ?>
                                                                                    <div class="categorygroup col-xs-12 col-sm-<? echo $col; ?> <? echo $hide; ?>">
                                                                                        <div class="widget-box">
                                                                                                <div class="widget-header widget-header-flat widget-header-small">
                                                                                                        <? if($i==0){ ?>
                                                                                                        <h4 class="widget-title text-success">Select a group</h4>
                                                                                                        <? }else{ ?>
                                                                                                        <h4 class="widget-title">
                                                                                                            <div class="hidden-xs">Select a category in</div>
                                                                                                            <div class="text-success pull-left"></div>
                                                                                                        </h4>                                                                                                        
                                                                                                        <? } ?>
                                                                                                        <div class="pull-right hidden-sm hidden-md hidden-lg widget-toolbar hide">
                                                                                                            <a class="category_close" href="javascript:void(0);">
                                                                                                                <i class="ace-icon fa fa-times"></i>
                                                                                                            </a>
                                                                                                        </div>
                                                                                                </div>
                                                                                                <div class="widget-body">
                                                                                                    <div class="widget-main no-padding">
                                                                                                        <? foreach($category[$i] as $key => $value){ ?>
                                                                                                        <div parent_id="<? echo $key; ?>" class="item-list list-group">
                                                                                                            <? foreach($value as $value2){ ?>
                                                                                                            <a href="javascript:void(0);" category_id="<? echo $value2['category_id']; ?>" class="list-group-item"><? echo $value2['name']; ?></a>
                                                                                                            <? } ?>
                                                                                                        </div>
                                                                                                        <? } ?>
                                                                                                    </div>
                                                                                                </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <? } ?>
                                                                                    
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                                                                                                    
								</div>
							</div>
<? echo $footer; ?>

<script>
    jQuery(function($){        
        $('.categorygroup a').click(function(){            
            select_category($(this));
        });
        check_category('<? echo $selected_category; ?>',true);
    });
    
    function check_category(id,display){
        var obj = id;
        if(typeof obj !== 'object'){
            obj = $('.categorygroup a[category_id="'+id+'"]');
            if(obj.length==0){
                $('.categorygroup').first().removeClass('hide').find('.widget-main').removeClass('hidden-xs');                
            }
        }        
        var cur_group = obj.closest('.categorygroup');
        var parent_id = obj.closest('div.list-group').attr('parent_id');
        var next_group = cur_group.next('.categorygroup').first();
        
        obj.closest('div.list-group').removeClass('hide');
        cur_group.removeClass('hide');
        cur_group.find('a').removeClass('active');
        obj.addClass('active');
        
        if(next_group.find('div[parent_id="'+obj.attr('category_id')+'"].list-group').length>0){            
            cur_group.find('.widget-toolbar').removeClass('hide');
            cur_group.find('.widget-main').addClass('hidden-xs');
            next_group.find('.text-success').html(obj.html());
            next_group.find('.list-group').addClass('hide');
            next_group.find('div[parent_id="'+obj.attr('category_id')+'"].list-group').removeClass('hide');
            next_group.removeClass('hide');
            if(!next_group.find('a.active').length){
                next_group.find('.widget-main').removeClass('hidden-xs');
            }            
        }else if(display!==true){            
            window.location.href = "/merchant/product/create?merchant_id=<? echo $this->merchant->getId(); ?>&category_id="+obj.attr('category_id');
        }
        if($('.categorygroup a[category_id="'+parent_id+'"]').length){
            check_category(parent_id);
        }
    }
    
    function select_category(id,display){
        if(typeof id === 'object' && id.hasClass('category_close')){            
            id = id.closest('.categorygroup').prev('.categorygroup').first().find('a.active').attr('category_id');
            display = true;
        }
        
        $('.categorygroup').addClass('hide');
        $('.categorygroup a').removeClass('active');        
        $('.categorygroup .widget-toolbar').addClass('hide');
        
        check_category(id,display);
    }
</script>