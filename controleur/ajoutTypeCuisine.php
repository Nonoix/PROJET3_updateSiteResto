<?php
use modele\dao\Bdd;

/**
 * Contrôleur ajout type cuisine
 * Page pour gérer les restaurants
 *
 * Vue contrôlée : vueRestaurants
 *
 * @version 07/2021 intégration couche modèle objet
 * @version 08/2021 gestion erreurs
 */


Bdd::connecter();

if ($GLOBALS['isLoggedAsAdmin']) {

    $ajoutReussie = false;   // booléen indiquant s'il faut afficher le formulaire ou bien confirmer l'inscription
// Données à transmettre à la vue
    $titre = "Ajout type cuisine";                    // titre de la vue
    // creation du menu burger
    $menuBurger = array();
    $menuBurger[] = Array("url"=>"./?action=utilisateurs","label"=>"Gérer les utilisateurs");
    $menuBurger[] = Array("url"=>"./?action=restaurants","label"=>"Gérer les restaurants");
    $menuBurger[] = Array("url"=>"./?action=typesCuisine","label"=>"Gérer les types de cuisine");


// Récupération des données GET, POST, et SESSION
    if(isset($_POST["libelleTC"])) {
        // Si la saisie a été effectuée
        if ($_POST["libelleTC"] != "" ) {
            // Si tous les champs sont renseignés
            $libelleTC = $_POST["libelleTC"];

            // Enregistrement des donnees dans la base de données
            $TC = new \modele\metier\TypeCuisine(0, $libelleTC);
            $ret = \modele\dao\TypeCuisineDAO::addTypeCuisine($TC);

            if($ret) {
                $ajoutReussie = true;
            } else {
                ajouterMessage("Ajout : le type cuisine n'a pas pu être ajouté.");
            }
        } else {
            ajouterMessage("Ajout : renseigner tous les champs...");
        }
    }

// Construction de la vue
    if($ajoutReussie) {
        header('Location: ./?action=typesCuisine');
    } else {
        // Première demande ou bien erreurs dans le formulaire
        require_once "$racine/vue/entete.html.php";
        require_once "$racine/vue/vueAjoutTypeCuisine.php";
        require_once "$racine/vue/pied.html.php";
    }
} else {
    echo "Vous n'êtes pas un compte administrateur ...";
}
?>


