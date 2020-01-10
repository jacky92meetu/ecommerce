<?
    if(!isset($pdata)){
        $pdata = array("floor_value"=>array("template_image"=>array(
            "0"=>array("image_url"=>"/image/floor_template/default/blank-390px-190px.jpg"),
            "1"=>array("image_url"=>"/image/floor_template/default/box-190px-190px.jpg"),
            "2"=>array("image_url"=>"/image/floor_template/default/box-190px-190px.jpg"),
            "31"=>array("image_url"=>"/image/floor_template/default/box-390px-390px.jpg"),
            "5"=>array("image_url"=>"/image/floor_template/default/box-190px-190px.jpg"),
            "6"=>array("image_url"=>"/image/floor_template/default/box-190px-190px.jpg")
        )));
    }
    
    $title_style = "";
    $title_span_style = "";
    $menu_style = "";
    if(isset($pdata['floor_value']['floor_style'])){
        $title_style = "border-color: ".$pdata['floor_value']['floor_style'].";";
        $title_span_style = "color: ".$pdata['floor_value']['floor_style'].";";
        $menu_style = "background-color: ".$pdata['floor_value']['floor_style'].";color:#fff;";
    }
?>
<div class="col-xs-12 product-floor-list">
    <? if(isset($pdata['floor_id'])){ ?>
    <div class="row">
        <div class="col-xs-12">
            <h2 class="title" style="<? echo $title_style; ?>"><span style="<? echo $title_span_style; ?>"><? echo $pdata['floor_num']; ?>F</span> <? echo $pdata['floor_name']; ?></h2>
            <div class="dropdown-container visible-xs show-800">
                <div>
                    <a role="button" data-toggle="dropdown" data-target="#">
                        <span class="menu fa fa-align-justify"></span>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <? foreach( $pdata['floor_value']['menu_link'] as $value ){ ?>
                        <li  role="presentation"><a role="menuitem" tabindex="-1" href="<? echo $value['href']; ?>" style="<? echo $value['link_value']['link_style']; ?>"><? echo $value['link_name']; ?></a></li>
                        <? } ?>
                    </ul>
                </div>
            </div>
        </div>        
    </div>
    <? } ?>
    <div class="row floor-content">
        <div class="hidden-xs col-xs-12 col-sm-6 left">
            <div class="row">
                <? if(isset($pdata['floor_id'])){ ?>
                <div class="hide-800 col-xs-12 pull-left">
                    <div class="category-box-cat" style="<? echo $menu_style; ?>">
                        <h3><? echo $pdata['floor_name']; ?></h3>
                        <h4><? echo $pdata['floor_value']['floor_subtitle']; ?></h4>
                        <ul>
                            <? foreach( $pdata['floor_value']['menu_link'] as $value ){ ?>
                            <li><a href="<? echo $value['href']; ?>" style="<? echo $value['link_value']['link_style']; ?>"><? echo $value['link_name']; ?></a></li>
                            <? } ?>                            
                        </ul>
                    </div>
                </div>
                <? }else{ ?>
                <div class="col-xs-12 image">
                    <a href="/merchant/system/link" target="_blank"><img src="<? echo $pdata['floor_value']['template_image']['0']['image_url']; ?>" /></a>
                </div>
                <? } ?>
                <div class="col-xs-6 image" image_class="image_size_190_190" image_id="1">
                    <? echo $pdata['floor_value']['template_image']['1']['image_price']; ?>
                    <a href="<? echo $pdata['floor_value']['template_image']['1']['image_link']; ?>"><img src="<? echo $pdata['floor_value']['template_image']['1']['image_url']; ?>" /></a>
                </div>
                <div class="col-xs-6 image" image_class="image_size_190_190" image_id="2">
                    <? echo $pdata['floor_value']['template_image']['2']['image_price']; ?>
                    <a href="<? echo $pdata['floor_value']['template_image']['2']['image_link']; ?>"><img src="<? echo $pdata['floor_value']['template_image']['2']['image_url']; ?>" /></a>
                </div>
            </div>            
        </div>
        <div class="col-xs-12 col-sm-6 right">            
            <div class="row">
                <div class="col-xs-8 col-sm-8 image full-400">
                    <div class="row">
                        <div class="col-xs-12 image image2" image_class="image_size_390_390" image_id="31">
                            <? echo $pdata['floor_value']['template_image']['31']['image_price']; ?>
                            <a href="<? echo $pdata['floor_value']['template_image']['31']['image_link']; ?>"><img src="<? echo $pdata['floor_value']['template_image']['31']['image_url']; ?>" /></a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 image half-400" image_class="image_size_190_190" image_id="5">
                    <? echo $pdata['floor_value']['template_image']['5']['image_price']; ?>
                    <a href="<? echo $pdata['floor_value']['template_image']['5']['image_link']; ?>"><img src="<? echo $pdata['floor_value']['template_image']['5']['image_url']; ?>" /></a>
                </div>
                <div class="col-xs-4 col-sm-4 image half-400" image_class="image_size_190_190" image_id="6">
                    <? echo $pdata['floor_value']['template_image']['6']['image_price']; ?>
                    <a href="<? echo $pdata['floor_value']['template_image']['6']['image_link']; ?>"><img src="<? echo $pdata['floor_value']['template_image']['6']['image_url']; ?>" /></a>
                </div>
            </div>
        </div>
    </div>
</div>