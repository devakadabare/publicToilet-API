<?php 
class User_model extends CI_model{

	public function addPlace($data){

        $result = $this->db->insert("place", $data);
        return $result;
    }

    public function addUser($data){

        $result = $this->db->insert("user", $data);
        return $result;
    }

    public function getAllPlaces() {
        $this->db->select('*');
        $this->db->from('place d');
        $this->db->where('m.status', 'ACTIVE');
        $query = $this->db->get();
        return $query->result();
    }

    
    
}