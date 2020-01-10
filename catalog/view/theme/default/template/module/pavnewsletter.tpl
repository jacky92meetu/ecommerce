<div class="<?php echo $prefix; ?> box newsletter_block" id="newsletter_<?php echo $position.$module;?>">
	<p class="title_block"><?php echo $this->language->get("entry_newsletter");?></p>
	<div class="description"><?php echo html_entity_decode(utf8_substr( strip_tags($description),0,58));?>...</div>
	<div class="block_content">
			<form method="post" action="<?php echo $action; ?>">
			<p>
				<input type="text" class="inputNew" <?php if(!isset($customer_email)): ?> onblur="javascript:if(this.value=='')this.value='<?php echo $this->language->get("default_input_text");?>';" onfocus="javascript:if(this.value=='<?php echo $this->language->get("default_input_text");?>')this.value='';"<?php endif; ?> value="<?php echo isset($customer_email)?$customer_email:$this->language->get("default_input_text");?>" size="18" name="email">
				<!--<select name="action">
					<option value="1">Subscribe</option>
					<option value="0">Unsubscribe</option>
				</select>-->
					<input type="submit" name="submitNewsletter" class="button_mini" value="<?php echo $this->language->get("button_ok");?>">
				<input type="hidden" value="1" name="action">
			</p>
		</form>
	</div>
</div>