<?php ?>


<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Prelude</b>formations</a>
  </div><!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">J'accède à mon compte</p>
    <form id="<?php print $login_form['#id']; ?>" accept-charset="UTF-8"
          method="<?php print $login_form['#method']; ?>" name="LoginForm"
          action="<?php print $login_form['#action']; ?>">
      <div class="form-group has-feedback">
        <?php print drupal_render($login_form['username']); ?>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <?php print drupal_render($login_form['password']); ?>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">

          </div>
        </div><!-- /.col -->
        <div class="col-xs-4">
          <?php print drupal_render($login_form['submit']); ?>
        </div><!-- /.col -->
      </div>
      <?php print drupal_render_children($login_form, array('form_build_id', 'form_token', 'form_id')); ?>
    </form>


    <a href="#">Problème de connexion</a><br>

  </div><!-- /.login-box-body -->
</div><!-- /.login-box -->

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

