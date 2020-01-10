
</div></div></section>

<section id="footer">			
    <div class="footer-bottom footer-colums">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="hr"></div>
                    <div class="row">
                        <div class="col-xs-9">
                            <ul class="nav navbar-nav special-menu">                                
                                <? foreach($link_4 as $value){ ?>
                                <li ><a href="<? echo $value['href']; ?>" style="<? echo $value['link_value']['link_style']; ?>"><? echo $value['link_name']; ?></a></li>
                                <? } ?>
                            </ul>
                        </div>
                        <div class="col-xs-3">
                            <div class="footer_menu_icon">
                                <a href="https://www.facebook.com/ubib.my" target="_blank">
                                    <img class="img-responsive" src="/image/data/icon_f_facebook.gif">
                                </a>
                                <a href="https://twitter.com/ubibmy" target="_blank">
                                    <img class="img-responsive" src="/image/data/icon_f_twitter.gif">
                                </a>
                                <a href="javascript:void(0);" target="_blank">
                                    <img class="img-responsive" src="/image/data/icon_f_pinterest.gif">
                                </a>
                            </div>                            
                        </div>
                    </div>
                    <div class="hr hidden-xs"></div>
                    <div class="row hidden-xs footer_submenu">
                        <div class="col-sm-5 left">
                            <div class="list-title">TOP CATEGORIES</div>
                            <div class="row">
                                <?php
                                    $count = 0;
                                    $list_row = array('0'=>array(),'1'=>array());
                                    foreach($categories as $value){
                                        $sort_order = $count % 2;
                                        $list_row[$sort_order][] = array("href"=>$value['href'],"name"=>$value['name']);
                                        $count++;
                                    }
                                    foreach($list_row as $key => $value){
                                ?>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="list-group">
                                    <?
                                        foreach($value as $category){
                                    ?>
                                        <a href="<? echo $category['href']; ?>" class="list-group-item"><? echo $category['name']; ?></a>                                        
                                    <?
                                        }
                                    ?>
                                    </div>
                                </div>
                                <? } ?>                                
                            </div>
                            <div class="hr vertical"></div>
                        </div>
                        <div class="col-sm-5">
                            <div class="row">
                                <div class="col-xs-12 center">
                                    <div class="list-title">LINKS</div>
                                    <div class="row">
                                        <?php                                
                                            $count = 0;
                                            $list_row = array('0'=>array(),'1'=>array(),'2'=>array());
                                            foreach($link_5 as $value){
                                                $sort_order = $count % sizeof($list_row);
                                                $list_row[$sort_order][] = array("href"=>$value['href'],"name"=>$value['link_name'],"style"=>$value['link_value']['link_style']);
                                                $count++;
                                            }
                                            foreach($list_row as $key => $value){ 
                                        ?>
                                        <div class="col-sm-4">
                                            <div class="list-group">
                                            <?
                                                foreach($value as $category){
                                            ?>
                                                <a href="<? echo $category['href']; ?>" class="list-group-item" style="<? echo $category['style']; ?>"><? echo $category['name']; ?></a>                                        
                                            <?
                                                }
                                            ?>
                                            </div>
                                        </div>
                                        <? } ?>                                
                                    </div>                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="hr"></div>
                            </div>                            
                            <div class="row">
                                <div class="col-xs-12 center">
                                    <div class="list-title">PAYMENT METHODS</div>
                                    <div class="img_bankslogo">
                                        <img src="/image/data/img_bankslogo.png">
                                    </div>                                    
                                </div>
                            </div>
                            <div class="hr vertical"></div>
                        </div>
                                
                        <div class="col-sm-2 right">
                            <div class="footersubscribe_outter">
                                <div class="footersubscribe_inner">
                                    <span class="section_title">Subscribe ubib.my</span>
                                    <span class="section_title_text">Get the latest and exciting deals from ubib.my. Make sure you don’t miss a thing & save more with ubib.my</span>
                                    <input type="text" class="inputBoxSignUpFooter" id="newsletter_email" autocomplete="off" placeholder="Your Email">
                                    <button id="signUpEmailCaptr" class="ubibSubmitBtn newsletter_subscribe_btn btn">Sign Up</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</section>
</body></html>