<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
	<div class="heading">
	  <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons">
			<a class="button" onclick="$('#form').submit();"><?php echo $button_save; ?></a>
			<a onclick="$('#action').val('save-stay');$('#form').submit();" class="button"><?php echo $this->language->get('save_stay'); ?></a>  
			<a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
		</div>
	</div>
	<div class="content">
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	  	<input type="hidden" name="action" id="action" />
		<div class="vtabs">
		  <?php $module_row = 1; ?>
		  <?php foreach ($modules as $module) { ?>
		  <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
		  <?php $module_row++; ?>
		  <?php } ?>
		  <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
		<?php $module_row = 1; ?>
		<?php foreach ($modules as $module) { ?>
		<div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
		  <div id="language-<?php echo $module_row; ?>" class="htabs">
			<?php foreach ($languages as $language) { ?>
			<a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
			<?php } ?>
		  </div>
		  <?php foreach ($languages as $language) { ?>
		  <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">
			<table class="form">
			  <tr>
				<td><?php echo $entry_description; ?></td>
				<td><textarea name="pavcategorytabs_module[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea></td>
			  </tr>
			</table>
		  </div>
		  <?php } ?>
		  <table class="form">
			<tr>
				<td><?php echo $this->language->get('prefix_class'); ?></td>
				<td>
          			<input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][prefix_class]" value="<?php echo isset($module['prefix_class'])?$module['prefix_class']:''; ?>" />
          			
          		</td>
          	</tr>
			<tr>
				<td><?php echo $entry_tabs; ?></td>
				<td>
					<select name="pavcategorytabs_module[<?php echo $module_row; ?>][category_id]">
					<?php foreach ($categories as $category) { ?>
					<?php $category_id = isset($module['category_id'])?$module['category_id']:0;?>
					<?php $selected = ($category['category_id'] == $category_id)?'selected=selected':''?>
					<option value="<?php echo $category['category_id']; ?>" <?php echo $selected;?>><?php echo $category['name']; ?></option>
					<?php } ?>
					</select>
				</td>
			</tr>

			<tr>
				<td><?php echo $this->language->get( 'entry_icon_image' );?></td>
				<td> 
					<?php 
						$idx = 0; 
						$imgidx = $module_row."-".$idx;
						$thumb = isset( $module['image']) ?$this->model_tool_image->resize( $module['image'], 32, 32) :"";
						$image = isset($module['image'])?$module['image']:"";
					?> 
					<img src="<?php echo $thumb; ?>" alt="" id="thumb<?php echo $imgidx; ?>" />
					<input type="hidden" name="pavcategorytabs_module[<?php echo $module_row; ?>][image]" value="<?php echo $image; ?>" id="image<?php echo $imgidx; ?>"  />
					<br />
					<a onclick="image_upload('image<?php echo $imgidx; ?>', 'thumb<?php echo $imgidx; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $imgidx; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $imgidx; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
				</td>
			</tr>

			<tr>
				<td><?php echo $limit_tabs; ?></td>
				<td class="left">
					<input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][limit_tabs]" value="<?php echo isset($module['limit_tabs'])?$module['limit_tabs']:4;?>" size="3"/>
                </td>	
			</tr>
			<tr>
				<td><?php echo $status_nav; ?></td>
				<td class="left">
					<select name="pavcategorytabs_module[<?php echo $module_row; ?>][status_nav]">
					<?php if($module['status_nav']) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1" ><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</td>	
			</tr>
			<tr>
				<td><?php echo $entry_dimension; ?></td>
				<td class="left"><input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
				<input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3"/>
				<?php if (isset($error_dimension[$module_row])) { ?>
				<span class="error"><?php echo $error_dimension[$module_row]; ?></span>
				<?php } ?></td>	
			</tr>
			<tr>
				 <td class="left"><?php echo $entry_carousel; ?></td>
				 <td class="left"><input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][itemsperpage]" value="<?php echo $module['itemsperpage']; ?>" size="3" /> - 
				<input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][cols]" value="<?php echo $module['cols']; ?>" size="3"/> - 
				<input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="3"/>
				<?php if (isset($error_carousel[$module_row])) { ?>
				<span class="error"><?php echo $error_carousel[$module_row]; ?></span>
				<?php } ?></td>
			</tr>
			<tr>
			  <td><?php echo $entry_layout; ?></td>
			  <td><select name="pavcategorytabs_module[<?php echo $module_row; ?>][layout_id]">
				 <?php foreach ($layouts as $layout) { ?>
				  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
				  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
				  <?php } else { ?>
				  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
				  <?php } ?>
				  <?php } ?>
				</select></td>
			</tr>
			<tr>
			  <td><?php echo $entry_position; ?></td>
			  <td><select name="pavcategorytabs_module[<?php echo $module_row; ?>][position]">
				  <?php foreach( $positions as $pos ) { ?>
				  <?php if ($module['position'] == $pos) { ?>
				  <option value="<?php echo $pos;?>" selected="selected"><?php echo $this->language->get('text_'.$pos); ?></option>
				  <?php } else { ?>
				  <option value="<?php echo $pos;?>"><?php echo $this->language->get('text_'.$pos); ?></option>
				  <?php } ?>
				  <?php } ?> 
				</select></td>
			</tr>
			<tr>
			  <td><?php echo $entry_status; ?></td>
			  <td><select name="pavcategorytabs_module[<?php echo $module_row; ?>][status]">
				  <?php if ($module['status']) { ?>
				  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				  <option value="0"><?php echo $text_disabled; ?></option>
				  <?php } else { ?>
				  <option value="1"><?php echo $text_enabled; ?></option>
				  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				  <?php } ?>
				</select></td>
			</tr>
			<tr>
			  <td><?php echo $entry_sort_order; ?></td>
			  <td><input type="text" name="pavcategorytabs_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
			</tr>
		  </table>
		</div>
		<?php $module_row++; ?>
		<?php } ?>
	  </form>
	</div>
  </div>
