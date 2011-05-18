<?php

// käyttäjän lähettämä data on aina tarkistettava (tässä tapauksessa mysql_real_escape_string)

$radio = $_POST['radio'];
$virkkeet = mysql_real_escape_string($_POST['virkkeet']);
$kappaleet = mysql_real_escape_string($_POST['kappaleet']);
$random = $_POST['random'];
$varitys = $_POST['varit'];

include("puppu.php");

if ($varitys == "undefined") { $varitys = false; } else { $varitys = true; }

if ($radio == "virke") {

$virke = new puppu();
echo $virke->virke($varitys);

}

// ja jälleen turvallisuuden takia tehdään toinen tarkistus (is_numeric)

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