<?php

/**
 * Class typstastusController
 */

require 'models/Type_statuses.php';

class TypeStatusController
{
    private $Type_statusesModel;

    public function __construct()
    {
        $this->Type_statusesModel = new Type_statuses;

    }

    public function index()
    {
        $typeSt = $this->Type_statusesModel->getAll();
    	require 'views/layout.php';
        require 'views/type_statuses/list.php';
    }
    public function add()
    {
        require 'views/layout.php';
        require 'views/type_statuses/new.php';
    }
    public function save()
    {
        $this->Type_statusesModel->newStatus($_REQUEST);
        header('Location: ?controller=typestatus');
    }
    public function edit() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $typeSt = $this->Type_statusesModel->getById($id);
            require 'views/layout.php';
            require 'views/type_statuses/edit.php';
        } else {
            echo 'Error, Se requiere el id del tipo de estado';
        }
    }

    public function update()
    {
        if(isset($_POST)) {
            $this->Type_statusesModel->editTypeStatus($_POST);
            header('Location: ?controller=typestatus');
        } else {
            echo 'Error intentando actualizar el estado';            
        }
    }

    public function delete()
    {
        $this->Type_statusesModel->deleteTypeStatus($_REQUEST);
        header('Location: ?controller=typestatus');
    }
}