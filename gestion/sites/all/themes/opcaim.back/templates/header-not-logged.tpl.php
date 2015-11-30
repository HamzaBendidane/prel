<div id="header">
  <div class="row">
    <div>
             <?php if ($logo): ?>
                <a href="/login"> <img src="<?php print $logo ?>"
    alt="logo" title="logo" id="logo" class="logo" />
   </a>
               <?php endif; ?>
    <img class="title pull-left"
    src="/<?php print drupal_get_path('theme', 'opcaim'); ?>/images/title.png"
    alt="Organisme Paritaire Collecteur Agréé des Industries de la Métallurgie" />
    </div>
  </div>

  <div class="row">
    <div id="image-service-formation" class="col-lg-12 col-md-12">
      <img class="pull-right"
        src="/<?php print drupal_get_path('theme', 'opcaim'); ?>/images/slogan.png"
        alt="Organisme Paritaire Collecteur Agréé des Industries de la Métallurgie">
    </div>
  </div>
     <?php print render($page['header']); ?>
</div>