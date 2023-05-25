<?php

require "../vendor/autoload.php";
require "./services/MidtermService.php";

Flight::register('midtermService', 'MidtermService');

require 'routes/MidtermRoutes.php';

Flight::start();
 ?>
