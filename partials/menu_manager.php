<?php $product_grid = get_product_grid(); ?>
<div class="container" id="body">
    <div class="panel panel-default">
        <div class="panel-body">
            <h3>Menu Manager</h3>
            <hr>
            <div class="panel panel-default">
                <div class="panel-body">
                    <label class="control-label">Select Menu Item</label>
                    <select class="form-control" id="menu_list">
                        <?php foreach($product_grid as $menu):?>
                        <option>
                            <?=$menu->product->title;?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	$(document).ready(function(){
		$('#menu_list').change(function(){
			$('body').css('background', $)
		});
	});
</script>
