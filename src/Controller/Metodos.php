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
use App\Entity\Consulta;
use App\Entity\Especialidades;
use App\Entity\Medico;
use App\Entity\Mensaje;
use App\Entity\Usuario;
use App\Entity\Valoran;


class Metodos extends AbstractController{
    /**
     * @Route("/bandeja", name="bandeja")
     */
    public function bandeja() {
        return $this->render('bandeja.html.twig');
    }

        /**
     * @Route("/bandeja/nueva_consulta", name="nueva consulta")
     */
    public function crearConsulta() {
        if(isset($_POST['asunto'] ) || isset($_POST['mensaje']) || isset($_POST['adjunto']) || isset($_POST['medicos'])){
            foreach($_POST['medicos'] as $medico){
                $entityManager = $this->getDoctrine()->getManager();
                
                //Creamos la consulta
                $consulta = new Consulta();
                $consulta->setAsunto($_POST['asunto']);
                $consulta->setLeido(0);
                $consulta->setCompletado(0);
                $consulta->setUsuario($entityManager->find(Usuario::class,$this->getUser()->getId()));
                $consulta->setMedico($entityManager->find(Medico::class,$_POST['medicos']));
                $entityManager->persist($consulta);
                $entityManager->flush();
                
                //Creamos el mensaje
                $mensaje = new Mensaje();
                $mensaje->setMensaje($_POST['mensaje']);
                $mensaje->setAdjunto($_POST['adjunto']);
                $mensaje->setConsulta($entityManager->find(Consulta::class,$consulta->getCodigo()));
                $mensaje->setUsuario($entityManager->find(Usuario::class,$this->getUser()->getId()));
                $entityManager->persist($mensaje);
                $entityManager->flush();
            }
        }
         return new Response("Equipo insertado\n");
        //return $this->render('bandeja.html.twig');
    }
    /**
     * @Route("/bandeja/{num}", name="chat")
     */
    public function cargarChat() {
        if(isset($_POST['asunto'] ) || isset($_POST['mensaje'])){
        //return $this->render('chat.html.twig');
        }
    }
        /**
     * @Route("/medicos", name="medicos")
     */
    public function mostrarMedicos() {
        return $this->render('bandeja.html.twig');
    }

}