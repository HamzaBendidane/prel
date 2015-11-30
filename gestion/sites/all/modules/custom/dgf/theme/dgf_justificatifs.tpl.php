<div class="row">
    <?php print render($justificatifs['#prefix']); ?>
</div>
<form id="<?php print $justificatifs['#id'] ?>" accept-charset="UTF-8" 
      method="<?php print $justificatifs['#method'] ?>" class = "form-inline" 
      action="<?php print $justificatifs['#action'] ?>" 
      enctype="<?php print $justificatifs['#attributes']['enctype'] ?>">
    <div class="padding15">
        <div class="row">
            <?php
                //affichage de tous les éléments du form sauf (back, quit, next)
                $boutonsAction = array('back', 'quit', 'next'); 
                $children_keys = element_children($justificatifs);
                $elementsToShow = array_diff($children_keys, $boutonsAction);
                print drupal_render_children($justificatifs, $elementsToShow); 
            ?>
        </div>
    </div>
    <div id="boutonAction" class="row">
        <?php print drupal_render($justificatifs['back']); ?>
        <?php print drupal_render($justificatifs['quit']); ?>
        <?php print drupal_render($justificatifs['next']); ?>
    </div>
</form>
