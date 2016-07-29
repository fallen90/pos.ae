<?php
require_once( dirname('__FILE__') . '/lib/woocommerce-api.php' );
require_once( dirname('__FILE__') . '/includes/Database.php');
require_once( dirname('__FILE__') . '/includes/Config.php');


$config = new Config();

$options = array(
	'debug'           => false,
	'return_as_array' => false,
	'validate_url'    => false,
	'timeout'         => 30,
	'ssl_verify'      => false,
);

$db = new Database([
		'host' => $config->host,
		'user' => $config->user,
		'pass' => $config->pass,
		'db' => $config->db
	]);

$client = null;


try {
	$client = new WC_API_Client( 'http://localhost/pos.ae', 'ck_c17b479d0f319b08a55712341c4aeb12ca17f9b1', 'cs_f56f49bc8105f1495b10ba470a0842bb80d567fa', $options );
} catch ( WC_API_Client_Exception $e ) {
	return HandleException($e);
}


	// custom
	//$client->custom->setup( 'webhooks', 'webhook' );
	//print_r( $client->custom->get( $params ) );


	// index
	//print_r( $client->index->get() );

	// orders
	//print_r( $client->orders->get() );
	//print_r( $client->orders->get( $order_id ) );
	//print_r( $client->orders->update_status( $order_id, 'pending' ) );

	// order notes
	//print_r( $client->order_notes->get( $order_id ) );
	//print_r( $client->order_notes->create( $order_id, array( 'note' => 'Some order note' ) ) );
	//print_r( $client->order_notes->update( $order_id, $note_id, array( 'note' => 'An updated order note' ) ) );
	//print_r( $client->order_notes->delete( $order_id, $note_id ) );

	// order refunds
	//print_r( $client->order_refunds->get( $order_id ) );
	//print_r( $client->order_refunds->get( $order_id, $refund_id ) );
	//print_r( $client->order_refunds->create( $order_id, array( 'amount' => 1.00, 'reason' => 'cancellation' ) ) );
	//print_r( $client->order_refunds->update( $order_id, $refund_id, array( 'reason' => 'who knows' ) ) );
	//print_r( $client->order_refunds->delete( $order_id, $refund_id ) );

	// products
	// print_r( $client->products->get() );
	// echo json_encode( $client->products->get( 101 ) );
	//print_r( $client->products->get( $variation_id ) );
	//print_r( $client->products->get_by_sku( 'a-product-sku' ) );
	//print_r( $client->products->create( array( 'title' => 'Test Product', 'type' => 'simple', 'regular_price' => '9.99', 'description' => 'test' ) ) );
	//print_r( $client->products->update( $product_id, array( 'title' => 'Yet another test product' ) ) );
	//print_r( $client->products->delete( $product_id, true ) );
	//print_r( $client->products->get_count() );
	//print_r( $client->products->get_count( array( 'type' => 'simple' ) ) );
	//print_r( $client->products->get_categories() );
	//print_r( $client->products->get_categories( $category_id ) );

	// reports
	//print_r( $client->reports->get() );
	//print_r( $client->reports->get_sales( array( 'filter[date_min]' => '2014-07-01' ) ) );
	//print_r( $client->reports->get_top_sellers( array( 'filter[date_min]' => '2014-07-01' ) ) );

	// webhooks
	//print_r( $client->webhooks->get() );
	//print_r( $client->webhooks->create( array( 'topic' => 'coupon.created', 'delivery_url' => 'http://requestb.in/' ) ) );
	//print_r( $client->webhooks->update( $webhook_id, array( 'secret' => 'some_secret' ) ) );
	//print_r( $client->webhooks->delete( $webhook_id ) );
	//print_r( $client->webhooks->get_count() );
	//print_r( $client->webhooks->get_deliveries( $webhook_id ) );
	//print_r( $client->webhooks->get_delivery( $webhook_id, $delivery_id );

	// trigger an error
	//print_r( $client->orders->get( 0 ) );



function get_product_grid(){
	global $db;

	$rows = $db->select('pos_wc_poin_of_sale_tiles', ['product_id'],'WHERE `grid_id`=1');
	$product_grid = [];
	foreach($rows as $prod){
		$product_grid[] = get_menu_product($prod['product_id']);
	}
	return $product_grid;
}


function get_ingredients(){
	global $client;
	try {
		if($ingredients = get_cache('ingredients')){
			return $ingredients;
		} else {
			$ingredients = [];
			$products = $client->products->get()->products;
			foreach($products as $item){
				if(is_array($item->categories) && sizeof($item->categories) > 0 && $item->categories[0] =="Ingredients"){
					$ingredients[] = $item;
				}
			}
			save_cache('ingredients', $ingredients);
			return $ingredients;
		}
	} catch (WC_API_Client_Exception $e) {
		return HandleException($e);
	}
}
function get_menu_product($product_id){
	global $client;
	try {
		if($menu_product = get_cache('menu_product_' . $product_id)){
			return $menu_product;
		} else {
			$product = $client->products->get($product_id);
			save_cache('menu_product_' . $product_id, $product);
			return $product;
		}
		return $product;
	} catch (WC_API_Client_Exception $e) {
		return HandleException($e);
	}
}

