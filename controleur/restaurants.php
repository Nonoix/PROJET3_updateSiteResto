<?php
use modele\dao\Bdd;
use modele\dao\RestoDAO;

/**
 * Contrôleur restaurents
 * Page pour gérer les restaurants
 * 
 * Vue contrôlée : vueRestaurants
 * 
 * @version 07/2021 intégration couche modèle objet
 * @version 08/2021 gestion erreurs
 */


Bdd::connecter();

// Récupération des données utilisées dans la vue 
// creation du menu burger
$menuBurger = array();
$menuBurger[] = Array("url"=>"./?action=utilisateurs","label"=>"Gérer les utilisateurs");
$menuBurger[] = Array("url"=>"./?action=restaurants","label"=>"Gérer les restaurants");
$menuBurger[] = Array("url"=>"./?action=typesCuisine","label"=>"Gérer les types de cuisine");

$listeRestos = RestoDAO::getAll();

$titre = "Gérer les restaurants";

require_once "$racine/vue/entete.html.php";
require_once "$racine/vue/vueRestaurants.php";
require_once "$racine/vue/pied.html.php";
?>