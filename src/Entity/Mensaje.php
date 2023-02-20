<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="mensajes")
 */
class Mensaje
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
     * One Consulta solo es tiene un usuario.
     * @ORM\OneToOne(targetEntity="Consulta")
     * @ORM\JoinColumn(name="codigo_consulta", referencedColumnName="codigo")
     */
    private $codigo_consulta;
    /**
     * One Mensaje solo es tiene un usuario.
     * @ORM\OneToOne(targetEntity="Usuario")
     * @ORM\JoinColumn(name="id_usuario", referencedColumnName="id")
     */
    private $id_usuario;

    private $ruta;
	
    public function getCodigo() {
        return $this->codigo;
    }
    public function getMensaje() {
        return $this->mensaje;
    }
    public function setMensaje($mensaje) {
        $this->mensaje = $mensaje;
    }
	public function getAdjunto() {
        return $this->adjunto;
    }
    public function setAdjunto($adjunto) {
        $this->adjunto = $adjunto;
    }
 	public function getFecha() {
        return $this->fecha_hora;
    }
    public function setFecha($fecha_hora) {
        $this->fecha_hora = $fecha_hora;
    }
    public function getConsulta() {
        return $this->codigo_consulta;
    }
    public function setConsulta($codigo_consulta) {
        $this->codigo_consulta = $codigo_consulta;
    }
    public function getUsuario() {
        return $this->id_usuario;
    }
    public function setUsuario($id_usuario) {
        $this->id_usuario = $id_usuario;
    }
    public function getRuta() {
        return $this->ruta;
    }
    public function setRuta($ruta) {
        $this->ruta = $ruta;
    }
}