<?php
use modele\dao\TypeCuisineDAO;
$lesAutresTypesCuisine = TypeCuisineDAO::getAll();
?><h1>Ajouter un restaurant</h1>
<br>
<h3>* Obligatoire</h3>
<br>
<form action="./?action=ajoutRestaurants" method="POST">

    <p>Nom : *</font></p>
    <input type="text" name="nomR" placeholder="Nom" /><br />

    <p>Numéro de rue : *</p>
    <input type="text" name="numAdr" placeholder="Numéro rue"  /><br />

    <p>Voie de la rue : *</p>
    <input type="text" name="voieAdr" placeholder="Voie rue" /><br />

    <p>Code postal : *</p>
    <input type="text" maxlength="5" name="cpR" placeholder="Code postal" /><br />

    <p>Ville : *</p>
    <input type="text" name="villeR" placeholder="Ville" /><br />

    <p>Latitude :</p>
    <input type="text" name="latitudeDegR" placeholder="Latitude" /><br />

    <p>Longitude :</p>
    <input type="text" name="longitudeDegR" placeholder="Longitude" /><br />

    <p>Description : *</p>
    <input type="text" name="descR" placeholder="Description" /><br />

    <br />
    <br />

    Choisir d'autres types de cuisine : <br />
    <ul id="tagFood">
        <?php
        for ($i = 0; $i < count($lesAutresTypesCuisine); $i++) {
            $unTC = $lesAutresTypesCuisine[$i];
            ?>
            <input type="checkbox" name="addLstidTC[]" id="addType<?= $i ?>" value="<?= $unTC->getIdTC() ?>" >
            <label for="addType<?= $i ?>"><li class="tag"><span class="tag">#</span><?= $unTC->getLibelleTC() ?></li></label><br />
        <?php } ?>
    </ul>
    <br />
    <br />

    <input type="submit" value="Ajouter" />
</form>