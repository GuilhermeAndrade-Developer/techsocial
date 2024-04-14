<?php

return [
    'driver'    => 'mysql',
    'host'      => 'database',
    'database'  => 'techsocial',
    'username'  => 'root',
    'password'  => 'techsocial',
    'charset'   => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
    'prefix'    => '',
    'options'   => [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ],
];