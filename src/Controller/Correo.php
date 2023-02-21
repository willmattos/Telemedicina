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
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
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
        return $this->render('mensaje.html.twig', array('mensaje' => "Se ha enviado un correo de verificación a $correo."));

	 }
         /**
     * @Route("/activar/{codigo}", name="activar")
     */
    public function activar($codigo) {
        
        if(!$this->getUser()){
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('recuperacion'=> $codigo));
            if($usuario){
                    $usuario->setRecuperacion(0);
                    $usuario->setActivado(1);
                    $entityManager->flush();
                    $token = new UsernamePasswordToken($usuario, null, 'main', $usuario->getRoles());
                    $this->get('security.token_storage')->setToken($token);
                    $this->get('session')->set('_security_main', serialize($token));
            }
        }
        return $this->redirectToRoute('bandeja');
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
	public function enviarCorreoRecuperacion(MailerInterface $mailer){  
        if(!$this->getUser()){
            if($_POST['correo']){
                $correo = filter_var($_POST['correo'], FILTER_SANITIZE_EMAIL);
                if (filter_var($correo, FILTER_VALIDATE_EMAIL)) {
                    $entityManager = $this->getDoctrine()->getManager();
                    $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('correo'=> $correo));
                    if($usuario){
                        $absolute_url = $this->full_url( $_SERVER );
                        $ruta = $absolute_url;
                        $ruta = $ruta . "/cambiar/".$usuario->getId();
                        $email = (new Email())
                        ->from('noreply@telemedicina.com')
                        ->to($correo)
                        ->subject('Cambiar contraseña de tu cuenta')
                        ->html("<a href=\"$ruta\">Cambiar contraseña</a>");
                        $mailer->send($email);
                    }else{
                        return new Response('<html><body>'. $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"] .'</body></html>');
                    }  
            }
            else{
             return new Response('<html><body>correo mals</body></html>');
            }
            }else{
                return new Response('<html><body>Falta datos</body></html>');
            }
        }else{
            return new Response('<html><body>Ya hay usuario</body></html>');
        }
        return new Response('<html><body><div class="conten">
        <h1>Mira tu bandeja de correos.</h1>
        <p>El correo de verificacion ha sido enviado</p>
      </div></body></html>');     
	 }

 /**
     * @Route("/enviarcorreoRecuperacion/cambiar/{id}", name="cambiar")
     */
    public function cambiar($id) {
            return $this->render('cambiarContraseña.html.twig', array('id' => $id));
    }
    /**
     * @Route("/enviarcorreoRecuperacion/cambiarContraseña", name="cambiarContraseña")
     */
    public function cambiarContraseña(UserPasswordHasherInterface $passwordHasher) {
        $entityManager = $this->getDoctrine()->getManager();
        $usuario = $entityManager->getRepository(Usuario::class)->findOneBy(array('id'=> $_POST['oculto']));
        $hashedPassword = $passwordHasher->hashPassword($usuario,$_POST['clave']);
        $usuario->setClave($hashedPassword);
        $entityManager->flush();
       return $this->redirectToRoute('bandeja');
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