<?php
/**
 * 
 * @author RME
 *
 */
class User extends AbstractCallback
{
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     * 
     * Renvoie directement l'id de l'utilisateur reçu en parametre 
     * 
     */
    public function getListeUser() {
        
        $users = array();
        
        $users[] = $this->param->id_user;
        
        return $users;
        
    }
    
    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeDestinataireMail()
     */
    public function getListeDestinataireMail() {
        
        $destinataires = array();
        
        if (isset($this->param->id_user)) {
            db_set_active(@DB_EXTRANET);
            
            $query = db_select('drupal_user', 'du');
            $query->fields('du');
            $query->condition('du.id_user_drupal' , $this->param->id_user, '=');
            $query->range(0,1);
            
            $result = $query->execute()->fetchAssoc();
            
            db_set_active();
            
            if ($result) {
                $destinataires[] = array(
                        'email' => $result['mail'],
                        'name' => trim($result['first_name']) . ' ' 
                                . trim($result['last_name'])
                );
            }
            
        } else {
            // dans le cas d'un utilisateur supprimé
            $destinataires[] = array(
                    'email' => $this->param->email,
                    'name' => $this->param->name
            );
        }
        
        return $destinataires;
        
    }
    
}