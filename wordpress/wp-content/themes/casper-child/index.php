<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package Casper
 */

get_header(); ?>


		<?php if ( have_posts() ) : ?>

			<?php /* Start the Loop */ ?>
			<?php while ( have_posts() ) : the_post(); ?>
            
            <div class="hentry">
            <h1 class="post-title"><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h1>
            <div class="img-home">
            <?php if ( has_post_thumbnail() ) { // check if the post has a Post Thumbnail assigned to it.
  					the_post_thumbnail();
					
					}
					?></div>
                    </div>

			<?php endwhile; ?>

			<?php casper_paging_nav(); ?>


		<?php else : ?>

			<?php get_template_part( 'content', 'none' ); ?>

		<?php endif; ?>
		
		
		
<?php get_footer(); ?>
