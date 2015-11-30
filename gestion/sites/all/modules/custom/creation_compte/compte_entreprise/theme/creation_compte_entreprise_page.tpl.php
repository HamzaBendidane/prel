<div class="row createAccount center">
    <?php print render($form_creation_compte['#prefix']); ?>
</div>

<form class="<?php print $form_creation_compte['page']["#value"]; ?>" id="<?php print $form_creation_compte['#id']; ?>" accept-charset="UTF-8"
  method="<?php print $form_creation_compte['#method']; ?>"
  action="<?php print $form_creation_compte['#action']; ?>">

<?php print drupal_render($form_creation_compte['page']); ?>
<?php print drupal_render($form_creation_compte['company']['nb_siret']); ?>

<?php if ($form_creation_compte['page']['#value'] == 'formulaire'): ?>

  <?php print theme('creation_compte_entreprise_page_entreprise_theme', $variables); ?>
  <?php print theme('creation_compte_entreprise_page_responsable_theme', $variables); ?>
  <?php print theme('creation_compte_entreprise_page_utilisateur_theme', $variables); ?>

  <div id="boutonAction">
    <?php print drupal_render($form_creation_compte['back']); ?>
    <?php print drupal_render($form_creation_compte['next']); ?>
  </div>

<?php elseif ($form_creation_compte['page']['#value'] == 'confirmation'): ?>

  <?php print theme('creation_compte_entreprise_page_confirm_entreprise_theme', $variables); ?>
  <?php print theme('creation_compte_entreprise_page_confirm_responsable_theme', $variables); ?>
  <?php print theme('creation_compte_entreprise_page_confirm_utilisateur_theme', $variables); ?>
  <div id="boutonAction">
    <?php print drupal_render($form_creation_compte['back']); ?>
    <?php // print drupal_render($form_creation_compte['imprimer']); ?>
    <?php print drupal_render($form_creation_compte['confirmer']); ?>
  </div>

<?php elseif ($form_creation_compte['page']['#value'] == 'charte'): ?>
  <div id="charte" class="scroller"><?php print @CHARTE_TEXTE; ?></div>
  <div class="clearfix"></div>
  <div class="charte-bas">
    <?php print drupal_render($form_creation_compte['validate']); ?>
    <div class="required">
      <?php print drupal_render($form_creation_compte['signature']); ?>
    </div>
    <?php print @CHARTE_TEXTE_FIN; ?>
  </div>

  <div id="boutonAction">
    <?php print drupal_render($form_creation_compte['back']); ?>
    <?php print drupal_render($form_creation_compte['valider']); ?>
  </div>
<?php endif;?>


<?php
  print drupal_render_children($form_creation_compte, array('form_build_id', 'form_token', 'form_id'));
?>
</form>