function get_ingredients_by_outlet($sku_prefix){
	$ingredients = get_ingredients();
	$filtered = [];
	foreach($ingredients as $ing){
		if(sku_taxonomy($ing->sku)['sku_prefix'] == $sku_prefix){
			$filtered[] = $ing;
		}
	}
	return $filtered;
}
function create_product($name, $sku, $quantity, $weight, $unit){
	$details = array(
		'title' => ($name == '') ? 'Ingredient Sample' : $name,
	    'type' => 'simple',
	    'status' => 'publish',
	    'sku' => (is_null($sku)) ? "INGRT" . rand() : $sku . '-' . $unit,
	    'managing_stock' => true,
	    'stock_quantity' => ($quantity == '' || is_null($quantity)) ? 1 : $quantity,
	    'in_stock' => true,
	    'purchaseable' => false,
	    'catalog_visibility' => 'hidden',
	    'weight' => "" + $weight,
	    'reviews_allowed' => false,
	    'parent_id' => 0,
	    'categories' => [6],
		'button_text' => $unit
    );
	global $client;
	try {
		remove_cache('ingredients');
		return($client->products->create($details));
	} catch (WC_API_Client_Exception $e) {
		return HandleException($e);
	}
}

function update_product($ing_id, $name, $sku, $quantity, $weight, $unit){
	global $client;
	try {
		remove_cache('ingredients');

		//generate sku
		
		return($client->products->update( $ing_id, [
					'title' => $name, 
					'sku' => generate_sku_with_unit($sku, $unit),
					'stock_quantity' => $quantity,
					'weight' => $weight
				]));
	} catch (WC_API_Client_Exception $e) {
		return HandleException($e);
	}
}
function generate_sku_with_unit($sku, $unit){
	$sku = sku_taxonomy($sku);
	$sku_gen = [
		$sku['sku_prefix'], $sku['ingredient_sku'], $sku['serial'], $unit
	];
	return implode('-', $sku_gen);
}
function update_product_quantity($id, $quantity){
	$product = get_product($id);
	$weighted = $product->weight / $product->stock_quantity;
	$as_quantity_weight = $weighted * $quantity;
	update_product($id, $product->title, $product->sku, $quantity, $as_quantity_weight, sku_taxonomy($product->sku)['unit']);
}

function delete_product($ing_id){
	global $client;
	try {
		remove_cache('ingredients');
		return($client->products->delete( $ing_id, true ));
	} catch (WC_API_Client_Exception $e) {
		return HandleException($e);
	}
}

function get_product($product_id){
	global $client;
	try {
		foreach(get_ingredients() as $ing){
			if($ing->id == $product_id){
				return $ing;
			}
		}
	} catch (WC_API_Client_Exception $e) {
		return HandleException($e);
	}
}


function send_notification($from, $to, $item_id, $quantity){
	global $db;
	$outlets = [];
	$rows = $db->insert('pos_borrow_notifications', [
				'to_branch' => $to,
				'from_branch' => $from,
				'quantity' => $quantity,
				'item_id' => $item_id
		])->insert_id;
	return $rows;
};
function add_to_used($item_id, $outlet_id, $quantity_used, $quantity_original){
	global $db;
	$rows = $db->insert('pos_used_ingredientes', [
				'item_id' => $item_id,
				'outlet_id' => $outlet_id,
				'stock_quantity_used' => $quantity_used,
				'stock_quantity_original' => $quantity_original
			])->insert_id;
	if($rows){
		update_product_quantity($item_id, $quantity_original - $quantity_used);
	}
	return $rows;
}
function get_notifications($to_branch){
	global $db;
	$notifications = [];
	$rows = $db->select('pos_borrow_notifications', '*', "WHERE to_branch='" . $to_branch. "' ORDER BY timestamp DESC");
	foreach($rows as $notif){
		$notifications[($notif['unread']) ? 'unread' : 'read'][] = [
			'id' => $notif['id'],
			'from_branch' => get_outlet($notif['from_branch']),
			'to_branch' => get_outlet($notif['to_branch']),
			'quantity' => $notif['quantity'],
			'item' => get_product($notif['item_id']),
			'timestamp' => date("F j, Y, g:i a", strtotime($notif['timestamp'])),
			'unread' => $notif['unread']
		];
	}
	return ($notifications);
}
// function mark_notif($notif_id){
// 	global $db;
// 	return $db->update_by_id('pos_borrow_notifications',[
// 			'unread' => 0
// 		],)
// }


