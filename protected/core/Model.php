<?php
namespace core;

use core\Db;

abstract class Model {
    protected function fetchAll($query) {
        $db = Db::getInstance();
        $data = $db->query($query);
        if ($db->errorCode() != '00000') {
            $this->showDbError($db->errorInfo());
        }

        $fetchedData = $data->fetchAll(\PDO::FETCH_ASSOC);

        if (!empty($fetchedData)) {
            return $fetchedData;
        } else return array();
    }

    protected function fetchOne($query) {
        $db = Db::getInstance();
        $data = $db->query($query);
        if ($db->errorCode() != '00000') {
            $this->showDbError($db->errorInfo());
        }

        $fetchedData = $data->fetchAll(\PDO::FETCH_ASSOC);

        if (!empty($fetchedData) && isset($fetchedData['0'])) {
            return $fetchedData['0'];
        } else return false;
    }

    protected function showDbError($errorInfo) {
        echo 'Db error occurred:';
        echo "<pre>";
        echo '<br><b> Code: </b>' . $errorInfo[0];
        echo '<br><b> Message: </b>' . $errorInfo[2];
        echo "</pre>";
        die();
    }
}
