<?php

namespace App\Http\Controllers;

use Session;
use Request;
use DB;
use CRUDBooster;

class AdminTBeliController extends \crocodicstudio\crudbooster\controllers\CBController
{

	public function cbInit()
	{

		# START CONFIGURATION DO NOT REMOVE THIS LINE
		$this->title_field = "id";
		$this->limit = "20";
		$this->orderby = "id,desc";
		$this->global_privilege = false;
		$this->button_table_action = true;
		$this->button_bulk_action = true;
		$this->button_action_style = "button_icon";
		$this->button_add = true;
		$this->button_edit = true;
		$this->button_delete = true;
		$this->button_detail = true;
		$this->button_show = true;
		$this->button_filter = true;
		$this->button_import = false;
		$this->button_export = false;
		$this->table = "t_beli";
		# END CONFIGURATION DO NOT REMOVE THIS LINE

		# START COLUMNS DO NOT REMOVE THIS LINE
		$this->col = [];
		$this->col[] = ["label" => "Tanggal", "name" => "dTanggal"];
		$this->col[] = ["label" => "Keterangan", "name" => "mKeterangan"];
		$this->col[] = [
			"label" => "Operasional", "name" => "(select sum(t_beli_detail.yOperasional) 
															from t_beli_detail 
															where 
															t_beli_detail.lDeleted = 0 
															AND t_beli_detail.t_beli_id = t_beli.id) as total_ops"
															, "callback" => function ($row) {
																return number_format($row->total_ops);
															}
		];
		$this->col[] = [
			"label" => "Quantity ( Kg )", "name" => "(select sum(t_beli_detail.yJumlah) 
															from t_beli_detail 
															where 
															t_beli_detail.lDeleted = 0 
															AND t_beli_detail.t_beli_id = t_beli.id) as total_qty"
															, "callback" => function ($row) {
																return number_format($row->total_qty);
															}
		];
		$this->col[] = [
			"label" => "Jumlah ( Rp )", "name" => "(select sum(t_beli_detail.ySub_beli) 
															from t_beli_detail 
															where 
															t_beli_detail.lDeleted = 0 
															AND t_beli_detail.t_beli_id = t_beli.id) as total_beli"
															, "callback" => function ($row) {
																return number_format($row->total_beli);
															}
		];
		// $this->col[] = ["label"=>"Operasional","name"=>"(SELECT SUM(a.yOperasional) total
		// 												FROM t_beli_detail a 
		// 												WHERE 
		// 												a.lDeleted=0
		// 												and a.t_beli_id= t_beli.id) AS operasional "];
		# END COLUMNS DO NOT REMOVE THIS LINE

		# START FORM DO NOT REMOVE THIS LINE
		$this->form = [];
		$this->form[] = ['label' => 'Tanggal', 'name' => 'dTanggal', 'type' => 'date', 'validation' => 'required|date', 'width' => 'col-sm-4'];
		$this->form[] = ['label' => 'Keterangan', 'name' => 'mKeterangan', 'type' => 'textarea', 'validation' => 'required|string|min:5|max:5000', 'width' => 'col-sm-6'];

		$columns[] = ['label' => 'Kandang', 'name' => 'kandang_id', 'type' => 'datamodal', 'datamodal_table' => 'm_kandang', 'datamodal_columns' => 'vNama,mAlamat,vNo_telp', 'datamodal_select_to' => 'id:vNama', 'datamodal_where' => '', 'datamodal_size' => 'large'];
		$columns[] = ['label' => 'Supir', 'name' => 'supir_id', 'type' => 'datamodal', 'datamodal_table' => 'm_supir', 'datamodal_columns' => 'vNama,vNo_telp', 'datamodal_select_to' => 'id:vNama', 'datamodal_where' => '', 'datamodal_size' => 'large'];
		$columns[] = ['label' => 'Harga', 'name' => 'yHarga', 'type' => 'number', 'required' => true, 'width' => 'col-sm-4'];
		$columns[] = ['label' => 'Quantity (Kg)', 'name' => 'yJumlah', 'type' => 'number', 'required' => true, 'width' => 'col-sm-4'];
		$columns[] = ['label'=>'Jumlah (Rp)','name'=>'ySub_beli','type'=>'number','formula'=>"[yHarga] * [yJumlah] ","readonly"=>true,'required'=>true,'width'=>'col-sm-4'];

		$columns[] = ['label' => 'Operasional', 'name' => 'yOperasional', 'type' => 'number', 'required' => true, 'width' => 'col-sm-4'];
		// $columns[] = ['label'=>'Plus','name'=>'yPlus','type'=>'number','required'=>true,'width'=>'col-sm-4'];
		// $columns[] = ['label'=>'Minus','name'=>'yMinus','type'=>'number','required'=>true,'width'=>'col-sm-4'];
		// $columns[] = ['label'=>'Nawar','name'=>'yNawar','type'=>'number','required'=>true,'width'=>'col-sm-4'];
		$columns[] = ['label' => 'Keterangan', 'name' => 'mKeterangan', 'type' => 'textarea', 'required' => false, 'width' => 'col-sm-4'];
		$this->form[] = ['label' => 'Detail Beli', 'name' => 't_beli_detail', 'type' => 'child', 'width' => 'col-sm-4', 'columns' => $columns, 'table' => 't_beli_detail', 'foreign_key' => 't_beli_id'];

		//$columns[] = ['label'=>'Sub Total','name'=>'subtotal','type'=>'number','formula'=>"[qty] * [price] - [discount]","readonly"=>true,'required'=>true];
		# END FORM DO NOT REMOVE THIS LINE

		# OLD START FORM
		//$this->form = [];
		//$this->form[] = ['label'=>'Tanggal','name'=>'dTanggal','type'=>'date','validation'=>'required|date','width'=>'col-sm-4'];
		//$this->form[] = ['label'=>'Keterangan','name'=>'mKeterangan','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-6'];
		//
		//$this->form[] = ['label'=>'Orders Detail','name'=>'orders_detail','type'=>'child','columns'=>$columns,'table'=>'orders_detail','foreign_key'=>'orders_id'];
		//
		//
		//// $columns[] = ['label'=>'Product','name'=>'products_id','type'=>'datamodal','datamodal_table'=>'products','datamodal_columns'=>'name,price','datamodal_select_to'=>'price:price','datamodal_where'=>'','datamodal_size'=>'large'];
		//// $columns[] = ['label'=>'Price','name'=>'price','type'=>'number','required'=>true];
		//// $columns[] = ['label'=>'QTY','name'=>'qty','type'=>'number','required'=>true];
		//// $columns[] = ['label'=>'Discount','name'=>'discount','type'=>'number','required'=>true];
		//// $columns[] = ['label'=>'Sub Total','name'=>'subtotal','type'=>'number','formula'=>"[qty] * [price] - [discount]","readonly"=>true,'required'=>true];
		//// $this->form[] = ['label'=>'Orders Detail','name'=>'orders_detail','type'=>'child','columns'=>$columns,'table'=>'orders_detail','foreign_key'=>'orders_id'];
		# OLD END FORM

		/* 
	        | ---------------------------------------------------------------------- 
	        | Sub Module
	        | ----------------------------------------------------------------------     
			| @label          = Label of action 
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class  
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        | 
	        */
		$this->sub_module = array();


		/* 
	        | ---------------------------------------------------------------------- 
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)     
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        | 
	        */
		$this->addaction = array();


		/* 
	        | ---------------------------------------------------------------------- 
	        | Add More Button Selected
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button 
	        | Then about the action, you should code at actionButtonSelected method 
	        | 
	        */
		$this->button_selected = array();


		/* 
	        | ---------------------------------------------------------------------- 
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------     
	        | @message = Text of message 
	        | @type    = warning,success,danger,info        
	        | 
	        */
		$this->alert        = array();



		/* 
	        | ---------------------------------------------------------------------- 
	        | Add more button to header button 
	        | ----------------------------------------------------------------------     
	        | @label = Name of button 
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        | 
	        */
		$this->index_button = array();



		/* 
	        | ---------------------------------------------------------------------- 
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------     
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
	        | 
	        */
		$this->table_row_color = array();


		/*
	        | ---------------------------------------------------------------------- 
	        | You may use this bellow array to add statistic at dashboard 
	        | ---------------------------------------------------------------------- 
	        | @label, @count, @icon, @color 
	        |
	        */
		$this->index_statistic = array();



		/*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
		$this->script_js = NULL;


		/*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code before index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
		$this->pre_index_html = null;



		/*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code after index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
		$this->post_index_html = null;



		/*
	        | ---------------------------------------------------------------------- 
	        | Include Javascript File 
	        | ---------------------------------------------------------------------- 
	        | URL of your javascript each array 
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
		$this->load_js = array();



		/*
	        | ---------------------------------------------------------------------- 
	        | Add css style at body 
	        | ---------------------------------------------------------------------- 
	        | css code in the variable 
	        | $this->style_css = ".style{....}";
	        |
	        */
		$this->style_css = NULL;



		/*
	        | ---------------------------------------------------------------------- 
	        | Include css File 
	        | ---------------------------------------------------------------------- 
	        | URL of your css each array 
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
		$this->load_css = array();
	}


	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for button selected
	    | ---------------------------------------------------------------------- 
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	public function actionButtonSelected($id_selected, $button_name)
	{
		//Your code here

	}


	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
	public function hook_query_index(&$query)
	{
		//Your code here

	}

	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */
	public function hook_row_index($column_index, &$column_value)
	{
		//Your code here
	}

	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	public function hook_before_add(&$postdata)
	{
		//Your code here

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after add public static function called 
	    | ---------------------------------------------------------------------- 
	    | @id = last insert id
	    | 
	    */
	public function hook_after_add($id)
	{
		//Your code here

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	public function hook_before_edit(&$postdata, $id)
	{
		//Your code here

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	public function hook_after_edit($id)
	{
		//Your code here 

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	public function hook_before_delete($id)
	{
		//Your code here

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	public function hook_after_delete($id)
	{
		//Your code here

	}



	//By the way, you can still create your own method in here... :) 


}
