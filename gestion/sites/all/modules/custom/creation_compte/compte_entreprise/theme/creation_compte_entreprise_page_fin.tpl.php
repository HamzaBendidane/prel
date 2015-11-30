<div class="row confirmation center createAccount">
    <?php print render($form_creation_compte_fin['#prefix']); ?>

</div>
<div id="message-fin">
  <?php print @MESSAGE_FIN_CREATION_COMPTE; ?>
  <span id="numero-demande">
     <?php print $numero_demande; ?>
  </span>
  <br />
  <?php print @MESSAGE_FIN_CREATION_COMPTE_2; ?>
</div>
  <form>
  <br>
<input type="button" id="edit-back" value="Retour" class="form-submit"></input>
  </form> 