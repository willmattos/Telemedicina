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
        return $this->redirectToRoute('login');
        
    }


	 /**
     * @Route("/crearcuenta", name="crearcuenta")	 
     */
	public function crear(UserPasswordHasherInterface $passwordHasher){  
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

                        $ruta = substr($_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"], 0, -11);
                        $ruta = $ruta . "activar/" .$usuario->getRecuperacion();
                        $email = (new Email())
                        ->from('noreply@telemedicina.com')
                        ->to($correo)
                        //->cc('cc@example.com')
                        //->bcc('bcc@example.com')
                        //->replyTo('fabien@example.com')
                        //->priority(Email::PRIORITY_HIGH)
                        ->subject('Activa tu cuenta')
                        ->html("<a href=\"http://$ruta\">Activar mi cuenta</a>");
                        $dns='smtp://537b291161b1d5:69f08f99c0af5d@sandbox.smtp.mailtrap.io:2525?encryption=tls&auth_mode=login';
                        $transport = Transport::fromDsn($dns);
                        $mailer = new Mailer($transport);
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
         /**
     * @Route("/activar/{codigo}", name="activar")
     */
    public function activar($codigo) {
        if(!$this->getUser()){
            return $this->render('registro.html.twig');
        }
        return $this->redirectToRoute('login');
        
    }
}