<fieldset class="form-wrapper demi-col" id="edit-utilisateur">
  <div class="fieldset-title">L'UTILISATEUR</div>
  <div class="fieldset-wrapper">
    <div class="row">
      <div class="col-md-12 inline-content">
        <?php print shared_form_view_select_compte($form_creation_compte['utilisateur']['utilisateur_titre']); ?>
        <?php print shared_form_view_input_compte($form_creation_compte['utilisateur']['utilisateur_nom']); ?>
        <?php print shared_form_view_input_compte($form_creation_compte['utilisateur']['utilisateur_prenom']); ?>
        <br/>
        <?php print shared_form_view_select_compte($form_creation_compte['utilisateur']['utilisateur_fonction']); ?>
        <br/>
        <?php print shared_form_view_input_compte($form_creation_compte['utilisateur']['utilisateur_email']); ?>
        <br/>
        <?php print shared_form_view_input_compte($form_creation_compte['utilisateur']['utilisateur_telephone']); ?>
      </div>
    </div>
  </div>
</fieldset>
<fieldset class="form-wrapper" id="edit-utilisateur-fonction">
  <div class="fieldset-wrapper">
    <div class="row">
      <div class="col-md-6">
        <?php print shared_form_view_checkboxes_compte($form_creation_compte['utilisateur']['utilisateur_fonctions']); ?>
      </div>
    </div>
  </div>
</fieldset>