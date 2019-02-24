<?php

    class Timer {

        public $spitInterval;

        public function __construct($dateTimeArg)
        {

            $currentDateTime            = date("y-m-d " . "h:i:s");

            $savedTimeAndDate        = explode(" ", $dateTimeArg);

            /**
             * SPLIT THE SAVED DATE AND TIME INTO ARRAYS
             * AND USE THE ARRAY ELEMENTS TO COMPARE
             * SPECIFICALLY.
             */


            $dateMonthYear           = $savedTimeAndDate[0];
            $hoursSecondsAndMinutes  = $savedTimeAndDate[1];

            $yearMonthAndDateArr     = explode("-", $dateMonthYear);
            $hourMinutesAndTimeArr   = explode(":", $hoursSecondsAndMinutes);

            $this->spitInterval = $this->dateTimeCalc($yearMonthAndDateArr[0], $yearMonthAndDateArr[1], $yearMonthAndDateArr[2], $hourMinutesAndTimeArr[0], $hourMinutesAndTimeArr[1], $hourMinutesAndTimeArr[2]);

        }

        public function dateTimeCalc($staticYear, $staticMonth, $staticDate, $staticHour, $staticMinute, $staticSecond)
        {

            $passedSeconds           = date("s") - $staticSecond;
            $passedMinutes           = date("m") - $staticMinute;
            $passedHours             = date("h") - $staticHour;

            $passedDays              = date("d") - $staticDate;
            $passedMonths            = date("m") - $staticMonth;
            $passedYears             = date("Y") - $staticYear;

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") == $staticDate && date("h") == $staticHour && date("m") == $staticMinute && date("s") <= $staticSecond) {

                return "Just now";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") == $staticDate && date("h") == $staticHour && date("m") == $staticMinute && date("s") >= $staticSecond) {

                return $passedSeconds . " seconds ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") == $staticDate && date("h") == $staticHour && date("m") >= $staticMinute) {

                return $passedMinutes . " minute ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") == $staticDate && date("h") >= $staticHour) {

                return $passedHours . " hours ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") >= $staticDate && $passedDays == 1) {

                return $passedDays . " day ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") >= $staticDate && $passedDays < 7) {

                return $passedDays . " days ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") >= $staticDate && $passedDays == 7 && $passedDays < 14) {

                return "1 week ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") >= $staticDate && $passedDays == 14) {

                return "2 weeks ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") >= $staticDate && $passedDays == 21) {

                return "3 weeks ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth && date("d") >= $staticDate && $passedDays >= 28) {

                return "4 weeks ago";

            }

            if (date("Y") == $staticYear && $staticMonth == 1) {

                return $passedMonths . " month ago";

            }

            if (date("Y") == $staticYear && date("m") == $staticMonth) {

                return $passedMonths . " months ago";

            }

            if ($passedYears == 1) {

                return $passedYears . " year ago";

            }

            if (date("Y") > $staticYear) {

                return $passedYears . " years ago";

            }

        }

    }

    $Timer = new Timer("2019-01-4 06:15:05");

    echo ($Timer->spitInterval);



?>