function get_outlets(){
	global $db;
	if($outlets = get_cache('outlets', true)){
		return $outlets;
	} else {
		$outlets = [];
		$rows = $db->select('pos_wc_poin_of_sale_outlets', '*');
		foreach($rows as $outlet){
			$outlet['contact'] = json_decode($outlet['contact'],true);
			$outlet['social'] = json_decode($outlet['social'],true);
			$outlet['sku_prefix'] = get_sku_prefix($outlet['name']);
			$outlets[] = $outlet;
		}
		save_cache('outlets', $outlets);
		return ($outlets);
	}
}

function get_outlet($outlet_id){
	$outlets = get_outlets();
	foreach($outlets as $outlet){
		if($outlet['ID'] == $outlet_id){
			return $outlet;
		}
	}
}

function get_stock_alerts($outlet_id){
	global $config;
	$stocks = get_ingredients_by_outlet(get_outlet($outlet_id)['sku_prefix']);
	$stock_alerts = [];
	foreach($stocks as $stock){

		if($stock->stock_quantity == 0){
			$stock_alerts['out_of_stock'][] = $stock;
			break;
		}

		if($stock->stock_quantity <= $config->stock_threshold){
			$stock_alerts['threshold_reached'][] = $stock;
			break;
		}
	}

	return $stock_alerts;
}

function get_categories(){
	global $client;
	try {
		return $client->products->get_categories();
	} catch (WC_API_Client_Exception $e){
		return HandleException($e);
	}
}

function HandleException($e){
	global $options;
	if($options['debug']){
		echo $e->getMessage() . PHP_EOL;
		echo $e->getCode() . PHP_EOL;
		if ( $e instanceof WC_API_Client_HTTP_Exception ) {
			print_r( $e->get_request() );
			print_r( $e->get_response() );
		}
	}
	return $e->get_response();
}

function get_sku_prefix($name){
	return str_replace(['A','E','I','O','U',' '], "", strtoupper($name));
}

function get_product_sku($prefix, $product_name){
	$serial = generate_serial();
	$name = get_sku_prefix($product_name);

	return $prefix . '-' . $name . '-' . $serial;
}

function print_debug($obj){
	global $options;
	if($options['debug']){
		print_r($obj);
	}
}

function sku_taxonomy($sku){
	global $outlets;
	$taxonomy = [];
	$sku_x = explode("-", $sku);
	if(sizeof($sku_x) > 2){
		$taxonomy['branch'] = @get_outlet_by_sku($sku_x[0])['name'];
		$taxonomy['sku_prefix'] = $sku_x[0];
		$taxonomy['ingredient_sku'] = $sku_x[1];
		$taxonomy['serial'] = $sku_x[2];
		$taxonomy['unit'] = (isset($sku_x[3])) ? $sku_x[3] : '';
	} else {
		$taxonomy = [
			'branch' => "",
			'sku_prefix' => "",
			'ingredient_sku' => "",
			'serial' => "",
			'unit' =>''
		];
	}

	return $taxonomy;
}

function generate_serial(){
	return substr(md5(microtime()),rand(0,26),6);
}

function get_current_outlet(){
	if(isset($_GET['outlet_id']) && $_GET['outlet_id'] != ''){
		return get_outlet($_GET['outlet_id']);
	} else {
		return [];
	}
}
function generate_sku(){
	return get_current_outlet()['sku_prefix'];
}

function show_response(){
	return isset($_GET['after_action']);
}
function base_url(){
	if(isset($_GET['outlet_id']) && $_GET['outlet_id'] != ''){
		return 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']) . '/?outlet_id=' . $_GET['outlet_id'];
	}
}


function get_outlet_by_sku($sku_prefix){
	global $outlets;
	$outlet = [];

	foreach($outlets as $otl){
		if($otl['sku_prefix'] == $sku_prefix){
			$outlet = $otl;
		}
	}

	return $outlet;
}
function clear_cache(){
	global $config;
	$files = glob($config->cache_location . '*.json'); 
	foreach($files as $file){ 
	  if(is_file($file))
	    unlink($file); 
	}
}

function remove_cache($identifier){
	global $config;

	if(file_exists($config->cache_location . $identifier . '.json')){
		unlink($config->cache_location . $identifier . '.json');
	}
}
function get_cache($identifier, $as_array=false){
	global $config;
	$file = $config->cache_location . $identifier . '.json';
	if(file_exists($file)){
		return json_decode(file_get_contents($file), $as_array);
	}
	return false;
}
function save_cache($identifier, $data){
	global $config;
	$data_ = json_encode($data);
	file_put_contents($config->cache_location . $identifier . '.json', $data_);
}
