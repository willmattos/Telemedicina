<?php
namespace App\Controller;
// src/Controller/PedidosLogin.php
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

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
    public function bandeja(UserPasswordHasherInterface $passwordHasher) {
        /*
        $entityManager = $this->getDoctrine()->getManager();
        $user =$this->getUser();
        $hashedPassword = $passwordHasher->hashPassword($user,'1234');
        $this->getUser()->setClave($hashedPassword);
        $entityManager->flush();
        var_dump($this->getUser());*/
        return $this->render('bandeja.html.twig');
        
    }

    /**
     * @Route("/medicos", name="medicos")
     */
    public function medicos() {
        $entityManager = $this->getDoctrine()->getManager();
        $especialidades = $entityManager->getRepository(Especialidades::class)->findAll();
        return $this->render('medicos.html.twig',array('especialidades' => $especialidades));
    }

    /**
     * @Route("/perfil", name="perfil")
     */
    public function perfil() {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->find(Usuario::class,$this->getUser()->getId());
        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $usuario));

        if($usuario->getFoto()){
            $usuario->setFoto(base64_encode(stream_get_contents($usuario->getFoto())));
        }else{
            $usuario = null;
        }
        if(!$medico){
            $medico = null;
            return $this->render('perfil.html.twig',array('usuario' => $usuario,'medico' => $medico));
        }else{
            $especialidades = $entityManager->getRepository(Especialidades::class)->findAll();
            return $this->render('perfil.html.twig',array('usuario' => $usuario,'medico' => $medico,'especialidades'=>$especialidades));
        }
    }

    /**
     * @Route("/registro", name="registro")
     */
    public function formularioRegistro() {

        return $this->render('registro.html.twig');
        
    }
    
    /**
     * @Route("/bandeja/nueva_consulta", name="formularioConsulta")
     */
    public function mostrarFormulario() {
        $entityManager = $this->getDoctrine()->getManager();
        $especialidades = $entityManager->getRepository(Especialidades::class)->findAll();
        return $this->render('formularioConsulta.html.twig',array('especialidades' => $especialidades));
    }
    
    /**
     * @Route("/bandeja/consulta/{consulta}", name="consulta")
     */
    public function cargarConsulta($consulta) {
       
        $entityManager = $this->getDoctrine()->getManager();

        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $this->getUser()));
        $consulta = $entityManager->getRepository(Consulta::class)->findOneBy(array('codigo'=>$consulta));
        if($medico){
            $nombre = $consulta->getUsuario()->getNombre();
            $apellido = $consulta->getUsuario()->getApellido();
        }else{
            $nombre = $consulta->getMedico()->getUsuario()->getNombre();
            $apellido = $consulta->getMedico()->getUsuario()->getApellido();
        }
        $mensajes = $entityManager->getRepository(Mensaje::class)->findBy(array('codigo_consulta'=>$consulta));
        $datos = $nombre . " " . $apellido . ": " . $consulta->getAsunto();

        $valoracion = $entityManager->getRepository(Valoran::class)->findOneBy(array('codigo_consulta'=>$consulta->getCodigo())) || 0;
        if($valoracion) $valoracion = $valoracion->getValoracion();
        return $this->render('consulta.html.twig',array('datos' => $datos, 'mensajes' => $mensajes, 'valoracion' => $valoracion));
    
    }

    /**
     * @Route("/bandeja/crearconsulta", name="crear_consulta")
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
                $consulta->setMedico($entityManager->find(Medico::class,$_POST['medicos'][0]));
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
        return $this->redirectToRoute('bandeja');
    }

    //LO QUE NO SEA AJAX VA ARRIBA
    //AQUI EMPEZAMOS AJAX

    /**
     * @Route("/recogerConsultas", name="recogerConsultas", methods={"POST"})
     */
    public function recogerConsultas() {
        $datos = array();

        $entityManager = $this->getDoctrine()->getManager();

        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $this->getUser()));
        if($medico){
            $consultas = $entityManager->getRepository(Consulta::class)->findBy(array('medico'=>$medico),array('fecha' => 'DESC'));
        }else{
            $consultas = $entityManager->getRepository(Consulta::class)->findBy(array('usuario'=>$this->getUser()), array('fecha' => 'DESC'));
        }
        foreach ($consultas as $consulta) {
            # code...
            if($medico){
                $nombre = $consulta->getUsuario()->getNombre();
                $apellido = $consulta->getUsuario()->getApellido();
            }else{
                $nombre = $consulta->getMedico()->getUsuario()->getNombre();
                $apellido = $consulta->getMedico()->getUsuario()->getApellido();
            }
            array_push($datos, array($consulta->getCodigo(),$consulta->getAsunto(),$nombre, $apellido,$consulta->getLeido()));
        }

        return new JsonResponse($datos);
    
    }
    /**
     * @Route("/medicosPorEspecialidad/{codigo}", name="medicosPorEspecialidad", methods={"GET"})
     */
    public function medicosPorEspecialidad($codigo=0) {
        $entityManager = $this->getDoctrine()->getManager();
        if($codigo){
            $medicos = $entityManager->getRepository(Medico::class)->findBy(array('especialidad'=> $entityManager->getRepository(Especialidades::class)->findOneBy(array('codigo'=>$codigo))));
        }else{
            $medicos = $entityManager->getRepository(Medico::class)->findAll();
        }
        $datos = array();
        for($i = 0;$i<count($medicos);$i++){

            $valoraciones = $entityManager->getRepository(Valoran::class)->findBy(array('num_medico'=> $medicos[$i]->getNumCol()));
            $total = 0;
            foreach($valoraciones as $valoracion){
               $total += $valoracion->getValoracion();
            }
            if($total) $total /= count($valoraciones);

            if($medicos[$i]->getUsuario()->getFoto()){
                $medicos[$i]->getUsuario()->setFoto(base64_encode(stream_get_contents($medicos[$i]->getUsuario()->getFoto())));
                $foto = $medicos[$i]->getUsuario()->getFoto();
            }else{
                $foto = null;
            }

            array_push($datos, array($medicos[$i]->getUsuario()->getId(),$medicos[$i]->getNumCol(),$medicos[$i]->getUsuario()->getNombre(),$medicos[$i]->getUsuario()->getApellido(),$medicos[$i]->getHospital(),$total,$foto));
        }	
        return new JsonResponse($datos);
    
    }

}