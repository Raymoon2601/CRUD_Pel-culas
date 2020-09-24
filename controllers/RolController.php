<?php 
require 'models/rol.php';
/**
 * 
 */
class RolController 
{
	private $RolModel;
	function __construct()
	{
		$this->RolModel = new Rol;
	}

	public function index()
    {
    	$roles = $this->RolModel->getAll();
    	require 'views/layout.php';
    	require 'views/roles/list.php';
    }
    public function add()
    {
        require 'views/layout.php';
        require 'views/roles/new.php';
    }

    public function save()
    {
        $this->RolModel->newRol($_REQUEST);
        header('Location: ?controller=rol');
    }

    public function edit() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $roles = $this->RolModel->getById($id);
            require 'views/layout.php';
            require 'views/roles/edit.php';
        } else {
            echo 'Error, Se requiere el id del rol';
        }
    }

    public function update()
    {
        if(isset($_POST)) {
            $this->RolModel->editRol($_POST);
            header('Location: ?controller=rol');
        } else {
            echo 'Error intentando actualizar el rol';            
        }
    }

    public function delete()
    {
        $this->RolModel->deleteRol($_REQUEST);
        header('Location: ?controller=rol');
    }

}
