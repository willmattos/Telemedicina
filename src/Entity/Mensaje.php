<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="mensajes")
 */
class Mensaje implements UserInterface, \Serializable 
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
    private $mensaje;
        /**
     * @ORM\Column(type="string")
     */
    private $adjunto;
    /**
     * @ORM\Column(type="datetimetz")
     */
    private $fecha_hora;
    /**
     * @ORM\Column(type="integer")
     */
    private $id_usuario;
	
    public function getCodigo() {
        return $this->codigo;
    }
    public function getMensaje() {
        return $this->mensaje;
    }
    public function setMensaje($mensaje) {
        $this->mensaje = $mensaje;
    }
	public function setAdjunto() {
        return $this->fecha;
    }
    public function setAdjunto($fecha) {
        $this->fecha = $fecha;
    }
 	public function getFecha() {
        return $this->leido;
    }
    public function setFecha($leido) {
        $this->leido = $leido;
    }

}