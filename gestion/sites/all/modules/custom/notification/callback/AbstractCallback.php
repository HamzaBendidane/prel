<?php
/**
 * 
 * @author RME
 *
 */
abstract class AbstractCallback
{
    /**
     * parametre(s) (dgf, entreprise, utilisateur...)
     * pour déterminer la liste des destinataires de la notification
     * 
     * @var int or array
     */
    protected $param;
    
    /**
     * 
     * @param array $param
     */
    public function __construct($param) {
        $this->param = $param;
    }
    
    /**
     * fonction pour récupérer la liste des destinaires pour une notification
     * 
     * @return array
     */
    abstract protected function getListeUser();
    
    /**
     * fonction pour récupérer la liste des destinaires pour un mail
     * 
     * @return array
     */
    public function getListeDestinataireMail() {
        return array();
    }
    
}