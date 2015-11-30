<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 10/06/2015
 * Time: 14:02
 */
define('TABLE_USER_ENTREPRISE'  ,  'user_entreprise');
define('TABLE_USER_RESPONSABLE' ,  'user_responsable');
define('TABLE_DRUPAL_USER' , 'drupal_user');
define('TABLE_ENTREPRISE' , 'entreprises');
function migration (){
    require_once 'migration_db.inc';
    $aComptes = migration_get_ref_comptes_extranet();

    print "###################################################################\n";
    print "START TIME : ".date('Y-m-d H:i:s')."\n";
    print "Accounts to process : ".count($aComptes)."\n";

    $aFonction = shared_db_get_fonction();

    $i = 1;$tabUsers = array();
    foreach ($aComptes as $compte){

      //  print "START Process ".str_replace(" ","",implode("<>",array_values($compte)))."\n";
        print $compte['id_entreprise']."\r";
       try {
            if (!array_key_exists($compte["email"],$tabUsers)) {

                $entreprise_data = shared_db_get_entreprise_data($compte['id_entreprise']);

                $id_drupal_user = migration_add_drupal_user($compte);

                $id_user_responsable = company_register_db_save_user_responsable($compte);

                $data = array();
                $data['utilisateur_titre'] = $compte['civilite'];
                $data['utilisateur_nom'] = $compte['nom'];
                $data['utilisateur_prenom'] = $compte['prenom'];
                $data['utilisateur_email'] = $compte['email'];
                $data['utilisateur_fonction'] = $compte['fonction'];
                $data['utilisateur_telephone'] = $compte['telephone'];

                $data['id_fonction'] = array_search(trim($compte['fonction']),$aFonction);

                $id_extranet_drupal_user = company_register_db_save_extranet_drupal_user($data, $id_drupal_user);

                 migration_compte_entreprise_db_save_user_habilitations($id_extranet_drupal_user);

                $id_user_entreprise = company_register_db_save_user_entreprise('', '', $id_extranet_drupal_user, $id_user_responsable, $compte['a_valide_charte']);
                $tabUsers[$compte["email"]] = $id_user_entreprise;
            }
            $id_user_entreprise = $tabUsers[$compte["email"]];

            $link_to_entreprise = migration_utilisateurs_db_attacher($id_user_entreprise,$compte['id_entreprise']);

       //     migration_process_comptes_extranet($compte['id'],$id_drupal_user);

        }catch (Exception $e){
            echo $e->getMessage();
        }

        print "Process ".$compte['id']." : ".$id_user_entreprise." $i / ".count($aComptes) ."\r";
        $i++;
        flush();

    }
    print "END TIME : ".date('Y-m-d H:i:s')."\n";
    print "###################################################################\n";
}
function process_civilites($civilite){



}

function migration_lien_adefim_entreprise(){
  require_once 'migration_db.inc';
  migration_process_adefim_entreprise();
  print("migration terminee");
}

function migration_lien_user_entreprise() {
  require_once 'migration_db.inc';
  migration_process_user_entreprise();
  print("migration terminee");
}