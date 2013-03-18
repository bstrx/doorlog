<?php
namespace controllers;
use core\Controller;
use models\Positions as PositionModel;
use core\FlashMessages;


class Positions extends Controller{
    public function indexAction() {
        $obj =  new PositionModel();
        
        $positions =  $obj->getAll();
        $this->render("Positions/index.tpl" , array('positions' => $positions));
    }
    public function addAction(){
        $Positions = new PositionModel();

        if( isset($_POST['posName'])){
            $positionName = $_POST['posName'];
            if($Positions->insertPosition($positionName)){
                FlashMessages::addMessage("Должность успешно добавлена.", "info");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Должность не была добавлена.", "error");
            }
        }
            $this->render("Positions/add.tpl");
    }
    public function editAction(){
        if (isset($_GET['id'])){
                $id = $_GET['id'];
                $Positions = new PositionModel();
                $position = $Positions->getPos($id);
                if (isset($_POST['position'])){
                    $set=$_POST['position'];
                    if($Positions->savePosition($id,$set)){
                        header("Location:/positions");
                        FlashMessages::addMessage("Должность успешно отредоктирована.", "info");
                    } else {
                        FlashMessages::addMessage("Произошла ошибка. Должность не была изменена.", "error");
                        $this->render("Positions/edit.tpl",array('position'=>$position));
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
            $Positions=new PositionModel();
            if ($Positions->deletePosition($id)){
                header('Location:/positions');
                FlashMessages::addMessage("Должность успешно удалена.", "info");
            } else {
                header('Location:/positions');
                FlashMessages::addMessage("Произошла ошибка. Должность не была удалена.", "error");
            }
        }
    }
    
}
?>