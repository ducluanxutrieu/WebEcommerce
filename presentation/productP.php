<?php include "business/productB.php"; ?>
<?php include "business/inventoryB.php"; ?>
<?php include "business/productAnalysisB.php"; ?>
<?php

class ProductP
{
    private $from = "2019-10-01";
    private $to = "2019-10-6";

    public function ShowItem(){
        //1. Get product id
        $product_id = $this->GetProduct();
        //2. Show Single product
        $pb = new ProductB();
        $result = $pb->GetProductByID($product_id);
        $row = mysqli_fetch_array($result);
        $name = $row['product_name'];
        $price = $row['product_price'];
        echo $this->ShowSingleProduct($name, $price);

        //Update view
        $pab = new ProductAnalysisB();
        $pab->UpdateViewOfProduct($product_id);
    }

    public function GetProduct(){
        if (!isset($_GET['product_id']))
            $product_id = 1;
        else
            $product_id = $_GET['product_id'];

        return $product_id;
    }

    public function ShowSingleProduct($name, $price)
    {
        return <<<DELIMITER
                <div class="col-sm-12">
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

    public function ShowProduct($name, $price, $id)
    {
        return <<<DELIMITER
                <div class="col-sm-4">
                    <div class="card">
                    <a href="item.php?product_id={$id}">
                     <img class="card-img-top" src="http://placehold.it/700x400" alt="">
                    </a>
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
            $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id']);
            $row['product_id'];
        }
    }

    public function ShowProductsByUser()
    {
        $cp = new CategoryP();
        $cat_id = $cp->GetCategory();
        if ($cat_id == 0) {
            $this->ShowFeaturedProduct();
        } else {
            $this->ShowProductsInCategory($cat_id);
        }
    }

    public function ShowProductsInCategory($cat_id)
    {
        $pb = new ProductB();
        $result = $pb->GetAllProductFromCategory($cat_id);
        while ($row = mysqli_fetch_array($result)) {
            echo $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id']);
        }
    }
}

?>