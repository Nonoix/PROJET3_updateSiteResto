<?php
?><h1>Ajouter un type de cuisine</h1>
<br>
<h3>* Obligatoire</h3>
<br>
<form action="./?action=ajoutTypeCuisine" method="POST">

    <p>Nom du type de cuisine : *</p>
    <input type="text" name="libelleTC" placeholder="Nom du type cuisine"  /><br />

    <br />
    <br />

    <input type="submit" value="Ajouter" />
</form>