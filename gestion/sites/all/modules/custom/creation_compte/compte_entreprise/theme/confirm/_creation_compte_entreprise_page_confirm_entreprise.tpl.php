<fieldset class="form-wrapper" id="edit-company">
  <div class="fieldset-title">L'ENTREPRISE</div>
  <div class="fieldset-wrapper">

    <?php
    print theme_table(array(
        'header' => array('Entreprise', 'Activité' , 'Adefim'),
        'rows' => print_entreprise_confirmation_data($form_creation_compte),
        'sticky' => false,
        'attributes' => array(),
        'caption' => '',
        'colgroups' => array(),
        'empty' => null
    ));
    ?>
  </div>
</fieldset>