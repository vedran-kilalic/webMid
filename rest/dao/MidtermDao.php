<?php

class MidtermDao {

    private $conn;

    /**
    * constructor of dao class
    */
    public function __construct(){
        try {

        /** TODO
        * List parameters such as servername, username, password, schema. Make sure to use appropriate port
        */
        $host = "web-prog-db-do-user-14041040-0.b.db.ondigitalocean.com";
        $user = "testuser";
        $password = "AVNS_k1p7nNwD6RGibrgf9_W";
        $schema = "midterm_2023";
        $port = 25060;

        /*options array neccessary to enable ssl mode - do not change*/
        /*$options = array(
        	PDO::MYSQL_ATTR_SSL_CA => 'https://drive.google.com/file/d/1g3sZDXiWK8HcPuRhS0nNeoUlOVSWdMAg/view?usp=share_link',
        	PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false,
          
        );
        */
        /** TODO
        * Create new connection
        * Use $options array as last parameter to new PDO call after the password
        */
        $this->conn = new PDO("mysql:host=$host;dbname=$schema;port=$port", $user, $password, /*$options*/);
        // set the PDO error mode to exception
          $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
          echo "Connected successfully";
        } catch(PDOException $e) {
          echo "Connection failed: " . $e->getMessage();
        }
    }

    /** TODO
    * Implement DAO method used to get cap table
    */
    public function cap_table(){
      $query = "SELECT * FROM cap_table";
      $stmt = $this->conn->prepare($query);
      $stmt->execute();
      $result = $stmt ->fetchAll(PDO::FETCH_ASSOC);
      return $result;
    }

    public function getShareCLass($share_class_id){
      $query = "SELECT * FROM share_classes WHERE id = :share_class_id";
      $stmt = $this->conn->prepare($query);
      $stmt -> execute(['share_class_id' => $share_class_id]);
      $result = $stmt -> fetchAll(PDO::FETCH_ASSOC);
      return $result;
    }

    public function getInvestor($investor_id){
      $query = "SELECT * FROM investors WHERE id = :investor_id";
      $stmt = $this->conn->prepare($query);
      $stmt -> execute(['investor_id' => $investor_id]);
      $result = $stmt -> fetchAll(PDO::FETCH_ASSOC);
      return $result;
    }

    public function getShareCLassCategory($share_class_category_id){
      $query = "SELECT * FROM share_class_categories WHERE id = :share_class_category_id";
      $stmt = $this->conn->prepare($query);
      $stmt -> execute(['share_class_category_id' => $share_class_category_id]);
      $result = $stmt -> fetch(PDO::FETCH_ASSOC);
      return $result;
    }

    /** TODO
    * Implement DAO method used to get summary
    */
    public function summary(){
      $query = "SELECT COUNT(DISTINCT investor_id) AS total_investors,SUM(diluted_shares) AS total_shares FROM cap_table";
      $stmt = $this->conn->prepare($query);
      $stmt -> execute();
      $result = $stmt -> fetch(PDO::FETCH_ASSOC);
      return $result;
    }

    /** TODO
    * Implement DAO method to return list of investors with their total shares amount
    */
    public function investors(){
      $query = "SELECT i.first_name , i.last_name, i.company , SUM(ct.diluted_shares) AS total_shares
      FROM investors i
      JOIN cap_table ct ON i.id = ct.investor_id
      GROUP BY i.id";
        $stmt = $this->conn->prepare($query);
        $stmt -> execute();
        $result = $stmt -> fetch(PDO::FETCH_ASSOC);
        return $result;
    }
}
?>
