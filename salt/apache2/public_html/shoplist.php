//Code has been copied from terokarvinen.com as example.

<?php
// connect
$pdo=new PDO("mysql:host=localhost;charset=UTF8;dbname=kgtestdb", 'kgtestdb', 'liefi7doh3phaa9uReirei4eteixie');
// insert
$name = $_GET["name"];
if ("" != $name) {
	echo "<p>Shopping List.</p>";
	$pdoStatement=$pdo->prepare("INSERT INTO kgtestdb (name) VALUES (:name)");
	$pdoStatement->bindParam(':name', $name);
	$pdoStatement->execute();
}
// list
$pdoStatement=$pdo->prepare('SELECT * FROM kgtestdb;');
$pdoStatement->execute();
$hits=$pdoStatement->fetchAll();
foreach($hits as $row) {
     echo "<p>".$row['id']." ".htmlentities($row['name'])." </p>\n";
}
?>
<form method=get>
	<input type=text name=name value="">
	<input type=submit>
</form>
