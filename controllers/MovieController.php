<?php

require 'models/Movie.php';
require 'models/User.php';
require 'models/Category.php';
require 'models/status.php';

class MovieController
{
    private $movieModel;
    private $users;
    private $category;
    private $status;

    public function __construct()
    {
        $this->movieModel = new Movie;
        $this->users = new User;
        $this->category = new Category;
        $this->status = new status;

    }

    public function index()
    {
    	$movies = $this->movieModel->getAll();

    	require 'views/layout.php';
    	require 'views/movie/list.php';
    }

    public function add()
    {
        $users = $this->users->getAll();
        $categories = $this->category->getAll();
        $statuses= $this->status->getAll();
        require 'views/layout.php';
        require 'views/movie/new.php';
    }

    public function save()
    {
       {
        //Organizar en un array los datos de la tabla movie
        $dataMovie = [
            'name'          => $_POST['name'],
            'description'   => $_POST['description'],
            'user_id'       => $_POST['user_id'],
            'status_id'     => 1
        ];

        //Array de categorias
        $arrayCategories = isset($_POST['categories']) ? $_POST['categories'] : [];        

        if(!empty($arrayCategories)) {
            //Inserción de la Tabla Movie
            $respMovie = $this->movieModel->newMovie($dataMovie);

            //Obtener el ultimo ID registrado
            $lastIdMovie = $this->movieModel->getLastId();
            //Inserción de la Tabla category_movie
            $respCategoryMovie = $this->movieModel->saveCategoryMovie($arrayCategories, $lastIdMovie[0]->id);

        } else {
            $respMovie          = false;
            $respCategoryMovie  = false;            
        }

        $arrayResp = [];

        if($respMovie == true && $respCategoryMovie == true) {
            $arrayResp = [
                'success' => true,
                'message' => "Pelicula Creada"  
            ];
        } else {
            $arrayResp = [
                'error' => true,
                'message' => "Error Creando la Pelicula"  
            ];
        }

        echo json_encode($arrayResp);
        return;

    }

    }

    public function edit() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $movie = $this->movieModel->getById($id);
            $users = $this->users->getAll();
            $statuses= $this->status->getAll();
            require 'views/layout.php';
            require 'views/movie/edit.php';
        } else {
            echo 'Error, Se requiere el id de la pelicula';
        }
    }

    public function seeCategories() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $movies = $this->movieModel->getcategoriesById($id);
            require 'views/layout.php';
            require 'views/movie/list_categories.php';
        } else {
            echo 'Error, Se requiere el id de la renta';
        }
    }

    public function update()
    {
        if(isset($_POST)) {
            $this->movieModel->editMovie($_POST);
            header('Location: ?controller=movie');
        } else {
            echo 'Error intentando actualizar una película';            
        }
    }

    public function delete()
    {
        $this->movieModel->deleteMovie($_REQUEST);
        header('Location: ?controller=movie');
    }
}