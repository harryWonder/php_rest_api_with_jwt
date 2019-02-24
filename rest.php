<?php

    use Firebase\JWT\JWT;

/**
 * @package THE REST API CLASS
 * VALIDATING THE REQUEST BEING RECEIVED
 * @property string $serviceName
 * @property array $Param
 * @property integer $userId
 * @property mixed $Database
 * @property mixed $request
 * @method mixed __construct()
 * @method mixed validateRequest()
 * @method mixed processApi
 * @method mixed validateParameter(Args)
 * @method mixed throwError(Arsg)
 * @method mixed returnResponse(Arsg)
 * @method mixed getAuthorizationHeader()
 * @method mixed getBearerToken()
 * @method mixed validateToken()
 */

 class Rest {

    protected $request;
    protected $serviceName;
    protected $Param;
    protected $Database;
    protected $userId;

    public function __construct()
    {


        /**
         * @package VALIDATE SERVER METHOD
         *          GET SENT REQUEST
         *          VALIDATE TOKEN ON CONDITIONALS
         */

        if ($_SERVER["REQUEST_METHOD"] === "GET") {

            $this->throwError(REQUEST_METHOD_ERROR, "Sorry, the method is not valid");

        }


            $Request = fopen("php://input", "r");
            $this->request = stream_get_contents($Request);
            $this->validateRequest();

            $db = new Database();
            $this->Database = $db->Connect();

            if ($this->serviceName !== "generateToken") {

                $this->validateToken();

            }


    }

    public function validateRequest()
    {


        if ($_SERVER["CONTENT_TYPE"] !== "application/json") {

            $this->throwError(INVALID_CONTENT_TYPE, "Content type is not valid");

        } else {

            $data = json_decode($this->request, true);

            if (!isset($data["name"]) || ($data["name"] == "")) {

                $this->throwError(UNDEFINED_API_NAME, "Sorry, this api does not exist");

            }

            $this->serviceName = $data["name"];

            if (!is_array($data["param"])) {

                $this->throwError(PARAMETER_IS_NOT_DEFINED, "Undefined api parameter");

            }

            $this->Param = $data["param"];

        }

    }

    public function processApi()
    {


        $Api = new Api();
        $rMethod = new ReflectionMethod("API", $this->serviceName);

        if (!method_exists($Api, $this->serviceName)) {

            $this->throwError(UNDEFINED_API, "Api is not recognized");

        }

        $rMethod->invoke($Api);


    }

    public function validateParameter($fieldname, $value, $dataType, $required = true)
    {


        if ($required == true && empty($value) == true) {

            $this->throwError(VALIDATE_PARAMETER_REQUIRED, "{$fieldname} parameter is required");

        }

        switch ($dataType) {
            case BOOLEAN:
                if (!is_bool($value)) {

                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, "Datatype is not valid for {$dataType}. It should be boolean");

                }

                break;

            case INTEGER:
                if (!is_numeric($value)) {

                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, "Datatype is not valid for {$dataType}. It should be numeric");

                }

                break;

            case STRING:
                if (!is_string($value)) {

                    $this->throwError(VALIDATE_PARAMETER_DATATYPE, "Datatype is not valid for {$dataType}. It should be string");

                }

                break;

            default:
            $this->throwError(VALIDATE_PARAMETER_DATATYPE, "Datatype is not valid for {$fieldname}. It should be string");
                break;
        }

        return $value;


    }

    public function throwError($code, $message)
    {

        header("content-type: application/json");

        $err = json_encode(["error"=>["status"=>$code, "message"=>$message]]);

        echo $err; exit;

    }

    public function returnResponse($code, $data)
    {

        header("content-type: application/json");

        $response = json_encode(["response"=>["status"=>$code, "message"=>$data]]);

        echo $response; exit;

    }

    public function getAuthorizationHeader()
    {

        $headers = null;

        if (isset($_SERVER['Authorization'])) {

            $headers = trim($_SERVER['Authorization']);

        } elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) {

            $headers = trim($_SERVER['HTTP_AUTHORIZATION']);

        } elseif (function_exists("apache_request_headers")) {

            $requestHeaders = apache_request_headers();

            $requestHeaders = array_combine(array_map("ucwords", array_keys($requestHeaders)), array_values($requestHeaders));

            if (isset($requestHeaders['Authorization'])) {

                $headers = trim($requestHeaders['Authorization']);

            }

        }

        return $headers;

    }

    public function getBearerToken()
    {

        $headers = $this->getAuthorizationHeader();

        if (!empty($headers)) {

            if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {

                return $matches[1];

            }

        }

        $this->throwError(AUTHORIZATION_HEADER_NOT_FOUND, "Invalid headers credentials");

    }

    public function validateToken()
    {

        try {

            $token = $this->getBearerToken();

            $Payload = JWT::decode($token, SECRETE_KEY, ['HS256']);

            $stmt = $this->Database->prepare("SELECT * FROM webcustomers WHERE id = :user_id");
            $stmt->bindParam(":user_id", $Payload->userId);
            $stmt->execute();

            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!is_array($user)) {

                $this->throwError(UNKNOWN_CUSTOMER, "Unidentified api customer");

            }

            // if ($user['active'] == "0") {

            //     $this->throwError(UNACTIVATED_CUSTOMER, "Unactivated customer");

            // }

            $this->userId = $Payload->userId;

        } catch(Exception $e) {

            $this->throwError(JWT_PROCESSING_ERROR, $e->getMessage());

        }

    }


 }

?>
