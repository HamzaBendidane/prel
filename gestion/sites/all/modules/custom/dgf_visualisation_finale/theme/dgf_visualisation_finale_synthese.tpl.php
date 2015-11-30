<?php

  //Toutes les données à afficher;
  $intitule = isset($synthese['Formation']['t_saisie_libre_intitule_formation']) ?  $synthese['Formation']['t_saisie_libre_intitule_formation'] : ' ';
  $demandeurRaisonSociale = isset($synthese['Demandeur']['t_raison_sociale']) ?  $synthese['Demandeur']['t_raison_sociale'] : ' ';
  $DemandeurNom = isset($synthese['Demandeur']['t_nom_demandeur']) ?  $synthese['Demandeur']['t_nom_demandeur'] : ' ';
  $DemandeurSiret = isset($synthese['Demandeur']['t_siret']) ?  $synthese['Demandeur']['t_siret'] : ' ';
  $dgfNumDemande = isset($synthese['Dgf']['numero_demande']) ?  $synthese['Dgf']['numero_demande'] : ' ';
  $dgfDateSynthese = isset($synthese['Dgf']['date_synthese']) ?  $synthese['Dgf']['date_synthese'] : ' ';
  $demandeNature = isset($synthese['Demande']['t_nature_demande']) ?  $synthese['Demande']['t_nature_demande'] : ' ';
  $formationDateDebut = isset($synthese['Formation']['t_date_debut']) ?  $synthese['Formation']['t_date_debut'] : ' ';
  $formationDateFin = isset($synthese['Formation']['t_date_fin']) ?  $synthese['Formation']['t_date_fin'] : ' ';
  $formationDureeJours = isset($synthese['Formation']['t_duree_jours']) ?  $synthese['Formation']['t_duree_jours'] : ' ';
  $formationDureeHeures = isset($synthese['Formation']['t_duree_heures']) ?  $synthese['Formation']['t_duree_heures'] : ' ';
  $formation_interne = isset($synthese['Formation']['t_formation_interne']) ?  $synthese['Formation']['t_formation_interne'] : ' ';
  $stagiaires = isset($synthese['Stagiaire']) ?  $synthese['Stagiaire'] : ' ';
  $organismeCoutPedagogique = isset($synthese['Organisme']['t_cout_pedagogique']) ?  $synthese['Organisme']['t_cout_pedagogique'] : ' ';
  $organismeRaisonSociale = isset($synthese['Organisme']['t_raison_sociale']) ?  $synthese['Organisme']['t_raison_sociale'] : ' ';
  $organismeNumDeclaration = isset($synthese['Organisme']['t_numero_declaration']) ?  $synthese['Organisme']['t_numero_declaration'] : ' ';
  $organismeSiret = isset($synthese['Organisme']['t_siret']) ?  $synthese['Organisme']['t_siret'] : ' ';
  $organismeNumRue = isset($synthese['Organisme']['t_numero_adresse']) ?  $synthese['Organisme']['t_numero_adresse'] : ' ';
  $organismeRue = isset($synthese['Organisme']['t_rue']) ?  $synthese['Organisme']['t_rue'] : ' ';
  $organismeCplRue = isset($synthese['Organisme']['t_complement_rue']) ?  $synthese['Organisme']['t_complement_rue'] : ' ';
  $organismeEmail = isset($synthese['Organisme']['t_contact_email']) ?  $synthese['Organisme']['t_contact_email'] : ' ';
  $organismeTelephone = isset($synthese['Organisme']['t_contact_telephone']) ?  $synthese['Organisme']['t_contact_telephone'] : ' ';
  $organismePaiement = isset($synthese['Organisme']['t_paiement_direct']) ? $synthese['Organisme']['t_paiement_direct'] : '';
  $justificatifs = isset($synthese['Justificatif']) ?  $synthese['Justificatif'] : ' ';
  $intitule = isset($synthese['Formation']['t_saisie_libre_intitule_formation']) ?  $synthese['Formation']['t_saisie_libre_intitule_formation'] : ' ';
  $intitule = isset($synthese['Formation']['t_saisie_libre_intitule_formation']) ?  $synthese['Formation']['t_saisie_libre_intitule_formation'] : ' ';
  $path = variable_get('file_public_path', conf_path());
  $path_cerfa = variable_get('file_public_path', conf_path()) . '/files/opcaim/demande/cerfa/cerfa_' . $DemandeurSiret . '-' . $dgfNumDemande . '.pdf';
