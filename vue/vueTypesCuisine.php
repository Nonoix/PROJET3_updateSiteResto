<?php
/**
 * --------------
 * vueUtilisateurs
 * --------------
 * 
 * @version 07/2021 par NB : intégration couche modèle objet
 * 
 * Variables transmises par le contrôleur detailResto contenant les données à afficher : 
  ---------------------------------------------------------------------------------------- */
/** @var Utilisateur  $util utilisteur à afficher */
?>
<h1>Gérer les types de cuisine</h1>

<table class="user">
    <tr>
        <th>ID</th>
        <th>Libelle</th>
    </tr>
    
    <?php
    foreach($listeTypeCuisine as $unTypeCuisine){
        ?>
        <tr>
            <th><?= $unTypeCuisine->getIdTC() ?></th>
            <th><?= $unTypeCuisine->getLibelleTC() ?></th>
            <script language = 'javascript'>
            function confirmer() {
                return confirm("Êtes-vous sûr de vouloir supprimer ?");
            }
        </script>
        <form action="./?action=supprimerTypesCuisine&idTC=<?= $unTypeCuisine->getIdTC() ?>" method="post" name="suppressionTypesCuisine">
            <td> <button value="Supprimer" onclick="return confirmer();">Supprimer</button></td>
        </form> 
        </tr>
    <?php
    }
    ?>
</table>
<button name="user">Ajouter</button>