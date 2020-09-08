<?php
	session_start();
    define ('SESSION_TIMEOUT', "1800");
    OB_start();
    if (isset($_SESSION['nom']) AND isset($_SESSION['login'])) {
        # code...
    
    $nom=$_SESSION['nom'];
    $user_id=$_SESSION['user_id'];
    $login=$_SESSION['login'];	
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


    $req = $db->prepare('SELECT *
                            FROM utilisateur us , compte copt, carte car
                            WHERE us.user_id=?
                            AND us.user_id=copt.user_id
                            AND copt.account_id=car.account_id;');
	$req->execute(array($user_id));
   
}else{
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

                                    <?php
                                        if (isset($_SESSION['nom']) AND isset($_SESSION['login'])) {


                                              while ($donnees = $req->fetch()){
                                                echo "<h2>Donnees du client<h2>";
                                                echo "<ul>";

                                                echo '<li> Identifiant : '. $donnees['user_id'] .'.</li>';
                                                echo '<li>Nom : '. $donnees['nom'] .' .</li>';
                                                echo '<li>  Prenom : '. $donnees['prenom'] .'.</li>';
                                                echo '<li>   Adresse : '.$donnees['adresse'] .'.</li>';
                                                echo '<li>   Ville : '.$donnees['ville'] .'.</li>';
                                                echo '<li>   code postal : '.$donnees['codepostal'] .'.</li>';
                                                echo '<li>   login : '.$donnees['login'] .'.</li>';
                                                echo '<li>   Identifiant de banque : '.$donnees['banque_id'] .'.</li>';
                                                echo '<li>l identifiant  de votre compte : '.$donnees['account_id']     .'</li>';
                                                echo '<li> Votre IBAN  : '. $donnees['iban'] .'</li>';
                                                
                                                echo '<li> carte Id : '.$donnees['carte_id']     .'</li>';
                                                echo '<li> la date de delivrance de votre carte  : '. $donnees['date_delivrance'] .'</li>';
                                                echo '<li> la date de peremption: '. $donnees['date_peremption'] .'</li>';

                                                
                                            }
                                             echo '</ul>';

                                             //$req = $db->prepare('SELECT SELECT 

                                            //    $req = $db->prepare('SELECT 
                                            //                             SUM (quantite)
                                            //                             FROM evenement, historique, compte, utilisateur
                                            //                             WHERE utilisateur.user_id=?
                                            //                             AND historique.historique_id = evenement.historique_id

                                            //                             AND compte.account_id = historique.account_id
                                            //                             AND utilisateur.user_id=compte.user_id
                                            //                                 ;');
                                            //     $req->execute(array($user_id));
                                            //      while ($donnees = $req->fetch()){
                                            //         echo '<p> Votre nouveau solde '.$donnees['solde'].'</p>' ;
                                            //     }
                                   
                                                 $req = $db->prepare('SELECT  
                                                                        type, quantite, date_transaction, lieu
                                                                        FROM evenement, historique, compte, utilisateur
                                                                        WHERE utilisateur.user_id=?
                                                                        AND historique.historique_id = evenement.historique_id

                                                                        AND compte.account_id = historique.account_id
                                                                        AND utilisateur.user_id=compte.user_id
                                                                            ;');
                                                $req->execute(array($user_id));
                                                 while ($donnees = $req->fetch()){
                                                    echo '<p>  type de transaction'.$donnees['type'] .' : '. $donnees['quantite'].' euro. Date de la transaction '.$donnees['date_transaction'].' lieu '.$donnees['lieu'] .'</p>' ;
                                                }

                                                $req = $db->prepare('SELECT  
                                                                         SUM (quantite) AS total
                                                                        FROM evenement, historique, compte, utilisateur
                                                                        WHERE utilisateur.user_id=?
                                                                        AND historique.historique_id = evenement.historique_id

                                                                        AND compte.account_id = historique.account_id
                                                                        AND utilisateur.user_id=compte.user_id;');

                                                    $req->execute(array($user_id));
                                                 while ($donnees = $req->fetch()){
                                                    echo '<p>  Votre solde est de '.$donnees['total']. ' euro' .'</p>' ;
                                                }
                                 
                                                                       
                                                                       

                                                    
                                                    


                                         }else{
                                    header('refresh:0;url=index.html');
                                 }


    $req->closeCursor();
    ?>




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