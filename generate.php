<?php

$radio = $_POST['radio'];
$virkkeet = $_POST['virkkeet'];
$kappaleet = $_POST['kappaleet'];
$random = $_POST['random'];
$varitys = $_POST['varit'];

include("puppu.php");

if ($varitys == "undefined") { $varitys = false; } else { $varitys = true; }

if ($radio == "virke") {

$virke = new puppu();
echo $virke->virke($varitys);

}

// turvallisuuden takia (is_numeric)

elseif ($radio == "kappale" && is_numeric($virkkeet)) {

$lkm = $virkkeet;

$virke = new puppu();
echo $virke->kappale($lkm, $varitys);

}

elseif ($radio == "teksti" && is_numeric($kappaleet)) {

$kpl = $kappaleet;

if ($random == "true") {

$virke = new puppu();
echo $virke->teksti($kpl, 4, true, $varitys);

	}

elseif ($random == "undefined") {

$virke = new puppu();
echo $virke->teksti($kpl, 4, false, $varitys);

	}
}

else {

echo "Tapahtui mystinen virhe.";

}

?>