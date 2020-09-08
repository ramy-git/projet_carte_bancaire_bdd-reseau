<?php

session_start();
define ('SESSION_TIMEOUT', "1800");
OB_start();
if (isset($_SESSION['nom']) AND isset($_SESSION['login'])) {
  # code...

$nomCon=$_SESSION['nom'];
$conseiller_id=$_SESSION['conseiller_id'];
$loginCon=$_SESSION['login'];
 function clean_text($string){
        // cette fonction fait en sorte que le nom prenom email IDE respcte certaines prioritees
        // les donnees entre par l'etudiant ne contienne pas de  caracteres special
        $string = trim($string);
        $string = stripslashes($string);
        //les caracteres special hml
        $string = htmlspecialchars($string); 
        return $string;
    }

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

       // pour afficher les donnes de l'utilisateur
    $req = $db->prepare('SELECT * FROM conseiller WHERE conseiller_id = ?  AND nom <= ? AND login <= ? ');
    $req->execute(array($conseiller_id, $nomCon, $loginCon));
 

    // 

// le admin pourra ajouter des donnees


 // si l'utilisateur envoie le formulaire 
// on verifie aue les champs sont bien remplie 
    if (isset($_POST['submit'])) {

        if (empty($_POST['ville'])) {
        
            echo "<p><label class='text-danger'> Entrez la ville du nv Utilisateur Svp </label></p>";
        
        }

        if (empty($_POST['codePostal'])) {
        
            echo "<p><label class='text-danger'> Entrez le nom du nouveau utilisateur Svp </label></p>";
        
        }

        if (empty($_POST['nameNU'])) {
        
            echo "<p><label class='text-danger'> Entrez le nom du nouveau utilisateur Svp </label></p>";
        
        }


        if (empty($_POST['prenomNU'])) {
        
            echo "<p><label class='text-danger'> Entrez le prenom du nouveau utilisateur Svp </label></p>";
        
        }
          if (empty($_POST['adresseNU'])) {
        
            echo "<p><label class='text-danger'> Entrez l'adresse du nouveau utilisateur Svp </label></p>";
        
        }
         if (empty($_POST['loginNU'])) {
        
            echo "<p><label class='text-danger'> Entrez Votre Login de l'utilisateur Svp </label></p>";
        
        }
         if (empty($_POST['banque_id'])) {
        
            echo "<p><label class='text-danger'> Entrez Votre Banque ID Svp </label></p>";
        
        }
         if (empty($_POST['pwNU'])) {
        
            echo "<p><label class='text-danger'> Entrez Votre Mot de passe Svp </label></p>";
        
        }
       
        

        if (!empty($_POST['nameNU']) AND !empty($_POST['prenomNU']) AND !empty($_POST['adresseNU']) AND !empty($_POST['loginNU']) AND !empty($_POST['banque_id'])AND !empty($_POST['pwNU'])AND !empty($_POST['codePostal'])AND !empty($_POST['ville'])) {
            
            $user_id=$_POST['user_id'];
           $prenomNU=$_POST['prenomNU'];
            $nomNU=$_POST['nameNU'];
            $adresseNU=$_POST['adresseNU'];
            $codePostalNU=$_POST['codePostal'];
            $villeNU=$_POST['ville'];

            $loginNU=$_POST['loginNU'];
            $banque_idNU=$_POST['banque_id'];

            $pw=$_POST['pwNU'];
             if(!preg_match("/^[A-Za-z0-9]*$/", $prenomNU)){
                  echo "<p> Votre prenom doit contenire que des chiffres et des lettres<p>";
            }
             if(!preg_match("/^[A-Za-z0-9]*$/", $nomNU)){
              echo "<p> Votre nom doit contenire que des chiffres et des lettres<p>";
            }
             if(!preg_match("/^[A-Za-z0-9]*$/", $adresseNU)){
              echo "<p> Votre adresse doit contenire que des chiffres et des lettres<p>";
            }
             if(!preg_match("/^[A-Za-z0-9]*$/", $codePostalNU)){
              echo "<p> Votre codePostal doit contenire que des chiffres et des lettres<p>";
            }
             if(!preg_match("/^[A-Za-z0-9]*$/", $villeNU)){
              echo "<p> Votre ville doit contenire que des chiffres et des lettres<p>";
            }
             if(!preg_match("/^[A-Za-z0-9]*$/", $loginNU)){
              echo "<p> Votre login doit contenire que des chiffres et des lettres<p>";
            }
             if(!preg_match("/^[A-Za-z0-9]*$/", $banque_idNU)){
              echo "<p> Votre banque ID doit contenire que des chiffres et des lettres<p>";
            }
           $pw=password_hash($pw,PASSWORD_DEFAULT);

        

          
           
            
            

         try {
            
            $statement = $db->prepare('INSERT INTO utilisateur (user_id, nom , prenom, adresse,ville, codePostal,login, password, banque_id) VALUES (?,?, ?, ?, ?,?, ?,?,? )');
            $statement->execute(array($user_id, $nomNU, $prenomNU,  $adresseNU, $villeNU, $codePostalNU, $loginNU, $pw,$banque_idNU));
            echo "<p>Ajout de l'utilisateur avec succe<p>";
   
         } catch (Exception $e) {
             $error=$statement->errorInfo();
            print_r($error);
             
  //        }   
           
    }
    }

}



if (isset($_POST['submit1'])) {
      if (empty($_POST['nameNU1'])) {
        
            echo "<p><label class='text-danger'> Entrez le nom du nouveau utilisateur Svp </label></p>";
        
        }
        if (empty($_POST['prenomNU1'])) {
        
            echo "<p><label class='text-danger'> Entrez le prenom du nouveau utilisateur Svp </label></p>";
        
        }
        if (!empty($_POST['nameNU1']) AND !empty($_POST['prenomNU1'])){



            $name =$_POST['nameNU1'];
            $prenom =$_POST['prenomNU1'];
               

              $req = $db->prepare('SELECT user_id, nom, prenom,adresse,ville,codepostal FROM utilisateur
              WHERE utilisateur.nom=?
              AND utilisateur.prenom=? ;');
              $req->execute(array($name, $prenom));

            // on parcours la base de donne a la recherche des element voulus

            while ($donnees = $req->fetch()){
              echo '<p> User ID : '.$donnees['user_id']. '</p>';
                 echo '<p> Nom : '.$donnees['nom']. '</p>';
               
               echo '<p> Prenom : '.$donnees['prenom']. '</p>';
               echo '<p>  Adresse : '.$donnees['adresse']. '</p>';
               echo '<p> Ville : '.$donnees['ville']. '</p>';
               echo '<p> Code Postal : '.$donnees['codepostal']. '</p>';
         
            }
                # code...
                // on parcours la table utilisateur 
     
        }
    }




if (isset($_POST['submit2'])) {
      if (empty($_POST['name'])) {
        
            echo "<p><label class='text-danger'> Entrez le nom du nouveau utilisateur Svp </label></p>";
        
        }
        if (empty($_POST['prenom'])) {
        
            echo "<p><label class='text-danger'> Entrez le prenom du nouveau utilisateur Svp </label></p>";
        
        }
        if (!empty($_POST['nameNU1']) AND !empty($_POST['prenomNU1'])){



            $name =$_POST['nameNU1'];
            $prenom =$_POST['prenomNU1'];
               

              $req = $db->prepare('SELECT user_id, nom, prenom,adresse,ville,codepostal FROM utilisateur
              WHERE utilisateur.nom=?
              AND utilisateur.prenom=? ;');
              $req->execute(array($name, $prenom));

            // on parcours la base de donne a la recherche des element voulus

            while ($donnees = $req->fetch()){
              echo '<p> User ID : '.$donnees['user_id']. '</p>';
                 echo '<p> Nom : '.$donnees['nom']. '</p>';
               
               echo '<p> Prenom : '.$donnees['prenom']. '</p>';
               echo '<p>  Adresse : '.$donnees['adresse']. '</p>';
               echo '<p> Ville : '.$donnees['ville']. '</p>';
               echo '<p> Code Postal : '.$donnees['codepostal']. '</p>';
         
            }
                # code...
                // on parcours la table utilisateur 
     
        }
    }
    if (isset($_POST['submit2'])) {
      if (empty($_POST['name3'])) {
        
            echo "<p><label class='text-danger'> Entrez le nom du nouveau utilisateur Svp </label></p>";
        
        }
        if (empty($_POST['prenom'])) {
        
            echo "<p><label class='text-danger'> Entrez le prenom du nouveau utilisateur Svp </label></p>";
        
        }
        if (!empty($_POST['name3']) AND !empty($_POST['prenom3'])){



            $name =$_POST['name3'];
            $prenom =$_POST['prenom3'];
            $adresse=$_POST['newadr'];
            $sql = "UPDATE utilisateur SET prenom =?, WHERE nom=?";
          $db->prepare($sql)->execute([$adresse,$name ]);
               

           

     
        }
    }

   if (isset($_POST['submit3'])) {
      if (empty($_POST['name4'])) {
        
            echo "<p><label class='text-danger'> Entrez le nom du nouveau utilisateur Svp </label></p>";
        
        }
        if (empty($_POST['prenom4'])) {
        
            echo "<p><label class='text-danger'> Entrez le prenom du nouveau utilisateur Svp </label></p>";
        
        }
        if (!empty($_POST['name4']) AND !empty($_POST['prenom4'])){



            $name =$_POST['name4'];
            $prenom =$_POST['prenom4'];
               

              $req = $db->prepare('DELETE FROM utilisateur
                                      
                                      WHERE nom=?
                                      AND prenom =?;');

             
              $req->execute(array( $name, $prenom));
              echo "marche";
            }
          }

  }
    else {
      header('refresh:0;url=index.html');
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

    <?php
    if (isset($_SESSION['login']) AND isset($_SESSION['login'])) {

       echo "<h3> Données personnelles de l'admin:</h3>";
    echo "<ul>";

    while ($donnees = $req->fetch()){
        echo '<li> Votre Identifiant : '. $donnees['conseiller_id'] .'.</li>';
        echo ' <li> Votre nom : '. $donnees['nom'] .' .</li>';
        echo '<li> Votre prenom : '. $donnees['prenom'] .'.</li>';
        echo '<li>  Votre telephone : '.$donnees['telephone'] .'.</li>';
        echo '<li>  Votre Login : '.$donnees['login'] .'.</li>';
        echo '<li>  Votre Identifiant de vote banque : '.$donnees['banque_id'] .'.</li>';
    }
    echo '</ul>';


  }
  
    ?>


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



                              <p> Ajouter utilisateur</p>
                              <p> </p>

                              <form method="post" action="userdonne.php">
                                <fieldset>
                                      <legend>Formulaire d'ajout d'utilisateur</legend>
                                 <div>
                                      <label for="nameNU">Nom utilisateur:</label>
                                      <input type="text" id="nameNU" name="nameNU">
                                  </div>
                                  <div>
                                      <label for="user_id">User ID:</label>
                                      <input type="text" id="user_id" name="user_id">
                                  </div>
                                  <div>
                                      <label for="prenomNU">Prenom Utilisateur :</label>
                                      <input type="text" id="prenomNU" name="prenomNU">
                                  </div>
                                  <div>
                                      <label for="adresseNU">Adresse Utilisateur :</label>
                                      <input type="text" id="adresseNU" name="adresseNU">
                                  </div>
                                    <div>
                                      <label for="ville">Ville :</label>
                                      <input type="text" id="ville" name="ville">
                                  </div>
                                    <div>
                                      <label for="codePostal">Code postal :</label>
                                      <input type="text" id="codePostal" name="codePostal">
                                  </div>
                                  <div>
                                      <label for="loginNU">Login :</label>
                                      <input type="text" id="loginNU" name="loginNU"></textarea>
                                  </div>
                                    <div>
                                      <label for="banque_id">Banque ID</label>
                                      <input type="text" id="banque_id" name="banque_id"></textarea>
                                  </div>
                                  <div>
                                      <label for="pwNU">Mot de passe</label>
                                      <input type="password" id="pwNU" name="pwNU"></textarea>
                                  </div>
                                      <button type="submit" name="submit" >Insérer</button>
                                      </fieldset>
                              </form>






                              <h2>Recherche un utilisateur</h2>


                              <form method="post" action="userdonne.php">
                                <fieldset>
                                      <legend>En utilisant nom, prenom</legend>
                                 <div>
                                      <label for="nameNU1">Nom utilisateur:</label>
                                      <input type="text" id="nameNU1" name="nameNU1">
                                  </div>
                                  <div>
                                      <label for="prenomNU1">Prenom Utilisateur :</label>
                                      <input type="text" id="prenomNU1" name="prenomNU1">
                                  </div>
                                  <button type="submit" name="submit1" >Envoyer</button>
                                </fieldset>
                              </form>



                              <form>
                                <fieldset>
                                      <legend>Mettre a jour un utilisateur</legend>
                                 <div>
                                      <label for="name3">Nom utilisateur:</label>
                                      <input type="text" id="name3" name="name3">
                                  </div>
                                  <div>
                                      <label for="prenomNU1">Prenom Utilisateur :</label>
                                      <input type="text" id="prenom3" name="prenom3">
                                  </div>
                                  <div>
                                      <label for="newadr">Nouvelle adresse :</label>
                                      <input type="text" id="newadr" name="newadr">
                                  </div>
                                  <button type="submit" name="submit2" >Envoyer</button>
                                </fieldset>
                              </form>
                              <form>
                                <fieldset>
                                      <legend>Supprimer utilisateur</legend>
                                 <div>
                                      <label for="name4">Nom utilisateur:</label>
                                      <input type="text" id="name4" name="name4">
                                  </div>
                                  <div>
                                      <label for="prenom4">Prenom Utilisateur :</label>
                                      <input type="text" id="prenom4" name="prenom4">
                                  </div>
                                  <button type="submit" name="submit3" >Envoyer</button>
                                </fieldset>
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
    <!--/ service_area  -->
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
