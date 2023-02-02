<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="consultas")
 */
class Consulta implements UserInterface, \Serializable 
{

    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="interger")
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
     * unir paciente
     * unir medico
    */
	
    public function getCodigo() {
        return $this->codigo;
    }
    public function getAsunto() {
        return $this->asunto;
    }
    public function setAsunto($asunto) {
        $this->asunto = $asunto;
    }
	public function setFecha() {
        return $this->fecha;
    }
    public function getFecha($fecha) {
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

}