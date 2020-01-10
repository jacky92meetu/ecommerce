<? echo $header; ?>

                                                        <div class="row">
								<div class="col-xs-12">
                                                                    
                                                                    <div id="main-category" class="widget-box transparent">
                                                                        <div class="widget-body">
                                                                            <div class="widget-main no-padding">
                                                                                <div class="row">
                                                                                    
                                                                                    <div id="category1" class="categorygroup col-xs-12 col-sm-4">
                                                                                        <div class="widget-box">
                                                                                                <div class="widget-header widget-header-flat widget-header-small">
                                                                                                    <h4 class="widget-title text-success hidden-xs">Select a group</h4>
                                                                                                    <h4 class="widget-title text-success hidden-sm hidden-md hidden-lg">Select a group</h4>
                                                                                                    <div class="pull-right hidden-sm hidden-md hidden-lg widget-toolbar hide">
                                                                                                        <a class="category_close" href="javascript:void(0);">
                                                                                                            <i class="ace-icon fa fa-times"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="widget-body">
                                                                                                    <div class="widget-main no-padding">
                                                                                                        
                                                                                                        <div category_id="0" parent_id="0" class="item-list list-group">
                                                                                                            <? foreach($category as $key => $value){ ?>
                                                                                                            <a href="javascript:void(0);" category_id="<? echo $value['category_id']; ?>" class="list-group-item"><? echo $value['name']; ?></a>
                                                                                                            <? } ?>
                                                                                                        </div>
                                                                                                        
                                                                                                    </div>
                                                                                                </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div id="category1-1" class="categorygroup col-xs-12 col-sm-4 hide">
                                                                                        <div class="widget-box">
                                                                                                <div class="widget-header widget-header-flat widget-header-small">
                                                                                                        <h4 class="widget-title hidden-xs">
                                                                                                            Select a category in
                                                                                                            <div class="text-success">testing</div>
                                                                                                        </h4>
                                                                                                        <h4 class="widget-title hidden-sm hidden-md hidden-lg">Select a category</h4>
                                                                                                        <div class="pull-right hidden-sm hidden-md hidden-lg widget-toolbar hide">
                                                                                                            <a class="category_close" href="javascript:void(0);">
                                                                                                                <i class="ace-icon fa fa-times"></i>
                                                                                                            </a>
                                                                                                        </div>
                                                                                                </div>

                                                                                                <div class="widget-body">
                                                                                                    <div class="widget-main no-padding">
                                                                                                        <? 
                                                                                                            foreach($category as $key => $value){ 
                                                                                                                if(is_array($value['sub_category']) && sizeof($value['sub_category'])>0){
                                                                                                        ?>
                                                                                                        <div category_id="<? echo $value['category_id']; ?>" parent_id="<? echo $value['parent_id']; ?>" class="item-list list-group">
                                                                                                            <? foreach($value['sub_category'] as $key2 => $value2){ ?>
                                                                                                            <a href="javascript:void(0);" category_id="<? echo $value2['category_id']; ?>" class="list-group-item"><? echo $value2['name']; ?></a>
                                                                                                            <? } ?>                                                                                                            
                                                                                                        </div>
                                                                                                        <?      }
                                                                                                            } ?>
                                                                                                    </div>
                                                                                                </div>
                                                                                        </div>
                                                                                    </div>                                                                                    
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
                return false;
            }
        }        
        var cur_group = obj.closest('.categorygroup');
        var parent_id = obj.closest('div[category_id].list-group').attr('category_id');
        var next_group = cur_group.next('.categorygroup').first();        
        
        obj.closest('div.list-group').removeClass('hide');
        cur_group.removeClass('hide');
        cur_group.find('a').removeClass('active');
        obj.addClass('active');
        
        if(next_group.find('div[category_id="'+obj.attr('category_id')+'"].list-group').length>0){
            cur_group.find('.widget-title.hidden-sm').html(obj.html());
            cur_group.find('.widget-toolbar').removeClass('hide');
            cur_group.find('.widget-main').addClass('hidden-xs');
            next_group.find('.text-success').html(obj.html());
            next_group.find('.list-group').addClass('hide');
            next_group.find('div[category_id="'+obj.attr('category_id')+'"].list-group').removeClass('hide');
            next_group.find('.widget-toolbar').addClass('hide');
            next_group.removeClass('hide');            
        }else if(display!==true){
            window.location.href = "/merchant/product/create?category_id="+obj.attr('category_id');
        }
        if($('.categorygroup a[category_id="'+parent_id+'"]').length){
            check_category(parent_id);
        }
    }
    
    function select_category(id,display){
        $('.categorygroup').addClass('hide');        
        
        if(typeof id === 'object' && id.hasClass('category_close')){            
            id.closest('.categorygroup').each(function(){
                $(this).removeClass('hide');                
                $(this).find('.widget-main').removeClass('hidden-xs');
                $(this).find('.widget-title.hidden-sm').html($(this).find('.widget-title.hidden-xs').html());
                $(this).find('.widget-toolbar').addClass('hide');
            });
            return;
        }
        
        check_category(id,display);
    }
</script>