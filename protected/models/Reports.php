<?php

namespace models;
use core\Db;
use core\Model;


class Reports extends Model{

    /**
     * Create  list (amount entry, time entry)
     * @param string $date
     * @return array
     */
    public function getTimesList($date){
        $params = array();
        $params['date'] = $date;
        $q = "SELECT count(emphint) AS count, HOUR(logtime) as hour
              FROM `tc-db-log`.`logs`
              WHERE DATE(logtime) = DATE(:date) AND SUBSTRING( HEX( `logdata` ) , 10, 1 ) = 2
              GROUP BY HOUR(logtime)
              ORDER BY HOUR(logtime) ASC";
        $result = $this->fetchAll($q, $params);
        return $result;
    }

    /**
     * Get Time list employee whose out from office
     * @param string $date
     * @return array|false
     */
    public function getOutTimesList($date){
        $params = array();
        $params['date'] = $date;
        $q = "SELECT count(emphint) AS count, HOUR(logtime) as hour
            FROM `tc-db-log`.`logs`
            WHERE DATE(logtime) = DATE(:date) AND SUBSTRING( HEX( `logdata` ) , 10, 1 ) = 1
            GROUP BY HOUR(logtime)
            ORDER BY HOUR(logtime) ASC";
        $result = $this->fetchAll($q, $params);
        return $result;
    }
}

?>
