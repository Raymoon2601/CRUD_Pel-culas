<?php

/**
 * Class rentalController
 */

require 'models/Rental.php';
require 'models/Movie.php';
require 'models/User.php';
require 'models/status.php';

class rentalController
{
    private $rentalModel;
    private $movie;
    private $users;

    public function __construct()
    {
        $this->rentalModel = new rental;
         $this->movie = new Movie;
         $this->users = new User;
         $this->status = new status;
    }

    public function index()
    {
    	$rentals = $this->rentalModel->getAll();
    	require 'views/layout.php';
    	require 'views/rentals/list.php';
    }

    public function add()
    {
        $users = $this->users->getAll();
        $movies = $this->movie->getAll();
        $statuses= $this->status->getAll();
        require 'views/layout.php';
        require 'views/rentals/new.php';
    }

    public function save()
    {
        //Organizar en un array los datos de la tabla Rentas
        $dataMovie = [
            'start_date'        => $_POST['fechaInicio'],
            'end_date'          => $_POST['fechaFin'],
            'total'             => $_POST['total'],
            'user_id'           => $_POST['user_id'],
            'status_id'         => $_POST['status_id'],
            
        ];

        //Array de peliculas
        $arrayCategories = isset($_POST['movies']) ? $_POST['movies'] : [];        

        if(!empty($arrayCategories)) {
            //Inserción de la Tabla Rentas
            $respMovie = $this->rentalModel->newRental($dataMovie);

            //Obtener el ultimo ID registrado
            $lastIdMovie = $this->rentalModel->getLastId();
            //Inserción de la Tabla movie_rental
            $respCategoryMovie = $this->rentalModel->saveCategoryMovie($arrayCategories, $lastIdMovie[0]->id);

        } else {
            $respMovie          = false;
            $respCategoryMovie  = false;            
        }

        $arrayResp = [];

        if($respMovie == true && $respCategoryMovie == true) {
            $arrayResp = [
                'success' => true,
                'message' => "Renta Creada"  
            ];
        } else {
            $arrayResp = [
                'error' => true,
                'message' => "Error Creando la Renta"  
            ];
        }

        echo json_encode($arrayResp);
        return;
        
    }
    public function edit() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $users = $this->users->getAll();
            $statuses= $this->status->getAll();
            $rental = $this->rentalModel->getById($id);
            require 'views/layout.php';
            require 'views/rentals/edit.php';
        } else {
            echo 'Error, Se requiere el id de la renta';
        }
    }
    public function seeMovies() 
    {
        if(isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $movies = $this->rentalModel->getmoviesById($id);
            require 'views/layout.php';
            require 'views/rentals/Movielist.php';
        } else {
            echo 'Error, Se requiere el id de la renta';
        }
    }

    public function update()
    {
        if(isset($_POST)) {
            $this->rentalModel->editRental($_POST);
            header('Location: ?controller=rental');
        } else {
            echo 'Error intentando actualizar una renta';            
        }
    }

    public function delete()
    {
        $this->rentalModel->deleteRental($_REQUEST);
        header('Location: ?controller=rental');
    }
}