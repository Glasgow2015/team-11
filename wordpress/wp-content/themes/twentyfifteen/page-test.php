<?php
/**
 *Template Name: Database
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

		<?php

			echo "string";
			echo "asdasd";
			$rows = $wpdb->get_results( 'SELECT * FROM Report'); 
			print_r($rows);
		?>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_footer(); ?>
