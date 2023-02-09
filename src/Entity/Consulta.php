<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="consultas")
 */
class Consulta  
{
    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $codigo;
    /**
     * @ORM\Column(type="string")
     */
    private $asunto;
    /**
     * @ORM\Column(type="datetimetz")
     */
    private $fecha;
    /**
     * @ORM\Column(type="integer")
     */
    private $leido;
    /**
     * @ORM\Column(type="integer")
     */
    private $completado;
     /**
     * One Consulta solo es tiene un usuario.
     * @ORM\OneToOne(targetEntity="Usuario")
     * @ORM\JoinColumn(name="id_paciente", referencedColumnName="id")
     */
	private $usuario;
     /**
     * One Consulta solo es tiene un medico.
     * @ORM\OneToOne(targetEntity="Medico")
     * @ORM\JoinColumn(name="num_medico", referencedColumnName="num_col")
     */
	private $medico;
	
    public function getCodigo() {
        return $this->codigo;
    }
    public function setCodigo($codigo) {
        $this->codigo = $codigo;
    }
    public function getAsunto() {
        return $this->asunto;
    }
    public function setAsunto($asunto) {
        $this->asunto = $asunto;
    }
    public function getFecha() {
        return $fecha->fecha;
    }
    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }
    public function getLeido() {
        return $this->leido;
    }
    public function setLeido($leido) {
        $this->leido = $leido;
    }
    public function getCompletado() {
        return $this->completado;
    }
    public function setCompletado($completado) {
        $this->completado = $completado;
    }
    public function getUsuario() {
        return $this->usuario;
    }
    public function setUsuario($usuario) {
        $this->usuario = $usuario;
    }
    public function getMedico() {
        return $this->medico;
    }
    public function setMedico($medico) {
        $this->medico = $medico;
    }

}