
<div id="<?php print $name; ?>" class="bloc-dashboard <?php print $class; ?>">  
  <div class= 'bloc-content'>
    <div class= 'bloc-text-haut'>
     <?php print $text_haut;?>
    </div>
    <div class= 'bloc-text-base'>
     <?php foreach ($liste_liens as $lien) { ?>
         <div class= 'bloc-liens <?php print isset($lien['class'])? $lien['class'] : '';?>'>
     
           <?php if (isset($lien['path'])) { ?>
              <a href="<?php print $lien['path']; ?>">
           <?php }?>
     
             <?php print isset($lien['text'])? $lien['text'] : ''; ?>
             <div class='blocs-liens-content  <?php print isset($lien['glyphicons'])? $lien['glyphicons'] : '';?>'></div>
     
           <?php if (isset($lien['path'])) { ?>
              </a>
           <?php }?>
     
         </div>
     <?php }?>
    </div>
  </div>
</div>


