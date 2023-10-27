<?php

class ingredient {

    private $connection;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    /// === Ophalen van één artikel === ///
    private function selecteer_artikel($artikel_id) {
        $artikel = $this->art->selecteer_artikel($artikel_id);
        return $artikel;
    }
  
    /// === Ophalen van alle ingrediënten === ///
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
                "art-price" => $artikel["prijs"]
            ];
        };

        return($return);

    }
}