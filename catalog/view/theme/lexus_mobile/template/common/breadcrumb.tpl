<?php if(isset($breadcrumbs)){ ?>
<div class="col-xs-12 breadcrumb-container">
<div class="hr"></div>
<div id="breadcrumb"><ol class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
</ol></div>
<div class="hr"></div>
</div>
<? } ?>