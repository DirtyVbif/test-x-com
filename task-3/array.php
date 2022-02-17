<?php

function getArrayDepth(array $array): int|false
{
    $depth = 1;
    foreach ($array as $value) {
        if (is_callable($value)) {
            return false;
        }
        if (is_array($value)) {
            $temp_depth = getArrayDepth($value);
            if ($temp_depth === false) {
                return false;
            } else if ($depth < ($temp_depth + 1)) {
                $depth = $temp_depth + 1;
            }
        }
    }
    return $depth;
}
