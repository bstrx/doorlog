<?php
namespace controllers;
use core\Controller;
use models\Positions as PositionModel;
use core\FlashMessages;
use core\Acl;
use core\Utils;

class Positions extends Controller{
    /**
     * Render page for all positions
     * @return void
     */
    public function indexAction() {
        if(!Acl::checkPermission('positions_view')){
            $this->render("errorAccess.tpl");
        }
        $positionsModel =  new PositionModel();
        $positions =  $positionsModel->getAll();
        $this->render("Positions/index.tpl" , array('positions' => $positions));
    }

    /**
     * Render page for add positions whose can see on index Page
     * @return void
     */
    public function addAction(){
        if(!Acl::checkPermission('positions_add')){
            $this->render("errorAccess.tpl");
        }
        $positions = new PositionModel();

        if(isset($_POST['posName']) && $_POST['posName']){
            $positionName = $_POST['posName'];
            if($positions->insertPosition($positionName)){
                FlashMessages::addMessage("Должность успешно добавлена.", "success");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Должность не была добавлена.", "error");
            }
        }
        
        Utils::redirect("/positions");
    }

    /**
     * Render page for edit position
     * @return void
     */
    public function editAction(){
        if(!Acl::checkPermission('positions_edit')){
            $this->render("errorAccess.tpl");
        }
        if (isset($_GET['id'])){
            $id = $_GET['id'];
            $positions = new PositionModel();
            $position = $positions->getPosition($id);

            if (isset($_POST['position']) && $_POST['position']){
                $set=$_POST['position'];
                if($positions->savePosition($id,$set)){
                    FlashMessages::addMessage("Должность успешно отредактирована.", "success");
                    Utils::redirect("/positions");
                } else {
                    FlashMessages::addMessage("Произошла ошибка. Должность не была отредактирована.", "error");
                    Utils::redirect("/positions");
                    }
                }
            else{
                $this->render("Positions/edit.tpl",array('position'=>$position));
            }
        }
    }
    
    /**
     * Delete position and redirect on index page
     * @return void
     */
    public function deleteAction(){
        if(!Acl::checkPermission('positions_delete')){
            $this->render("errorAccess.tpl");
        }
        if (isset($_POST['id'])){
            $id = $_POST['id'];
            $positions=new PositionModel();

            if ($positions->deletePosition($id)){
                FlashMessages::addMessage("Должность успешно удалена.", "success");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Должность не была удалена.", "error");
            }
            Utils::redirect("/positions");
        }
    }

}
?>