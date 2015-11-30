
<div id="<?php print $name; ?>" class="bloc-dashboard <?php print $class; ?>">  
  <?php if($lien) { ?>
    <a href="<?php print $lien ?>">
  <?php } ?>
      <div class="bloc-titre <?php print $image . ' ' . $couleur_haute;?>">
        <div class="bloc-titre-text">
          <?php print $titre ?>
        </div>

        <?php if($nb_notifications > 0) {?>
          <div class="bloc-nb-notifications" data-toggle="tooltip" data-original-title="<?php print $text_notifications;?>">
            <?php print $nb_notifications; ?>
          </div>
        <?php } ?>
        
        
      </div>
      <div class="bloc-text <?php print $couleur_basse;?>">
        <div class="text-content">
          <?php foreach ($lignes as $ligne) { ?>
            <div class="text-line">
              <div class="text-content-arrow <?php print $couleur_haute;?>"></div>
                <?php print $ligne; ?>
            </div>
          <?php } ?>
        </div>
      </div>
  <?php if($lien) { ?>
    </a>
  <?php } ?>
  <div class="bloc-text-cross <?php print $couleur_plus;?>"> + </div>
</div>


