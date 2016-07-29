<div class="md-modal md-dynamicmodal" id="modal-add_custom_product">
    <div class="md-content">
        <h1><?php _e('Add Service Charge', 'wc_point_of_sale'); ?><span class="md-close"></span></h1>
        <div class="full-height">
            <div class="box_content">
                <table id="custom_product_table" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th class="product_title">
                                <?php _e('Description', 'wc_point_of_sale'); ?>
                            </th>
                            <th class="product_price">
                                <?php _e('Price ('.get_woocommerce_currency_symbol().')', 'wc_point_of_sale'); ?>
                            </th>
                            <!-- <th class="product_quantity">
                                <?php //_e('Quantity', 'wc_point_of_sale'); ?>
                            </th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="product_title">
                                <input type="text" id="custom_product_title" value="Service Charge">
                            </td>
                            <td class="product_price">
                                <input type="text" id="custom_product_price">
                            </td>
                            <td class="product_quantity" style="display:none;">
                                <input type="text" id="custom_product_quantity" value="1">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div id="custom_product_meta_label">
                    <h3><?php _e('Product Meta Fields', 'wc_point_of_sale'); ?></h3>
                </div>
                <table id="custom_product_meta_table" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th class="meta_label">
                                <?php _e('Product Attribute', 'wc_point_of_sale'); ?>
                            </th>
                            <th class="meta_attribute">
                                <?php _e('Meta Value', 'wc_point_of_sale'); ?>
                            </th>
                            <th class="remove_meta"></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="wrap-button">
            <button style="display:none;" class="button wp-button-large " id="add_custom_product_meta">
                <?php _e('Add Meta', 'wc_point_of_sale'); ?>
            </button>
            <button class="button button-primary wp-button-large alignright" id="add_custom_product">
                <?php _e('Proceed', 'wc_point_of_sale'); ?>
            </button>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    $('#custom_product_title').val('Service Charge');
});
</script>
