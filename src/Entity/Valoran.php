<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="valoran")
 */
class Valoran 
{
    /**
     * @ORM\Column(type="integer", name="valoracion") 
     */
    private $valoracion;
    /**
     * @ORM\Id @ORM\Column(type="integer", name="codigo_consulta")
     */
    private $codigo_consulta;
    /**
     * @ORM\Id @ORM\Column(type="integer", name="num_medico")
     */
    private $num_medico;
    /**
     * @ORM\Column(type="integer", name="id_usuario") 
     */
    private $id_usuario;

    public function getValoracion() {
        return $this->valoracion;
    }
    public function setValoracion($valoracion) {
        $this->valoracion = $valoracion;
    }
    public function getCodigo() {
        return $this->codigo_consulta;
    }
    public function setCodigo($codigo_consulta) {
       $this->codigo_consulta = $codigo_consulta;
    }
    public function getNumCol() {
        return $this->num_medico;
    }
    public function setNumCol($num_medico) {
        $this->num_medico = $num_medico;
    }
    public function getIdUsuario() {
        return $this->id_usuario;
    }
    public function setIdUsuario($id_usuario) {
        $this->id_usuario = $id_usuario;
    }
}
