<div class="row">
    <?php print render($demande['#prefix']); ?>
</div>
<form id="<?php print $demande['#id'] ?>" accept-charset="UTF-8" method="<?php print $demande['#method'] ?>" class = "form-inline" action="<?php print $demande['#action'] ?>">
    <div class="padding15">
	    <div class="row">
            <div class="col-md-6 required">
            	<?php print drupal_render($demande['nature_demande']); ?>
            </div>
            <div class="col-md-6">
                <div class="radio-separator"></div>
            	<?php print drupal_render($demande['nature_formation']); ?>
            </div>
        </div>
        <div class="row">
            <?php print drupal_render($demande['rappel_contrat_pro']); ?>
        </div>
    </div>
    <div id="boutonAction" class="row">
        <?php print drupal_render($demande['back']); ?>
        <?php print drupal_render($demande['next']); ?>
    </div>
    <?php print drupal_render_children($demande); ?>
</form>
    