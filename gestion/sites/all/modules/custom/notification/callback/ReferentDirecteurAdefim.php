<?php
/**
 * 
 * @author RME
 *
 */
class ReferentDirecteurAdefim extends AbstractCallback
{
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     * 
     * Fonction pour récupérer Le référent (et Directeur si différent) 
     * de l’ADEFIM rattachée à partir de la liste d'ID Entreprise
     * 
     */
    public function getListeUser() {
        
        $users = array();
        
        $ids_entreprise = $this->param->id_entreprises;
        
        db_set_active(@DB_SLAVE);
        
        $query = db_select('comptes_adefims', 'ca');
        $query->join('fonctions_adefims', 'fa', 'ca.id_fonction_adefim = fa.id');
        $query->join('adefims', 'a', 'ca.id_adefim = a.id');
        $query->join('v_adefims_entreprise', 'lae', 'lae.id_adefim = a.id');
        $query->join('entreprises', 'e', 'lae.id_entreprise = e.id');
        $query->fields('ca', array('id','nom_utilisateur'));
        $query->condition('a.est_actif' , 1, '=');
        $query->condition('ca.est_actif' , 1, '=');
        //filtre par entreprise
        $query->condition('e.id', $ids_entreprise, 'IN');
        //filtre par fonction Directeur et Référent
        $query->condition('fa.id' , array('I.1','I.3'), 'IN');
        
        $results = $query->execute()->fetchAll();
        
        db_set_active();
        
        //Récupération des uid des users Adefim depuis drupal
        foreach ($results as $user_adefim) {
            $user = user_load_by_name(rtrim($user_adefim->nom_utilisateur));
            if ($user != false) {
                $users[] = $user->uid;
            }
        }
        
        // Supprimer les doublons si plusieurs entreprises
        $users = array_unique($users);
        
        return $users;
        
    }
    
}