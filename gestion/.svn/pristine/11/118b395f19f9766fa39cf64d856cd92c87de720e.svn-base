<h3>Paramétrage des alertes</h3>
<form id="<?php print $parametrage_form['#id'] ?>" accept-charset="UTF-8" method="<?php print $parametrage_form['#method'] ?>" class = "form-inline" action="<?php print $parametrage_form['#action'] ?>">
    <div class="padding15">
        <div class="row">
            <div class="col-md-6">
                <?php print drupal_render($parametrage_form['reception_rapports_alertes']); ?>
            </div>
        </div>
        <div class="row">
            <table class="table table-striped table-condensed table-bordered">
                <thead>
                    <tr>
                        <th>Libellé de l'alerte</th>
                        <th>Action attendue</th>
                        <th>Réception par mail</th>
                    </tr>
                </thead>
                <tbody>
                <?php foreach ($notifications as $notification) {?>
                    <tr>
                        <td><?php print $notification->action_declenchante?></td>
                        <td><?php print $notification->action_attendue?></td>
                        <td>
                            <?php
                                $key = 'notification-' . $notification->id;
                                print drupal_render($parametrage_form['parametrage_alerte'][$key]); 
                            ?>
                        </td>
                    </tr>
                <?php }?>
                </tbody>
            </table>    
        </div>
    </div>

    <div id="boutonAction" class="row">
        <?php print drupal_render($parametrage_form['submit']); ?>
    </div>
    <?php print drupal_render_children($parametrage_form); ?>
    
</form>