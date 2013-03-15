<?php
namespace controllers;
use core\Controller;
use models\Positions as PositionModel;


class Positions extends Controller{
    public function indexAction() {
        $obj =  new PositionModel();
        
        $positions =  $obj->getAll();
        $this->render("Positions/index.tpl" , array('positions' => $positions));
    }
    public function addAction(){
        $Positions = new PositionModel();

        if( isset($_POST['posName'])){
            $position = $_POST['posName'];
            if($Positions->insertPosition( $position)){
                FlashMessages::addMessage("Должность успешно добавлена.", "info");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Должность не была добавлена.", "error");
            }
        }

        $this->render("Positions/add.tpl");
    }
    }
?>