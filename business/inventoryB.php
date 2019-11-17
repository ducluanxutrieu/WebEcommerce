<?php include "../data/database.php" ?>
<?php

$test = new InventoryB();
$from = "2019-10-01";
$to = "2019-10-06";

//$test->GetRelevantInventoryID(1, $to);
//$test->GetCorrectSoldItems(1, $from, $to);
//echo $test -> MarkOfSoldItems(1, $from, $to, "2019-10-03");
$test -> GetLatestInventoryStatus(1);

class InventoryB
{
    public function CalculatorPerformance($product_id, $from, $to)
    {
        /*
         * 1. Get all relevant inventory_id
         * 2. Sum M_S, M_I, --> P_ID
        */
        $list = $this->GetRelevantInventoryID($product_id, $to);
        $total = 0;
        while ($row = mysqli_fetch_array($list)) {
            $inventory_id = $row['inventory_id'];
            $import_date = $row['import_date'];
            //2.1 find out M_S of current inventory_id
            $sum_M_S = $this -> MarkOfSoldItems($inventory_id, $from, $to, $import_date);
            //2.2 find out M_I of current inventory_id
        }
        return $total;
    }

    public function MarkOfStockItems($inventory_id){
        //1. Get latest record

        //2. Calculate
    }

    public function GetLatestInventoryStatus($inventory_id){
        $sql = "SELECT * FROM inventory_management WHERE inventory_id = {$inventory_id} ORDER BY im_id DESC LIMIT 1";
        $db = new Database();
        $result = $db->select($sql);

        while ($row = mysqli_fetch_array($result)){
            echo $row['im_id'];
        }
    }

    public function MarkOfSoldItems($inventory_id, $from, $to, $import_date)
    {
        //1.Get correct row
        $list = $this -> GetCorrectSoldItems($inventory_id, $from, $to);

        //2. Calculate row by row
        $total = 0;
        $M = strtotime($import_date);
        $N = strtotime($to);
        while ($row = mysqli_fetch_array($list)){
            $export_date = $row['export_date'];
            $E = strtotime($export_date);
            $M_S = $N - ($E - $M);
            $total += $M_S;
        }
        return $total;
    }

    public function GetCorrectSoldItems($inventory_id, $from, $to)
    {
        $FROM = "'" . $from . "'";
        $TO = "'" . $to . "'";
        $sql = "SELECT * FROM inventory_out WHERE inventory_id={$inventory_id} AND export_date > {$FROM} AND export_date < {$TO}";
        $db = new Database();
        $result = $db->select($sql);
        return $result;
    }

    public function GetRelevantInventoryID($product_id, $to)
    {
        $TO = "'" . $to . "'";
        $sql = "SELECT * FROM Inventory_In WHERE product_id={$product_id}";
        $db = new Database();
        $result = $db->select($sql);
        return $result;
    }
}

?>