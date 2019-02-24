<?php

/**
 * @package AUTOLOADING CLASSES
 * THROWING ERRORS AND REQUIRING
 * OTHER CLASSES
 */

 require_once("constants.php");
 require_once("filter.php");
 require_once("jwt.php");


 spl_autoload_register(function($className) {

    $Path = strtolower($className) . '.php';

    if (file_exists($Path)) {

        require_once($Path);

    } else {

        $AutoloadError = "Could not autoload class {$className}";

        echo $AutoloadError;

    }

 });


?>
