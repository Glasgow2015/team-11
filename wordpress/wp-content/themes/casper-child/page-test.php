<?php
/**
 *Template Name: Database
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

get_header(); ?>
	<?php $loc = (isset($_GET['locat']) ? $_GET['locat'] : '' ); ?>
	<?php $st = (isset($_GET['interest']) ? $_GET['interest'] : '' ); ?>
	<form action="?" method="get">
	<label for="locat">Location:</label>
    <input name="locat" id="locat" value="<?php echo $locat;?>" type="text">
    <div>e.g. g26hs, 45 waterloo street, glasgow</div>
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
			$from = stripslashes( trim ($_GET['locat']));
		}
		$blogusers = get_users('role=subscriber');
		foreach ($blogusers as $user) {
			$address = get_user_meta( $user->ID, 'address', true );
			$interest = strtolower($interest);
			$userdesc = strtolower(get_user_meta($user->ID, 'description', true));
			$from = urlencode($from);
			$to = urlencode($address);
			$data = file_get_contents("http://maps.googleapis.com/maps/api/distancematrix/json?origins=$from&destinations=$to&language=en-EN&sensor=false");
			$data = json_decode($data);
			$time = 0;
			$distance = 0;
			foreach($data->rows[0]->elements as $road) {
			    $time += $road->duration->value;
			    $distance += $road->distance->value;
			}
			if (($from !== '') && ($distance > 3000 || $distance < 1)) {
				continue;
			}
			if (strpos($userdesc, $interest) !== false) {    
			    echo '<li>'
			    . get_avatar($user->ID, 120) .
			    '<br />'
			    . $user->display_name .
			    '<br />'
			    . $user->first_name .
			    '<br />'
			    . $user->last_name .
			    '<br />'
			    . $user->user_email .
			    '<br />'
			    . get_user_meta($user->ID, 'description', true) .
			    '<br />'
			    . get_user_meta( $user->ID, 'dbem_phone', true ) .
			    '</li>';
			}
		}
?> 
<?php 
// $from = "sr nagar,hyderabad";
// $to = "kukatpalle,hyderabad";
// $from = urlencode($from);
// $to = urlencode($to);
// $data = file_get_contents("http://maps.googleapis.com/maps/api/distancematrix/json?origins=$from&destinations=$to&language=en-EN&sensor=false");
// $data = json_decode($data);
// $time = 0;
// $distance = 0;
// foreach($data->rows[0]->elements as $road) {
//     $time += $road->duration->value;
//     $distance += $road->distance->value;
// }
// echo "To: ".$data->destination_addresses[0];
// echo "<br/>";
// echo "From: ".$data->origin_addresses[0];
// echo "<br/>";
// echo "Time: ".$time." seconds";
// echo "<br/>";
// echo "Distance: ".$distance." meters";
?>
		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_footer(); ?>
