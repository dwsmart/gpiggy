<?php
header('Content-Type: application/json');
// testing only, you wouldn't allow this in production
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Authorization, Origin, Content-Type, X-Auth-Token');
try {
$dbh = new PDO('mysql:host=localhost;dbname=<database-name>', '<username>', '<pass>');
 } catch(Exception $e) {
  exit('Unable to connect to database.');
 }
$data = json_decode(file_get_contents('php://input'), true);

$lookup = $dbh->prepare("SELECT * FROM `routes` WHERE `request` = :route");
$lookup->execute(array(
	":route" => $data['route']
));
$route = $lookup->fetch(PDO::FETCH_ASSOC);
// make sure we get a match
if ($lookup->rowCount() > 0) {
	if ($route['type'] == "cat") {
		$catgories = $dbh->prepare("SELECT * FROM `categories` WHERE `category_id` = :id");
		$catgories->execute(array(':id' => $route['target']));
		$cat = $catgories->fetch(PDO::FETCH_ASSOC);
		$pigs = $dbh->prepare("SELECT r.`request`, p.`name`, p.`image` FROM `pigs` as p, `routes` as r WHERE p.`category` = :id AND r.`target` = p.`pig_id` AND r.`type` = 'pig'");
		$pigs->execute(array(':id' => $route['target']));
		$pig = $pigs->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode(array('route' => $route, 'cat' => $cat, 'pig' => $pig));
	}
	if ($route['type'] == "pig") {
		$pigs = $dbh->prepare("SELECT r.`request`, p.* FROM `pigs` as p, `routes` as r WHERE p.`pig_id` = :id AND r.`target` = p.`category` AND r.`type` = 'cat'");
		$pigs->execute(array(':id' => $route['target']));
		$pig = $pigs->fetch(PDO::FETCH_ASSOC);
		echo json_encode(array('route' => $route, 'pig' => $pig));
	}
	if ($route['type'] == "redirect") {
		echo json_encode(array('route' => $route));
	}
}