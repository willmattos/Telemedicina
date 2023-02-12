# Telemedicina-Symfony
composer require friendsofsymfony/jsrouting-bundle
 composer update
 composer recipes:install symfony/apache-pack --force -v;

Al empezar
en la carpeta a modificar git bash here;
-----------
git init(primera vez)
Para añadir y modificar archivos
git status 
git add (nombre archivo)
git commit -m "mensaje de lo que has hecho"
git push
-----------------
para actualizar archivos en local
git fetch
git merge
----------------
para ver las modificaciones de un archivo
githistory.xyz
https://github.githistory.xyz/


usuarios
medicos ->one/one usuarios
mensajes ->one/one consulta -> one /one usuario
consultas ->one/one usuario-> one /one medico //nuevo atributo para cojer mensajes
valoran ->one/one consulta ->one/one medico -> one/one  usuario
sadas
xzc
--------------------------------------------------------------------
controler
login/loguout
metodos

//rutas
if(paciente) crear consulta
bandeja
consulta
medicos
perfil medicos (get id)
perfil
salir
recuperar
registrarse

//twig
login
bandeja
consulta
medicos
perfil medicos (get id)
perfil
salir
recuperar
registrarse


//post
asunto,mensaje,adjunto,

---------------------------------
Notas Ivan
        /**
     * @Route("/bandeja/nueva_consulta", name="bandeja")
     */
    public function crearConsulta() {
        if(isset($_POST['asunto'] ) || isset($_POST['mensaje']) || isset($_POST['adjunto']) || isset($_POST['medicos'])){
            foreach($_POST['medicos'] as $medico){
                $entityManager = $this->getDoctrine()->getManager();
                $consulta = new Consulta();
                $consulta->setAsunto($_POST['asunto']);
                $consulta->setLeido(0);
                $consulta->setCompletado(0);
                $consulta->setUsuario($entityManager->find(Usuario::class,$this->getUser()->getId()));
                $consulta->setMedico($entityManager->find(Medico::class,$_POST['medicos']));
                $entityManager->persist($consulta);
                $entityManager->flush();
                $mensaje = new Mensaje();
                $mensaje->setMensaje($_POST['mensaje']);
                $mensaje->setAdjunto($_POST['adjunto']);
                $mensaje->setConsulta($entityManager->find(Consulta::class,$consulta->getCodigo()));
                $mensaje->setUsuario($entityManager->find(Usuario::class,$this->getUser()->getId()));
                $entityManager->persist($mensaje);
                $entityManager->flush();
            }
        }
         return new Response("Equipo insertado, Id= " . $nuevo->getId() . "\n");
        //return $this->render('bandeja.html.twig');
    }


    nombre de medico
    asunto 
    codigo de consulta

