<?php
/*
*	Puppugeneraattori
*
*	Toimintaperiaatteesta osoitteessa h
*	ttp://unknownpixels.com/blogi.php?kategoria=ohjelmointi&id=113
*
*	Vaatii toimiakseen neljä eri taulua tietokantaan, joka on nimetty 
*	muodostettavan pupun mukaan (esim. politiikka tai tekniikka). 
*	Tietokantaan yhdistämiset hoidettava itse.
*
* 	Esimerkkejä
*	
*	Uusi olio, aihe jos tarvetta (default politiikka)
*		
*	$obj = new puppu();
*
*	Virke (värit)
*	echo $obj->virke(false);
*
*	Kappale (virkkeiden määrä, värit)
*	echo $obj->kappale(5, false);
*
*	Kokonainen teksti (kappaleet, satunnaista, värit)
*	echo $obj->teksti(3,true,false);
*
*	@author     Olli-Pekka Heinisuo <http://unknownpixels.com> 
*	@email		<o-p@unknownpixels.com>
*	@version    0.9
*
*/

class Puppu {

	// satunnaisarrayn alustus
	public $gen = array(1 => '', 2 => '', 3 => '',  4 => '');

	// taulujen nimet eli virkkeen rakennuspalikat
	public $a = array(0 => 'puhuttelu', 1 => 'subjekti', 
						2 => 'predikaatti',  3 => 'kohde');

	// värikoodaus tekstille
	public $varit = array(0 => "#5894b3", 1 => "#b36558", 
							2 => "#6db358",  3 => "#d8de70");

	// virkkeiden määrän sekä kappaleiden määrän maksimit, väh. 3,3
	public $limit = array(6, 6);

	function __construct($aihe = "politiikka")
	
	{
		
		$a = $this->a;
		
		try {
			
			// tarkistetaan, että kaikissa tauluissa sama määrä rivejä
			mysql_select_db($aihe);
			
			$query = "SELECT counta, countb, countc, countd FROM
				(SELECT COUNT(id) AS counta FROM $a[0]) AS a,
				(SELECT COUNT(id) AS countb FROM $a[1]) AS b,
				(SELECT COUNT(id) AS countc FROM $a[2]) AS c,
				(SELECT COUNT(id) AS countd FROM $a[3]) AS d";
			
			$result = mysql_query($query);
			if (!$result) {
				throw new PuppuTekstiException("Ongelma tietokantahaussa.");
			}
			else {
				$rivit = mysql_fetch_array($result);
			}
			if ($rivit[counta] == $rivit[countb] && 
			$rivit[countb] == $rivit[countc] && 
			$rivit[countc] == $rivit[countd]) {
			
				$this->yht = $rivit[counta];
				$this->total = pow($rivit[counta], 4);
			}
			else { 
				throw new PuppuTekstiException("Virhe. Taulujen rivimäärät 
				eivät täsmää: $a[0] = $rivit[0], $a[1] = $rivit[1], 
				$a[2] = $rivit[2], $a[3] = $rivit[3]"); 
			}
		}
		catch(PuppuTekstiException $e) {
			$e -> __toString();
		}
	}
	
	// tulostaa infoa tietokannasta
	
	public function info() {

		echo "Rivien määrä: $this->yht";
		echo "Erilaisten virkkeiden määrä: $this->total";
	}

	// Tietokantahaku

	public function haku($taulu, $id) {

		try {
			$query = "SELECT id, text FROM $taulu WHERE id=$id";
			$result = mysql_query($query);

			if (!$result) {
				throw new PuppuTekstiException("Ongelma tietokantahaussa.");
			}

			else {
				$row = mysql_fetch_array($result, MYSQL_NUM);
				return $row;
			}
		}
		catch(PuppuTekstiException $e) {
			$e -> __toString();
		}
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

		try {
			if ($lkm <= $limit[0]) {

				//Looppi virkkeiden lukumäärän mukaisesti

				for ($k = 1; $k < $lkm+1; $k++) {

					$gen = $this->generator();

					// Ensimmäisen virkkeen päästävä läpi ehdoitta

					if ($k == 1) {

						echo $this->virke($varit);
						$genb = $gen;
					}

					// Jos edellinen virke ei sisällä samoja arvoja 
					// kuin seuraava, tulostetaan

					elseif (!count(array_intersect_assoc($gen, $genb)) && 
					$k > 1) {

						echo $this->virke($varit);
						$genb = $gen;
					} 

					// Jos samoja arvoja löytyy peräkkäisistä virkkeistä, 
					// arvotaan uudestaan yhden kerran (muuten loopista 
					// saattaa tulla hyvin pitkä ja raskas)

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
			
			else { 
				throw new PuppuTekstiException("Kappaleen virkkeiden lukumäärä liian suuri. $lkm"); 
			}
		} 
		catch(PuppuTekstiException $e) {
			$e -> __toString();
		}
	}
	
	// kokonainen teksti, (kappaleiden lukumäärä,virkkeiden lukumäärä kappaleessa, random, värit)
	
	public function teksti($kpl, $random = false, $varit = false) {

		$limit = $this->limit;
		
		try {
			
			if ($random == true && $kpl <= $limit[1] && 3 <= $limit[1]) {
				
				for ($i = 1; $i < $kpl+1; $i++) {
					
					$alaraja = $limit[0]-($limit[0]-2);
					$lkm = rand($alaraja,$limit[0]);

					$kappale = $this->kappale($lkm, $varit);
					echo "<p>$kappale</p>";
					
				}
			}
			elseif ($random == false && $kpl <= $limit[1] && 3 <= $limit[1]) {

				// Looppi kappaleiden lukumäärän mukaisesti
				
				for ($i = 1; $i < $kpl+1; $i++) {

					$kappale = $this->kappale(4, $varit);
					echo "<p>$kappale</p>";

				}
			}
			elseif (3 > $limit[1]){ 
				throw new PuppuTekstiException("Kappaleen virkkeiden 
				alaraja liian pieni.");
			}
			else { 
				throw new PuppuTekstiException("Kappaleiden lukumäärä 
				liian suuri.");
			}
		}
		catch(PuppuTekstiException $e) {
			$e -> __toString();
		}
	}
}

class PuppuTekstiException extends Exception
{
	public function __construct($message) {
		parent::__construct($message, 0);
	}

	public function __toString() {
		echo('Virhe: ' . parent::getMessage());
	}
}

?>