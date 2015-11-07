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
			$user_ID = get_current_user_id();
			echo $user_ID;
			print_r(get_user_meta($user_ID, 'address'));
		?>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_footer(); ?>
