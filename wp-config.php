<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'pos.ae');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' wp>4nbNs[Ah<z4 lT%zW=jj9aI `=/.j-6@vj#`&>]5>zUw.!,qX,b_Frse?%w:');
define('SECURE_AUTH_KEY',  'Dzi_]DBY8%|*9<@fc8=M<D,YO=uU-c5W%NDw3K}}]f;5{oH=tVqaE>WL:9FS/r>x');
define('LOGGED_IN_KEY',    '^6Y$PL8l9 1,k6rln1@}U?V.~7vpHdwB(Br/f5}2MYHs,TP1a,|m]Z,cg2.eYz!z');
define('NONCE_KEY',        'n3l7w8=&n/o+vq}Wyy4xH):go+Dkm5M~,dkW}8p{L-SbjaA]b1-n/19r,LJL%P.8');
define('AUTH_SALT',        'bA|HkLeI!YU]!o.0AP;|EjJ%/}eg7+z`@|)j.6-cU{8MOw_eGKNU0{#CI0F?rh97');
define('SECURE_AUTH_SALT', 'gXw|3q_10fgImM/+cti.+sLT/W>HL!+ARd]No4qD;`={]%:|, Dr22m4;c%ogxhR');
define('LOGGED_IN_SALT',   'YT2z_.OjZLj:zV|C1&ld_[,|&ZoQ++H1@WHo-tGh`v4)3%/JDbX{Wn.%( F|V9#J');
define('NONCE_SALT',       '_-zXIfc$(.$E<r+z3,./%xl`]>hV#x-<yQ]7_}+[[H-k`=.=n&F5A<>=`Ei({ +v');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'pos_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
