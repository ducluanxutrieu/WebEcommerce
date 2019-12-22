<?php
class ProductB
{

    public function GetProductByID($product_id){
        $sql = "SELECT * FROM Product WHERE product_id = {$product_id}";
        $db = new Database();
        return $db->select($sql);
    }

    public function GetAllProductFromCategory($cat_id)
    {
        $sql = "SELECT * FROM Product WHERE cat_id = {$cat_id}";
        $db = new Database();
        $result = $db->select($sql);

        return $result;
    }
}
?>
