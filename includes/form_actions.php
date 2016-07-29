<?php
$response = [];

//fucking handle the fucking form control
if(isset($_GET['action']) && $_GET['action'] != ''){
	//execute function 
	$_GET['action']();
}

function add(){
	global $response;
	if(isset($_POST['sku']) && sizeof($_POST) > 3){
		extract($_POST);
		$resp = create_product($title, $sku, $stock_quantity, $weight, $unit);
		if(property_exists($resp, "product")){
			$response['message'] = "Item added to inventory.";
			$response['status'] = 'success';
		} else if(property_exists($resp, "body")){
			$response['message'] = json_decode($resp->body)->errors[0]->message;
			$response['status'] = 'danger';
		}
	}
}

function update(){
	global $response;

	if(isset($_GET['id']) && $_GET['id'] != ''){
		extract($_POST);
		$resp = update_product($_GET['id'], $title, $sku, $stock_quantity, $weight, $unit);
		if(property_exists($resp, "product")){
			$response['message'] = "Item details updated.";
			$response['status'] = 'success';
		} else if(property_exists($resp, "body")){
			$response['message'] = json_decode($resp->body)->errors[0]->message;
			$response['status'] = 'danger';
		}
	}
}

function delete(){
	global $response;

	if(isset($_GET['id']) && $_GET['id'] != ''){
		extract($_POST);
		$resp = delete_product($_GET['id']);
		if(property_exists($resp, "product")){
			$response['message'] = "Item details deleted.";
			$response['status'] = 'success';
		} else if(property_exists($resp, "body")){
			$response['message'] = json_decode($resp->body)->errors[0]->message;
			$response['status'] = 'danger';
		}
	}
}

function borrow(){
	global $response;

	$to = get_outlet($_POST['to_branch']);
	$from = get_outlet($_POST['from_branch']);

	$remaining_stocks = $_POST['original_quantity'] - $_POST['stock_quantity'];


	//check for duplicates/ same ingredients from the destination branch
	$to_ingr = get_ingredients_by_outlet($to['sku_prefix']);
	$duplicate_found = false;
	$proc1 = "";
	$proc2= "";

	foreach($to_ingr as $ing){
		if($ing->title == $_POST['title']){
			//there's duplicate
			//update
			$proc1 = update_product($ing->id, $_POST['title'], $ing->sku, ($ing->stock_quantity + $_POST['stock_quantity']), $_POST['weight'], $_POST['unit']);
			$duplicate_found = true;
			break;
		}
	}

	if(!$duplicate_found){
		$proc1 = create_product($_POST['title'], get_product_sku($to['sku_prefix'], $_POST['title']), $_POST['stock_quantity'], $_POST['weight'], $_POST['unit']);
	}
	//second, update the original product with new details, remaining stocks;
	$proc2 = update_product($_POST['item_id'], $_POST['title'], $_POST['sku'], $remaining_stocks, $_POST['weight'], $_POST['unit']);


	if(property_exists($proc1, "product") && property_exists($proc2, "product")){
		$response['message'] = $from['name'] . " has been notified for the transfer.";
		$response['status'] = 'success';

		send_notification($_POST['from_branch'], $_POST['to_branch'], $_POST['item_id'], $_POST['stock_quantity']);

	} else if(property_exists($proc1, "body") && property_exists($proc2, "body")){
		$response['message'] = json_decode($resp->body)->errors[0]->message;
		$response['status'] = 'danger';
	}
}


function addused(){
	if(!sizeof($_POST) >= 4){
		return false;
	}
	if(add_to_used($_POST['item_id'], $_POST['outlet_id'], $_POST['used'], $_POST['original'])){
		$response['message'] = "Added to used ingredients.";
		$response['status'] = 'success';
	}
}