</div>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},  
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
<?php $module_row++; ?>
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	html += '  <div id="language-' + module_row + '" class="htabs">';
	<?php foreach ($languages as $language) { ?>
	html += '    <a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
	<?php } ?>
	html += '  </div>';

	<?php foreach ($languages as $language) { ?>
	html += '    <div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>">';
	html += '      <table class="form">';
	html += '        <tr>';
	html += '          <td><?php echo $entry_description; ?></td>';
	html += '          <td><textarea name="pavcategorytabs_module[' + module_row + '][description][<?php echo $language['language_id']; ?>]" id="description-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
	html += '        </tr>';
	html += '      </table>';
	html += '    </div>';
	<?php } ?>

	html += '  <table class="form">';
	//prefix_class
	html += '<tr>';
	html += '	<td><?php echo $this->language->get("prefix_class"); ?></td>';
	html += '	<td>';
	html += '		<input type="text" name="pavcategorytabs_module[' + module_row + '][prefix_class]" value="" />';
	html += '	</td>';
	html += '</tr>';
	//category select box
	html += '<tr>';
	html += '	<td><?php echo $entry_tabs; ?></td>';
	html += '	<td>';
	html += '		<select name="pavcategorytabs_module[<?php echo $module_row; ?>][category_id]">';
					<?php foreach ($categories as $category) { ?>
					<?php $category_id = isset($module['category_id'])?$module['category_id']:0;?>
					<?php $selected = ($category['category_id'] == $category_id)?'selected=selected':''?>
	html += '			<option value="<?php echo $category['category_id']; ?>" <?php echo $selected;?>><?php echo $category['name']; ?></option>';
					<?php } ?>
	html += '		</select>';
	html += '	</td>';
	html += '</tr>';

	// Icon 
	html += '<tr>';
	html += '<td><?php echo $this->language->get( 'entry_icon_image' );?></td>';
	html += '<td>';
			<?php 
				$idx = 0; 
				$imgidx = $module_row."-".$idx;
				$thumb = '';//isset( $module['image'][$idx]) ?  $this->model_tool_image->resize( $module['image'][$idx], 32, 32) :"";
				$image = '';//isset($module['image'][$idx])?$module['image'][$idx]:"";
			?> 
	html += '<img src="<?php echo $thumb; ?>" alt="" id="thumb<?php echo $imgidx; ?>" />';
	html += '<input type="hidden" name="pavcategorytabs_module[' + module_row + '][image]" value="<?php echo $image; ?>" id="image<?php echo $imgidx; ?>"  />';
	html += '<br />';
	html += '<a onclick="image_upload(\'image<?php echo $imgidx; ?>\', \'thumb<?php echo $imgidx; ?>\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb<?php echo $imgidx; ?>\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image<?php echo $imgidx; ?>\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';
	html += '</td>';
	html += '</tr>';

	//limit tab
	html += '<tr>';
	html += '	<td><?php echo $limit_tabs; ?></td>';
	html += '	<td>';
	html += '		<input type="text" name="pavcategorytabs_module[' + module_row + '][limit_tabs]" value="8" size="3" />';
	html += '	</td>';
	html += '</tr>';
	//enable nav
	html += '    <tr>';
	html += '      <td><?php echo $status_nav; ?></td>';
	html += '      <td><select name="pavcategorytabs_module[' + module_row + '][status_nav]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';

	
	html += '    <tr>';
	html += '      <td><?php echo $entry_dimension; ?></td>';
	html += '    <td class="left"><input type="text" name="pavcategorytabs_module[' + module_row + '][width]" value="" size="3" /> <input type="text" name="pavcategorytabs_module[' + module_row + '][height]" value="" size="3" /></td>';
	html += '    </tr>';
	html += '    </tr>';
	html += '      <td><?php echo $entry_carousel; ?></td>';
	html += '    <td class="left"><input type="text" name="pavcategorytabs_module[' + module_row + '][itemsperpage]" value="8" size="3" /> - <input type="text" name="pavcategorytabs_module[' + module_row + '][cols]" value="4" size="3" /> - <input type="text" name="pavcategorytabs_module[' + module_row + '][limit]" value="16" size="3" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="pavcategorytabs_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="pavcategorytabs_module[' + module_row + '][position]">';
	<?php foreach( $positions as $pos ) { ?>
	html += '<option value="<?php echo $pos;?>"><?php echo $this->language->get('text_'.$pos); ?></option>';      
	<?php } ?>		html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="pavcategorytabs_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="pavcategorytabs_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';
	html += '  </table>'; 


	html += '</div>';
	
	$('#form').append(html);
	
	<?php foreach ($languages as $language) { ?>
	CKEDITOR.replace('description-' + module_row + '-<?php echo $language['language_id']; ?>', {
		filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});  
	<?php } ?>
	
	$('#language-' + module_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 


<?php echo $footer; ?>