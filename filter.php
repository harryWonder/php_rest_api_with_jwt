<?php

    class Filter {

        public function filterIntegersAndStrings($Args)
        {

            $filterInput = trim(htmlspecialchars(htmlentities($Args)));

            return $filterInput;

        }

    }

?>
