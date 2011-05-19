<?php
/**
 *	Puppugeneraattori
 *
 *	Toimintaperiaatteesta osoitteessa http://unknownpixels.com/blogi.php?kategoria=ohjelmointi&id=113
 *
 *	Vaatii toimiakseen neljä eri taulua tietokantaan. Tietokantaan yhdistämiset hoidettava itse.
 *
 * 	Esimerkkejä
 *
 *	$obj = new puppu();
 *
 *	Virke (värit)
 *	echo $obj->virke(false);
 *
 *	Kappale (virkkeiden määrä, värit)
 *	echo $obj->kappale(5, false);
 *
 *	Kokonainen teksti (kappaleet, virkkeet per kappale, satunnaista, värit)
 *	echo $obj->teksti(3,4,true,false);
 *
 * @author     Olli-Pekka Heinisuo <http://unknownpixels.com> <o-p@unknownpixels.com>
 * @version    0.7
 */

class puppu {

// satunnaisarrayn alustus
public $gen = array(1 => '', 2 => '', 3 => '',  4 => '');

// taulujen nimet eli virkkeen rakennuspalikat
public $a = array(0 => 'puhuttelu', 1 => 'subjekti', 2 => 'predikaatti',  3 => 'kohde');

// värikoodaus tekstille
public $varit = array(0 => "#5894b3", 1 => "#b36558", 2 => "#6db358",  3 => "#d8de70");

// virkkeiden määrän sekä kappaleiden määrän maksimit
public $limit = array(6, 6);

	function __construct() 
	
	{
		$a = $this->a;
		
		// tarkistetaan, että kaikissa tauluissa sama määrä rivejä
		
		$query = "SELECT counta, countb, countc, countd FROM
				(SELECT COUNT(id) AS counta FROM $a[0]) AS a,
				(SELECT COUNT(id) AS countb FROM $a[1]) AS b,
				(SELECT COUNT(id) AS countc FROM $a[2]) AS c,
				(SELECT COUNT(id) AS countd FROM $a[3]) AS d";
					
		$result = mysql_query($query) or die('Virhe mysql-haussa.');
		$rivit = mysql_fetch_array($result);

		if ($rivit[counta] == $rivit[countb] && $rivit[countb] == $rivit[countc] && $rivit[countc] == $rivit[countd]) 
		{
		$this->yht = $rivit[counta];
		$this->total = pow($rivit[counta], 4);
		}
		else 
		{ 
		die ("Virhe. Taulujen rivimäärät eivät täsmää: $a[0] = $rivit[0], $a[1] = $rivit[1], $a[2] = $rivit[2], $a[3] = $rivit[3]"); 
		}

	}
	
// tulostaa infoa tietokannasta
	
public function info() {

echo "Rivien määrä: $this->yht";
echo "Erilaisten virkkeiden määrä: $this->total";

}

// Tietokantahaku

public function haku($taulu, $id) {

$query = "SELECT id, text FROM $taulu WHERE id=$id";
$result = mysql_query($query) or die("Virhe.");
$row = mysql_fetch_array($result, MYSQL_NUM);
return $row;

}

// generoi satunnaisen arrayn
	
public function generator() {

$gen = $this->gen;
$yht = $this->yht;

for($i = 1; $i < 5; $i++) {

    $gen[$i] = rand(1, $yht);
	
	}

// lisää satunnaisuutta
shuffle($gen);
return $gen;

}

// luo yksittäisen virkkeen, osien värjäys jos tarve

public function virke($varit = false) {

$gen = $this->generator();
$a = $this->a;
$vari = $this->varit;

// haetaan tietokannasta satunnaisarrayn määrittämien id:n arvojen mukaiset osaset, tauluja on 4 kpl

for ($i = 0; $i < 4; $i++) {

$row = $this->haku($a[$i], $gen[$i]);

if ($varit == false) { echo "$row[1] "; }

elseif ($varit == true) { echo "<span style=\"color: $vari[$i]\">$row[1] </span>"; }

	}
}
		
// luo kappaleen määritetyllä virkemäärällä ($lkm)
		
public function kappale($lkm, $varit = false)
{

$limit = $this->limit;

if ($lkm <= $limit[0]) {

//Looppi virkkeiden lukumäärän mukaisesti

for ($k = 1; $k < $lkm+1; $k++) {

$gen = $this->generator();

// Ensimmäisen virkkeen päästävä läpi ehdoitta

if ($k == 1) {

echo $this->virke($varit);
$genb = $gen;

	}

// Jos edellinen virke ei sisällä samoja arvoja kuin seuraava, tulostetaan

elseif (!count(array_intersect_assoc($gen, $genb)) && $k > 1) {

echo $this->virke($varit);
$genb = $gen;

	} 

// Jos samoja arvoja löytyy peräkkäisistä virkkeistä, arvotaan uudestaan yhden kerran (muuten loopista saattaa tulla hyvin pitkä ja raskas)

else {

/*
DEBUG only
print_r($gen);
print_r($genb);
*/

$gen = $this->generator();
echo $this->virke($varit);
$genb = $gen;

		}

	}
	
}
	
else { echo "Virkkeiden lukumäärä liian suuri."; }
	
}
	
// kokonainen teksti, (kappaleiden lukumäärä,virkkeiden lukumäärä kappaleessa, random, värit)
	
public function teksti($kpl, $lkm = 4, $random = false, $varit = false) {

	$limit = $this->limit;
	
	if ($random == true) {
	
	for ($i = 1; $i < $kpl+1; $i++) {
	
	$lkm = rand(3,5);

	$kappale = $this->kappale($lkm, $varit);
	echo "<p>$kappale</p>";
	
			}
	}
	elseif ($random == false && $lkm <= $limit[1]) {

	// Looppi kappaleiden lukumäärän mukaisesti

	for ($i = 1; $i < $kpl+1; $i++) {

	$kappale = $this->kappale($lkm, $varit);
	echo "<p>$kappale</p>";

			}

	}
	
	else { echo "Kappaleiden lukumäärä liian suuri."; }
		
	
	}
}

?>