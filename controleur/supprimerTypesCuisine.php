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

if ($GLOBALS['isLoggedAsAdmin']) {
// Récupération des données utilisées dans la vue 
// creation du menu burger
$menuBurger = array();
$menuBurger[] = Array("url"=>"./?action=utilisateurs","label"=>"Gérer les utilisateurs");
$menuBurger[] = Array("url"=>"./?action=restaurants","label"=>"Gérer les restaurants");
$menuBurger[] = Array("url"=>"./?action=typesCuisine","label"=>"Gérer les types de cuisine");

$listeTypeCuisine = TypeCuisineDAO::getAll();

$titre = "Gérer les types de cuisine";

if(!isset($_GET["idTC"])) {
    ajouterMessage("Types Cuisine : il faut fournir un identifiant de type de cuisine");
    $titre = "erreur";
    require_once "$racine/vue/entete.html.php";
    require_once "$racine/vue/pied.html.php";
} else {
    $idTC = intval($_GET["idTC"]);
    TypeCuisineDAO::deleteTypeCuisine($idTC);
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}

require_once "$racine/vue/entete.html.php";
require_once "$racine/vue/vueTypesCuisine.php";
require_once "$racine/vue/pied.html.php";
} else {
    echo "Vous n'êtes pas un compte administrateur ...";
}
?>