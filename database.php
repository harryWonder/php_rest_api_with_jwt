<?php

    class Database {

        private $server = "localhost";
        private $dbname = "maccaw_data_bank";
        private $user = "root";
        private $pass = "";

        public function connect() {


                try {

                    $conn = new PDO("mysql:host=" . $this->server . ";dbname=" . $this->dbname, $this->user, $this->pass);
                    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                     return $conn;

                } catch(PDOException $e) {

                    $err = $e->getMessage();
                    echo $err;

                }

        }


    }

    $Database = new Database();
    $Database->connect();

?>
