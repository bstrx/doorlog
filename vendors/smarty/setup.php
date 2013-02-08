<?php

// загружаем библиотеку Smarty

require("libs/Smarty.class.php");

// Файл setup.php - файл подключения библиотеки

class Smarty_DoorLog extends Smarty {

    
   function Smarty_DoorLog()
   {

        // Конструктор класса.
        // Он автоматически вызывается при создании нового экземпляра.

        $this->Smarty();

        $this->template_dir = "vendors/smarty/templates/";
        $this->compile_dir  = "vendors/smarty/templates_c/";
        $this->config_dir   = "vendors/smarty/cache/";
        $this->cache_dir    = "vendors/smarty/configs/";

        $this->caching = true;
   }

}
?>
