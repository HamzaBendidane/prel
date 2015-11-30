<?php
function hardis_autoloader($class_name) {
    $aClass = explode("_",$class_name);
    $path = implode("/",$aClass);
    require_once $path . '.inc';
}
spl_autoload_register('hardis_autoloader');

include_files('common');
/**
 * include required files
 */
function include_files($view){

    $aView = explode("_",$view);
    $path = implode("/",$aView);
    require_once 'form/'.$path.'.inc';
    require_once 'validate/'.$path.'.inc';
    require_once 'submit/'.$path.'.inc';
    require_once 'list/'.$path.'.inc';
}
function include_js($view){
    $aView = explode("_",$view);
    $path = implode("/",$aView);
    drupal_add_js(drupal_get_path('module', 'hardis' ) . '/js/common.js' );
    drupal_add_js(drupal_get_path('module', 'hardis' ) . '/js/'.$path.'.js' );
}
function include_css($view){
    $aView = explode("_",$view);
    $path = implode("/",$aView);
    drupal_add_css(drupal_get_path('module', 'hardis' ) . '/css/common.css' );
    drupal_add_css(drupal_get_path('module', 'hardis' ) . '/css/sb-admin.css' );
    drupal_add_css(drupal_get_path('module', 'hardis' ) . '/css/skins/_all-skins.min.css' );


}

/**
 * Common view
 * @return string
 * @throws Exception
 */
function common_view($type,$view) {
    include_files($view);
    include_js($view);
    include_css($view);

    if (@ENV == "dev"){
        $_SESSION['DEVQUERIES'] = array();
        $_SESSION['DEVQUERIESTIME'] = 0;
    }

    switch ($type) {
        case 'form':
            $variables =  array(
                'form'=> drupal_get_form('common_form',$view)
            );
            $output = theme($view."_".$type, $variables);
            break;
        case 'list':
            $variables =  common_list($view);
            $output = theme($view."_".$type, $variables);

            break;
        case 'view':
            $variables =  common_page($view);
            $output = theme($view."_".$type, $variables);

            break;
    }
    if (@ENV == "dev"){
        $output .= theme('hardis_dev', $_SESSION);
    }
    return $output;
}

/**
 *  Common Form
 *  @param: $view
 *  @return: string
 *
 */
function common_list($view) {
    $strForm = 'list_'.$view;
    $oForm = new $strForm($view);
    return $oForm->display();
}

/**
 *  Common Form
 *
 *  @param: $form, &$form_state
 *  @return: $form
 *
 */
function common_form($form, &$form_state,$view) {
    $strForm = $view.'_form';
    $oForm = new $strForm($view);
    return $oForm->get_form();
}


/**
 *  Common Form
 *
 *  @param: $form, &$form_state
 *  @return: $form
 *
 */
function common_page($view) {
    $strForm = 'view_'.$view;
    $oForm = new $strForm($view);
    return $oForm->display();
}