<?php include "business/productB.php"; ?>
<?php include "business/inventoryB.php"; ?>
<?php

class ProductP
{
    private $from = "2019-10-01";
    private $to = "2019-10-6";

    public function ShowProduct($name, $price)
    {
        return <<<DELIMITER
                <div class="col-sm-4">
                    <div class="card">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt="">
                          <div class="card-body">
                          <h4 class="card-title">{$name}</h4>
                            <h5>\${$price}</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                            <a href="#" class="btn btn-primary">Add to card</a>
                          </div>
                    </div>
                </div>
        DELIMITER;
    }

    public function ShowFeaturedProduct()
    {
        //1. Get product list sorted performance
        $ib = new InventoryB();
        $featuredList = $ib->GetPoorPerformance($this->from, $this->to);
        foreach ($featuredList as $x => $x_value) {
            $pb = new ProductB();
            $result = $pb->GetProductByID($x);
            $row = mysqli_fetch_array($result);

            while ($row = mysqli_fetch_array($result)) {
                echo $this->ShowProduct($row['product_name'], $row['product_price']);
            }
        }
    }

    public function ShowProductsByUser(){
        $cp = new CategoryP();
        $cat_id = $cp ->GetCategory();
        if ($cat_id ==0 ){
            $this ->ShowFeaturedProduct();
        }else{
            $this->ShowProductsInCategory($cat_id);
        }
    }

    public function ShowProductsInCategory($cat_id)
    {
        $pb = new ProductB();
        $result = $pb->GetAllProductFromCategory($cat_id);
        while ($row = mysqli_fetch_array($result)) {
            echo $this->ShowProduct($row['product_name'], $row['product_price']);
        }
    }
}

?>