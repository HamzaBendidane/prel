<fieldset class="form-wrapper" id="edit-company">
  <div class="fieldset-title">L'ENTREPRISE</div>
  <div class="fieldset-wrapper">
    <div class="company-infos company-infos-0">
      <div class="row">
        <div class="col-md-6 required">
          <?php print drupal_render($form_creation_compte['company']['siret']['0']); ?>
        </div>
        <div class="col-md-6 required">
          <?php print drupal_render($form_creation_compte['company']['raison_sociale']['0']); ?>
        </div>
      </div>
      <div class="row">
        <div class="row col-md-6 left-part-form">
          <div class="required">
            <?php
              print shared_form_input_coller_serrer($form_creation_compte['company']['code_nace']['0'],
                  $form_creation_compte['company']['libelle_nace']['0']);
              print drupal_render($form_creation_compte['company']['id_nace']['0']);
            ?>
          </div>
          <div class="required">
            <?php
              print shared_form_input_coller_serrer($form_creation_compte['company']['code_filiere']['0'],
                  $form_creation_compte['company']['libelle_filiere']['0']);
              print drupal_render($form_creation_compte['company']['id_filiere']['0']);
            ?>
          </div>
          <div>
            <?php
              print shared_form_input_coller_serrer($form_creation_compte['company']['code_filiere2']['0'],
                  $form_creation_compte['company']['libelle_filiere2']['0']);
              print drupal_render($form_creation_compte['company']['id_filiere2']['0']);
            ?>
          </div>
        </div>
        <div class="row col-md-6 right-part-form">
          <div class="required">
            <?php
              print drupal_render($form_creation_compte['company']['adresse'][0]);
            ?>
          </div>
          <div>
          <?php print drupal_render($form_creation_compte['company']['complement_adresse']['0']); ?>
          </div>
          <div>
          <?php print drupal_render($form_creation_compte['company']['complement_adresse_2']['0']); ?>
          </div>
          <div class="required">
            <?php
              print shared_form_input_coller_serrer($form_creation_compte['company']['code_postal']['0'],
                $form_creation_compte['company']['ville']['0']);
            ?>
          </div>
        </div>
      </div>
    </div>
    <?php
      print drupal_render($form_creation_compte['company']['demande_multi_siret']);
    ?>

    <div id="autreSiret">
      <?php if ($form_creation_compte['company']['nb_siret']['#value'] >=1 ) { ?>
        <?php for ($i = 1; $i < $form_creation_compte['company']['nb_siret']['#value']; $i++) { ?>
          <div class="company-infos company-infos-<?php $i ?>">
            <div class="row">
              <div class="col-md-6 required">
                <?php print drupal_render($form_creation_compte['company']['siret'][$i]); ?>
              </div>
              <div class="col-md-6 required">
                <?php print drupal_render($form_creation_compte['company']['raison_sociale'][$i]); ?>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 required">
                <?php
                  print shared_form_input_coller_serrer($form_creation_compte['company']['code_nace'][$i],
                      $form_creation_compte['company']['libelle_nace'][$i]);
                  print drupal_render($form_creation_compte['company']['id_nace'][$i]);
                ?>
              </div>
              <div class="col-md-6 required">
                  <?php print drupal_render($form_creation_compte['company']['adresse'][$i]); ?>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 required">
                  <?php
                  print shared_form_input_coller_serrer($form_creation_compte['company']['code_filiere'][$i],
                      $form_creation_compte['company']['libelle_filiere'][$i]);
                  print drupal_render($form_creation_compte['company']['id_filiere'][$i]);
                  ?>
              </div>
              <div class="col-md-6">
                <?php print drupal_render($form_creation_compte['company']['complement_adresse'][$i]); ?>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                  <?php
                  print shared_form_input_coller_serrer($form_creation_compte['company']['code_filiere2'][$i],
                      $form_creation_compte['company']['libelle_filiere2'][$i]);
                  print drupal_render($form_creation_compte['company']['id_filiere2'][$i]);
                  ?>
              </div>
              <div class="col-md-6">
                <?php print drupal_render($form_creation_compte['company']['complement_adresse_2'][$i]); ?>

              </div>
            </div>
            <div class="row">
              <div class="col-md-6"></div>
              <div class="col-md-offset-6 col-md-6 required">
                <?php print shared_form_input_coller_serrer($form_creation_compte['company']['code_postal'][$i],
                  $form_creation_compte['company']['ville'][$i]); ?>
              </div>
            </div>
          </div>
      <?php } ?>
    <?php } ?>
    </div>

    <?php print drupal_render($form_creation_compte['company']['ajout_siret']); ?>

  </div>
</fieldset>