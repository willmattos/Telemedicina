<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="medicos")
 */
class Medico implements UserInterface, \Serializable 
{
    /**
     * @ORM\Id @ORM\Column(type="integer")
     */
    private $num_col;
    /**
     * @ORM\Column(type="string")
     */
    private $especialidad;
    /**
     * @ORM\Column(type="string")
     */
    private $hospital;
    /**
     * @ORM\Column(type="string")
     */
    private $cv;
    /**
     * unir con usuario
     */
  

    public function getNumCol() {
        return $this->num_col;
    }
    public function setNumCol($num_col) {
       $this->num_col = $num_col;
    }
    public function getEspecialidad() {
        return $this->especialidad;
    }
    public function setEspecialidad($especialidad) {
        $this->especialidad = $especialidad;
    }
	public function getHospital() {
        return $this->supervisor;
    }
    public function setHospital($hospital) {
        $this->hospital = $hospital;
    }
 	public function getCV() {
        return $this->cv;
    }
    public function setCV($cv) {
        $this->cv = $cv;
    }

}