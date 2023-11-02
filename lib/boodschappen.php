<?php

class boodschappen
{
    private $connection;
    private $ingredient;

    public function __construct($connection)
    {
        $this->connection = $connection;
        $this->ingredient = new ingredient($connection);
    }

    public function boodschappen_toevoegen($gerecht_id, $user_id)
    {
        $ingredienten = $this->ingredient->selecteer_ingredient($gerecht_id);
        foreach ($ingredienten as $ingredient) {
            $ingredient_artikel = $ingredient["ing-artikel-id"];
            $aantal = 1;
            if ($this->artikel_op_lijst($ingredient_artikel, $user_id)) {
                $sql = "update boodschappen set aantal = aantal + 1 where artikel_id = $ingredient_artikel";
                $result = mysqli_query($this->connection, $sql);
            } else {
                $sql = "insert into boodschappen (user_id, artikel_id, aantal) values ($user_id, $ingredient_artikel, $aantal)";
                $result = mysqli_query($this->connection, $sql);
            }
        }
        return ($result);
    }

    public function artikel_op_lijst($artikel_id, $user_id)
    {
        $boodschappen = $this->ophalen_boodschappen($user_id);
        foreach ($boodschappen as $boodschap) {
            if ($boodschap["boodschappen_artikel_id"] == $artikel_id) {
                return ($boodschap);
            }
        }
        return false;
    }

    public function ophalen_boodschappen($user_id)
    {
        $sql = "select * from boodschappen where user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);
        $boodschappen = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $boodschappen[] = [
                "boodschappen_id" => $row["id"],
                "boodschappen_user_id" => $row["user_id"],
                "boodschappen_artikel_id" => $row["artikel_id"],
                "boodschappen_aantal" => $row["aantal"],
            ];
        }
        return ($boodschappen);
    }
}
