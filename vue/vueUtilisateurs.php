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
<h1>Gérer les utilisateurs</h1>

<table class="user">
    <tr>
        <th>ID</th>
        <th>Mail</th>
        <th>Pseudo</th>
        <th>Admin</th>
        <th></th>
    </tr>

    <?php
    foreach ($listeUser as $unUser) {
        ?>
        <tr>
            <td><?= $unUser->getIdU() ?></td>
            <td><?= $unUser->getMailU() ?></td>
            <td><?= $unUser->getPseudoU() ?></td>
            <?php
            $adminVerif = $unUser->getAdminU();
            if ($adminVerif == true) {
                $adminU = "Oui";
            } else {
                $adminU = "Non";
            }
            ?>
            <td><?= $adminU ?></td>
        <script language = 'javascript'>
            function confirmer() {
                return confirm("Êtes-vous sûr de vouloir supprimer ?");
            }
        </script>
        <form action="./?action=supprimerUtilisateurs&idU=<?= $unUser->getIdU() ?>" method="post" name="suppressionUtil">
            <td> <button value="Supprimer" onclick="return confirmer();">Supprimer</button></td>
        </form> 


    </tr>
    <?php
}
?>
</table>