<?php
use modele\dao\Bdd;
use modele\dao\TypeCuisineDAO;

/**
 * Contrôleur typesCuisines
 * Page pour gérer les types de cuisines
 * 
 * Vue contrôlée : vueTypesCuisines
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

$listeTypeCuisine = TypeCuisineDAO::getAll();

$titre = "Gérer les types de cuisine";

require_once "$racine/vue/entete.html.php";
require_once "$racine/vue/vueTypesCuisine.php";
require_once "$racine/vue/pied.html.php";
?>