?>
    <div id ="synthese">
      <div class="tab-title">
        <h3>Demande de gestion et financement</h3>
        <h5><?php print ($intitule);?></h5>
      </div>
        <div class="row entete">
           <div class="form-item col-md-6">
             <p>N° adh : </p>
             <p>Entreprise : <?php print ($demandeurRaisonSociale)?></p>
             <p>Siret : <?php print ($DemandeurSiret)?></p>
            <p>Nom du demandeur : <?php print ($DemandeurNom)?></p>
           </div>
           <div class="form-item itemGauche col-md-6">
             <p>N° : <?php print ($dgfNumDemande)?></p>
             <p>Le : <?php print ($dgfDateSynthese)?></p>
           </div>
        </div>
         <h4><span class="upper-bold">Nature de la demande : </span><?php print ($demandeNature)?></h4>
         <div class="row">
           <div class="form-item col-md-6">
             <span>Formation du <?php print ($formationDateDebut).' au '.($formationDateFin)?></span>
           </div>
           <div class="form-item col-md-6">
               <span>Durée <?php print ($formationDureeJours)?> mois <?php print ($formationDureeHeures)?> jours</span>
           </div>
         </div>
         <div class="underline"></div>
         <h4><span class="upper-bold">Le(s) stagiaire(s)</span></h4>
       <br>
         <table class="table">
              <thead>
                  <tr>
                      <th>Nom</th>
                      <th>Prénom</th>
                      <th>Date de naissance</th>
                      <th>CSP</th>
                      <th>Heures formations</th>
                      <th>Coût pédagogique</th>
                      <th>Autre frais</th>
                      <th>spécificités</th>
                  </tr>
              </thead>
              <tbody>
              <?php
                  foreach ($stagiaires as $stagiaire){
                    if(!empty($stagiaire)) {
                      print('<tr>');
                      print('<td>'.($stagiaire['t_nom']).'</td>');
                      print('<td>'. ($stagiaire['t_prenom']).'</td>');
                      print('<td>'.($stagiaire['t_date_naissance']).'</td>');
                      print('<td></td>');
                      print('<td></td>');
                      print('<td>'.$organismeCoutPedagogique.'</td>');
                      print('<td></td>');
                      print('<td></td>');
                      print('</tr>');
                    }
                  }
              ?>
              </tbody>
          </table>
          <div class="underline"></div>
         <h4><span class="upper-bold">Coût total de la formation</span></h4>
         <div class="row">
           <div class="form-item col-md-6">
             <span>Coût pédagogique : <?php print ($organismeCoutPedagogique)?>€</span>
           </div>
           <div class="form-item itemGauche col-md-6">
             <span>Frais annexes <?php // TODO print ($fraisAnnexes)?>€</span>
           </div>
         </div>
         <div class="row" id="foo">
           <?php
             if ($organismePaiement) {
               ?>
               <input type="checkbox" checked name="nom" value="" disabled>
               <span>Paiement direct de l'organisme de formation</span>
               <?php
             } else {
               ?>
                 <input type="checkbox" name="nom" value="" disabled>
                 <span>Paiement direct de l'organisme de formation</span>
               <?php
               }
               ?>
         </div><br/>
         <div class="underline"></div>
           <h4><span class="upper-bold">Organisme de formation</span></h4><br>
             <div class="row">
             <?php if ($formation_interne == 1): ?>
               <div class="form-item col-md-6">
                 <span><?php print trim($synthese['entreprise']['t_entreprise']); ?></span><br/>
                 <span>N° Siret <?php print trim($synthese['Demandeur']['t_siret']); ?></span>
               </div>

               <div class="form-item col-md-6">
                 Adresse
                 <br />
                 <?php
                    $adresse = '';
                    if (trim($synthese['entreprise']['t_entreprise_rue']) != '') {
                      $adresse .= trim($synthese['entreprise']['t_entreprise_rue']) .' <br />';
                    }
                    if (trim($synthese['entreprise']['t_entreprise_complement_rue']) != '') {
                      $adresse .= trim($synthese['entreprise']['t_entreprise_complement_rue']) .' <br />';
                    }
                    if (trim($synthese['entreprise']['t_entreprise_complement_rue_2']) != '') {
                      $adresse .= trim($synthese['entreprise']['t_entreprise_complement_rue_2']) .' <br />';
                    }
                    $adresse .= trim($synthese['entreprise']['t_entreprise_code_postal']) . ' '
                      . trim($synthese['entreprise']['t_entreprise_ville']);
                    print $adresse;
                   ?>

                 <br />Contact (Mail/Télephone)<br />
                 <?php print trim($synthese['entreprise']['t_entreprise_email']); ?><br />
                 <?php print trim($synthese['entreprise']['t_entreprise_telephone']); ?>
               </div>
             <?php else: ?>
               <div class="form-item col-md-6">
                 <span><?php print ($organismeRaisonSociale)?></span><br/>
                 <span>N° de déclaration d activité <?php print ($organismeNumDeclaration)?><span><br/>
                 <span>N° Siret <?php print ($organismeSiret)?></span>
               </div>

               <div class="form-item col-md-6">
                 <p>Adresse </p>
                 <p><?php print ($organismeNumRue).' '.($organismeRue).' '.($organismeCplRue)?></p>
                 <p>Contact (Mail/Télephone)</p>
                 <p> <?php print ($organismeEmail)?></p>
                 <p> <?php print ($organismeTelephone)?></p>
               </div>
             <?php endif; ?>
          </div>
<!--           <div class="underline"></div> -->
<!--           <h4><span class="upper-bold">Pièces associées</span></h4> -->
<!--           <table id="listfiles" class="table table-condensed small-margin-top"> -->
<!--             <thead> -->
<!--               <tr> -->
<!--                 <th>Type de la pièce jointe</th> -->
<!--                 <th class="center">Nom du fichier</th> -->
<!--                 </tr> -->
<!--              </thead> -->
<!--              <tbody> -->
               <?php
//                 foreach ($justificatifs as $piece){
//                   print(
//                       '<tr><td class="types">'.$piece['t_nom_ref_fichier'].'</td>'.
//                       '<td class="center"><a href="'.$piece['t_chemin_fichier'].'">'.$piece['t_fichier'].'</a></td></td></tr>');
//                 }
//                 ?>
<!--               </tbody></table> -->
         </fieldset>
         <div class="col-md-12 center">
           <a href="/<?php print $path_cerfa ?>" target="_blank" class="btn btn-default btn-sm synthese-edit center">
             <span class="glyphicon glyphicon-print"> </span>
             Editer la synthese
           </a>
         </div>
        <?php print drupal_render_children($synthese, array('form_build_id', 'form_token', 'form_id')); ?>
     </div>
