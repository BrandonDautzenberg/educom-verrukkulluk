<?php

class keukentype {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    /// === ophalen van keukentype === ///
    public function selecteer_keuken_type($keuken_type_id) {

        $sql = "select * from keuken_type where id = $keuken_type_id";
        
        $result = mysqli_query($this->connection, $sql);
        $keuken_type = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($keuken_type);

    }


}