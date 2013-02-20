<?php
namespace core;

class ExceptionsManager {
    function show($e) {
        echo('Message: ' . $e->getMessage());
        echo('<br>' . 'File: ' . $e->getFile());
        echo('<br>' . 'Line: ' . $e->getLine());
        if($e->getCode()){
            echo('<br>' . 'Code: ' . $e->getCode());
        echo('<br>' . 'Trace: ' . '<pre>' . $e->getTraceAsString() . '</pre>');
        }
    }
}