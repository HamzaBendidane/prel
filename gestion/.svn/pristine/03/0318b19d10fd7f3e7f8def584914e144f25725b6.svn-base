<?php
/**
 * 
 * @author RME
 *
 */
class AdminResponsableEtp extends AbstractCallback
{
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     * 
     * Fonction pour récupérer Le référent (et Directeur si différent) 
     * de l’ADEFIM rattachée 
     * 
     */
    public function getListeUser() {
        
        $users = array();
        
        $id_entreprises = $this->param->id_entreprises;
        
        db_set_active(@DB_EXTRANET);
        
        $query = db_select('user_entreprise', 'ue');
        $query->join('lien_user_entreprise_ref_esclave_entreprise', 'luee', 'luee.id_user_entreprise = ue.id');
        $query->join('drupal_user', 'du', 'ue.id_drupal_user = du.id');
        $query->fields('du', array('id_user_drupal'));
        $query->condition('luee.est_actif' , 1, '=');
        //filtre par entreprise
        $query->condition('luee.id_ref_esclave_entreprise', $id_entreprises, 'IN');
        
        $results = $query->execute()->fetchAll();
        
        db_set_active();
        
        foreach ($results as $result) {
            
            //chercher si l'utilisateur existe dans drupal
            $user = user_load($result->id_user_drupal);
            
            if ($user != false) {
                
                // Vérifier si l'utilisateur est ADMIN ENTREPISE (role 5)
                // @todo RESPONSABLE ENTREPISE
                if (user_has_role(5,$user)) {
                    $users[] = $user->uid;
                }
            }
        }
        
        // Supprimer les doublons si plusieurs entreprises
        $users = array_unique($users);
        
        return $users;
        
    }
    
}