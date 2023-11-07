<?php

class gerecht
{
    private $connection;
    private $keukentype;
    private $ingredient;
    private $gerechtinfo;
    private $user;

    public function __construct($connection)
    {
        $this->connection = $connection;
        $this->keukentype = new keukentype($connection);
        $this->ingredient = new ingredient($connection);
        $this->gerechtinfo = new gerechtinfo($connection);
        $this->user = new user($connection);
    }

    public function selecteer_gerecht($gerecht_id = "alle_gerechten")
    {
        if ($gerecht_id === "alle_gerechten") {
            $sql = "select * from gerecht";
        } else {
            $sql = "select * from gerecht where id = $gerecht_id";
        }
        $result = mysqli_query($this->connection, $sql);

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $ingredienten = $this->selecteer_ingredient($row["id"]);
            $users = $this->selecteer_user($row["id"]);
            $prijs = $this->bereken_prijs($row["id"]);
            $totaalcal = $this->bereken_calorieen($row["id"]);
            $waardering = $this->bereken_waardering($row["id"]);
            $stappen = $this->selecteer_stappen($row["id"]);
            $opmerkingen = $this->selecteer_opmerkingen($row["id"]);
            $keuken = $this->selecteer_keuken($row["keuken_id"]);
            $type = $this->selecteer_type($row["type_id"]);
            $favoriet = $this->selecteer_favoriet($row["id"]);

            $return[] = [
                "gerecht" => $row,
                "ingredienten" => $ingredienten,
                "toegevoegd door" => $users,
                "prijs" => $prijs,
                "calorieën" => $totaalcal,
                "gemiddelde_waardering" => $waardering,
                "stappen" => $stappen,
                "opmerkingen" => $opmerkingen,
                "keuken" => $keuken,
                "type" => $type,
                "favoriet" => $favoriet,
            ];
        };
        return ($return);
    }

    private function selecteer_ingredient($gerecht_id)
    {
        $return = $this->ingredient->selecteer_ingredient($gerecht_id);
        return ($return);
    }

    private function selecteer_user($user_id)
    {
        $user = $this->user->selecteer_user($user_id);
        return $user;
    }

    private function bereken_prijs($gerecht_id)
    {
        $ingredient_array = $this->selecteer_ingredient($gerecht_id);
        $totaalprijs = 0;
        foreach ($ingredient_array as $ingredient) {
            $totaalprijs += $ingredient["art_prijs"];
        }
        return ($totaalprijs / 100);
    }

    private function bereken_calorieen($gerecht_id)
    {
        $ingredient_array = $this->selecteer_ingredient($gerecht_id);
        $totaalcal = 0;
        foreach ($ingredient_array as $ingredient) {
            $totaalcal += $ingredient["ing_aantal"] * $ingredient["art_calorieën"];
        }
        return ($totaalcal);
    }

    private function bereken_waardering($gerecht_id)
    {
        $gerecht_info_array = $this->gerechtinfo->selecteer_gerecht_info($gerecht_id, 'W');
        if ($gerecht_info_array != null) {
            $totaal_waarderingen = 0;
            foreach ($gerecht_info_array as $waardering) {
                $totaal_waarderingen += $waardering["nummeriekveld"];
            }
            return ($totaal_waarderingen / count($gerecht_info_array));
        }
    }

    private function selecteer_stappen($gerecht_id)
    {
        $gerecht_info_array = $this->gerechtinfo->selecteer_gerecht_info($gerecht_id, 'B');
        foreach ($gerecht_info_array as $stappen) {
            $instructie[] = [
                "stap" => $stappen["nummeriekveld"],
                "bereidingswijze" => $stappen["tekstveld"],
            ];
        }
        return ($instructie);
    }

    private function selecteer_opmerkingen($gerecht_id)
    {
        $gerecht_info_array = $this->gerechtinfo->selecteer_gerecht_info($gerecht_id, 'O');
        if ($gerecht_info_array != null) {
            foreach ($gerecht_info_array as $opm) {
                $opmerkingen[] = [
                    "opmerking" => $opm["tekstveld"],
                ];
            }
            return ($opmerkingen);
        }
    }

    private function selecteer_keuken($keuken_id)
    {
        $keuken = $this->keukentype->selecteer_keuken_type($keuken_id);
        return ($keuken);
    }

    private function selecteer_type($type_id)
    {
        $type = $this->keukentype->selecteer_keuken_type($type_id);
        return ($type);
    }

    private function selecteer_favoriet($gerecht_id)
    {
        $gerecht_info_array = $this->gerechtinfo->selecteer_gerecht_info($gerecht_id, 'F');
        if ($gerecht_info_array != null) {
            foreach ($gerecht_info_array as $fav) {
                $favorieten[] = [
                    "user_id" => $fav["user_id"],
                ];
            }
            return ($favorieten);
        }
    }
}
