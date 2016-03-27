<?php
/**
 * Plugin Name: WooCommerce Point of Sale
 * Plugin URI: http://actualityextensions.com/
 * Description: WooCommerce Point of Sale is an extension which allows you to enter a customer order using the point of sale interface. This extension is suitable for retailers who have both on online and offline store.
 * Version: 3.0.7
 * Author: Actuality Extensions
 * Author URI: http://actualityextensions.com/
 * Tested up to: 4.2
 *
 * Copyright: (c) 2015 Actuality Extensions (info@actualityextensions.com)
 *
 * License: GNU General Public License v3.0
 * License URI: http://www.gnu.org/licenses/gpl-3.0.html
 *
 * @package     WC-Point-Of-Sale
 * @author      Actuality Extensions
 * @category    Plugin
 * @copyright   Copyright (c) 2015, Actuality Extensions
 * @license     http://www.gnu.org/licenses/gpl-3.0.html GNU General Public License v3.0
 */

if ( !defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if (function_exists('is_multisite') && is_multisite()) {
    include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
    if ( !is_plugin_active( 'woocommerce/woocommerce.php' ) )
        return;
}else{
    if (!in_array('woocommerce/woocommerce.php', apply_filters('active_plugins', get_option('active_plugins'))))
        return; // Check if WooCommerce is active    
}

// Load plugin class files
require_once( 'includes/class-wc-pos.php' );

/**
 * Returns the main instance of WC_POS to prevent the need to use globals.
 *
 * @since    3.0.5
 * @return object WC_POS
 */
function WC_POS () {
	$instance = WC_POS::instance( __FILE__, '3.0.5' );
	return $instance;
}
// Global for backwards compatibility.
global $wc_point_of_sale, $wc_pos_db_version;

$wc_pos_db_version      = WC_POS()->db_version;
$wc_point_of_sale       = WC_POS();
$GLOBALS['wc_pos'] = WC_POS();