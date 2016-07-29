<?php

$store_url = 'http://localhost/pos.ae';
$endpoint = '/wc-auth/v1/authorize';
$params = [
    'app_name' => 'My App Name',
    'scope' => 'read/write',
    'user_id' => 123,
    'return_url' => 'http://localhost/borrow',
    'callback_url' => 'http://localhost/borrow'
];
$query_string = http_build_query( $params );

echo $store_url . $endpoint . '?' . $query_string;