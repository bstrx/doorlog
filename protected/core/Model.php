<?php
namespace core;

use core\Db;

abstract class Model {

    //TODO rewrite
    protected function get($query) {
        $db = Db::getInstance();
        $data = $db->query($query);
        if ($db->errorCode() != '00000') {
            $errorInfo = $db->errorInfo();
            echo 'Db error happened:';
            echo '<br><br><b>Code:</b>' . $errorInfo[0];
            echo '<br><b> Message:</b>' . $errorInfo[2];
            echo "</pre>";
            die();
        }
        $fetchedData = $data->fetchAll(\PDO::FETCH_ASSOC);
        return $fetchedData;
    }

}
