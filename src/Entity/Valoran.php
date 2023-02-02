<?php

namespace App\Entity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity @ORM\Table(name="valoran")
 */
class Valoracion implements UserInterface, \Serializable 
{
    /**
     * @ORM\Id @ORM\Column(type="integer")
     */
    private $codigo_consulta;
    /**
     * @ORM\Id @ORM\Column(type="integer")
     */
    private $num_medico;
    /**
     * @ORM\Column(type="integer")
     */
    private $valoracion;

    public function getCodigo() {
        return $this->id;
    }
    public function setCodigo($codigo) {
       $this->usuario = $usuario;
    }
    public function getNumCol() {
        return $this->clave;
    }
    public function setNumCol($clave) {
        $this->clave = $clave;
    }
	public function getValoracion() {
        return $this->supervisor;
    }
    public function setValoracion($valoracion) {
        $this->valoracion = $valoracion;
    }

}
