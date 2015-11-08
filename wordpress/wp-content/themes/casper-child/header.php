<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package Casper
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />

<title><?php wp_title( '|', true, 'right' ); ?></title>

<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>

<header id="masthead" role="banner" class="site-head site-header" <?php if(get_header_image() ) : ?>style="background-image: url(<?php esc_url(header_image()); ?>);"<?php endif ?>>
    <nav id="site-navigation" class="main-navigation" role="navigation">
        <div>
            <h1 class="menu-toggle">
                <a class="icon-bars" href="#">
                    <span class="hidden"><?php _e( 'Menu', 'casper' ); ?></span>
                </a>
            </h1>
            <a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'casper' ); ?></a>
            <?php wp_nav_menu( array( 'theme_location' => 'primary' ) ); ?>
            
        </div>
    </nav><!-- #site-navigation -->

    <div class="vertical-row">
        <div class="vertical">
            <div class="site-head-content inner">
                <?php if ( get_theme_mod( 'casper_logo' ) ) : ?>
                    <a class="blog-logo" href='<?php echo esc_url( home_url( '/' ) ); ?>' rel='home'><img src='<?php echo esc_url( get_theme_mod( 'casper_logo' ) ); ?>' alt='<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>'></a>
                <?php endif; ?>
                <h1 class="blog-title"><?php bloginfo( 'name' ); ?></h1>
                <a href="http://ec2-54-216-244-128.eu-west-1.compute.amazonaws.com/wordpress/wp-login.php"><button type="button" class="button-full">Sign up/in</button></a>
               
                <a href="http://ec2-54-216-244-128.eu-west-1.compute.amazonaws.com/wordpress/index.php/report-incident/"><button type="button" class="button-full">Report</button></a>
                <h2 class="blog-description"><?php bloginfo( 'description' ); ?></h2>
            </div>
        </div>
    </div>
</header><!-- #masthead -->

<main id="content" class="content" role="main">
