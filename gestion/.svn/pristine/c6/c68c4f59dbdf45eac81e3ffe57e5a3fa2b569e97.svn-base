<h3>
  Ajout d'un utilisateur
</h3>

<form id="<?php print $form['#id']; ?>" accept-charset="UTF-8"
  method="<?php print $form['#method']; ?>"
  action="<?php print $form['#action']; ?>">
    <div class="padding15">
        <?php

  print theme('administration_utilisateurs_common_page_info_perso_theme', $variables);
  print '<br />';
  print theme('administration_utilisateurs_common_page_fonctionnalite_theme', $variables);
//   print '<br />';
//   print theme('administration_utilisateurs_modification_page_etablissement_theme', $variables);

?>
        
        <div id="bouton-action">
<?php
  print drupal_render($form['bouton']['ajouter']);
?>
</div>
        
    </div>



<?php
  print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id'));
?>
<div id="boutonAction" class="row">
<?php
    print drupal_render($form['bouton']['back']);
?>
</div>
</form>

</div>