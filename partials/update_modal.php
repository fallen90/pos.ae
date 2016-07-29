<div class="modal fade" id="updateModal_<?=$ing->id;?>">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Update Ingredient</h4>
            </div>
            <div class="modal-body">
                <form action="<?=base_url();?>&action=update&after_action=1&id=<?=$ing->id;?>" method="POST" id="updateFormModal_<?=$ing->id;?>">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" id="title_<?=$ing->id;?>" name="title" placeholder="Name" value="<?=$ing->title;?>">
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" class="form-control" id="stock_quantity_<?=$ing->id;?>" name="stock_quantity" placeholder="Stock Quantity" value="<?=$ing->stock_quantity;?>">
                    </div>
                    <div class="form-group">
                        <label>Weight / Volume per Piece</label>
                        <input type="number" class="form-control" id="weight_<?=$ing->id;?>" placeholder="Weight / Volume per Piece" value="<?=round($ing->weight / $ing->stock_quantity, 2);?>">
                    </div>
                    <div class="form-group">
                        <label>Unit</label>
                        <input type="text" class="form-control" id="unit" name="unit" placeholder="Unit (e.g ml or kg)" value="<?=sku_taxonomy($ing->sku)['unit'];?>">
                    </div>
                    <div class="form-group">
                        <label>Total Calculated Weight / Volume</label>
                        <input type="number" class="form-control" id="total_weight_<?=$ing->id;?>" name="weight" placeholder="Total Weight" readonly value="<?=$ing->weight;?>">
                    </div>
                    <div class="form-group">
                        <label>SKU</label>
                        <input type="text" class="form-control" name="sku" id="sku_<?=$ing->id;?>" placeholder="(auto generated)" value="<?=$ing->sku;?>">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="updateSubmitModal_<?=$ing->id;?>">Save Changes</button>
            </div>
        </div>
    </div>
</div>
<script>
//fuck i hate myself -_- this code is disgusting.

$(document).ready(function() {
    $('#title_<?=$ing->id;?>').on('change keyup keydown paste', function(e) {
        var title = $(this).val();
        if (title != "") {
            var new_title = '<?=generate_sku();?>-' + title.replace(/[aeiou&\/\\#,+()$~%.'":*?<>{}-\s]/ig, '') + '-<?=generate_serial();?>';

            if (new_title != "" || typeof new_title !== "undefined") {
                $('#sku_<?=$ing->id;?>').val(new_title.toUpperCase());
            }
            console.log(new_title, title);
        }
    });
    $('#weight_<?=$ing->id;?>').on('change keyup keydown paste', function(){
        if($('#stock_quantity_<?=$ing->id;?>').val() == ""){
            return false;
        }
        var total_weight = $('#weight_<?=$ing->id;?>').val() * $('#stock_quantity_<?=$ing->id;?>').val();
        console.log(total_weight, $('#weight_<?=$ing->id;?>').val(), $('#stock_quantity_<?=$ing->id;?>').val());
        $('#total_weight_<?=$ing->id;?>').val(Math.round(total_weight, 2));
    });
    $('#updateSubmitModal_<?=$ing->id;?>').on('click', function(e){
    	e.preventDefault();
    	$('#updateFormModal_<?=$ing->id;?>').submit();
    })
});
</script>
