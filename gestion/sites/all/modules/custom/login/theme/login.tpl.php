<?php ?>
<div id="main">
  <div id="login-container">
    <div class="top-mask"></div>
    <div class="left-zone pull-left"></div>
    <div class="right-zone">
      <div class="text"><?php print t(@ESPACE_DEDIE); ?></div>
    </div>
    <div class="bar">
      <form id="<?php print $login_form['#id']; ?>" accept-charset="UTF-8"
        method="<?php print $login_form['#method']; ?>" name="LoginForm"
        action="<?php print $login_form['#action']; ?>">
        <div class="form">
          <div class="account-container pull-left">
            <span class="v-aligner"></span><span class="arrow"></span>
            <?php print drupal_render($login_form['username']); ?>
          </div>
          <div class="password-container pull-left">
            <span class="v-aligner"></span><span class="arrow"></span>
            <?php print drupal_render($login_form['password']); ?>
          </div>
          <div class="btn-container pull-left">
              <span class="v-aligner"></span>
              <?php print drupal_render($login_form['submit']); ?>

          </div>
          <?php print drupal_render_children($login_form, array('form_build_id', 'form_token', 'form_id')); ?>
          <div class="clearfix"></div>
        </div>
      </form>
    </div>
  </div>

  <div id="links-blocks" class="row clearfix">
    <div class="link-block create-block col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="title"><?php print t(@TEXTE_BOUTON_1); ?></div>
              <a id="lCrea" class="link orange" href="/creation/compte/entreprise"><?php print t(@TEXTE_BOUTON_LIEN_1); ?></a>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="link-block forgot-block col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="title"><?php print t(@TEXTE_BOUTON_2); ?></div>
      <a href="javascript:void(0);" id="forgot-password-link" class="link orange"><?php print t(@TEXTE_BOUTON_LIEN_2); ?></a>
    </div>
  </div>


  <?php
    $errors = drupal_get_messages();
    if (isset($errors['error'])) {
      print '<div class="errorlogin">';
      foreach ($errors['error'] as $err):
        print '<div class="">'.$err.'</div>';
      endforeach;
      print '</div>';
    }else if (isset($errors['status'])){
        print '<div class="statuslogin">';
        foreach ($errors['status'] as $err):
            print '<div class="">' . $err . '</div>';
        endforeach;
        print '</div>';
    }
  ?>
</div>

<div id="forgot-password" class="modal" tabindex="-1" role="dialog" aria-labelledby="forgot-passwordLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"><?php print t(@MODAL_FORGOT_PWD_TITRE); ?></h4>
        </div>
        <form name="LoginForgotPasswordForm" method="post" action="/login/modalSubmit" id="LoginForgotPasswordForm">
        <div class="modal-body">
          <?php print t(@MODAL_FORGOT_PWD_CONTENT); ?>
          <div class="modal-content-input"> 
            <?php print drupal_render($login_password_forgot_form['email']); ?>
            <?php print drupal_render($login_password_forgot_form['submit']); ?>
            <div class='error_modal'> <?php print drupal_render($login_password_forgot_form['error']); ?> </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="close-modal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Fermer</span></button>  
        </div>
        <?php print drupal_render_children($login_password_forgot_form, array('form_build_id', 'form_token', 'form_id')); ?>
        </form>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

