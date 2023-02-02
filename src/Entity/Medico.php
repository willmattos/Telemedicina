<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;
/**
 * @ORM\Entity @ORM\Table(name="medicos")
 */
class Medico 
{
    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
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
     * One Medico solo es un usuario.
     * @ORM\OneToOne(targetEntity="Usuario")
     * @ORM\JoinColumn(name="id_usuario", referencedColumnName="id")
     */
	private $usuario;

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
    public function getUsuario() {
        return $this->usuario;
    }
    public function setsuario($usuario) {
        $this->usuario = $usuario;
    }

}