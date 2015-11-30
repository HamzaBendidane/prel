<?php
/**
 * hardis submit
 * @param $form
 * @param $form_state
 */
function ajouterstage_validate($form, &$form_state){
    print("validate");
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