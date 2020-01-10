<? echo $header; ?>            
<div class="row">
    <div class="col-xs-12">
        
        
        
        <div class="widget-box transparent">
            <div class="table-header">
                Results for "<? echo $report_title; ?>"
            </div>
            
            <div>
                <div class="dataTables_wrapper form-inline" role="grid">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6"><div class="dataTables_length"><label>Display 
                                    <select size="1" class="table_limit">
                                        <? 
                                            $option_list = array("10","25","50","100");
                                            foreach($option_list as $option){
                                                $selected = "";
                                                if(isset($data_list['filter']['limit']) && $data_list['filter']['limit']==$option){
                                                    $selected = 'selected="selected"';
                                                }                                            
                                        ?>
                                        <option value="<? echo $option; ?>" <? echo $selected; ?>><? echo $option; ?></option>
                                        <? } ?>                                    
                                    </select> records</label></div></div>
                        <div class="col-xs-12 visible-xs"><div class="dataTables_length">
                                <label>Sort By 
                                    <select size="1" class="table_sort_name">
                                        <option value=""> Default </option>
                                        <?
                                            foreach($data_header as $key => $value){
                                                if(!isset($value['no_filter'])){
                                                    $selected = "";
                                                    if(isset($data_list['filter']['order']) && array_key_exists($key, $data_list['filter']['order'])!==FALSE){
                                                        $selected = 'selected="selected"';
                                                    }                                            
                                        ?>
                                        <option value="<? echo $key; ?>" <? echo $selected; ?>><? echo $value['display_name']; ?></option>
                                        <?      
                                                }
                                            }
                                        ?>                                    
                                    </select>
                                    <select size="1" class="table_sort_order">
                                        <? 
                                            $option_list = array("asc"=>"Ascending","desc"=>"Descending");
                                            foreach($option_list as $key => $value){
                                                $selected = "";
                                                if(isset($data_list['filter']['order']) && array_search($key, $data_list['filter']['order'])!==FALSE){
                                                    $selected = 'selected="selected"';
                                                }
                                        ?>
                                        <option value="<? echo $key; ?>" <? echo $selected; ?>><? echo $value; ?></option>
                                        <? } ?>                                    
                                    </select>
                                </label></div></div>                        
                    </div>
                    
                    <div class="row">                    
                        <div class="col-xs-12 button_group">
                            <div>
                                <?  if(isset($button_group)){
                                    foreach($button_group as $key => $value){ 
                                        $icon = (isset($value['icon_class']))?'<i class="ace-icon fa '.$value['icon_class'].' bigger-110"></i>':'';
                                        $class = "btn-info";
                                        if(isset($value['class'])){
                                            $class = $value['class'];
                                        }
                                        $confirm_class = (isset($value['confirm']))?"confirm_bootbox":"";
                                        $confirm_class = (isset($value['is_prompt']))?"prompt_bootbox":"";
                                        $confirm_text = (isset($value['confirm']))?'confirm_text="'.$value['confirm'].'"':'';
                                        $url = '<a href="'.$value['url'].'" class="btn btn-white '.$class.' '.$confirm_class.'" '.$confirm_text.' data-rel="tooltip"  title="" data-original-title="'.$value['display_name'].'">'.$icon.' '.$value['display_name'].'</a>';
                                        echo $url;
                                    }
                                    }
                                ?>                               
                            </div>                            
                        </div>                    
                    </div>                    
                    
                    <form class="table_form" onsubmit="return false;">
                    <table class="table table-striped table-bordered table-hover dataTable">
                        <thead>
                            <tr>                            
                                <?
                                    foreach($data_header as $key => $value){
                                        $icon = (isset($value['icon_class']))?'<i class="ace-icon fa '.$value['icon_class'].' bigger-110"></i>':'';
                                        $sort_class = "";
                                        $width = "";
                                        if(isset($value['width'])){
                                            $width = "width=".$value['width'];
                                        }
                                        if(!isset($value['no_filter'])){
                                            $sort_class = "sorting";                                    
                                            $sort_order = "asc";                                    
                                            if(array_key_exists($key, $data_list['filter']['order'])){
                                                if($data_list['filter']['order'][$key]=="desc"){
                                                    $sort_class = "sorting_desc";
                                                    $sort_order = "asc";
                                                }else{
                                                    $sort_class = "sorting_asc";
                                                    $sort_order = "desc";
                                                }
                                            }
                                        }
                                        $class = "";
                                        if(isset($value['class'])){
                                            $class = $value['class'];
                                        }
                                ?>
                                <th class="<? echo $sort_class; ?> <? echo $class; ?>" sort_name="<? echo $key; ?>" sort_order="<? echo $sort_order; ?>" <? echo $width; ?>>
                                    <? echo $icon; ?>
                                    <? echo $value['display_name']; ?>
                                </th>
                                <? } ?>
                                <? if(isset($tool_group)){ ?>
                                <th></th>
                                <? } ?>
                            </tr>
                        </thead>                        
                        <tbody role="alert" aria-live="polite" aria-relevant="all">                            
                            <tr class="table_search_form">
                                <?
                                    foreach($data_header as $key => $value){
                                    $search_form = "";
                                    $class = "hidden-xs";
                                    if(!isset($value['no_search'])){
                                        $selected = "";
                                        $class = "";
                                        if(array_key_exists($key,$data_list['filter']['where'])!==FALSE){
                                            $selected = $data_list['filter']['where'][$key];
                                        }
                                        if(isset($value['status_value'])){
                                            $search_form = '<SELECT name="filter_search['.$key.']">';
                                            $search_form .= '<OPTION VALUE=""></OPTION>';
                                            foreach($value['status_value'] as $key2 => $value2){                                                
                                                $search_form .= '<OPTION VALUE="'.$key2.'" '.(($selected!="" && $selected==$key2)?"SELECTED='SELECTED'":"").'>'.$value2.'</OPTION>';
                                            }
                                            $search_form .= '</SELECT>';
                                        }else{
                                            $search_form = '<input type="text" name="filter_search['.$key.']" value="'.$selected.'">';
                                        }                                        
                                    }
                                ?>
                                <td class="<? echo $class; ?>"><div class="table_label visible-xs"><? echo $value['display_name']; ?></div><? echo $search_form; ?></td>
                                <?
                                    }
                                ?>
                                <td>
                                    <div class="action-buttons">
                                        <input type="submit" class="tooltip-info btn btn-white btn-info table_search_form_btn" value="Search" />                                        
                                    </div>
                                </td>
                            </tr>
                            <?
                                foreach($data_list['data'] as $record){                                
                            ?>
                            <tr>                            
                                <?
                                    foreach($data_header as $key => $value){
                                    $data_value = "";
                                    $class = "";
                                    if(isset($record[$key])){                                        
                                        if(isset($value['content'])){
                                            if(is_callable($value['content'])){
                                                $data_value = call_user_func($value['content'], $record);
                                            }else{
                                                $data_value = $value['content'];
                                            }                                    
                                        }else{
                                            $data_value = (isset($value['status_value']) && isset($value['status_value'][$record[$key]]))?$value['status_value'][$record[$key]]:$record[$key];
                                        }                                        
                                        if(isset($value['url'])){
											$confirm_class = (isset($value['confirm']))?"confirm_bootbox":"";
                                                                                        $confirm_class = (isset($value['is_prompt']))?"prompt_bootbox":"";
											$confirm_text = (isset($value['confirm']))?'confirm_text="'.$value['confirm'].'"':'';
                                            $data_value = '<a href="'.$value['url'].'" class="'.$confirm_class.'" '.$confirm_text.'>'.$data_value.'</a>';
                                        }
										$data_value = preg_replace_callback("#\{([^\{\}]+)\}#i", function($matches) use ($record){return (isset($record[$matches[1]]))?$record[$matches[1]]:"";}, $data_value);
                                    }                                    
                                    if(isset($value['class'])){
                                        $class = $value['class'];
                                    }
                                ?>
                                <td class="<? echo $class; ?>">
                                    <div class="table_label visible-xs"><? echo $value['display_name']; ?></div>
                                    <div class="table_value">
                                        <? echo $data_value; ?>
                                    </div>                                
                                </td>
                                <? } ?>
                                <? if(isset($tool_group)){ ?>
                                <td>                                
                                    <div class="action-buttons">
                                        <? 
                                            foreach($tool_group as $key => $value){ 
												$url = "";
                                                if(isset($value['url'])){
                                                    $icon = (isset($value['icon_class']))?'<i class="ace-icon fa '.$value['icon_class'].' bigger-130"></i>':'';                                                    
                                                    $class = "";
                                                    if(isset($value['class'])){
                                                        $class = $value['class'];
                                                    }
													$confirm_class = (isset($value['confirm']))?"confirm_bootbox":"";
                                                                                                        $confirm_class = (isset($value['is_prompt']))?"prompt_bootbox":"";
													$confirm_text = (isset($value['confirm']))?'confirm_text="'.$value['confirm'].'"':'';
													$url = '<a href="'.$value['url'].'" class="tooltip-info '.$class.' '.$confirm_class.'" '.$confirm_text.' data-rel="tooltip"  title="" data-original-title="'.$value['display_name'].'">'.$icon.'</a>';
													$url = preg_replace_callback("#\{([^\{\}]+)\}#i", function($matches) use ($record){return (isset($record[$matches[1]]))?$record[$matches[1]]:"";}, $url);
                                                }
												echo $url;
                                            } 
                                        ?>                                    
                                    </div>
                                </td>
                                <? } ?>
                            </tr>
                            <? } ?>
                        </tbody>
                    </table>                    
                    </form>

                    <div class="row">
                        <div class="col-xs-12 col-sm-6"><div class="dataTables_info">Showing <? echo $data_list['from_rec']; ?> to <? echo $data_list['to_rec']; ?> of <? echo $data_list['row']; ?> entries</div></div>
                                    <?
                                        if(isset($data_list['pagination'])){                                            
                                    ?>
                                    <div class="col-xs-12 col-sm-6"><div class="dataTables_paginate paging_bootstrap">
                                            <ul class="pagination">                                        
                                            <?
                                                echo ($data_list['pagination']['ppp']>0)?'<li class="prev"><a href="#" page="'.$data_list['pagination']['ppp'].'"><i class="fa fa-angle-double-left"></i></a></li>':'<li class="prev disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>';
                                                echo ($data_list['pagination']['pp']>0)?'<li class="prev"><a href="#" page="'.$data_list['pagination']['pp'].'"><i class="fa fa-angle-left"></i></a></li>':'<li class="prev disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>';
                                                foreach($data_list['pagination']['p'] as $value){
                                                    echo ($value>0)?'<li><a href="#" page="'.$value.'">'.$value.'</a></li>':'';
                                                }
                                                echo ($data_list['pagination']['c']>0)?'<li class="active"><a href="#">'.$data_list['pagination']['c'].'</a></li>':'';
                                                foreach($data_list['pagination']['n'] as $value){
                                                    echo ($value>0)?'<li><a href="#" page="'.$value.'">'.$value.'</a></li>':'';
                                                }
                                                echo ($data_list['pagination']['nn']>0)?'<li class="next"><a href="#" page="'.$data_list['pagination']['nn'].'"><i class="fa fa-angle-right"></i></a></li>':'<li class="next disabled"><a href="#"><i class="fa fa-angle-right"></i></a></li>';
                                                echo ($data_list['pagination']['nnn']>0)?'<li class="next"><a href="#" page="'.$data_list['pagination']['nnn'].'"><i class="fa fa-angle-double-right"></i></a></li>':'<li class="next disabled"><a href="#"><i class="fa fa-angle-double-right"></i></a></li>';
                                                
                                                /*
                                                echo ($data_list['pagination']['p4']>0)?'<li class="prev"><a href="#" page="'.$data_list['pagination']['p4'].'"><i class="fa fa-angle-double-left"></i></a></li>':'<li class="prev disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>';
                                                echo ($data_list['pagination']['p3']>0)?'<li class="prev"><a href="#" page="'.$data_list['pagination']['p3'].'"><i class="fa fa-angle-left"></i></a></li>':'<li class="prev disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>';
                                                echo ($data_list['pagination']['p2']>0)?'<li><a href="#" page="'.$data_list['pagination']['p2'].'">'.$data_list['pagination']['p2'].'</a></li>':'';
                                                echo ($data_list['pagination']['p1']>0)?'<li><a href="#" page="'.$data_list['pagination']['p1'].'">'.$data_list['pagination']['p1'].'</a></li>':'';
                                                echo ($data_list['pagination']['c']>0)?'<li class="active"><a href="#">'.$data_list['pagination']['c'].'</a></li>':'';
                                                echo ($data_list['pagination']['n1']>0)?'<li><a href="#" page="'.$data_list['pagination']['n1'].'">'.$data_list['pagination']['n1'].'</a></li>':'';
                                                echo ($data_list['pagination']['n2']>0)?'<li><a href="#" page="'.$data_list['pagination']['n2'].'">'.$data_list['pagination']['n2'].'</a></li>':'';
                                                echo ($data_list['pagination']['n3']>0)?'<li class="next"><a href="#" page="'.$data_list['pagination']['n3'].'"><i class="fa fa-angle-right"></i></a></li>':'<li class="next disabled"><a href="#"><i class="fa fa-angle-right"></i></a></li>';
                                                echo ($data_list['pagination']['n4']>0)?'<li class="next"><a href="#" page="'.$data_list['pagination']['n4'].'"><i class="fa fa-angle-double-right"></i></a></li>':'<li class="next disabled"><a href="#"><i class="fa fa-angle-double-right"></i></a></li>';
                                                */
                                            ?>
                                        </ul>
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


<!-- inline scripts related to this page -->
<script type="text/javascript">
    function change_location(url){
        if(url.length>0){
            location = url;
            widget_toggle($('.dataTable').closest('.widget-box'));
        }
    }
    var $url_filter = "<? echo $this->merchant->link($data_list['filter']['route'], array("filter"=> urlencode(serialize($data_list['filter'])))); ?>";
    jQuery(function($) {
        $('[data-rel="tooltip"]').tooltip({container:'body'});
        
        if($('.table_sort_name :selected').val()!=""){
            $('.table_sort_order').show();
        }else{
            $('.table_sort_order').hide();
        }
        $('.table_sort_name, .table_sort_order').change(function(e){
            e.preventDefault();
            var $sort_name = $('.table_sort_name :selected').val();
            var $sort_order = "";
            if($sort_name.length>0){
                $sort_order = $('.table_sort_order :selected').val();
            }
            change_location($url_filter+"&filter_sort_name="+$sort_name+"&filter_sort_order="+$sort_order);
        });
        $('.dataTable th[sort_name][sort_order][class*="sorting"]').click(function(e){
            e.preventDefault();
            var $sort_name = $(this).attr('sort_name');
            var $sort_order = $(this).attr('sort_order');
            if($sort_name.length>0 && $sort_order.length>0){
                change_location($url_filter+"&filter_sort_name="+$sort_name+"&filter_sort_order="+$sort_order);
            }            
        });
        
        $('select.table_limit').change(function(e){
            e.preventDefault();
            var $value = $(this).find(':selected').val();
            if($value.length>0){
                change_location($url_filter+"&filter_limit="+$value);
            }
        });
        
        $('.pagination a[page]').click(function(e){
            e.preventDefault();
            var $value = $(this).attr('page');
            if($value.length>0){
                change_location($url_filter+"&filter_page="+$value);
            }
        });
    })
    
    $('form.table_form').submit(function(e){
        change_location($url_filter+"&"+$(this).serialize());
        e.preventDefault();
        return false;
    });
    $('form.table_form select').change(function(e){
        change_location($url_filter+"&"+$(this).serialize());
        e.preventDefault();
        return false;
    });
    
    $('a.alert_bootbox').click(function(e){
        var url = $(this).attr('href');
        var confirm_text = $(this).attr('confirm_text');
        alert(confirm_text);
        change_location(url);
        e.preventDefault();
        return false;
    });
	
    $('a.confirm_bootbox').click(function(e){
        var url = $(this).attr('href');
        var confirm_text = $(this).attr('confirm_text');
        bootbox.confirm(confirm_text,function(result){
            if(result){
                change_location(url);
            }
        });
        e.preventDefault();
        return false;
    });
    
    $('a.prompt_bootbox').click(function(e){
        var url = $(this).attr('href');
        var confirm_text = $(this).attr('confirm_text');
        bootbox.prompt(confirm_text,function(result){
            if(result!==null && typeof result === 'string' && result.length>0){
                change_location(url+"&prompt_value="+encodeURI(result));
            }
        });
        e.preventDefault();
        return false;
    });
</script>
