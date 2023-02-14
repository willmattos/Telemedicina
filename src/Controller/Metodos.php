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
        $usuario = $this->getUser();
        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $usuario));

        if($usuario->getFoto()){
            $usuario = $usuario->getFoto();
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
        
        return $this->render('consulta.html.twig',array('consulta' => $consulta));
    
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


     /**
     * @Route("/bandeja/actualizarDatos", name="actualizarDatos")
     */
    public function actualizarDatos() {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $this->getUser();
        $medico = $entityManager->getRepository(Medico::class)->findOneBy(array('usuario'=> $usuario));
        $especialidad = $entityManager->getRepository(Especialidades::class)->findOneBy(array('codigo'=> $_POST['especialidad']));
        //Cambiar Datos
        //var_dump($_POST);
        //var_dump($_FILES);die;
        if(isset($usuario)){
            //En la tabla usuario
            $usuario->setNombre($_POST['nombre']);
            $usuario->setApellido($_POST['apellido']);
            if($_FILES['foto']['tmp_name']){
                $stream = fopen($_FILES['fichero']['tmp_name'],'rb');
                $usuario->setFoto(base64_encode(stream_get_contents($stream)));
            }

            //En la tabla medico
            $medico->setEspecialidad($especialidad);
            $medico->setHospital($_POST['hospital']);
            $cv = $_FILES['cv']['tmp_name'];
            $filesystem = new Filesystem();
            $directorio = dirname(__FILE__);
            $usuario = $this->getUser();
            $ruta = $filesystem->exists($directorio.'/../../public/Usuarios/'.$usuario->getId());
            $filesystem->copy($cv, $ruta);
            var_dump($cv);
            $entityManager->flush();
        }

        //Cargar su perfil de nuevo
        $especialidades = $entityManager->getRepository(Especialidades::class)->findAll();
        return $this->render('perfil.html.twig',array('usuario' => $usuario,'medico' => $medico,'especialidades'=>$especialidades));
    
    }
    //LO QUE NO SEA AJAX VA ARRIBA
    //AQUI EMPEZAMOS AJAX

    /**
     * @Route("/recogerConsultas", name="recogerConsultas", methods={"GET"})
     */
    public function recogerConsultas() {
        $datos = array();
        $id = $this->getUser()->getId();
        $entityManager = $this->getDoctrine()->getManager();
        $consultas = $entityManager->getRepository(Consulta::class)->findBy(array('usuario'=>1));
        for($i = 0;$i<count($consultas);$i++){
            array_push($datos, array($consultas[$i]->getCodigo(),$consultas[$i]->getAsunto(),$consultas[$i]->getMedico()->getUsuario()->getNombre(),$consultas[$i]->getLeido()));
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