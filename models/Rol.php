<?php 
 class Rol{
 	private $id;
 	private $name;
 	private $status;
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
    		$strSql = "SELECT r.*, s.name as status FROM roles r INNER JOIN  statuses s  ON s.id=r.status_id ORDER BY r.id ASC";
    		$query = $this->pdo->select($strSql);
    		return $query;
	    } catch (PDOException $e) {
	    	die($e->getMessage());
	    } 
    }

    public function newRol($data)
    {
        try {
            $this->pdo->insert('roles', $data);
        } catch (PDOException $e) {
            die($e->getMessage());
        } 
    }
    public function getById($id)
    {
        try {
            $strSql = "SELECT * FROM Roles WHERE id = :id";
            $arrayData = ['id' => $id];
            $query = $this->pdo->select($strSql, $arrayData);
            return $query;
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }

    public function editRol($data)
    {
        try {
            $strWhere = 'id = ' . $data['id'];
            $this->pdo->update('Roles', $data, $strWhere); 
        } catch (PDOException $e) {
            die($e->getMessage());
        } 
    }
    public function deleteRol($data)
    {
        try {
            $strWhere = 'id = ' . $data['id'];
            $this->pdo->delete('Roles', $strWhere); 
        } catch (PDOException $e) {
            die($e->getMessage());
        }    
    }
 }