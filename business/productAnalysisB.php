<?php include "../data/database.php"; ?>
<?php
$test = new ProductAnalysisB();
$test->UpdateViewOfProduct(1);

class ProductAnalysisB
{
    public function UpdateViewOfProduct($product_id)
    {
        $now = date("Y-m-d H:i:s");
        $NOW = "'" . $now . "'";
        $sql = "INSERT INTO product_analysis(`product_id`, `visited_date`) VALUES ({$product_id}, {$NOW})";
        $db = new Database();
        $result = $db->insert($sql);
    }
}

?>
