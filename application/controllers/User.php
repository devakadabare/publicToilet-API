<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct() {

		parent::__construct();

		// $currentUserData = $this->session->userdata();

		//     if(!isset($currentUserData["loggedTransportManager"]))
		// 	{
		// 		redirect('/Login/index');
		// 	}

		$this->load->model('User_model','',true);
		
		

	}
	public function index()
	{
		$this->load->view('welcome_message');
	}
	public function addPlace(){
		$data = json_decode(file_get_contents('php://input'), true);

		if($data){
			try {

				$newPlace = array(
					'placeName' =>$data['placeName'],
					'placeLat' =>$data['placeLat'],
					'placeLng' =>$data['placeLng'],
					'charge' =>$data['charge'],
					'isDisableCan' =>$data['isDisableCan'],
					'openHours' =>$data['openHours'],
					'placeType' =>$data['placeType'],
					'gender' =>$data['gender'],
					'isParking' =>$data['isParking'],
					'isHotWater' =>$data['isHotWater'],
					'isDrinkingWater' =>$data['isDrinkingWater'],
					'isBabyChange' =>$data['isBabyChange'],
					'isShower' =>$data['isShower'],

				 );

				$result=$this->User_model->addPlace($newPlace);

				if($result){

					$response['status']=true;
					$response['result']=$result;

				}else{

					$response['status']=false;
					$response['result']=$result;
					
				}
				
			} catch (Exception $e) {
				$response['status']=false;
				$response['result']=$e;
			}

			

			echo json_encode($response);
			
		}else{
			$response['status']=false;
			echo json_encode($response);
		}
	}


	public function registerUser(){
		$data = json_decode(file_get_contents('php://input'), true);

		if($data){
			try {

				$newUser = array(
					'username' =>$data['username'],
					'passowrd' =>$data['passowrd'],

				 );

				$result=$this->User_model->addUser($newPlace);

				if($result){

					$response['status']=true;
					$response['result']=$result;

				}else{

					$response['status']=false;
					$response['result']=$result;
					
				}
				
			} catch (Exception $e) {
				$response['status']=false;
				$response['result']=$e;
			}

			

			echo json_encode($response);
			
		}else{
			$response['status']=false;
			echo json_encode($response);
		}
	}

	public function getPlaces(){
		$data = json_decode(file_get_contents('php://input'), true);

		if($data){
			try {

				// $newUser = array(
				// 	'username' =>$data['username'],
				// 	'passowrd' =>$data['passowrd'],

				//  );

				$result=$this->User_model->getAllPlaces();

				if($result){

					$response['status']=true;
					$response['result']=$result;

				}else{

					$response['status']=false;
					$response['result']=$result;
					
				}
				
			} catch (Exception $e) {
				$response['status']=false;
				$response['result']=$e;
			}

			

			echo json_encode($response);
			
		}else{
			$response['status']=false;
			echo json_encode($response);
		}
	}

}
