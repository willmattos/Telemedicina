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
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mime\Address;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Filesystem\Path;
use Symfony\Component\Finder\Finder;
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
     * @Route("/ejemplo", name="ejemplo")
     */
    public function ejemplo() {
        //$usuario = $this->getUser();
        //var_dump($usuario->getId());die;
        try {
            $filesystem = new Filesystem();
            $finder = new Finder();
            $directorio = dirname(__FILE__);
            $usuario = $this->getUser();
            $filesystem->exists($directorio.'/../../public/Usuarios/'.$usuario->getId());
            if(is_dir($directorio.'/../../public/Usuarios/'.$usuario->getId())){
                    echo null;
            }else{
                $filesystem->mkdir(
                    Path::normalize($directorio.'/../../public/Usuarios/'.$usuario->getId()),
                );
            } 
           }
           catch (IOExceptionInterface $exception) {
            echo "An error occurred while creating your directory at ".$exception->getPath();
        }
        return $this->render('bandeja.html.twig');   
    }
    /**
     * @Route("/bandeja", name="bandeja")
     */
    public function bandeja() {
        //public function bandeja(UserPasswordHasherInterface $passwordHasher) {
        /*
        $entityManager = $this->getDoctrine()->getManager();
        $user =$this->getUser();
        $hashedPassword = $passwordHasher->hashPassword($user,'1234');
        $this->getUser()->setClave($hashedPassword);
        $entityManager->flush();
        var_dump($this->getUser());*/
        if($this->isGranted('ROLE_USER')){
            return $this->render('bandeja.html.twig');
        }
        return $this->redirectToRoute('ctrl_login');
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
        if($this->isGranted('ROLE_USER')){

        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $this->getUser();
        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $usuario));

        if(!$usuario->getFoto()){
            $usuario = null;
        }
        if(!$medico){
            $medico = null;
            return $this->render('perfil.html.twig',array('usuario' => $usuario,'medico' => $medico));
        }else{
            $filesystem = new Filesystem();
            $directorio = dirname(__FILE__);
            $rutaF = $directorio.'/../../public/Usuarios/u'.$this->getUser()->getId().'/cv/'.'curriculum.pdf';
            $rutaP = 'Usuarios/u'.$this->getUser()->getId().'/cv/'.'curriculum.pdf';
            $ruta = $filesystem->exists($rutaF);
            if(!$ruta){
                $rutaP= null;
            }
            $especialidades = $entityManager->getRepository(Especialidades::class)->findAll();
            return $this->render('perfil.html.twig',array('usuario' => $usuario,'medico' => $medico,'especialidades'=>$especialidades, 'cv' =>$rutaP));
        }
        }
        return $this->redirectToRoute('bandeja');

        
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
        if($this->isGranted('ROLE_USER')){
        $entityManager = $this->getDoctrine()->getManager();
        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $this->getUser()));
        if(!$medico){
            $especialidades = $entityManager->getRepository(Especialidades::class)->findAll();
            return $this->render('formularioConsulta.html.twig',array('especialidades' => $especialidades));
        }
        }
        return $this->redirectToRoute('bandeja');
    }
    
    /**
     * @Route("/bandeja/consulta/{consulta}", name="consulta")
     */
    public function cargarConsulta($consulta = null) {
        if($this->isGranted('ROLE_USER') && $consulta){
        
        $entityManager = $this->getDoctrine()->getManager();
        $consulta = $entityManager->getRepository(Consulta::class)->findOneBy(array('codigo'=>$consulta));
        if($consulta){
            if(($consulta->getUsuario()->getId() == $this->getUser()->getId()) || ($consulta->getMedico()->getUsuario()->getId() == $this->getUser()->getId())){
                if($medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $this->getUser()))){
                    $nombre = $consulta->getUsuario()->getNombre();
                    $apellido = $consulta->getUsuario()->getApellido();
                }else{
                    $nombre = $consulta->getMedico()->getUsuario()->getNombre();
                    $apellido = $consulta->getMedico()->getUsuario()->getApellido();
                }
                $mensajes = $entityManager->getRepository(Mensaje::class)->findBy(array('codigo_consulta'=>$consulta));
                foreach ($mensajes as $mensaje) {
                    $mensaje->setMensaje(str_replace("\n", '</p><p>', $mensaje->getMensaje()));
                }
                $datos = $nombre . " " . $apellido . ": " . $consulta->getAsunto();
        
                $valoracion = $entityManager->getRepository(Valoran::class)->findOneBy(array('codigo_consulta'=>$consulta->getCodigo())) || 0;
                if($valoracion) $valoracion = $valoracion->getValoracion();
                return $this->render('consulta.html.twig',array('datos' => $datos, 'mensajes' => $mensajes, 'valoracion' => $valoracion, 'consulta' => $consulta));
            }
        }
        
        }
        return $this->redirectToRoute('bandeja');
    }

    /**
     * @Route("/bandeja/crearconsulta", name="crear_consulta", methods={"POST"})
     */
    public function crearConsulta() {
        if(isset($_POST['asunto'] ) && isset($_POST['mensaje']) && isset($_POST['medicos']) && $_POST['asunto'] && $_POST['mensaje'] && $_POST['medicos']){
            foreach($_POST['medicos'] as $medico){
                $entityManager = $this->getDoctrine()->getManager();
               
                //Creamos la consulta
                $consulta = new Consulta();
                $consulta->setAsunto($_POST['asunto']);
                $consulta->setLeido(0);
                $consulta->setCompletado(0);
                $consulta->setUsuario($this->getUser());
                $consulta->setMedico($entityManager->find(Medico::class,$_POST['medicos'][0]));
                $entityManager->persist($consulta);
                $entityManager->flush();
                
                //Creamos el mensaje
                $mensaje = new Mensaje();
                $mensaje->setMensaje($_POST['mensaje']);
                if(isset($_FILES['adjunto'])){
                    $mensaje->setAdjunto($_FILES['adjunto']);
                }
                $mensaje->setConsulta($consulta);
                $mensaje->setUsuario($this->getUser());
                $entityManager->persist($mensaje);
                $entityManager->flush();
                $consulta = $consulta->getCodigo();
            }
        }
        return $this->redirectToRoute('consulta', array('consulta' => $consulta));
    }
     /**
     * @Route("/bandeja/enviarMensaje", name="enviarMensaje", methods={"POST"})
     */
    public function enviarMensaje() {

        if(isset($_POST['mensaje'] ) || isset($_POST['fichero'])){
                $entityManager = $this->getDoctrine()->getManager();
                //Creamos la mensaje
                $mensaje = new Mensaje();
                $mensaje->setMensaje($_POST['mensaje']);
                
                //Cambiar por lo de fichero
                $mensaje->setAdjunto($_POST['fichero']);
                $mensaje->setConsulta($entityManager->find(Consulta::class,$_GET['consulta']));
                $mensaje->setUsuario($entityManager->find(Usuario::class,$this->getUser()->getId()));
                $entityManager->persist($mensaje);
                $entityManager->flush();
        }
        return $this->redirectToRoute('consulta',array('consulta' => $_GET['consulta']));
    }

     /**
     * @Route("/registro/crear", name="crearcuenta", methods={"POST"})
     */
    public function crearCuenta() {

        if(!$this->isGranted('ROLE_USER')){
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('correo'=> $_POST['correo']));
            if(!$usuario){

            }
            return $this->redirectToRoute('medicos');
        }
        

        return $this->redirectToRoute('medicos');
    }


     /**
     * @Route("/bandeja/actualizarDatos", name="actualizarDatos")
     */
    public function actualizarDatos() {
        if($this->isGranted('ROLE_USER')){
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = $this->getUser();
            $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $usuario));
            
            $usuario->setNombre($_POST['nombre']);
            $usuario->setApellido($_POST['apellido']);

            if($medico){
                $especialidad = $entityManager->getRepository(Especialidades::class)->findOneBy(array('codigo'=> $_POST['especialidad']));
                $medico->setEspecialidad($especialidad);
                $medico->setHospital($_POST['hospital']);
                $cv = $_FILES['cv']['tmp_name'];
                $nombre = $_FILES['cv']['name'];
                $directorio = dirname(__FILE__);

                if($cv){
                    $filesystem = new Filesystem();
                    $directorio = dirname(__FILE__);
                    $ruta = $filesystem->exists($directorio.'/../../public/Usuarios/u'.$usuario->getId().'/cv/');
                    $rutaF = $directorio.'/../../public/Usuarios/u'.$usuario->getId().'/cv/'.'curriculum.pdf';
                    $mover = move_uploaded_file($cv, $directorio.'/../../public/Usuarios/u'.$usuario->getId().'/cv/'.'curriculum.pdf');
                    $cv = $rutaF;
                }else{
                    $cv = null;
                }
            }
            //En la tabla usuario
            
            if($_FILES['foto']['tmp_name']){
                $stream = fopen($_FILES['foto']['tmp_name'],'rb');
                $usuario->setFoto(base64_encode(stream_get_contents($stream)));
            }
          
            $entityManager->flush();
        }
        return $this->redirectToRoute('perfil');
    }
    
    //LO QUE NO SEA AJAX VA ARRIBA
    //AQUI EMPEZAMOS AJAX

    /**
     * @Route("/recogerConsultas", name="recogerConsultas")
     */
    public function recogerConsultas() {
        $datos = array();
        if($this->isGranted('ROLE_USER')){
            
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
                $foto = $medicos[$i]->getUsuario()->getFoto();
            }else{
                $foto = null;
            }

            array_push($datos, array($medicos[$i]->getUsuario()->getId(),$medicos[$i]->getNumCol(),$medicos[$i]->getUsuario()->getNombre(),$medicos[$i]->getUsuario()->getApellido(),$medicos[$i]->getHospital(),$total,$foto));
        }	
        return new JsonResponse($datos);
    
    }

    /**
     * @Route("/foto", name="foto", methods={"GET"})
     */
    /*    public function testAction(){   
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = $entityManager->find(Usuario::class,4);
            $file = $usuario->getFoto();              
            $response = new Response(base64_decode($file), 200, array(
                    'Content-Type' => 'application/octet-stream',
                    'Content-Disposition' => 'attachment; filename="fotoperfil.jpg"'
            ));
            
            return $response; 
        }
    */
}