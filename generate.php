<?php

$radio = $_POST['radio'];
$virkkeet = $_POST['virkkeet'];
$kappaleet = $_POST['kappaleet'];
$random = $_POST['random'];
$varitys = $_POST['varit'];

include("puppu.php");

if ($varitys == "undefined") { $varitys = false; } else { $varitys = true; }

$virke = new Puppu();

if ($radio == "virke") {

	echo $virke->virke($varitys);

}

// turvallisuuden takia (is_numeric)

elseif ($radio == "kappale" && is_numeric($virkkeet)) {

	$lkm = $virkkeet;

	$kappale = $virke->kappale($lkm, $varitys);
	echo $kappale;

}

elseif ($radio == "teksti" && is_numeric($kappaleet)) {

	$kpl = $kappaleet;
	$lkm = $virkkeet;

	if ($random == "true") {

		$teksti = $virke->teksti($kpl, true, $varitys);
		echo $teksti;
	}

	elseif ($random == "undefined") {

		$teksti = $virke->teksti($kpl, false, $varitys);
		echo $teksti;
	}

}

else {

	echo "Tapahtui mystinen virhe.";

}

?>