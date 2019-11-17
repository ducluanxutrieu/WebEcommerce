<?php include "business/productB.php"; ?>
<?php
class ProductP
{
    public function ShowProductsInCategory()
    {
        $pb = new ProductB();
        $cp = new CategoryP();
        $cat_id = $cp -> GetCategory();
        $result = $pb->GetAllProductFromCategory($cat_id);
        while ($row = mysqli_fetch_array($result)) {
            $product = <<<DELIMITER
            <div class="col-sm-4">
            <div class="card">
            <img class="card-img-top" src="http://placehold.it/700x400" alt="">
              <div class="card-body">
              <h4 class="card-title">{$row['product_name']}</h4>
                <h5>\${$row['product_price']}</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                <a href="#" class="btn btn-primary">Add to card</a>
              </div>
            </div>
            </div>
            DELIMITER;
            echo $product;
        }
    }
}
?>