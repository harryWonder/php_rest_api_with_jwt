<?php

    use Firebase\JWT\JWT;

    /**
     * @package API CLASS
     * THE SERVICENAME FROM THE REST CLASS
     * ACTS AS A METHOD HERE.
     * @method mixed __construct()
     * @method mixed generateToken()
     * @method mixed checkIfEmailExists()
     * @method mixed createUserBySignup()
     */

    class Api extends Rest {

        public function __construct()
        {


            parent::__construct();


        }

        public function generateToken()
        {


          $Application =  trim(htmlentities(htmlspecialchars($this->validateParameter("Application", $this->Param["appName"], STRING))));

          $Url         =  trim(htmlentities(htmlspecialchars($this->validateParameter("Url", $this->Param["appUrl"], STRING))));


          $Stmt = $this->Database->prepare("SELECT * FROM webcustomers WHERE application = :application AND url = :url");

          $Stmt->bindParam("application", $Application);
          $Stmt->bindParam("url", $Url);

          $Stmt->execute();
          $Result = $Stmt->fetch(PDO::FETCH_ASSOC);

          if (!is_array($Result)) {

                $this->returnResponse(INVALID_USER_CREDENTIALS, "Invalid application credentials");

          }

          $Payload = [

            "iat" => time(),
            "iss" => "Codehank_api",
            "exp" => time() + (20*60),
            "userId" => $Result['id']

          ];

         $token = JWT::encode($Payload, SECRETE_KEY);

          $data = [

            "token" => $token

         ];

        $this->returnResponse(SUCCESS_RESPONSE, $data);

        }

        public function landingPageItems()
        {

            $Filter = new Filter();

            $testCase = $Filter->filterIntegersAndStrings($this->validateParameter("testCase", $this->Param["testCase"], STRING));

            $this->returnResponse(SUCCESS_RESPONSE, $testCase);
        }

    }


?>
