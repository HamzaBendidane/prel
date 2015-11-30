<form id="<?php print $form['#id']; ?>" accept-charset="UTF-8"
  method="<?php print $form['#method']; ?>"
  action="<?php print $form['#action']; ?>">
    <div class="padding15">
<?php

  print theme('administration_utilisateurs_common_page_info_perso_theme', $variables);
  print '<br />';
?>
  <div id="mot-de-passe" class="fieldset">
    <div class="row">
      <div class="col-md-12">
        <h5>Modifier mon mot de passe</h5>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <?php print drupal_render($form['utilisateur']['utilisateur_password']); ?>
      </div>
      <div class="col-md-6 condition-password-infos">
        Le mot de passe doit être composé de 8 caractères minimum dont au moins une lettre majuscule, 
        une lettre miniscule, un chiffre et un caractère spécial
      </div>
      
    </div>
  </div>

  <br />

<?php
  print theme('administration_utilisateurs_common_page_fonctionnalite_theme', $variables);
  print '<br />';
  print theme('administration_utilisateurs_common_page_etablissement_theme', $variables);

?>
<div id="bouton-action">
<?php
  print drupal_render($form['bouton']['modifier']);
?>
</div>

<?php
  print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id'));
 ?>
    </div>
    <div id="boutonAction" class="row">
    <?php
        print drupal_render($form['bouton']['back']);
    ?>
    </div>

</form>
