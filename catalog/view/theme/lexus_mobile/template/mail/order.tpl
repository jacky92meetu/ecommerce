<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title><?php echo $title; ?></title>
    </head>
    <body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
        <div style="width: 680px; text-align:center"><a href="<? echo $store_url; ?>" title="<? echo $store_name; ?>"><img src="<? echo $store_url; ?>image/data/logo.png" alt="<? echo $store_name; ?>" style="margin-bottom: 20px; border: none;"></a></div>
        <span style="background-color:#000; color:#fff; width:680px; text-align:center; padding:8px; display:block; font-size:18px;  text-transform:uppercase; margin:0 0 20px 0;">Your Order has be Confirmed</span>
        <div style="width: 680px;">
            <p style="margin-top: 0px; margin-bottom: 10px;">Dear, <? echo $customer_name; ?></p>
            <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_greeting; ?> <?php echo $text_link; ?></p>
            <?php if ($customer_id) { ?>            
            <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $link; ?>"><?php echo $link; ?></a></p>
            <?php } ?>
            <?php if ($download) { ?>
            <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_download; ?></p>
            <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $download; ?>"><?php echo $download; ?></a></p>
            <?php } ?>
            <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
                <thead>
                    <tr>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #78AB50;" colspan="2"><?php echo $text_order_detail; ?></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
                            <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />          
                            <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
                            <? /* ?>
                            <?php if ($shipping_method) { ?>
                            <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
                            <?php } ?></td>
                        <? */ ?>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_email; ?></b> <?php echo $email; ?><br />
                            <b><?php echo $text_telephone; ?></b> <?php echo $telephone; ?><br />
                            <? /* ?>
                            <b><?php echo $text_ip; ?></b> <?php echo $ip; ?><br /></td>
                        <? */ ?>
                    </tr>
                </tbody>
            </table>
            <?php if ($comment) { ?>
            <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
                <thead>
                    <tr>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #78AB50;"><?php echo $text_instruction; ?></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $comment; ?></td>
                    </tr>
                </tbody>
            </table>
            <?php } ?>
            <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
                <thead>
                    <tr>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #78AB50;"><?php echo $text_payment_address; ?></td>
                        <?php if ($shipping_address) { ?>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #78AB50;"><?php echo $text_shipping_address; ?></td>
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $payment_address; ?></td>
                        <?php if ($shipping_address) { ?>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $shipping_address; ?></td>
                        <?php } ?>
                    </tr>
                </tbody>
            </table>
            <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
                <thead>
                    <tr>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo $text_product; ?></td>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"> Voucher </td>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;"><?php echo $text_quantity; ?></td>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;"><?php echo $text_price; ?></td>
                        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;"><?php echo $text_total; ?></td>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a> (Product Id: <?php echo $product['product_id']; ?>)
                            <?php foreach ($product['option'] as $option) { ?>
                            <br />
                            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                            <?php } ?></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['order_voucher_code']; ?></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['quantity']; ?></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['price']; ?></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['total']; ?></td>
                    </tr>
                    <?php } ?>
                    <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;">1</td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
                <tfoot>
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;" colspan="4"><b><?php echo $total['title']; ?>:</b></td>
                        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                </tfoot>
            </table>
            <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_footer; ?></p>  
            <ul>
                <li>Please do not reply to this e-mail as we are not able to respond to this messages sent to this e-mail address</li>
                <li>Ubib shall not be held responsible for any liabilities arising in connection with any transaction between buyers and sellers on this website. </li> 
                <li>To access your account and view your order details, click <a style="color:#78AB50" href="<?php echo $link; ?>">here</a></li>
            </ul> 


            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td> <p style="margin-top: 30px; margin-bottom: 20px;">Sincerely,<br>
                            Ubib Malaysia</p> </td>
                    <td align="right">
                        <a href="https://www.facebook.com/ubib.my" target="_blank"><img src="http://staging.ubib.my/image/data/icon_f_facebook.gif"></a>
                        <a href="https://twitter.com/ubibmy" target="_blank"><img src="http://staging.ubib.my/image/data/icon_f_twitter.gif"></a>
                    </td>
                </tr>
            </table>

            <table cellpadding="0" cellspacing="0" border="0" style="font-size: 11px; color:#747474; padding:10px 0; border:1px dotted #747474; border-width:1px 0 0 0;">
                <tr>
                    <td>You are receiving this with your email address <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                        To ensure our emails don't end up in your spam, add <a href="mailto:support@ubib.my">support@ubib.my</a> to your address book. 
                        We promise not to share your information, click <a href="http://www.ubib.my/mp/link?link_id=24">here</a> to view our privacy policy. 
                    </td>
                </tr>
            </table>
            
        </div>
    </body>
</html>
