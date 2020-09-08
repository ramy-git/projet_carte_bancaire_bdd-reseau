<?php
session_start();
 define ('SESSION_TIMEOUT', "1800");
    OB_start();

    function clean_text($string){
        // cette fonction fait en sorte que le nom prenom email IDE respcte certaines prioritees
        // les donnees entre par l'etudiant ne contienne pas de  caracteres special
        $string = trim($string);
        $string = stripslashes($string);
        //les caracteres special hml
        $string = htmlspecialchars($string); 
        return $string;
    }

//l'utilisateur envoie le formulaire 
    if (isset($_POST['submit'])) {


        // si le champs nom vide on affcihe un message d'erreur
        
        // si le chmaps longin est vide on affiche un messaege d'erreur
        if (empty($_POST['loginU'])) {
        
            echo "<p><label class='text-danger'> Entrez Votre Login Svp </label></p>";
        
        }

        // si le champs user id est vide on affiche un meassage d'erreur
      
        

        // si le pw nest pas remplie on affiche un message d'erreur
        if (empty($_POST['pwU'])) {
        
            echo "<p><label class='text-danger'> Entrez Votre Mot de passe Svp </label></p>";
        
        }
        
        
        // dans le cas ou tout les  champs du formulaire sont bien rempli on triater les donnees entre par l'utilsateur 
        if (!empty($_POST['loginU'])  AND !empty($_POST['pwU'])) {
        
            $loginU= clean_text($_POST['loginU']);
               
               
            if(!preg_match("/^[A-Za-z0-9]*$/", $loginU)){
              echo "<p> Votre login doit contenire que des chiffres et des lettres<p>";
            }
  # code...
              try{

                $host='localhost';
                $dbname='db2019l3i_abelkess';
                $dbuser='db2019l3i_abelkess';
                $bdpassword='A123456*';
                
                
                            $db = new PDO("pgsql:host=devwebdb.etu;dbname=db2019l3i_abelkess", "y2019l3i_abelkess", "A123456*");
                            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            }catch (Exception $e){
              
              die('Erreur : ' . $e->getMessage());
            
            }
            // on affecte  $_POST[nameU], $_POST[user_id], $_POST[pwU], et $_POST[loginU] a des varibale
            
            $password=$_POST['pwU'];
            $login=$_POST['loginU'];


            //$reponce =$db->query('SELECT  password,login, nom, PRENOM, telephone  FROM conseiller');
            // on selectionne de la table utilisateur
            $sql =  'SELECT user_id, nom, login, password FROM utilisateur';
            // on parcours la base de donne a la recherche des element voulus
            $identifier=false;
            if ($identifier==false) {
                # code...
                // on parcours la table utilisateur 
                foreach  ($db->query($sql) as $row) {
                    // on recuper les donnees de la table 
                    // on recupere le nom 
                    $nombd=$row['nom'];
                    // on recupere le user_id
                    $useridbd=$row['user_id'];
                    // on recuepre le login
                    $loginbd=$row['login'];
                    // on recupere le mot de passe hashe
                    $passwordbd=$row['password'];



                 
                    // on compare les donnees retrer par l'utilisateur et les donnees dans la tabels
                    if (0==strcmp($login,$loginbd)) {
                       
                        // on verifie que le mot de passe rentre par l'utilisateur est bien celui de la base de donnee
                        if (password_verify($password, $passwordbd)) {
                            echo '<p>Le mot de passe est valide !</p>';
                            echo "<p>Vous etes bien connecter</p>";

                            $_SESSION['nom']=$nombd;
                            $_SESSION['user_id']=$useridbd;
                            $_SESSION['login']=$loginbd;
                          
                            $identifier=true ;
                            header( "refresh:3;url=userconnect.php" );

                        } 

                    }

                }


            }else{
        echo "<p>connection echouer</p>";
    }


           
    }

}






?>




<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>UCP banque</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
<style>

      
    form {
  /* Uniquement centrer le formulaire sur la page */
  margin: 0 auto;
  width: 400px;
  /* Encadré pour voir les limites du formulaire */
  padding: 1em;
  border: 1px solid #CCC;
  border-radius: 1em;
}

form div + div {
  margin-top: 1em;
}



