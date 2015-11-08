<?php
/**
 *Template Name: Database
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=geometry"></script>
	<?php $st = (isset($_GET['interest']) ? $_GET['interest'] : '' ); ?>
	<?php $loc = (isset($_GET['locat']) ? $_GET['locat'] : '' ); ?>
	<form action="?" method="get">
    <label for="locat">Location:</label>
    <input name="locat" id="locat" value="<?php echo $loc;?>" type="text">
	<br>
    <label for="interest">Interests:</label>
    <input name="interest" id="interest" value="<?php echo $st;?>" type="text">
    <input name="dosearch" type="submit" value="Submit">
	</form>
	<br>
	<?php
		$interest = '';
		$locat = '';
		if (!(current_user_can('contributor') || current_user_can('administrator')) ){
    		wp_die("Access denied, must be logged in as admin.");
    		exit;
		} else if( isset( $_GET['interest'] ) ){
			$interest = stripslashes( trim($_GET['interest']) );
		} else if (isset( $_GET['locat'] )){
			$locat = stripslashes( trim($_GET['locat']) );
		}
		$blogusers = get_users('include=1,2,3,4,5,6,7,8');
		foreach ($blogusers as $user) {
			$interest = strtolower($interest);
			$locat = strtolower($locat);
			$userdesc = strtolower(get_user_meta($user->ID, 'description', true));
			if ($locat == ''){
				if (strpos($userdesc, $interest) !== false) {    	 
			    echo '<li>'
			    . get_avatar($user->ID, 120) .
			    '<br />'
			    . $user->display_name .
			    '<br />'
			    . $user->user_email .
			    '<br />'
			    . get_user_meta($user->ID, 'description', true) .
			    '<br />'
			    . $user_phone = get_user_meta( $user->ID, 'phone', true ) .
			    '</li>';
				}
			}
			if ($interest == '') {
				get_user_meta( $user->ID, 'address', true );
				if (strpos(get_user_meta( $user->ID, 'address', true ), $interest) !== false){
				echo "success!";
			}
			}
		}
?> 
<?php 
     // $user_id = get_current_user_id(); 
     // $key = 'phone'; 
     // $single = true; 
     // $user_last = get_user_meta( $user_id, $key, $single ); 
     // echo $user_last; 
?>
<?php
// function get_clients() { 

//     $users = array();
//     $roles = array('subscriber', 'custom_role1', 'custom_role2');

//     foreach ($roles as $role) :
//         $users_query = new WP_User_Query( array( 
//             'fields' => 'all_with_meta', 
//             'role' => $role, 
//             'orderby' => 'display_name'
//             ) );
//         $results = $users_query->get_results();
//         if ($results) $users = array_merge($users, $results);
//     endforeach;

//     return $users;
// }
?>
		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_footer(); ?>
