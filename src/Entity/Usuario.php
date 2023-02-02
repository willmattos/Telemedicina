<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="usuarios")
 */
class Usuario implements UserInterface, \Serializable 
{
    /**
     * @ORM\Id 
     * @ORM\GeneratedValue 
     * @ORM\Column(type="integer")
     */
    private $id;
    /**
     * @ORM\Column(type="string")
     */
    private $correo;
        /**
     * @ORM\Column(type="string")
     */
    private $nombre;
        /**
     * @ORM\Column(type="string")
     */
    private $clave;
        /**
     * @ORM\Column(type="integer")
     */
    private $rol;
    /**
     * @ORM\Column(type="blob")
     */
    private $foto;
    /**
     * @ORM\Column(type="integer")
     */
    private $bloquear;	
	

    public function getId() {
        return $this->id;
    }
    public function setUsuario($usuario) {
       $this->usuario = $usuario;
    }
    public function getCorreo() {
        return $this->clave;
    }
    public function setCorreo($clave) {
        $this->clave = $clave;
    }
	public function getNombre() {
        return $this->supervisor;
    }
    public function setNombre($supervisor) {
        $this->supervisor = $supervisor;
    }
 	public function getClave() {
        return $this->especialidad;
    }
    public function setClave($especialidad) {
        $this->especialidad = $especialidad;
    }
    public function getFoto() {
        return $this->especialidad;
    }
    public function setFoto($especialidad) {
        $this->especialidad = $especialidad;
    }
    public function getBloquear() {
        return $this->especialidad;
    }
    public function setBloquear($especialidad) {
        $this->especialidad = $especialidad;
    }
 	// =======================================================
	// Elementos necesarios para la autenticación
	// =======================================================
   public function getRoles()
    {
		// Si el médico es supervisor, entonces tiene acceso
		// a la zona de administración.
		if($this->supervisor)
			return array('ROLE_USER', 'ROLE_ADMIN');            
		else
			return array('ROLE_USER');            
	}

    public function getPassword()
    {
        return $this->getClave();
    }

    public function getUsername()
    {
        return $this->getCorreo();
    }

    public function eraseCredentials()
    {
        return;
    }
	
    public function getSalt()
    {
        return;
    }

	public function serialize(){
        return serialize(array(
            $this->id,
            $this->correo,
            $this->nombre,
            $this->clave,
            $this->rol,
            $this->foto,
			$this->bloquear
        ));
    }
	
    public function unserialize($serialized){
        list (
            $this->id,
            $this->correo,
            $this->nombre,
            $this->clave,
            $this->rol,
            $this->foto,
			$this->bloquear
            ) = unserialize($serialized);
    }
}