label {

  display: inline-block;
  width: 90px;
  text-align: right;
}

label {
  /* Pour être sûrs que toutes les étiquettes ont même taille et sont correctement alignées */
  display: inline-block;
  width: 90px;
  text-align: right;
}

input, textarea {
  /* Pour s'assurer que tous les champs texte ont la même police.
     Par défaut, les textarea ont une police monospace */
  font: 1em sans-serif;

  /* Pour que tous les champs texte aient la même dimension */
  width: 300px;
  box-sizing: border-box;

  /* Pour harmoniser le look & feel des bordures des champs texte */
  border: 1px solid #999;
}

input:focus, textarea:focus {
  /* Pour souligner légèrement les éléments actifs */
  border-color: #000;
}

textarea {
  /* Pour aligner les champs texte multi‑ligne avec leur étiquette */
  vertical-align: top;

  /* Pour donner assez de place pour écrire du texte */
  height: 5em;
}

.button {
  /* Pour placer le bouton à la même position que les champs texte */
  padding-left: 90px; /* même taille que les étiquettes */
}

button {
  /* Cette marge supplémentaire représente grosso modo le même espace que celui
     entre les étiquettes et les champs texte */
  margin-left: .5em;
}
</style>
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-2">
                            <div class="logo">
                                <a href="index.html">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-7">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="index.html">home</a></li>
                                        <li><a href="utilisateur.php">Utilisateur</a></li>
                                        <li><a href="admin.php">Admin</a></li>
                                        <li><a href="https://www.u-cergy.fr/fr/index.html">UCP</a></li>
                                        
                                       
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                            <div class="Appointment">
                                <div class="book_btn d-none d-lg-block">
                                    <a  href="#"> <i class="fa fa-phone"></i> 0033615042148</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->

    <div class="shap_big_2 d-none d-lg-block">
        <img src="img/ilstrator/body_shap_2.png" alt="">
    </div>
    <!-- slider_area_start -->
    <div class="slider_area">
       
        <div class="poly_img">
            <img src="img/ilstrator/poly.png" alt="">
        </div>
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="slider_text text-center">
                            <div class="text">
                                <p> mot de passe Irika</p>
                                <p>login 2345</p>

                              <form action="utilisateur.php" method="post">
                                    <div>
                                        <label for="loginU">Login Utilisateur</label>
                                        <input type="text" id="loginU" name="loginU">
                                    </div>
                                    
                                    <div>
                                        <label for="pw">Mot de passe</label>
                                        <input type="password" id="pwU" name="pwU"></textarea>
                                    </div>
                                    <button type="submit" name="submit" >Se connecter</button>
                            </form>
                                <h3>
                                    Ici pour un avenir meilleur
                                </h3>
                           
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->

    <!-- service_area  -->
    <div class="service_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-md-4">
                    <div class="single_service text-center">
                        <div class="icon">
                            <img src="img/svg_icon/seo_1.svg" alt="">
                        </div>
                        <h3>Nos conseiller</h3>
                        <p>Nos conseiller sont la pour vous aider a choisir votre futur</p>
                
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="single_service text-center">
                        <div class="icon">
                            <img src="img/svg_icon/seo_2.svg" alt="">
                        </div>
                        <h3>Taux</h3>
                        <p>Notre banque a le meilleur taux sur le marché.</p>
                        
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="single_service text-center">
                        <div class="icon">
                            <img src="img/svg_icon/seo_3.svg" alt="">
                        </div>
                        <h3>Social Media</h3>
                        <p>On est présent sur les reseaux sociaux pour vous a n'importe quelle moment  </p>
                        
                    </div>
                </div>
            </div>

        </div>
    </div>
    <h2> Site web fait dans le cadre du Projet de Base de Donnees </h2>



        
        <h3>Encadrant du projet :</h3>
            
            <ul>
                <li>LEMAIRE Marc</li>
                <li> JEN TAO Yuan  </li>
                <li> DANG NGOC TUYET Tram</li>
            </ul>
            <h3>Membre du groupe :</h3>

            <ul>
                <li>BELKESSA Ahcene</li>
                <li> SZATHMARY David</li>
                <li> TLEMCANI Ramy</li>
            </ul>



    <!--/ service_area  -->


    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
</body>

</html>