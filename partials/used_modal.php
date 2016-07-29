<div class="modal fade" id="usedModal_<?=$ing->id;?>">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    				<h4 class="modal-title"></h4>
    			</div>
            <div class="modal-body">
                <form action="<?=base_url();?>&action=addused&after_action=1&id=<?=$ing->id;?>" method="POST" id="usedFormModal_<?=$ing->id;?>">
	                <input type="hidden" name="item_id" value="<?=$ing->id;?>">
	                <input type="hidden" name="original" value="<?=$ing->stock_quantity;?>">
	                <input type="hidden" name="outlet_id" value="<?=$_GET['outlet_id'];?>">
                    <div class="form-group">
                        <label class="">Quantity Used</label>
                        <input type="number" class="form-control" id="used_<?=$ing-id;?>" value="<?=$ing->stock_quantity;?>" name="used" placeholder="Quantity Used">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="usedModalSubmit_<?=$ing->id;?>">Confirm</button>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(e) {
    $('#usedModalSubmit_<?=$ing->id;?>').on('click', function(e) {
        e.preventDefault();
        var stock = $('#used_<?=$ing->id;?>').val();
         $('#usedFormModal_<?=$ing->id;?>').submit();
    })
});
</script>
