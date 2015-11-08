<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package Casper
 */
?>
	<footer id="colophon" class="site-footer" role="contentinfo">
		<div class="site-info inner">
		    <section class="copyright">
		    
		     <!--social-->
            <div class="social-icons">
                    <?php if ( false != get_theme_mod( 'casper_social_youtube')) { ?>
                        <a class="icon-youtube" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_youtube') ); ?>">
                            <span class="hidden"><?php _e( 'Youtube', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_tumblr')) { ?>
                        <a class="icon-tumblr" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_tumblr') ); ?>">
                            <span class="hidden"><?php _e( 'Tumblr', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_instagram')) { ?>
                        <a class="icon-instagram" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_instagram') ); ?>">
                            <span class="hidden"><?php _e( 'Instagram', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_google')) { ?>
                        <a class="icon-google-plus" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_google') ); ?>">
                            <span class="hidden"><?php _e( 'Google+', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_facebook')) { ?>
                        <a class="icon-facebook" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_facebook') ); ?>">
                            <span class="hidden"><?php _e( 'Facebook', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_twitter')) { ?>
                        <a class="icon-twitter" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_twitter' ) ); ?>">
                            <span class="hidden"><?php _e( 'Twitter', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_website')) { ?>
                        <a class="icon-home" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_website') ); ?>">
                            <span class="hidden"><?php _e( 'Home', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_mail')) { ?>
                        <a class="icon-envelope" target="_blank" href="<?php echo esc_url( 'mailto:' . get_theme_mod( 'casper_social_mail') ); ?>">
                            <span class="hidden"><?php _e( 'Email', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_linkedin')) { ?>
                        <a class="icon-linkedin" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_linkedin') ); ?>">
                            <span class="hidden"><?php _e( 'LinkedIn', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_github')) { ?>
                        <a class="icon-github-alt" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_github') ); ?>">
                            <span class="hidden"><?php _e( 'GitHub', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_bitbucket')) { ?>
                        <a class="icon-bitbucket" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_bitbucket') ); ?>">
                            <span class="hidden"><?php _e( 'Bitbucket', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_stack_overflow')) { ?>
                        <a class="icon-stack-overflow" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_stack_overflow') ); ?>">
                            <span class="hidden"><?php _e( 'Stack Overflow', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_dribbble')) { ?>
                        <a class="icon-dribbble" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_dribbble') ); ?>">
                            <span class="hidden"><?php _e( 'Dribbble', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_behance')) { ?>
                        <a class="icon-behance" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_behance') ); ?>">
                            <span class="hidden"><?php _e( 'Behance', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_rss')) { ?>
                        <a class="icon-feed" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_rss') ); ?>">
                            <span class="hidden"><?php _e( 'RSS', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_codepen')) { ?>
                        <a class="icon-codepen" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_codepen') ); ?>">
                            <span class="hidden"><?php _e( 'CodePen', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_deviantart')) { ?>
                        <a class="icon-deviantart" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_deviantart') ); ?>">
                            <span class="hidden"><?php _e( 'Deviant Art', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_flickr')) { ?>
                        <a class="icon-flickr" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_flickr') ); ?>">
                            <span class="hidden"><?php _e( 'Flickr', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_lastfm')) { ?>
                        <a class="icon-lastfm" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_lastfm') ); ?>">
                            <span class="hidden"><?php _e( 'LastFM', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_soundcloud')) { ?>
                        <a class="icon-soundcloud" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_soundcloud') ); ?>">
                            <span class="hidden"><?php _e( 'SoundCloud', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                    <?php if ( false != get_theme_mod( 'casper_social_spotify')) { ?>
                        <a class="icon-spotify" target="_blank" href="<?php echo esc_url( get_theme_mod( 'casper_social_spotify') ); ?>">
                            <span class="hidden"><?php _e( 'Spotify', 'casper' ); ?></span>
                        </a>
                    <?php } ?>
                </div>
                <!--social end-->
		    
		    	<?php if(  false == get_theme_mod( 'casper_custom_footer') ) { ?>
		    		<?php printf( __( '<a href="%1$s" rel="home">Web app</a> by Team 11', 'casper' ), esc_url( 'http://ec2-54-216-244-128.eu-west-1.compute.amazonaws.com/wordpress/' ) ); ?>
		    	<?php } else { echo get_theme_mod( 'casper_custom_footer'); } ?>
		    </section>
		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</main><!-- /#content -->

<?php wp_footer(); ?>
</body>
</html>
