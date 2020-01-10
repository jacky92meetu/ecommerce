<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" );
$themeConfig = $this->config->get( 'themecontrol' );
?>
<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>

<section class="col-xs-12">

    <div id="content"><?php echo $content_top; ?>

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

            <div class="row">
                <div class="col-xs-12 col-sm-8">
                    <h1><?php echo $heading_title; ?></h1>

                    <h2><?php echo $text_location; ?></h2>
                    <div class="contact-info">
                        <div class="content"><div class="left"><b><?php echo $text_address; ?></b><br />
                                <?php echo $store; ?><br />
                                <?php echo $address; ?></div>
                            <? /* ?>
                            <div class="right">
                                <?php if ($telephone) { ?>
                                <b><?php echo $text_telephone; ?></b><br />
                                <?php echo $telephone; ?><br />
                                <br />
                                <?php } ?>
                                <?php if ($fax) { ?>
                                <b><?php echo $text_fax; ?></b><br />
                                <?php echo $fax; ?>
                                <?php } ?>
                            </div>
                            <? */ ?>
                        </div>
                    </div>
                    <h2><?php echo $text_contact; ?></h2>
                    <div class="content">
                        <b><?php echo $entry_name; ?></b><br />
                        <input type="text" class="form-control" placeholder="Please enter your name" name="name" value="<?php echo $name; ?>" />
                        <br />
                        <?php if ($error_name) { ?>
                        <span class="error"><?php echo $error_name; ?></span>
                        <?php } ?>
                        <br />
                        <b><?php echo $entry_email; ?></b><br />
                        <input type="text" class="form-control" placeholder="Please enter your email" name="email" value="<?php echo $email; ?>" />
                        <br />
                        <?php if ($error_email) { ?>
                        <span class="error"><?php echo $error_email; ?></span>
                        <?php } ?>
                        <br />
                        <b><?php echo $entry_mobile_no; ?></b><br />
                        <input type="text" class="form-control" placeholder="Please enter your mobile no." name="mobile_no" value="<?php echo $mobile_no; ?>" />
                        <br />
                        <?php if ($error_mobile_no) { ?>
                        <span class="error"><?php echo $error_mobile_no; ?></span>
                        <?php } ?>
                        <br />
                        <b>Message: </b><br />
                        <SELECT name="enquiry_title" SIZE="1" class="form-control">
                            <?
                            $options = array("Enquiry","Question","Comment","Complaint","Become a Seller");
                            foreach($options as $option){
                            ?>
                            <option value="Enquiry" <? echo (strtolower($option)==strtolower($enquiry_title))?'SELECTED="SELECTED"':''; ?>> <? echo $option; ?> </option>
                            <? } ?>        
                        </SELECT>
                        <br />
                        <textarea name="enquiry" cols="40" rows="10"  class="form-control" placeholder="Please enter your message here"><?php echo $enquiry; ?></textarea>
                        <br />
                        <?php if ($error_enquiry) { ?>
                        <span class="error"><?php echo $error_enquiry; ?></span>
                        <?php } ?>
                        <br />
                        <b><?php echo $entry_captcha; ?></b><br />
                        <input class="contact-form" type="text" placeholder="Please enter captcha" name="captcha" value="<?php echo $captcha; ?>" />
                        <br />
                        <img src="index.php?route=information/contact/captcha" alt="" />
                        <?php if ($error_captcha) { ?>
                        <span class="error"><?php echo $error_captcha; ?></span>
                        <?php } ?>
                    </div>

                </div>
            </div>

            <div class="buttons">
                <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
            </div>
            
        </form>

        <?php echo $content_bottom; ?>
    </div>
</section> 

<?php echo $footer; ?>