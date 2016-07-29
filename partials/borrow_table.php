<div class="alert">
    <div class="form-inline">
        <div class="form-group">
            <label for="">Selected Branch :</label>
            <select name="selected_outlet" class="form-control">
                <?php 
                foreach($outlets as $outlet): 
                    if($outlet['ID'] != $_GET['outlet_id']):
            ?>
                <option value="<?=$outlet['sku_prefix'];?>">
                    <?=$outlet['name'];?>
                </option>
                <?php
                    endif;
                endforeach;
            ?>
            </select>
        </div>
    </div>
</div>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Stock Quantity</th>
            <th>Weight</th>
            <th>SKU</th>
            <th>Serial</th>
            <th>Branch Location</th>
            <th>&nbsp;</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach(get_ingredients() as $ing):
            if(sku_taxonomy($ing->sku)['sku_prefix'] != get_current_outlet()['sku_prefix']):
    ?>
        <tr class="<?=sku_taxonomy($ing->sku)['sku_prefix'];?> ingredient_row <?=($ing->stock_quantity <= $config->stock_threshold) ? 'danger' : '';?>" style="display:none;">
            <td>
                <?=$ing->id;?>
            </td>
            <td>
                <?=$ing->title;?>
            </td>
            <td>
                <?=$ing->stock_quantity;?>
            </td>
            <td>
                <?=$ing->weight . ' ' . sku_taxonomy($ing->sku)['unit'];?>
            </td>
            <td>
                <?=sku_taxonomy($ing->sku)['ingredient_sku'];?>
            </td>
            <td>
                <?=sku_taxonomy($ing->sku)['serial'];?>
            </td>
            <td>
                <?=sku_taxonomy($ing->sku)['branch'];?>
            </td>
            <td style="display:<?=($ing->stock_quantity <= $config->stock_threshold) ? 'none' : 'block';?>">
                <a class="glyphicon glyphicon-random btn btn-primary" data-toggle="modal" href='#borrowModal_<?=$ing->id;?>'></a>
            </td>
        </tr>
        <?php include("partials/borrow_modal.php");?>
        <?php endif; endforeach; ?>
    </tbody>
</table>

    <script>
        $(document).ready(function(e){
            $('.' + $('[name="selected_outlet"]').val()).show();

            $('[name="selected_outlet"]').change(function(e){
                $('.ingredient_row').hide();
                $('.' + $(this).val()).show();
            });
        });
    </script>