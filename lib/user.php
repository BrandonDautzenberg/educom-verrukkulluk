<?php

class user {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    /// === ophalen van één user === ///
    public function selecteer_user($user_id) {

        $sql = "select * from user where id = $user_id";
        
        $result = mysqli_query($this->connection, $sql);
        $user = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($user);

    }


}