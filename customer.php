<?php

    /**
     * @package SQL API SERVICE FOR INSERTING AND VALIDATING
     * VALUES SENT AS REQUESTS
     * @property string $Id
     * @property string $Email
     * @property string $Username
     * @property string $Password
     * @property string $Signup
     * @property string $dbConn
     * @property string $Agent
     *
     * @method string setId()
     * @method string getId()
     * @method string setEmail()
     * @method string getEmail()
     * @method string setUsername()
     * @method string getUsername()
     * @method string doSignup()
     * @method string checkEmail()
     * @method string checkUserName()
     * @method string signupUser()
     * @method string loginUserToApp()
     * @method string getTokenAndIdOnLogin()
     * @method string setSignupNotification()
     */

    class Customer {

        private $Id, $Names;

        public function __construct()
        {


            $Database = new Database();
            $this->dbConn = $Database->connect();


        }

        public function __set($PropertyName, $Value)
        {

            if (property_exists("Customer", $PropertyName)) {

                $this->{$PropertyName} = stripcslashes(strip_tags(trim(htmlentities(htmlspecialchars($Value)))));

            } else {

                return false;

            }

        }

        public function __get($PropertyName)
        {

            if (property_exists("Customer", $PropertyName)) {

               return  $this->{$PropertyName};

            } else {

                return false;

            }

        }




    }

?>
