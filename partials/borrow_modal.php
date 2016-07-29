<div class="modal fade" id="borrowModal_<?=$ing->id;?>">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Borrow Ingredients</h4>
            </div>
            <div class="modal-body">
                <form action="<?=base_url();?>&action=borrow&after_action=1&id=<?=$ing->id;?>" method="POST" id="borrowFormModal_<?=$ing->id;?>">
                    <input type="hidden" name="from_branch" value="<?=get_outlet_by_sku(sku_taxonomy($ing->sku)['sku_prefix'])['ID'];?>">
                    <input type="hidden" name="to_branch" value="<?=get_current_outlet()['ID'];?>">
                    <input type="hidden" name="original_quantity" value="<?=$ing->stock_quantity?>">
                    <input type="hidden" name="item_id" value="<?=$ing->id;?>">
                    <input type="hidden" name="unit" value="<?=(isset(sku_taxonomy($ing->sku)['unit'])) ? sku_taxonomy($ing->sku)['unit'] : '';?>" />
                    <div class="form-group" style="display:none">
                        <label>Name</label>
                        <input type="text" class="form-control" id="title_<?=$ing->id;?>" name="title" placeholder="Name" value="<?=$ing->title;?>">
                    </div>
                    <div class="form-group">
                        <label>Quantity to Transfer</label>
                        <input type="number" class="form-control" id="stock_quantity_<?=$ing->id;?>" name="stock_quantity" placeholder="Stock Quantity" value="<?=$ing->stock_quantity;?>" max="<?=$ing->stock_quantity;?>" min="1">
                        <cite style="color:red;" id="note_<?=$ing->id;?>"></cite>
                    </div>
                    <div class="form-group">
                        <label>Weight</label>
                        <input type="text" class="form-control" id="weight_<?=$ing->id;?>" name="weight" placeholder="Weight" value="<?=$ing->weight;?>" readonly>
                    </div>
                    <div class="form-group" style="display:none">
                        <label>SKU</label>
                        <input type="text" class="form-control" name="sku" id="sku_<?=$ing->id;?>" placeholder="(auto generated)" value="<?=$ing->sku;?>">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="borrowSubmitModal_<?=$ing->id;?>">Notify Branch</button>
            </div>
        </div>
    </div>
</div>
<script>
//fuck i hate myself -_- this code is disgusting.

$(document).ready(function() {
    $('#borrowSubmitModal_<?=$ing->id;?>').on('click', function(e) {
        e.preventDefault();
        var stock = $('#stock_quantity_<?=$ing->id;?>').val();
        if (stock <= <?=$ing->stock_quantity;?> && stock >= 1) {
            $('#borrowFormModal_<?=$ing->id;?>').submit();
        } else {
            alert('Quantity should be less than or equal to total stocks of a branch, and cannot be less than 1');
        }
    })

    $('#stock_quantity_<?=$ing->id;?>').on('change keyup keydown paste', function() {



        var unit = '<?=(isset(sku_taxonomy($ing->sku)['unit'])) ? sku_taxonomy($ing->sku)['unit'] : '';?>';
        var stock_quantity = <?=$ing->stock_quantity;?>;
        var stock_quantity_selected = $(this).val();
        var total_weight = <?=(isset($ing->weight)) ? $ing->weight : 0;?>;
        var weight_per_pc = total_weight / stock_quantity;
        var calculated_weight = stock_quantity_selected * weight_per_pc;
        console.log(unit, stock_quantity_selected, total_weight, calculated_weight);

        if ($('#stock_quantity_<?=$ing->id;?>').val() > stock_quantity || $('#stock_quantity_<?=$ing->id?>').val() < 1 && $('#stock_quantity_<?=$ing->id;?>').val() != "") {
            $('#note_<?=$ing->id;?>').text('Please input valid values');
            $('#stock_quantity_<?=$ing->id;?>').val(stock_quantity)
        } else {
            $('#note_<?=$ing->id;?>').text('');
        }


        $('#weight_<?=$ing->id;?>').val(calculated_weight + unit);
    });
});
</script>
