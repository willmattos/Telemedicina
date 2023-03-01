<?php 
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Acceso extends AbstractController{
    /**
     * @Route("/login", name="ctrl_login")
     */
    public function login(){ 
        if(!$this->getUser()){
            return $this->render('login.html.twig');
        }
        return $this->redirectToRoute('bandeja');   
        
    }
	
	/**
     * @Route("/logout", name="ctrl_logout")
     */
    public function logout(){    
        return $this->render('login.html.twig');
    }    
}