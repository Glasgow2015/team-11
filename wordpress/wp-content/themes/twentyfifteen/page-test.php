<?php
/**
 *Template Name: Database
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>

	<?php $st = (isset($_GET['usersearch']) ? $_GET['usersearch'] : '' ); ?>
	<form action="" method="get">
    <label for="usersearch">Search Term:</label>
    <input name="usersearch" id="usersearch" value="<?php echo $st; ?>" type="text">
    <input name="dosearch" type="submit" value="Submit">
	</form>

		<?php
			echo $_POST["name"];
		$blogusers = get_users('include=2,3,4,5,6,7,8');
		foreach ($blogusers as $user) {
   		 echo '<li>'
    		. get_avatar($user->ID, 120) .
    		'<br />'
    			. $user->display_name .
   			 '<br />'
    			. $user->user_email .
   			 '<br />'
    			. get_user_meta($user->ID, 'description', true) .
    			'</li>';
}
?>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_footer(); ?>
