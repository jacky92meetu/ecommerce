<?    
    $temp = array();
    foreach($data_header as $key => $value){
        $temp[] = "\"".$value['display_name']."\"";
    }
    echo implode(",",$temp);
?>

<?    
    foreach($data_list['data'] as $record){
        echo "
";
        $temp = array();
        foreach($data_header as $key => $value){
            if(isset($record[$key])){
                $temp[] = "\"".$record[$key]."\"";
            }
        }
        echo implode(",",$temp);
    }
?>