<!-- <h3> -->
<!--   Mon compte : -->
<!-- </h3> -->
<div id="mon-compte" class="padding15">
  <div id="info-user" class="fieldset">
    <div class="row">
      <div class="col-md-12">
        <h5>Mon compte</h5>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        Civilité : <?php print $user_infos->civilite_label;?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        Nom : <?php print $user_infos->last_name;?>
      </div>
      <div class="col-md-6">
        Prénom : <?php print $user_infos->first_name;?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        Courriel : <?php print $user_infos->mail;?>
      </div>
      <div class="col-md-6">
        Fonction : <?php print $user_infos->fonction_label;?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        Téléphone : <?php print $user_infos->telephone;?>
      </div>
    </div>
  </div>

  <br />

<!--   <div id="mot-de-passe" class="fieldset"> -->
<!--     <div class="row"> -->
<!--       <div class="col-md-12"> -->
<!--         <h5>Modifier mon mot de passe</h5> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->

  <div id="fonctionnalites" class="fieldset">
    <div class="row">
      <div class="col-md-12">
        <h5>Fonctionnalités</h5>
        <?php foreach ($habilitations as $key => $habilitation): ?>
          <?php if (array_key_exists($key, $user_habilitations)): ?>
            <?php print '<div class="view-checkbox-value view-checked">' . $habilitation . '</div>'?>
          <?php else: ?>
            <?php print '<div class="view-checkbox-value view-not-checked">' . $habilitation . '</div>'?>
          <?php endif; ?>
        <?php endforeach;?>
      </div>
    </div>
  </div>

  <br />

  <div id="perimetre" class="fieldset">
    <div class="row">
      <div class="col-md-12">
        <h5>Mon périmètre (établissements)</h5>
      </div>
      <?php
        $header = array('Etablissements', 'ADEFIM', 'Statuts');
        print theme('table',
          array(
              'header' => $header,
              'rows' => $table_rows,
              'sticky' => false
        ));
      ?>
    </div>
  </div>

  <div id="bouton-action">
    <?php print l('Modifier', '/mon-compte/modifier', array('attributes' => array('class' => 'modifier-mon-compte')));?>
  </div>

</div>

