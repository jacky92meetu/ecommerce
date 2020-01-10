<?php

class ControllerFeedUbibRss extends Controller {

    public function index() {
        $output = '<?xml version="1.0" encoding="UTF-8" ?>';
        $output .= '<rss version="2.0" xmlns:g="http://base.google.com/ns/1.0">';
        $output .= '<channel>';
        $output .= '<title>' . $this->config->get('config_name') . '</title>';
        $output .= '<description>' . $this->config->get('config_meta_description') . '</description>';
        $output .= '<language>en-us</language>';
        $output .= ' 
    <image> 
        <url>http://www.ubib.my/image/data/logo.png</url>
        <title>Experience Smart Shopping Today - ubib.my</title>
        <link>http://www.ubib.my</link>
    </image>';
        $output .= '<link>' . HTTP_SERVER . '</link>';

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $products = $this->model_catalog_product->getProducts();

        foreach ($products as $product) {
            $discount_price = ($product['price'] - $product['special']);
            $discount_percentage = round(($discount_price / $product['price'] * 100),2);
            if ($product['description']) {
                $output .= '<item>';
                $output .= '<title>' . $product['name'] . '</title>';
                $output .= '<link>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</link>';
                $output .= '<g:image>/image/' . $product['image'] . '</g:image>';
                $output .= '<description><![CDATA[<ul>';
                $output .= '<img src="'.$this->model_tool_image->resize($product['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height')).'" />';                
                $output .= '<li class="product_price">Product Price: ' . $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))) . '</li>';
                $output .= '<li class="product_discount_price">Product Discount Price: ' . $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax'))) . '</li>';
                $output .= '<li class="product_save_price">Save Price: '.$discount_price.'</li>';
                $output .= '<li class="product_discount_percentage">Discount Percentage: '.$discount_percentage.'% OFF</li>';
                $output .= '<li class="product_reward_points">Earn Ubib Reward Points: '.$product['reward'].'</li>';
                $output .= '<li class="product_availability">Product Availability: ' . ($product['quantity'] ? 'in stock' : $product['stock_status']) . '</li>';
                $output .= '<li class="product_desc">Product Description: ' . html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8') . '</li>';
                $output .= '<li class="product_store">Store Name: ' . $product['merchant_name'] . '</li>';
                $output .= '</ul>]]></description>';
                $output .= '</item>';
            }
        }

        $output .= '</channel>';
        $output .= '</rss>';

        $this->response->addHeader('Content-Type: application/rss+xml');
        $this->response->setOutput($output);
    }

}

?>