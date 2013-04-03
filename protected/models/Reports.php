<?php

/**
 * @author adrenaline
 */

namespace models;
use core\Db;
use core\Model;


class Reports extends Model{
    function getTimesList($date){
        $params = array();
        $params['date'] = $date;
        $q = "SELECT count(emphint) AS count, HOUR(logtime) as hour
              FROM `tc-db-log`.`logs`
              WHERE DATE(logtime) = DATE(:date) AND SUBSTRING( HEX ( `logdata` ) , 10, 1 ) = 2
              GROUP BY HOUR(logtime)
              ORDER BY HOUR(logtime) ASC";
        $result = $this->fetchAll($q, $params);
        return $result;
    }
}

?>
