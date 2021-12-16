<?php

use modele\dao\Bdd;
use modele\dao\RestoDAO;
use model\metier\Resto;
/**
 * Contrôleur editRestautrants
 * Page d'affichage des caractéristiques d'un utilisateur
 *
 * Vues contrôlées : vueUpdProfil, vueAuthentification.php
 *
 * @version 07/2021 intégration couche modèle objet
 * @version 08/2021 gestion erreurs
 */
Bdd::connecter();

if ($GLOBALS['isLoggedAsAdmin']) {
    $ajoutReussie = false;   // booléen indiquant s'il faut afficher le formulaire ou bien confirmer l'inscription
// Données à transmettre à la vue
    $titre = "Modification restaurant";                    // titre de la vue
// creation du menu burger
    $menuBurger = array();
    $menuBurger[] = Array("url"=>"./?action=utilisateurs","label"=>"Gérer les utilisateurs");
    $menuBurger[] = Array("url"=>"./?action=restaurants","label"=>"Gérer les restaurants");
    $menuBurger[] = Array("url"=>"./?action=typesCuisine","label"=>"Gérer les types de cuisine");

// Récupération des données GET, POST, et SESSION
if(isset($_POST["nomR"]) && isset($_POST["numAdr"]) && isset($_POST["voieAdr"]) && isset($_POST["cpR"]) && isset($_POST["villeR"]) && isset($_POST["latitudeDegR"]) && isset($_POST["longitudeDegR"]) && isset($_POST["descR"]) && isset($_POST["horairesR"])) {
    // Si la saisie a été effectuée
    if ($_POST["nomR"] != "" && $_POST["numAdr"] != "" && $_POST["voieAdr"] != "" && $_POST["cpR"] != "" && $_POST["villeR"] != "" && $_POST["descR"]/* != "" && $_POST["horairesR"] != "" && $_POST["photoR"] != ""*/) {
        // Si tous les champs sont renseignés
        $nomR = $_POST["nomR"];
        $numAdr = $_POST["numAdr"];
        $voieAdr = $_POST["voieAdr"];
        $cpR = $_POST["cpR"];
        $villeR = $_POST["villeR"];
        $descR = $_POST["descR"];
        $horairesR = NULL;
        $latitudeDegR = NULL;
        $longitudeDegR = NULL;
        //$photoR = $_POST["photoR"];
        $addLstidTC = array();
        $delLstidTC = array();

        if(isset($_POST["addListTC"])) {
            $addLstidTC = $_POST["addListTC"];
        }

        if(isset($_POST["delListTC"])) {
            $delLstidTC = $_POST["addListTC"];
        }

        if($_POST["horairesR"] != "") {
            $horairesR = $_POST["horairesR"];
        }

        if($_POST["latitudeDegR"] != "") {
            $latitudeDegR = $_POST["latitudeDegR"];
        }

        if($_POST["longitudeDegR"] != "") {
            $longitudeDegR = $_POST["longitudeDegR"];
        }

        $resto = new Resto($_GET["idR"], $nomR, $numAdr, $voieAdr, $cpR, $villeR, $latitudeDegR, $longitudeDegR, $descR, $horairesR);
        $ret = RestoDAO::updateResto($resto);

        if($ret) {
            $ajoutReussie = true;
        } else {
            ajouterMessage("Le resto n'a pas pu être mis à jour !");
        }
    } else {
        ajouterMessage("Renseigner tous les champs...");
    }
}

// Construction de la vue
    if ($ajoutReussie) {
        header('Location: ./?action=restaurants');
    } else {
        // Première demande ou bien erreurs dans le formulaire
        require_once "$racine/vue/entete.html.php";
        require_once "$racine/vue/vueEditRestaurant.php";
        require_once "$racine/vue/pied.html.php";
    }
} else {
    echo "Vous n'êtes pas un compte administrateur ...";
}
?>

