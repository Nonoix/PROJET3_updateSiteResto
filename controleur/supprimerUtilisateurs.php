<?php
use modele\dao\Bdd;
use modele\dao\UtilisateurDAO;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Bdd::connecter();

$titre = "Gérer les utilisateurs";

$listeUser = UtilisateurDAO::getAll();

if(!isset($_GET["idU"])) {
    ajouterMessage("Utilisateur : il faut fournir un identifiant d'utilisateur");
    $titre = "erreur";
    require_once "$racine/vue/entete.html.php";
    require_once "$racine/vue/pied.html.php";
} else {
    $idU = intval($_GET["idU"]);
    UtilisateurDAO::deleteUser($idU);    
    header('Location: http://localhost/phpprojectresto2021/?action=utilisateurs');
}


require_once "$racine/vue/entete.html.php";
require_once "$racine/vue/vueUtilisateurs.php";
require_once "$racine/vue/pied.html.php";
?>