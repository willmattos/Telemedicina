<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Mime\Address;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\Usuario;

class Correo extends AbstractController{

    /**
     * @Route("/registro", name="registro")
     */
    public function formularioRegistro() {
        if(!$this->getUser()){
            return $this->render('registro.html.twig');
        }
        return $this->redirectToRoute('bandeja');
        
    }

	 /**
     * @Route("/crearcuenta", name="crearcuenta")	 
     */
	public function crear(UserPasswordHasherInterface $passwordHasher,MailerInterface $mailer){  
        if(!$this->getUser()){
            if(isset($_POST['nombre']) && isset($_POST['apellido']) && isset($_POST['correo']) && isset($_POST['clave']) && $_POST['nombre'] && $_POST['apellido'] && $_POST['correo'] && $_POST['clave']){
                $correo = filter_var($_POST['correo'], FILTER_SANITIZE_EMAIL);
                if (filter_var($correo, FILTER_VALIDATE_EMAIL)) {
                    $entityManager = $this->getDoctrine()->getManager();
                    $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('correo'=> $correo));
                    if(!$usuario){
                        
                        $usuario = new Usuario();
                        $usuario->setNombre($_POST['nombre']);
                        $usuario->setApellido($_POST['apellido']);
                        $usuario->setCorreo($correo);

                        $hashedPassword = $passwordHasher->hashPassword($usuario,$_POST['clave']);

                        $usuario->setClave($hashedPassword);
                        $usuario->setRol(0);
                        $usuario->setActivado(0);
                        $usuario->setRecuperacion(rand(1,2147483647));

                        $entityManager->persist($usuario);
                        $entityManager->flush();                          
                        
                        $absolute_url = $this->full_url( $_SERVER );
                        
                        $ruta = substr($absolute_url, 0, -11);
                        $ruta = $ruta . "activar/" .$usuario->getRecuperacion();
                        $email = (new Email())
                        ->from('noreply@telemedicina.com')
                        ->to($correo)
                        //->cc('cc@example.com')
                        //->bcc('bcc@example.com')
                        //->replyTo('fabien@example.com')
                        //->priority(Email::PRIORITY_HIGH)
                        ->subject('Activa tu cuenta')
                        ->html("<a href=\"$ruta\">Activar mi cuenta</a>");
                        $mailer->send($email);
                    }else{
                        return $this->render('mensaje.html.twig', array('mensaje' => 'Un usuario ya esta registrado con ese correo.'));
                    }
               

                
            }
            else{
                return $this->render('mensaje.html.twig', array('mensaje' => 'Correo electronico no valido.'));
            }
            }else{
                return $this->render('mensaje.html.twig', array('mensaje' => 'No se completaron todos los datos.'));
            }
        }else{
            return $this->redirectToRoute('bandeja');
        }   
	 }
         /**
     * @Route("/activar/{codigo}", name="activar")
     */
    public function activar($codigo) {
        
        if(!$this->getUser()){
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('recuperacion'=> $codigo));
            if($usuario){
                $usuario->setRecuperacion(null);
                $usuario->setActivado(1);
                $entityManager->flush();

            }
        }
        return $this->redirectToRoute('ctrl_login');
    }
    /**
     * @Route("/recuperar", name="recuperar")
     */
    public function recuperar() {
        if(!$this->getUser()){
            return $this->render('recuperar.html.twig');
        }
        return $this->redirectToRoute('bandeja');
        
    }
    /**
     * @Route("/enviarcorreoRecuperacion", name="enviarcorreoRecuperacion")	 
     */
	public function enviarCorreoRecuperacion(){  
        if(!$this->getUser()){
            if($_POST['correo']){
                $correo = filter_var($_POST['correo'], FILTER_SANITIZE_EMAIL);
                if (filter_var($correo, FILTER_VALIDATE_EMAIL)) {
                    $entityManager = $this->getDoctrine()->getManager();
                    $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('correo'=> $correo));
                    var_dump($usuario);
                    if($usuario){
                        $absolute_url = $this->full_url( $_SERVER );
                        $ruta = substr($absolute_url, 0, -11);
                        var_dump($ruta);
                        $ruta = $ruta . "activar/" .$usuario->getRecuperacion();
                        $email = (new Email())
                        ->from('noreply@telemedicina.com')
                        ->to($correo)
                        //->cc('cc@example.com')
                        //->bcc('bcc@example.com')
                        //->replyTo('fabien@example.com')
                        //->priority(Email::PRIORITY_HIGH)
                        ->subject('R tu cuenta')
                        ->html("<a href=\"$ruta\">Activar mi cuenta</a>");
                        $mailer->send($email);
                    }else{
                        return new Response('<html><body>'. $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"] .'</body></html>');

                    }
               

                
            }
            else{
             return new Response('<html><body>correo mals</body></html>');
            }
            }else{
                return new Response('<html><body>falta datos</body></html>');
            }
        }else{
            return new Response('<html><body>ya hay usuario</body></html>');
        }
        return new Response('<html><body>Enviado</body></html>');     
	 }
     function url_origin($s, $use_forwarded_host=false) {

        $ssl = ( ! empty($s['HTTPS']) && $s['HTTPS'] == 'on' ) ? true:false;
        $sp = strtolower( $s['SERVER_PROTOCOL'] );
        $protocol = substr( $sp, 0, strpos( $sp, '/'  )) . ( ( $ssl ) ? 's' : '' );
      
        $port = $s['SERVER_PORT'];
        $port = ( ( ! $ssl && $port == '80' ) || ( $ssl && $port=='443' ) ) ? '' : ':' . $port;
        
        $host = ( $use_forwarded_host && isset( $s['HTTP_X_FORWARDED_HOST'] ) ) ? $s['HTTP_X_FORWARDED_HOST'] : ( isset( $s['HTTP_HOST'] ) ? $s['HTTP_HOST'] : null );
        $host = isset( $host ) ? $host : $s['SERVER_NAME'] . $port;
      
        return $protocol . '://' . $host;
      
      }
      
      function full_url( $s, $use_forwarded_host=false ) {
        return $this->url_origin( $s, $use_forwarded_host ) . $s['REQUEST_URI'];
      }
}