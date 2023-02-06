<?php
// src/Controller/Acceso.php
namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use App\Entity\Medico;
use App\Entity\Usuario;
use App\Entity\Consulta;
use App\Entity\Mensaje;
use App\Entity\Valoran;

class Acceso extends AbstractController{
    /**
     * @Route("/login", name="login")
     */
    public function login(){
        $entityManager = $this->getDoctrine()->getManager();
        $equipo = $entityManager->find(Mensaje::class, 15);
        //var_dump($equipo);
        return new Response($equipo->getUsuario()->getNombre());
    }
}
