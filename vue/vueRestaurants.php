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
<h1>Gérer les restaurants</h1>

<table class="user">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Numéro</th>
        <th>Voie</th>
        <th>Code postal</th>
        <th>Ville</th>
        <th>Latitude</th>
        <th>Longitude</th>
        <th>Description</th>
        <th>Horaires</th>
    </tr>
    
    <?php
    foreach($listeRestos as $unResto){
        ?>
        <tr>
            <td><?= $unResto->getIdR() ?></td>
            <td><?= $unResto->getNomR() ?></td>
            <td><?= $unResto->getNumAdr() ?></td>
            <td><?= $unResto->getVoieAdr() ?></td>
            <td><?= $unResto->getCpR() ?></td>
            <td><?= $unResto->getVilleR() ?></td>
            <?php $LatitudeVerif = $unResto->getLatitudeDegR();
            if ( $LatitudeVerif == null){
                $LatitudeDegR = "NULL";
            } else {
                $LatitudeDegR = $LatitudeVerif;
            }
            ?>
            <td><?= $LatitudeDegR ?></td>
            <?php $LongitudeVerif = $unResto->getLongitudeDegR();
            if ( $LongitudeVerif == null){
                $LongitudeDegR = "NULL";
            } else {
                $LongitudeDegR = $LongitudeVerif;
            }
            ?>
            <td><?= $LongitudeDegR ?></td>
            <td><?= $unResto->getDescR() ?></td>
            <td><?= $unResto->getHorairesR() ?></td>
            <td><button name="user">Modifier</button>
            <script language = 'javascript'>
            function confirmer() {
                return confirm("Êtes-vous sûr de vouloir supprimer ?");
            }
        </script>
        <form action="./?action=supprimerRestaurants&idR=<?= $unResto->getIdR() ?>" method="post" name="suppressionResto">
            <button value="Supprimer" onclick="return confirmer();">Supprimer</button></td>
        </form>
        </tr>
    <?php
    }
    ?>
</table>
<button name="user">Ajouter</button>