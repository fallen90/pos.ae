<?php
class Database {
    private $conn;
    
    public $insert_id = "";

    public $data = [];

    public function __construct($config)
    {
        $link = new mysqli($config['host'], $config['user'], $config['pass'], $config['db']);
        if (!$link->connect_errno) {
            $this->conn = $link;
        } else {
            return false;
        }
    }
    public function __destruct(){
        mysqli_close($this->conn);
    }
    
    public function getInstance(){
        return $this->conn;
    }

    public function query($sql)
    {
        $result = $this->conn->query($sql);
        if (!$this->conn->connect_errno) {
            return $result;
        } else {
            return false;
        }
    }
    public function insert($table, $values, $where = "")
    {
        $fields = "(`" . implode("`,`", array_keys($values)) . "`)";
        $values = "('" . implode("','", array_values($values)) . "')";
        $sql = "INSERT INTO `$table` $fields VALUES $values $where";
        $this->query($sql);
        $this->insert_id = mysqli_insert_id($this->conn);
        return $this;
    }
    public function delete($table, $col_ref, $col_val){
        $sql ="DELETE FROM `$table` WHERE `$col_ref`='$col_val'";
        $this->query($sql);
    }
    public function update($table, $values, $where=""){
        $update_fields = [];
        foreach($values as $key=>$value){
            $update_fields[] = "`$key` = '$value'";
        }
        $sql = "UPDATE `$table` SET " . implode(", ", $update_fields) . " $where";
        $this->query($sql);
    }
    public function update_by_id($table, $values, $id){
        $id_ref = $id;
        $id_val = $values[$id_ref];
        $this->update($table, $values, "WHERE `$id_ref` = '$id_val'");
        return true;
    }
    public function select($table, $fields, $where = "", $multiple = true)
    {
        if($fields != "*"){
            $fields = "`" . implode("`,`",$fields) . "`";
        }

        $sql = "SELECT " . $fields . " FROM $table $where";
        if($multiple){
            $data = [];
            foreach ($this->query($sql) as $value) {
                $data[] = $value;
            }
            return $data;
        } else {
            return $this->query($sql)->fetch_assoc();
        }
    }
    public function show_columns($table){
        $columns = [];
        $q = $this->query("SHOW COLUMNS FROM $table");
        if($q != null){
            foreach($q as $column){
                $columns[] = $column;
            }
        }
        return $columns;
    }
    public function show_tables(){
        $tables = $this->query("SHOW TABLES;");
        $tbls = [];
        foreach($tables as $tbl){
            $tbls[] = $tbl['Tables_in_' . DB];
        }
        return $tbls;
    }
}