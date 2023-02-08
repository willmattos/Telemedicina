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
     * @ORM\Column(type="integer", name = "id")
     */
    private $id;
    /**
     * @ORM\Column(type="string", name = "correo")
     */
    private $correo;
        /**
     * @ORM\Column(type="string", name = "nombre")
     */
    private $nombre;
        /**
     * @ORM\Column(type="string", name = "clave")
     */
    private $clave;
        /**
     * @ORM\Column(type="integer", name = "rol")
     */
    private $rol;
    /**
     * @ORM\Column(type="string", name = "foto")
     */
    private $foto;
    /**
     * @ORM\Column(type="integer", name = "bloquear")
     */
    private $bloquear;

    /**
     * @return mixed
     */
    public function getRol(){
        return $this->rol;
    }
    /**
     * @param mixed $rol
     */
    public function setRol($rol){
        $this->rol = $rol;
    }

    public function getId() {
        return $this->id;
    }
    public function setCorreo($correo) {
       $this->correo = $correo;
    }
    public function getCorreo() {
        return $this->correo;
    }
    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }
	public function getNombre() {
        return $this->nombre;
    }
    public function setClave($clave) {
        $this->clave = $clave;
    }
 	public function getClave() {
        return $this->clave;
    }
    public function getFoto() {
        return $this->foto;
    }
    public function setFoto($foto) {
        $this->foto = $foto;
    }
    public function getBloquear() {
        return $this->bloquear;
    }
    public function setBloquear($bloquear) {
        $this->bloquear = $bloquear;
    }
 	// =======================================================
	// Elementos necesarios para la autenticación
	// =======================================================
   public function getRoles()
    {
        if($this->rol){
            return array('ROLE_USER','ROLE_ADMIN');            
            }
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
			$this->bloquear,
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