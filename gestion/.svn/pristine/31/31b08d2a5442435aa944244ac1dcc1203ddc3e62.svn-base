<?php
/**
 * 
 * @author RME
 *
 */
class ResponsableUser extends AbstractCallback
{
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     * 
     * Renvoie directement l'id du responsable de l'utilisateur donné
     * @todo 
     * 
     */
    public function getListeUser() {
        
        $users = array();
        
        $users[] = 0;
        
        return $users;
        
    }
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeDestinataireMail()
     */
    public function getListeDestinataireMail() {
        
        $destinataires = array();
        
        db_set_active(@DB_EXTRANET);
        
        $query = db_select('user_responsable', 'ur');
        $query->join('user_entreprise', 'ue', 'ue.id_user_responsable = ur.id');
        $query->join('drupal_user', 'du', 'ue.id_drupal_user = du.id');
        $query->fields('ur');
        $query->condition('du.id_user_drupal' , $this->param->id_user, '=');
        $query->range(0,1);
        
        $result = $query->execute()->fetchAssoc();
        
        db_set_active();
        
        $destinataires[] = array(
            'email' => $result['email'],
            'name' => trim($result['prenom']) . ' ' . trim($result['nom'])
        );
        
        return $destinataires;
        
    }
    
}