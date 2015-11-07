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
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'code4good');

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
define('AUTH_KEY',         'w1)F/FN|I2ef6~nk[zy(z`/vy`Iin!0-876$RqWz+blK*`+caH@W}sl;Y-7}1p<Z');
define('SECURE_AUTH_KEY',  'XrFY<s>3i?rP;sNU_eVq>BL ?3-t +Q=/<,`{2^D+;--%V #N(W1e_zSZ~Q6<9UK');
define('LOGGED_IN_KEY',    'YZm#| GIH1x$J,K;,|]k{9Ii=}==el/CgEzz)MLhKO<@OHC!~&f 1-{:~7;hjAk$');
define('NONCE_KEY',        'K@3ENQ-=-osG]C/Mr]V|G]wg,;;UL%!E.U]Oz,oupI{.|a${04kWu2o(}d2Pa/e^');
define('AUTH_SALT',        ';sj2E$vEq NcNrNQ-A,0p(!Z9N _U~FQ(ww`2WgZy^oa3R|Ndan&.}]aJB_Gtfs#');
define('SECURE_AUTH_SALT', '@o39Hq#YN/Ftk@@;7=EUo7yo^=N@|ut|v:O)+YT<@w8xgT5(0z6Wh*%2+0O_-cv(');
define('LOGGED_IN_SALT',   'Gi9l7xygFeeIN:+F<DF!{oCEKQ)YVnQKN[q|.N?R7&[KC-tDq}f*SoP#?gM|Ps13');
define('NONCE_SALT',       '<r+),]^.BGeLg+~@j9u+.=!Qci 7itpVwAl17=h-E*C;7c&$y~i->gXhH5~n(C]_');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

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

