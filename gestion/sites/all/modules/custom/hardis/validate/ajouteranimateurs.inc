<?php
/**
 * hardis submit
 * @param $form
 * @param $form_state
 */
function creation_form_validate_animateur($form, &$form_state){

}

/**
 * Element hardis validate
 * @param $element
 * @param $form_state
 */
function element_hardis_validate($element, &$form_state){
    $value = $element ['#value'];
    if (!$value) {
        form_error($element, t('@name est obligatoire', array('@name' => $element ['#title'])));
    }
}