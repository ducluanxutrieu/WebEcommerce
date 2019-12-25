<?php include "../data/database.php"; ?>
<?php include "../include/lib/simple_html_dom.php"; ?>

<?php
$from = "2019-08-01";
$to = "2019-12-31";
$product_name = "iphone x 64gb";
$test = new ProductAnalysisB();
//$test->UpdateViewOfProduct(1);
//$test->GetView(2, $from, $to);
//echo $test->BuildSearchString("Iphone x 64 GB");
$test->GetRelevantLinks($product_name);
$test->FindPrice("https://fptshop.com.vn/dien-thoai/iphone-x/338058/tra-gop");
class ProductAnalysisB
{
    private $high_view = 2;
    private $google_link = "https://www.google.com/search?q=";

    public function GetRelevantLinks($product_name)
    {
        //1. Build search string
        $search = $this->BuildSearchString($product_name);
        $url = $this->google_link . $search;

        //2. Send search string and get result
        $html = file_get_html($url);

        //3. Analyze search result and get links
        // Find all links

        $return_list = array();

        foreach ($html->find('a') as $element) {
            $pos = stripos($element->plaintext, $product_name);
            if ($pos !== false) {
                $link = $this->StandarizeLink($element->href);
                if ($link != -1) {
                    $return_list["{$element->plaintext}"] = "{$link}";
                }
            }
        }

        foreach ($return_list as $x => $x_value){
            echo $x . '<br>';
            echo $x_value . '<br>';
            echo '<br>';
        }
    }


    public function FindPrice($link){
        $html = file_get_html($link);
        //$ret = $html->find('.area_price');
        //$test = '.area_price';
        //$test = '.fs-dtprice';
        //$test = '#_price_new436';
        $test = '.price';
        //$test = '.area_price';
//        $test = '.tg-hder';
        echo $test;
        foreach($html->find($test) as $element)
            echo $element . '<br>';
    }

    public function StandarizeLink($raw_link)
    {
        $start = stripos($raw_link, "http");
        if ($start !== false) {
            $end = stripos($raw_link, "&");
            return substr($raw_link, $start, $end - $start);
        }else return -1;
    }

    //standardize search string
    public function BuildSearchString($search)
    {
        $list = explode(" ", $search);
        $result = "";
        for ($i = 0; $i < count($list) - 1; $i++)
            $result = $result . $list[$i] . "+";
        $result = $result . $list[$i];
        return $result;
    }

    public function GetView($product_id, $from, $to)
    {
        $FROM = "'" . $from . "'";
        $TO = "'" . $to . "'";

        $sql = "SELECT COUNT(*) as NUM FROM product_analysis WHERE `product_id`=$product_id AND `visited_date`>$FROM AND `visited_date` < $TO";
        $db = new Database();
        $result = $db->select($sql);
        $row = mysqli_fetch_array($result);
        echo $row['NUM'];
        return $db->select($sql);
    }

    public function UpdateViewOfProduct($product_id)
    {
        $now = date("Y-m-d H:i:s");
        $NOW = "'" . $now . "'";
        $sql = "INSERT INTO product_analysis(`product_id`, `visited_date`) VALUES ({$product_id},{$NOW})";
        $db = new Database();
        $db->insert($sql);
    }
}

?>


