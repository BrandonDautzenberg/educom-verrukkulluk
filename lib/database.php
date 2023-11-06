<?php

define("USER", "root");
define("PASSWORD", "");
define("DATABASE", "verrukkulluk2.0");
define("HOST", "localhost");

class database
{
    private $connection;

    public function __construct()
    {
        $this->connection = mysqli_connect(
            HOST,
            USER,
            PASSWORD,
            DATABASE
        )
            or die("Couldn't connect to database");
    }

    public function getConnection()
    {
        return ($this->connection);
    }
}
