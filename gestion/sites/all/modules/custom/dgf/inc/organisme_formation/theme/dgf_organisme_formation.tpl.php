<div class="row">

    <?php print render($organisme_formation['#prefix']); ?>
</div>
<form id="<?php print $organisme_formation['#id'] ?>"
  accept-charset="UTF-8"
  method="<?php print $organisme_formation['#method'] ?>"
  class="form-inline"
  action="<?php print $organisme_formation['#action'] ?>">
  <?php print drupal_render($organisme_formation['cerfa-step']); ?>
  <?php print drupal_render($organisme_formation['id_dgf']); ?>
  <?php print drupal_render($organisme_formation['id_dgf_organisme_formation']); ?>
  <div class="padding15">
    <!-- partie recherche de l'organisme -->
    <fieldset id="edit-title-markup">
      <legend>
        <span class="fieldset-legend">Organisme de formation</span>
      </legend>
      <div class="col-md-6 required">
          <?php print drupal_render($organisme_formation['title_markup']['siret_number']); ?>
        </div>
      <div class="row col-md-6 required">
          <?php print drupal_render($organisme_formation['title_markup']['activity_number']); ?>
        </div>
      <div class="row col-md-6 required">
          <?php print drupal_render($organisme_formation['title_markup']['corporate_name']); ?>
        </div>
    </fieldset>

    <fieldset id="view-info-generale">
      <div id= "orga-info">
        <?php
          $id_dgf = shared_security_access_user(3, 'DGF');
          $info_organisme_formation = organisme_formation_db_get_v_organisme_formation(
              $organisme_formation['id_dgf_organisme_formation']['#value']);
          $adresse_organisme_formation = organisme_formation_db_get_v_adresse_organisme_formation(
              $organisme_formation['id_dgf_organisme_formation']['#value']);

          $html_orga_infos = '';
          if ($adresse_organisme_formation) {
            $html_orga_infos = '<div class="row">';
            $html_orga_infos .= '<div class="col-md-10 adresse"><label>Adresse </label>'
                . shared_isset_trim($adresse_organisme_formation['rue'])
                . ' ' . shared_isset_trim($adresse_organisme_formation['complement_de_rue'])
                . ' ' . shared_isset_trim($adresse_organisme_formation['complement_de_rue_2'])
                . ' ' . shared_isset_trim($adresse_organisme_formation['code_postal'])
                . ' ' . shared_isset_trim($adresse_organisme_formation['ville'])
                . '</div>';

            $html_orga_infos .= '<div class="col-md-10 adresse"><label>Téléphone </label>'
              . shared_isset_trim($info_organisme_formation['telephone_principal']) . '</div>';
            $html_orga_infos .= '<div class="col-md-10 adresse"><label>Courriel </label>'
                  . shared_isset_trim($info_organisme_formation['email']) . '</div>';
            $html_orga_infos .= '<div class="col-md-10 adresse"><label id="tva-number-adresse">Numéro de TVA </label>'
              . shared_isset_trim($info_organisme_formation['tva_intracommunautaire']) . '</div>';
            $html_orga_infos .= '</div>';
          }
          print $html_orga_infos;
        ?>
      </div>
    </fieldset>

    <!-- partie information sur l'organisme -->
    <fieldset id="edit-info-generale">
      <div class="row margin-0">
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-12 padding-left-right0 required">
                <?php print drupal_render($organisme_formation['info_generale']['street_name']); ?>
            </div>
            <div class="col-md-12 padding-left-right0">
              <?php print drupal_render($organisme_formation['info_generale']['address_complement']); ?>
            </div>
              <div class="col-md-12 padding-left-right0">
                  <?php print drupal_render($organisme_formation['info_generale']['address_complement_2']); ?>
              </div>
            <div class="col-md-12 padding-left-right0 required">
              <?php print shared_form_input_coller_serrer($organisme_formation['info_generale']['zip_code'],
                    $organisme_formation['info_generale']['city']); ?>
            </div>
          </div>
        </div>
        <div class="col-md-6">
                <?php print drupal_render($organisme_formation['info_generale']['phone_number']); ?>
                <?php print drupal_render($organisme_formation['info_generale']['email']); ?>
        </div>
      </div>

      <div class="row"></div>
      <div class="row">
        <div class="col-md-6">
            <?php print drupal_render($organisme_formation['info_generale']['tva_bool']); ?>
          </div>
      </div>
      <div class="row">
        <div class="col-md-6"><?php print drupal_render($organisme_formation['info_generale']['tva_number']); ?></div>
      </div>
    </fieldset>

    <!-- partie sélectionner un contact -->
    <fieldset id="edit-contact">
      <legend>
        <span class="fieldset-legend">Interlocuteur</span>
      </legend>
      <div class="row">
        <div class="col-md-6 required">
          <?php //$_SESSION['contact'] = $organisme_formation['contact_markup']['select_contact'];  ?>
          <?php print drupal_render($organisme_formation['contact_markup']['select_contact']); ?>
        </div>
        <div class="col-md-12 required">
          <?php print drupal_render($organisme_formation['contact_markup']['add']); ?>
        </div>
      </div>
    </fieldset>



    <!-- partie créer un contact -->
    <fieldset id="edit-new-contact">
      <legend>
        <span class="fieldset-legend">Interlocuteur</span>
      </legend>
      <div class="fieldset-wrapper">
        <div class="row">
          <div class="col-md-6">
            <?php print drupal_render($organisme_formation['new_contact']['new_contact_title']); ?>
          </div>
          <div class="col-md-6">
            <?php print drupal_render($organisme_formation['new_contact']['new_contact_lastname']); ?>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <?php print drupal_render($organisme_formation['new_contact']['new_contact_firstname']); ?>
          </div>
          <div class="col-md-6">
            <?php print drupal_render($organisme_formation['new_contact']['new_contact_fonction']); ?>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <?php print drupal_render($organisme_formation['new_contact']['new_contact_phone']); ?>
          </div>
          <div class="col-md-6">
            <?php print drupal_render($organisme_formation['new_contact']['new_contact_mail']); ?>
          </div>
        </div>
      </div>
    </fieldset>

    <fieldset id="edit-cost">
      <legend>
        <span class="fieldset-legend">Coûts / dépenses</span>
      </legend>
      <div class="fieldset-wrapper">
        <div class="row">
          <div class="col-md-4 required">
            <?php print drupal_render($organisme_formation['cost']['pedagogical_cost']); ?>
          </div>
          <div class="col-md-4">
            <?php print drupal_render($organisme_formation['cost']['eval_pre_formative']); ?>
          </div>
          <div class="col-md-4">
            <?php print drupal_render($organisme_formation['cost']['certification_passing']); ?>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 required">
            <?php print drupal_render($organisme_formation['fielset_direct_payment']['direct_payment']); ?>
          </div>
        </div>
      </div>
    </fieldset>
  </div>
  <div id="boutonAction" class="row">
      <?php print drupal_render($organisme_formation['back']); ?>
      <?php print drupal_render($organisme_formation['quit']); ?>
      <?php print drupal_render($organisme_formation['next']); ?>
  </div>

  <!-- MODALES -->
  <!-- Partie compléter un contact -->
  <div id="complete-contact-modal" class="modal" tabindex="-1"
    role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close modalQuit" data-dismiss="modal"
            aria-hidden="true">&times;</button>
          <h4 class="modal-title">Données manquantes</h4>
        </div>
        <div class="modal-body">
          <div class="row">
          <p>Veuillez indiquer la fonction et le courriel du contact
            sélectionné afin que l'OPCAIM puisse régler directement
            l'organisme de formation</p>
          </div>
          <div class="row">
            <div class="col-md-12 required">
              <?php print drupal_render($organisme_formation['contact_complete']['complete_contact_fonction']); ?>
            </div>
            <div class="col-md-12 required">
              <?php print drupal_render($organisme_formation['contact_complete']['complete_contact_mail']); ?>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input class="btn btn-cancel modalQuit" data-dismiss="modal"
            type="button" id="edit-modal-quit" value="Annuler"> <input
            class="btn btn-submit form-submit modalValid" data-dismiss="modal"
            type="button" id="edit-complete-modal-save" value="Valider">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->

  <!-- Partie ajouter un contact -->
  <div id="new-contact-modal" class="modal" tabindex="-1" role="dialog"
    aria-hidden="true">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close modalQuit" data-dismiss="modal"
            aria-hidden="true">&times;</button>
          <h4 class="modal-title">Ajouter un contact</h4>
        </div>
          <div class="col-md-12 required">
            <?php print drupal_render($organisme_formation['contact_modal']['modal_contact_title']); ?>
          </div>
          <div class="col-md-12 required">
            <?php print drupal_render($organisme_formation['contact_modal']['modal_contact_lastname']); ?>
          </div>
          <div class="col-md-12 required">
            <?php print drupal_render($organisme_formation['contact_modal']['modal_contact_firstname']); ?>
          </div>
          <div class="col-md-12 required">
            <?php print drupal_render($organisme_formation['contact_modal']['modal_contact_fonction']); ?>
          </div>
          <div class="col-md-12">
            <?php print drupal_render($organisme_formation['contact_modal']['modal_contact_mail']); ?>
          </div>
          <div class="col-md-12">
            <?php print drupal_render($organisme_formation['contact_modal']['modal_contact_phone']); ?>
          </div>
        <div class="modal-footer">
          <input class="btn btn-cancel modalQuit" data-dismiss="modal" type="button" id="edit-modal-quit" value="Annuler">
          <input class="btn btn-submit form-submit modalValid" type="button" id="edit-modal-save" value="Valider">
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->

  <!-- Modal info final -->
  <div id="modal-message-information-final" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Fin de saisie</h4>
        </div>
        <div class="modal-body">
          <?php print drupal_render($tuteur['modal_info_final']['text']); ?>
        </div>
        <div class="modal-footer">
          <?php print drupal_render($tuteur['modal_info_final']['goto-cerfa']); ?>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  <!-- Fin Modal info final -->
  <?php print drupal_render($organisme_formation['modal_quit']); ?>
  <?php print drupal_render_children($organisme_formation, array('form_build_id', 'form_token', 'form_id','cerfa-step')); ?>
</form>

