<?php
namespace controllers;
use core\Controller;
use models\Positions as PositionModel;
use core\FlashMessages;
use core\Utils;


class Positions extends Controller{
    public function indexAction() {
        $obj =  new PositionModel();

        $positions =  $obj->getAll();
        $this->render("Positions/index.tpl" , array('positions' => $positions));
    }

    public function addAction(){
        $positions = new PositionModel();

        if(isset($_POST['posName']) && $_POST['posName']){
            $positionName = $_POST['posName'];
            if($positions->insertPosition($positionName)){
                FlashMessages::addMessage("Должность успешно добавлена.", "info");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Должность не была добавлена.", "error");
            }
        }

        Utils::redirect("/positions");
    }

    public function editAction(){
        if (isset($_GET['id'])){
            $id = $_GET['id'];
            $positions = new PositionModel();
            $position = $positions->getPosition($id);

            if (isset($_POST['position']) && $_POST['position']){
                $set=$_POST['position'];
                if($positions->savePosition($id,$set)){
                    Utils::redirect("/positions");
                    FlashMessages::addMessage("Должность успешно отредактирована.", "info");
                } else {
                    FlashMessages::addMessage("Произошла ошибка. Должность не была отредактирована.", "error");
                    }
                }
            else{
                $this->render("Positions/edit.tpl",array('position'=>$position));
            }
        }
    }

    public function deleteAction(){
        if (isset($_POST['id'])){
            $id = $_POST['id'];
            $positions=new PositionModel();

            if ($positions->deletePosition($id)){
                FlashMessages::addMessage("Должность успешно удалена.", "info");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Должность не была удалена.", "error");
            }
            Utils::redirect("/positions");
        }
    }

}
?>