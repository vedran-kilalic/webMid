<?php
require_once __DIR__."/../dao/MidtermDao.php";

class MidtermService {
    protected $dao;

    public function __construct(){
        $this->dao = new MidtermDao();
    }

    /** TODO
    * Implement service method to return detailed cap-table
    */
    public function cap_table(){
        $initialData = $this->dao->cap_table();
        $result = array();
        foreach($initialData as $row){
            $share_class_id = $row['share_class_id'];
            $share_class_category_id = $row['share_class_category_id'];
            $investor_id = $row['investor_id'];

            $share_class = $this->dao->getShareClass($share_class_id);
            $share_class_category = $this->dao->getShareClassCategory($share_class_category_id);
            $investor = $this->dao->getInvestor($investor_id);


            $result[$share_class_id]['class'] = $share_class['description'];
            $result[$share_class_id]['categories'][$share_class_category_id] = $share_class_category['description'];
            $result[$share_class_id]['categories'][$share_class_category_id]['investors'][$investor_id]['investor'] = 
             $investor['first_name']. ' ' . $investor['last_name'];
             $result[$share_class_id]['categories'][$share_class_category_id]['investors'][$investor_id]['diluted_shares'] = $row['diluted_shares'];
            
        }
        $result = array_values($result);
        foreach($result as &$class){
            $class['categories'] = array_values($class['categories']);
            foreach($class['categories'] as &$category){
                $category['investors'] = array_values($category['investors']);
        }
    }
        return $result;
    }

    /** TODO
    * Implement service method to return cap-table summary
    */
    public function summary(){
        return $this->dao->summary();
    }

    /** TODO
    * Implement service method to return list of investors with their total shares amount
    */
    public function investors(){
        return $this->dao->investors();
    }
}
?>
