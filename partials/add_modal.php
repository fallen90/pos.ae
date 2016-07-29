<div class="modal fade" id="addModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add Ingredient</h4>
            </div>
            <div class="modal-body">
                <form action="<?=base_url();?>&action=add&after_action=1" method="POST" id="addModalForm">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="title" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" class="form-control" id="stock_quantity" name="stock_quantity" placeholder="Stock Quantity">
                    </div>
                    <div class="form-group">
                        <label>Weight / Volume per Piece</label>
                        <input type="number" class="form-control" id="weight" placeholder="Weight / Volume per Piece">
                    </div>
                    <div class="form-group">
                        <label>Unit</label>
                        <input type="text" class="form-control" id="unit" name="unit" placeholder="Unit (e.g ml or kg)">
                    </div>
                    <div class="form-group">
                        <label>Total Calculated Weight / Volume</label>
                        <input type="number" class="form-control" id="total_weight" name="weight" placeholder="Total Weight" readonly>
                    </div>
                    <div class="form-group">
                        <label>SKU</label>
                        <input type="text" class="form-control" name="sku" id="sku" placeholder="(auto generated)" readonly>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="addSubmitModal">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script>
//fuck i hate myself -_- this code is disgusting.

$(document).ready(function() {
    $('[name="title"]').on('change keyup keydown paste', function(e) {
        var title = $(this).val();
        if (title != "") {
            var new_title = '<?=generate_sku();?>-' + title.replace(/[aeiou&\/\\#,+()$~%.'":*?<>{}-\s]/ig, '') + '-<?=generate_serial();?>';

            if (new_title != "" || typeof new_title !== "undefined") {
                $('#sku').val(new_title.toUpperCase());
            }
            console.log(new_title, title);
        }
    });

    $('#weight').on('change keyup keydown paste', function(){
        if($('#stock_quantity').val() == ""){
            return false;
        }
        var total_weight = $('#weight').val() * $('#stock_quantity').val();
        console.log(total_weight, $('#weight').val(), $('#stock_quantity').val());
        $('#total_weight').val(Math.round(total_weight, 2));
    });

    $('#addSubmitModal').on('click', function(e){
    	e.preventDefault();
    	$('#addModalForm').submit();
    })
});
</script>
