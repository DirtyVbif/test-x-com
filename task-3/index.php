<?php

include 'array.php';

$array = [
    'antonio' => [
        'ian' => [
            'molly' => [
                'blake' => 'blake',
                'jhonyDeep' => 'jhonyDeep'
            ]
        ],
        'shonda' => [
            'dana' => 'dana',
            'james' => 'james'
        ],
        'nels' => [
            'jason' => 'jason',
            'danny' => 'danny'
        ],
        'molly' => [
            'blake' => 'blake'
        ],
        'blake' => 'blake',
        'travis' => 'travis'
    ]
];

echo 'array depth: ' . getArrayDepth($array); // array depth: 4
