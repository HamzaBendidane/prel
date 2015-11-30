<div id ="justificatif_paiement">
  <h3>Justificatifs Paiements</h3>
  <fieldset class="form-wrapper row ">
  <?php
    print drupal_render($justificatif_paiement);
  ?>
  </fieldset>
</div>

<!--   <fieldset class="form-wrapper row "> -->
<!--     <form enctype="multipart/form-data" action="/dgf/visualisation/88" method="post" id="dgf-justificatif-paiement-form" accept-charset="UTF-8"> -->
<!--       <div> -->
<!--         <div class="row"> -->
<!--           <h3><span class="num">1</span> Sélectionnez le type de pièce à joindre</h3> -->
<!--         </div> -->
<!--         <div class='row'> -->
<!--           <div class='col-lg-6'> -->
<!--             <p>Type de pièce(s) à joindre <b>impérativement</b></p> -->
<!--             <ul class='list-unstyled justifs'> -->
            <?php
//               $justifs_mandatory = $justificatif_paiement['convention']['listes']["#markup"]["mandatory"];
//               print $justifs_mandatory;
//             ?>
<!--             </ul> -->
<!--             </div> -->
<!--             <div class='col-lg-6'> -->
<!--               <p>Type de pièce(s) complémentaires éventuelles</p> -->
<!--               <ul class='list-unstyled justifs-complements'> -->
              <?php
//                 $justifs_complementary = $justificatif_paiement['convention']['listes']["#markup"]["complementary"];
//                 print $justifs_complementary;
//               ?>
<!--               </ul> -->
<!--           </div> -->
          <?php //print drupal_render($justificatif_paiement['convention']['id_ref_file']);?>
<!--         </div> -->
<!--         <div class="row"> -->
<!--           <h3><span class="num">2</span> Recherche le fichier que vous désirez joindre</h3> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--           <b>Merci de joindre vos documents au format: .pdf, .doc, .docx, .xls, .xlsx, .jpeg, .png</b> -->
<!--         </div> -->
<!--         <div class="form-item form-type-file form-item-files-file-to-upload"> -->
<!--           <label class="element-invisible" for="edit-file-to-upload--2">Fichier à joindre</label> -->
          <?php
//             print drupal_render($justificatif_paiement['convention']['file_to_upload']);
//           ?>
<!--           <div class="description">(parcourir les fichiers de votre ordinateur)</div> -->
<!--         </div> -->
<!--         <div id="limit-size" class="row"> -->
<!--           <b><b>ATTENTION</b>: la taille maximale des pièces justificatives est limité à 5 Méga Octets</b> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--           <h3><span class="num">3</span> Cliquez sur << Joindre la pièce >> </h3> -->
<!--         </div> -->
        <?php
//           print drupal_render($justificatif_paiement['convention']['join_file']);
//           print drupal_render($justificatif_paiement['convention']['result']);
//         ?>
<!--         <div class="clearfix"></div> -->
<!--       </div> -->
<!--       <div> -->
        <?php // print drupal_render_children($justificatif_paiement, array('form_build_id', 'form_token', 'form_id')); ?>
<!--       </div> -->
<!--     </form> -->
<!--   </fieldset> -->
<!-- </div> -->