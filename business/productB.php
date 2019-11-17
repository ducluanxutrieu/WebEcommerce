<?php
class ProductB
{
    public function GetAllProductFromCategory($cat_id)
    {
        $sql = "SELECT * FROM Product WHERE cat_id = {$cat_id}";
        $db = new Database();
        $result = $db->select($sql);

        return $result;
    }
}
?> 