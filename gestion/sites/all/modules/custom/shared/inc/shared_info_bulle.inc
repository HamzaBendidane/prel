<?php 
/**
 *
 * @author Gael GALBAS-FRONTINOIS
 *
 */
class infoBulle
{
//   /* Attributes */
  public $code;
  public $message;
  
  /* Constantes */
  const CONTENT_TYPE = 'info_bulle';
  
  /* Constructor */
  /**
   * Construteur
   * @param str titre de la node
   */
  function __construct($title) {
    $query = new EntityFieldQuery();
    $entities = $query->entityCondition('entity_type', 'node')
    ->propertyCondition('type', self::CONTENT_TYPE)
    ->propertyCondition('title', $title)
    ->propertyCondition('status', NODE_PUBLISHED)
    ->range(0,1)
    ->execute();
    if(!empty($entities)) {
      $keys = array_keys(
                  $entities['node']
                  );
      
      $node =  node_load(
          array_shift($keys)
          );
    }
    $this->code = $title;
    if(isset($node)) {
      $this->message = $node->body['und'][0]['value'];

    }
     
    if(has_role_admin()) {
      $this->message = $title . ' ' . $this->message;
    }
    
  }
  
  /* Methodes */
  /**
   * Retourne le code 
   */
  function getCode () {
    return $this->code;
  }

  /**
   * Retourne le body
   */
  function getBody () {
    return $this->message;
  }

}