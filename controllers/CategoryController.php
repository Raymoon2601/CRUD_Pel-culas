<?php

/**
 * 
 */

require 'models/Category.php';
require 'models/Status.php';

class CategoryController
{
    private $status;
    
    private $CategoryModel;

    public function __construct()
    {
        $this->CategoryModel = new Category;
        $this->status = new Status;
    }

    public function index()
    {
    	$Categories = $this->CategoryModel->getAll();
    	require 'views/layout.php';
    	require 'views/categories/list.php';
    }

    public function add()
    {
        $statuses = $this->status->getCustomStatuses('category');
        require 'views/layout.php';
        require 'views/categories/new.php';
    }

    public function save()
    {
        $this->CategoryModel->newCategory($_REQUEST);
        header('Location: ?controller=Category');
    }
    public function edit() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $Category = $this->CategoryModel->getById($id);
            $statuses = $this->status->getCustomStatuses('category');
            require 'views/layout.php';
            require 'views/categories/edit.php';
        } else {
            echo 'Error, Se requiere el id de la categoría';
        }
    }

    public function update()
    {
        if(isset($_POST)) {
            $this->CategoryModel->editCategory($_POST);
            header('Location: ?controller=Category');
        } else {
            echo 'Error intentando actualizar una categoría';            
        }
    }

    public function delete()
    {
        $this->CategoryModel->deleteCategory($_REQUEST);
        header('Location: ?controller=Category');
    }
}