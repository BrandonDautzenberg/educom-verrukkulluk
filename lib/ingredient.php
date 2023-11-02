<?php

class ingredient {

    private $connection;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    private function selecteer_artikel($artikel_id) {
        $artikel = $this->art->selecteer_artikel($artikel_id);
        return $artikel;
    }
  
    public function selecteer_ingredient($gerecht_id) {
        $sql = "select * from ingredient where gerecht_id = $gerecht_id";
        $result = mysqli_query($this->connection, $sql);
        $return = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

            $artikel = $this->selecteer_artikel($row["artikel_id"]);
            
            $return[] = [
                "ing-id" => $row["id"], 
                "ing-gerecht_id" => $row["gerecht_id"],
                "ing-artikel-id" => $row["artikel_id"],
                "ing-aantal" => $row["aantal"],
                "art-name" => $artikel["naam"],
                "art-calorieën" => $artikel["calorieen"],
                "art-prijs" => $artikel["prijs"],
                "art-eenheid" => $artikel["eenheid"],
                "art-verpakking" => $artikel["verpakking"]
            ];
        };

        return($return);

    }
}