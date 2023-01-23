<?php
class Produk
{
    public $id;
    public $name;
    public $harga;
    public $deskripsi;

    private $conn;
    private $table = "tbl_produk";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function add()
    {
        $query = "INSERT INTO
                " . $this->table . "
            SET
               id=:id, name=:name, harga=:harga, deskripsi=:deskripsi";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('harga', $this->harga);
        $stmt->bindParam('deskripsi', $this->deskripsi);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " p          
                WHERE
                    p.id = ?
                LIMIT
                0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        $stmt->execute();

        $product = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $product['id'];
        $this->name = $product['name'];
        $this->harga = $product['harga'];
        $this->deskripsi = $product['deskripsi'];
    }

    function update()
    {
        $query = "UPDATE
                " . $this->table . "
            SET
                name = :name,
                harga = :harga,
                deskripsi = :deskripsi
            WHERE
                id = :id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('harga', $this->harga);
        $stmt->bindParam('deskripsi', $this->deskripsi);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}