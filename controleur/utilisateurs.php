<?php

use modele\dao\Bdd;
use modele\dao\UtilisateurDAO;

/**
 * Contrôleur utilisateurs
 * Page pour gérer les utilisateurs
 * 
 * Vue contrôlée : vueUtilisateurs
 * 
 * @version 07/2021 intégration couche modèle objet
 * @version 08/2021 gestion erreurs
 */
Bdd::connecter();

if ($GLOBALS['isLoggedAsAdmin']) {

// Récupération des données utilisées dans la vue 
// creation du menu burger
$menuBurger = array();
$menuBurger[] = Array("url" => "./?action=utilisateurs", "label" => "Gérer les utilisateurs");
$menuBurger[] = Array("url" => "./?action=restaurants", "label" => "Gérer les restaurants");
$menuBurger[] = Array("url" => "./?action=typesCuisine", "label" => "Gérer les types de cuisine");

// appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
$listeUser = UtilisateurDAO::getAll();

$titre = "Gérer les utilisateurs";


require_once "$racine/vue/entete.html.php";
require_once "$racine/vue/vueUtilisateurs.php";
require_once "$racine/vue/pied.html.php";
} else {
    echo "Vous n'êtes pas un compte administrateur ...";
}
?>
