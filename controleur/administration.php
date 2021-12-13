<?php
use modele\dao\Bdd;

/**
 * Contrôleur administration
 * Page pour gérer les données du site
 * 
 * Vue contrôlée : vueAdministration
 * 
 * @version 07/2021 intégration couche modèle objet
 * @version 08/2021 gestion erreurs
 */


Bdd::connecter();

if ($GLOBALS['isLoggedAsAdmin']) {
    
// Récupération des données utilisées dans la vue 
// creation du menu burger
$menuBurger = array();
$menuBurger[] = Array("url"=>"./?action=utilisateurs","label"=>"Gérer les utilisateurs");
$menuBurger[] = Array("url"=>"./?action=restaurants","label"=>"Gérer les restaurants");
$menuBurger[] = Array("url"=>"./?action=typesCuisine","label"=>"Gérer les types de cuisine");

$titre = "Administration";

require_once "$racine/vue/entete.html.php";
require_once "$racine/vue/vueAdministration.php";
require_once "$racine/vue/pied.html.php";
} else {
    echo "Vous n'êtes pas un compte administrateur ...";
}
?>