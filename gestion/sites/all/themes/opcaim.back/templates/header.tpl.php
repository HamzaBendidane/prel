<div id="header">
   <div class="row">
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
           <?php if ($logo): ?>
              <a href="/dashboard">
                  <img src="<?php print $logo ?>" alt="logo"
                      title="logo" id="logo" class="logo" />
              </a>
             <?php endif; ?>
        </div>

        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 div-metallurgie">
          <div class='div-title'>
            <img class="title pull-left"
            src="/<?php print drupal_get_path('theme', 'opcaim'); ?>/images/title.png"
            alt="Organisme Paritaire Collecteur Agréé des Industries de la Métallurgie" / >
          </div>
        </div>
        <div class=" <?php print isset($user->name) ? 'profilConnexion' : ''; ?>">
        <div class="profilConnexionImage">
          <img class="img-cadre pull-left"
            src="/<?php print drupal_get_path('theme', 'opcaim'); ?>/images/encadre.png"
            alt="" style="width:100%;height:94px">
        </div>
          <div class="profildate col-lg-8 col-md-8 col-sm-8 col-xs-8">
              <?php $info_user = shared_users_get_infos_header($user); ?>
              <div class="opcaimBleuP profil">
                  <?php print $info_user['name']; ?>
              </div>
              <div class="opcaimBleuP entreprise">
                  <?php
                    if (has_role_entreprise()) {
                      print isset($info_user['entreprise']) ? 'Entreprise : ' . $info_user['entreprise'] :'';
                    } else if (has_role_adefim()) {
                      print isset($info_user['adefim']) ? 'ADEFIM : ' . $info_user['adefim'] :'';
                    } else if (has_role_opcaim()) {
                      print 'OPCAIM';
                    } else if (has_role_admin()) {
                      print 'ADMIN';
                    }

                  ?>
              </div>
              <div>
                  <?php //print isset($info_user['n_adherent']) ? 'Adhérent n° : ' . $info_user['n_adherent'] :'';?>
              </div>
              <div class="derniere-connexion"> <?php if (isset($user->login)) {
                      		$dateUser = date('d/m/Y H:i', $user->login);
                      		$date = str_replace(' ',' à ',$dateUser);
                      		print isset($user->login) ? 'Dernière connexion : ' . $date : 'Inconnue';
              			}
                     ?>
              </div>
          </div>

          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 profilCo opcaimBlanc">
              <?php
                if (has_role_entreprise()) {
                  print l(t('MON PROFIL'), '/mon-compte');
                } else if (has_role_opcaim() || has_role_admin()) {
                  print l(t('MON PROFIL'), '/user/'.$user->uid.'/edit');
                }
                print '<br />';
                print '<div class="div-logout">';
                print isset($user->name) ? l(t('Déconnexion'), 'user/logout', array('query' => array('destination' => 'login'))) : '';
                print '</div>';
              ?>
          </div>
        </div>
   </div>

   <div class="row position-relative">
       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 separator"> <img src="<?php print base_path() . path_to_theme() . '/' . 'images/title-separator.png'; ?>" /> </div>
       <div class="div-icons">
         <ul class="header-icons">
           <li class="header-icon">
            <a href="/dashboard"><img src="<?php print base_path() . path_to_theme() . '/' . 'images/home.png'; ?>" /> </a>
           </li>

          <?php
            $text_notif = '';
            $nb_notifications = shared_db_get_count_notifications_categories(array(), shared_get_drupal_user_id($user->uid));
            if ($nb_notifications > 0) {
              $text_notifications = shared_get_message_categorie(array(), shared_get_drupal_user_id($user->uid));
              $text_notif = '';
              foreach ($text_notifications  as $text_notification) {
                $text_notif .= '<div>' . $text_notification . '</div>';
              }
            }
          ?>

          <li class='header-icon header-icon-alerte'>
            <a id="alerte-notifications" class="alerte-notifications" data-toggle="popover" data-content="<?php print $text_notif;?>" >
              <img src="<?php print base_path() . path_to_theme() . '/' . 'images/alerte.png'; ?>" />
              <?php
                if ($nb_notifications > 0) {
              ?>
                  <div class="alerte-nb-notifications" >
                    <?php print $nb_notifications; ?>
                  </div>
              <?php
                }
              ?>
            </a>
          </li>

          <li class="header-icon">
            <a href="#"><img src="<?php print base_path() . path_to_theme() . '/' . 'images/info.png'; ?>" /> </a>
          </li>
       </div>
   </div>

   <?php print render($page['header']); ?>
</div>