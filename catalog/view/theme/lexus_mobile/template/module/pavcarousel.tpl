<?php $id = rand(1,10); $span =  12/$columns; // echo $columns;die;?>
   	<div id="pavcarousel<?php echo $id;?>" class="box carousel slide pavcarousel hidden-sm hidden-xs">
		<div class="carousel-inner">
			 <?php foreach ($banners as $i => $banner) { $i=$i+1;?>
				<?php if($i%$columns==1) { ?>
				<div class="row item <?php if(($i-1)==0) {?>active<?php } ?>">
				<?php } ?>
				<div class="item-carousel col-xs-12 col-sm-6 col-lg-2 col-md-2">
					<div class="item-inner">
						<?php if ($banner['link']) { ?>
						<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
						<?php } else { ?>
						<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
						<?php } ?>
					</div>
				</div>	
				<?php if( $i%$columns==0 || $i==count($banners)) { ?>
				</div>
				<?php } ?>
			<?php } ?>
		</div>
		<?php if( count($banners) > $columns ){ ?>
		<div class="carousel-flex">
			<span class="pr-top flex"></span>
			<a class="carousel-control left" href="#pavcarousel<?php echo $id;?>" data-slide="prev"></a>
			<span class="pr-bottom flex"></span>
		</div>
		<div class="carousel-flex">
			<span class="nt-top flex"></span>
			<a class="carousel-control right" href="#pavcarousel<?php echo $id;?>" data-slide="next"></a>
			<span class="nt-bottom flex"></span>
		</div>
		
		<?php } ?>
    </div>
<?php if( count($banners) > 1 ){ ?>
<script type="text/javascript"><!--
 $('#pavcarousel<?php echo $id;?>').carousel({interval:false});
--></script>
<?php } ?>
