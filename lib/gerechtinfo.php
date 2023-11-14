<?php

class gerechtinfo
{

    private $connection;
    private $user;

    public function __construct($connection)
    {
        $this->connection = $connection;
        $this->user = new user($connection);
    }

    private function selecteer_user($user_id)
    {
        $user = $this->user->selecteer_user($user_id);
        return $user;
    }

    public function selecteer_gerecht_info($gerecht_id, $record_type)
    {
        $sql = "SELECT * FROM gerecht_info WHERE gerecht_id = $gerecht_id AND record_type LIKE '$record_type'";
        $result = mysqli_query($this->connection, $sql);
        $user = [];
        $row = [];
        $return = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $user = $this->selecteer_user($row["user_id"]);
            if ($record_type == 'O' || $record_type == 'F') {
                $return[] = array_merge($user, $row);
            } else {
                $return[] = $row;
            }
            
        } return($return);
    }

    public function favoriet_toevoegen($gerecht_id, $user_id)
    {
        $this->favoriet_verwijderen($gerecht_id, $user_id);
        $sql = "INSERT INTO gerecht_info (user_id, gerecht_id, record_type) VALUES ($user_id, $gerecht_id, 'F')";
        $result = mysqli_query($this->connection, $sql);
        return ($result);
    }

    public function favoriet_verwijderen($gerecht_id, $user_id)
    {
        $sql = "DELETE FROM gerecht_info WHERE user_id = $user_id AND gerecht_id = $gerecht_id AND record_type = 'F'";
        $result = mysqli_query($this->connection, $sql);
        return ($result);
    }

    public function add_waardering($gerecht_id, $aantal)
    {
        $sql = "INSERT INTO gerecht_info (gerecht_id, nummeriekveld, record_type) VALUES ($gerecht_id, $aantal, 'W')";
        $result = mysqli_query($this->connection, $sql);
        return ($result);
    }
}
