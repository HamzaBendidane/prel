<?php
/**
 * 
 * @author RME
 *
 */
class OwnerDGF extends AbstractCallback
{
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     * 
     * Fonction pour récupérer l'utilisateur ayant créé la DGF
     * 
     */
    public function getListeUser() {
        
        $users = array();
        
        db_set_active(@DB_EXTRANET);
        
        $query = db_select('dgf', 'd')
        ->fields('d', array('id_user_creation'))
        ->condition('id', $this->param, '=');
        
        $results = $query->execute()->fetchAssoc();
        
        $users[] = $results['id_user_creation'];
        
        db_set_active();
        
        return $users;
        
    }
    
}