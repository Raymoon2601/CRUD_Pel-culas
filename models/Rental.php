<?php

/**
 * 
 */
class Rental
{

	private $id;
	private $start;
    private $end;
    private $total;
	private $pdo;
    
    public function __construct()
    {
    	try {
    		$this->pdo = new Database;
	    } catch (PDOException $e) {
	    	die($e->getMessage());
	    }    
    }

    public function getAll()
    {
    	try {
    		$strSql = "SELECT r.*, u.name as usuario , s.name as status from rentals r inner join users u on u.id= r.user_id inner join statuses s on r.status_id=s.id group by r.id";
    		$query = $this->pdo->select($strSql);
    		return $query;
	    } catch (PDOException $e) {
	    	die($e->getMessage());
	    } 
    }

    public function newRental($data)
    {
        try {
            $this->pdo->insert('rentals', $data);
            return true;
        } catch (PDOException $e) {
            die($e->getMessage());
        } 
    }
     public function getById($id)
    {
        try {
            $strSql = "SELECT * FROM rentals WHERE id = :id";
            $arrayData = ['id' => $id];
            $query = $this->pdo->select($strSql, $arrayData);
            return $query;
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }

    public function getmoviesById($id)
    {
        try {
            $strSql = "SELECT mv.*,m.name as namemovie,m.description,u.name as nameuser FROM movie_rental mv inner join rentals r on r.id= mv.rental_id inner join movies m on m.id=mv.movie_id INNER join users u on r.user_id=u.id where r.id=:id";
            $arrayData = ['id' => $id];
            $query = $this->pdo->select($strSql, $arrayData);
            return $query;
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }


    public function editRental($data)
    {
        try {
            $strWhere = 'id = ' . $data['id'];
            $this->pdo->update('rentals', $data, $strWhere); 
        } catch (PDOException $e) {
            die($e->getMessage());
        } 
    }

    public function deleteRental($data)
    {
        try {
            $strWhere = 'id = ' . $data['id'];
            $this->pdo->delete('rentals', $strWhere); 
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }

    public function getLastId()
    {
        try {
            $strSql = "SELECT MAX(id) as id FROM rentals";
            $query = $this->pdo->select($strSql);
            return $query;
        } catch (PDOException $e) {
            return $e->getMessage();
        }
    }


    public function saveCategoryMovie($arrayCategories, $lastIdRental)
    {
        $price=5;
        try {
            foreach ($arrayCategories as $movie) {
                $data = [
                    'rental_id'      =>  $lastIdRental,
                    'movie_id'   =>  $movie["id"], 
                    'price' => $price
                ];

                $this->pdo->insert('movie_rental', $data);
            } 

            return true;
        } catch (PDOException $e) {
            return $e->getMessage();
        }    
    }
}