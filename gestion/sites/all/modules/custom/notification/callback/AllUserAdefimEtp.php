<?php
/**
 * 
 * @author RME
 *
 */
class AllUserAdefimEtp extends AbstractCallback
{
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     *
     * Fonction pour récupérer Les utilisateurs  
     * des ADEFIM rattachées rattachées aux entreprise
     * 
     * @todo ressemble à getListeDestinataireMail 
     *
     */
    public function getListeUser() {
    
        $users = array();
    
        //$this->param->id_entreprises;
        
        $users[] = 0;
    
        return $users;
    
    }
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     * 
     * Fonction pour récupérer Les utilisateurs et leurs mails 
     * des ADEFIM rattachées rattachées aux entreprise
     * 
     */
    public function getListeDestinataireMail() {
        
        $destinataires = array();
        
        $id_entreprises = $this->param->id_entreprises;
        
        $id_adefims = array();
        
        foreach ($id_entreprises as $id_entreprise) {
            $id_adefims[] = shared_get_id_adefim_from_id_entreprise($id_entreprise);
        }
        
        db_set_active(@DB_SLAVE);
        
        $query = db_select('v_comptes_adefims', 'ca');
        $query->fields('ca');
        $query->condition('id_adefim', $id_adefims, 'IN');
        $result = $query->execute();
        $comptes_adefim = $result->fetchAll();
        
        db_set_active();
        
        foreach ($comptes_adefim as $compte_adefim) {

            $destinataires[] = array(
                'email' => $compte_adefim->email,
                'name' => trim($compte_adefim->prenom) . ' ' . trim($compte_adefim->nom)
            );
            
        }
        
        return $destinataires;
        
    }
    
}