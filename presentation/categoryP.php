<?php include "business/categoryB.php"; ?>
<?php

class CategoryP
{
    public function ShowAllCategory()
    {
        $cb = new CategoryB();
        $result = $cb->GetAllCategory();

        $count = 1;
        while ($row = mysqli_fetch_array($result)) {
            $category = <<<DELIMITER
            <a href="index.php?category={$count}"  class="list-group-item list-group-item-action" {$this->SetStyleForCurrentCategory($count)}>{$row['cat_name']}</a>
            DELIMITER;
            echo $category;
            $count++;
        }
    }

    public function SetStyleForCurrentCategory($count)
    {
        $cat_id = $this->GetCategory();
        $style = "";
        if ($count == $cat_id) {
            $style = "style = 'color:red'";
        }
        return $style;
    }

    public function GetCategory()
    {
        $cat_id = 1;
        if (!isset($_GET['category']))
            $cat_id = 1;
        else
            $cat_id = $_GET['category'];
        return $cat_id;
    }
}

?>