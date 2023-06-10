<?php

	include 'includes/config.php';

	// Check if user is logged in
	$isLoggedIn = isset($_SESSION['email']) && isset($_SESSION['pass']);

	// Get car details
	$carId = $_GET['id'];
	$sel = "SELECT * FROM cars WHERE car_id = '$carId'";
	$rs = $conn->query($sel);
	$rws = $rs->fetch_assoc();

	// Handle form submission
	if (isset($_POST['save'])) {
		$fname = $_POST['fname'];
		$id_no = $_POST['id_no'];
		$gender = $_POST['gender'];
		$email = $_POST['email'];
		$phone = $_POST['phone'];
		$location = $_POST['location'];

		$qry = "INSERT INTO client (fname, id_no, gender, email, phone, location, car_id, status)
				VALUES ('$fname', '$id_no', '$gender', '$email', '$phone', '$location', '$carId', 'Pending')";

		$result = $conn->query($qry);

		if ($result) {
			echo "<script type=\"text/javascript\">
					alert(\"Successfully Registered. Proceed to pay\");
					window.location = \"pay.php\";
				</script>";
			exit;
		} else {
			echo "<script type=\"text/javascript\">
					alert(\"Registration Failed. Try Again\");
					window.location = \"book_car.php?id=$carId\";
				</script>";
			exit;
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>NELAYANID</title>
	<meta charset="utf-8">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">

	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</head>
<body>
	<section class="">
		<?php include 'header.php'; ?>

		<section class="caption">
			<h2 class="caption" style="text-align: center">Temukan Kapal Terbaik di Daerahmu</h2>
			<h3 class="properties" style="text-align: center">Segala Jenis Kapal Tersedia di Sini</h3>
		</section>
	</section><!--  end hero section  -->

	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
				<li>
					<a href="book_car.php?id=<?php echo $rws['car_id'] ?>">
						<img class="thumb" src="cars/<?php echo $rws['image']; ?>" width="300" height="200">
					</a>
					<span class="price"><?php echo 'Kshs.' . $rws['hire_cost']; ?></span>
					<div class="property_details">
						<h1>
							<a href="book_car.php?id=<?php echo $rws['car_id'] ?>"><?php echo 'Car Make > ' . $rws['car_type']; ?></a>
						</h1>
						<h2>Car Name/Model: <span class="property_size"><?php echo $rws['car_name']; ?></span></h2>
					</div>
				</li>
				<h3>Melanjutkan Untuk Menyewa <?php echo $rws['car_name']; ?>.</h3>
				<?php if (!$isLoggedIn) : ?>
					<form method="post">
						<table>
							<tr>
								<td>Full Name:</td>
								<td><input type="text" name="fname" required></td>
							</tr>
							<tr>
								<td>Phone Number:</td>
								<td><input type="text" name="phone" required></td>
							</tr>
							<tr>
								<td>Email Address:</td>
								<td><input type="email" name="email" required></td>
							</tr>
							<tr>
								<td>ID Number:</td>
								<td><input type="text" name="id_no" required></td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td>
									<select name="gender">
										<option> Select Gender </option>
										<option> Male </option>
										<option> Female </option>
									</select>
								</td>
							</tr>
							<tr>
								<td>Location:</td>
								<td><input type="text" name="location" required></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:right"><input type="submit" name="save" value="Submit Details"></td>
							</tr>
						</table>
					</form>
				<?php else : ?>
					<a href="pay.php">Click to Book</a>
				<?php endif; ?>
				</li>
			</ul>
		</div>
	</section><!--  end listing section  -->

	<footer>
		<div class="wrapper footer">
			<ul>
				<li class="links">
					<ul>
						<li>OUR COMPANY</li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Policy</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</li>

				<li class="links">
					<ul>
						<li>OTHERS</li>
						<li><a href="#">...</a></li>
						<li><a href="#">...</a></li>
						<li><a href="#">...</a></li>
						<li><a href="#">...</a></li>
					</ul>
				</li>

				<li class="links">
					<ul>
						<li>OUR VEHICLE TYPES</li>
						<li><a href="#">Kapal Rawai</a></li>
						<li><a href="#">Kapal Jaring Insang</a></li>
						<li><a href="#">Kapal Jaring Angkat</a></li>
						<li><a href="#">Others.</a></li>
					</ul>
				</li>

				<li>
				</li>
			</ul>
		</div>
	</footer>
</body>
</html>
