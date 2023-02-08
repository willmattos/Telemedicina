<?php
namespace App\Controller;
// src/Controller/PedidosLogin.php
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mime\Address;

use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpFoundation\Session\SessionInterface;


class Metodos extends AbstractController{
    /**
     * @Route("/bandeja", name="bandeja")
     */
    public function bandeja() {
        return $this->render('bandeja.html.twig');
    }
        /**
     * @Route("/bandeja/crearconsulta", name="formularioConsulta")
     */
    public function formularioConsulta() {
        return $this->render('formularioConsulta.html.twig');
    }
            /**
     * @Route("/bandeja/crear_consulta", name="crear_consulta")
     */
    public function formularioCoansulta() {
        return $this->render('consulta.html.twig');
    }
                /**
     * @Route("/bandeja/crear_consulta", name="medicos")
     */
    public function formularioCoaasdnsulta() {
        return $this->render('consulta.html.twig');
    }
}