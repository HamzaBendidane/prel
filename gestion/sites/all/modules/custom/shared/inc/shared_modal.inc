<?php

/**
 *  Modal Quitter
 *  @param : $form
 *  @param : $validatorsQuit
 *  @param : $validatorsSave
 *  @param : $submitsSave
 *  @param : $form
 *  *
 */
function shared_modal_quit_form(&$form, $validatorsQuit = '', $validatorsSave = '', $submitsSave, $ecran = null, $accept = '', $refuse = '', $message = '', $custom_text = '') {
  $prefix = '<div id="modalquit" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 id="header_message">'. $message . '</h4>
                        <p id="custom_text">'.$custom_text.'</p>
                  </div>
                    <div class="modal-footer">';

  $suffix = '</div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->';


  $form['modal_quit']['header'] = array(
      '#type' => 'markup',
      '#markup' => $prefix,
  );

  $form ['modal_quit']['modal_quit'] = array(
      '#type' => 'submit',
      '#value' => isset($refuse) ? $refuse : t('Non'),
      '#attributes' => array(
          'class' => array('btn modalQuit'),
      ),
      '#validate' => isset($validatorsQuit) ? $validatorsQuit : '',

  );

  $form ['modal_quit']['modal_save'] = array(
      '#type' => 'submit',
      '#value' => isset($accept) ? $accept : t('Oui'),
      '#attributes' => array(
          'class' => array('btn modalSave'),
      ),
      '#validate' => isset($validatorsSave) ? $validatorsSave : '',
      '#submit' => $submitsSave,
  );

  $form['modal_quit']['footer'] = array(
      '#type' => 'markup',
      '#markup' => $suffix,
  );
}
