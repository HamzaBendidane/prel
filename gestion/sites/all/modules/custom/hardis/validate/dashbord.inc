<?php
/**
 * Class hardis_form
 */
class hardis_form extends common_form {
    function get_form(){

        $db = new db_hardis();
        $data = $db->get_by_id(1);

        $form['hardis'] = $this->get_element_form_hardis($data[0]['date_creation']);

        $form['submit'] = array(
            '#type' => 'submit',
            '#value' => t('Suivant'),
            '#validate' => array($this->get_form_validate()),
            '#submit' => array($this->get_form_submit()),
        );

        return $form;
    }
}