<?php
class common_form{

    protected $form ;

    /**
     * constructeur common
     * @param $form
     */
    public function __construct($form){
        $this->form = $form;
    }

    /**
     * retourne le fomulaire par default
     * @return array
     */
    protected function get_form(){
        $return =  array();

        return $return;
    }

    /**
     * exemple element text field
     * @param null $value
     * @return array
     */
    protected function get_element_form_hardis($value=null){
        return array(
            '#element_validate' => array('element_hardis_validate'),
            '#type' => 'textfield',
            '#default_value' =>  $value,
            '#title' => t('Test textfield' )
        );
    }


    /**
     * exemple element text field
     * @param null $value
     * @return array
     */
    protected function get_element_form_text($value=null,$title){
        return array(
            '#type' => 'textfield',
            '#title' => $title,
            '#default_value' => $value,
        );
    }


    /**
     * exemple validate form
     * @return string
     */
    protected function get_form_validate(){
        return $this->form.'_validate';
    }

    /**
     * exemple submit form
     * @return string
     */
    protected function get_form_submit(){
        return $this->form.'_submit';
    }
}