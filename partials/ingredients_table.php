<div class="alert">
    <a data-toggle="modal" href='#addModal' class="btn btn-success">
        <i class="glyphicon glyphicon-plus"></i> Add Ingredient
    </a>
</div>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Stock Quantity</th>
            <th>Weight / Volume <small style="display:block">(total)</th>
            <th>SKU</th>
            <th>Serial</th>
            <th>Branch Location</th>
            <th>&nbsp;</th>
        </tr>
    </thead>
    <tbody>
    <?php 
        foreach(get_ingredients_by_outlet(get_current_outlet()['sku_prefix']) as $ing):
            $row_class = "";
            if($ing->stock_quantity == 0){
                $row_class = 'danger';
            } elseif($ing->stock_quantity <= $config->stock_threshold){
                $row_class = 'warning';
            }
    ?>
        <tr class="<?=$row_class;?>">
            <td><?=$ing->id;?></td>
            <td><?=$ing->title;?></td>
            <td><?=$ing->stock_quantity;?></td>
            <td><?=$ing->weight . ' ' . sku_taxonomy($ing->sku)['unit'];?></td>
            <td><?=sku_taxonomy($ing->sku)['ingredient_sku'];?></td>
            <td><?=sku_taxonomy($ing->sku)['serial'];?></td>
            <td><?=sku_taxonomy($ing->sku)['branch'];?></td>
            <td>
            <a href="<?=base_url();?>&action=delete&id=<?=$ing->id;?>" class="glyphicon glyphicon-trash btn btn-danger"></a>
            <a class="glyphicon glyphicon-pencil btn btn-primary" data-toggle="modal" href='#updateModal_<?=$ing->id;?>'></a>
            <a class="btn btn-primary" data-toggle="modal" href='#usedModal_<?=$ing->id;?>'> Used </a>
            </td>
        </tr>
        <?php include("./partials/update_modal.php");?>
        <?php include("./partials/used_modal.php");?>
    <?php endforeach; ?>
    </tbody>
</table>
