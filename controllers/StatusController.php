<?php

/**
 * Class UserController
 */

require 'models/Status.php';
require 'models/Type_Statuses.php';

class StatusController
{
    private $statusModel;
    private $type;

    public function __construct()
    {
        $this->statusModel = new Status;
        $this->type = new Type_Statuses;
    }

    public function index()
    {
        $statuses = $this->statusModel->getAll();
        require 'views/layout.php';
        require 'views/statuses/list.php';
    }

    public function add()
    {
        $types= $this->type->getAll();
        require 'views/layout.php';
        require 'views/statuses/new.php';
    }

    public function save()
    {
        $this->statusModel->newStatus($_REQUEST);
        header('Location: ?controller=status');
    }
    public function edit() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $types= $this->type->getAll();
            $data = $this->statusModel->getById($id);
            require 'views/layout.php';
            require 'views/statuses/edit.php';
        } else {
            echo 'Error, Se requiere el id del estado';
        }
    }

    public function update()
    {
        if(isset($_POST)) {
            $this->statusModel->editStatus($_POST);
            header('Location: ?controller=status');
        } else {
            echo 'Error intentando actualizar un estado';            
        }
    }

    public function delete()
    {
        $this->statusModel->deleteStatus($_REQUEST);
        header('Location: ?controller=status');
    }
}