<?php 
/**
 * 
 */
class Movie
{
	private $id;
	private $nombre;
	private $description;
	private $pdo;
	
	function __construct()
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
    		$strSql = "SELECT m.*, s.name as estado, u.name as usuario FROM movies m INNER JOIN statuses s ON s.id = m.status_id INNER JOIN users u ON u.id = m.user_id group  by m.id";
    		$query = $this->pdo->select($strSql);
    		return $query;
	    } catch (PDOException $e) {
	    	die($e->getMessage());
	    } 
    }

    public function newMovie($data)
    {
        try {
            $this->pdo->insert('movies', $data);
            return true;
        } catch (PDOException $e) {
            die($e->getMessage());
        } 
    }
    public function getById($id)
    {
        try {
            $strSql = "SELECT * FROM movies WHERE id = :id";
            $arrayData = ['id' => $id];
            $query = $this->pdo->select($strSql, $arrayData);
            return $query;
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }

    public function editMovie($data)
    {
        try {
            $strWhere = 'id = ' . $data['id'];
            $this->pdo->update('movies', $data, $strWhere); 
        } catch (PDOException $e) {
            die($e->getMessage());
        } 
    }
    public function deleteMovie($data)
    {
        try {
            $strWhere = 'id = ' . $data['id'];
            $this->pdo->delete('movies', $strWhere); 
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }
    public function getLastId()
    {
        try {
            $strSql = "SELECT MAX(id) as id FROM movies";
            $query = $this->pdo->select($strSql);
            return $query;
        } catch (PDOException $e) {
            return $e->getMessage();
        }
    }

    public function getcategoriesById($id)
    {
        try {
            $strSql = "select c.* ,s.name as estado from category_movie cm INNER JOIn movies m on m.id=cm.movie_id INNER JOIN categories c on c.id=cm.category_id inner join statuses s on c.status_id=s.id where m.id=:id";
            $arrayData = ['id' => $id];
            $query = $this->pdo->select($strSql, $arrayData);
            return $query;
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }

    public function saveCategoryMovie($arrayCategories, $lastIdMovie)
    {
        try {
            foreach ($arrayCategories as $category) {
                $data = [
                    'movie_id'      =>  $lastIdMovie,
                    'category_id'   =>  $category["id"]
                ];

                $this->pdo->insert('category_movie', $data);
            } 

            return true;
        } catch (PDOException $e) {
            return $e->getMessage();
        }    
    }
}