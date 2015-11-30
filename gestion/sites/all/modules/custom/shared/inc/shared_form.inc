<?php
/**
 * shared_form_input_coller_serrer
 *
 * permet de coller deux champs, ajouter les classes coller-serrer-1 et coller-serrer2 sur les champs
 *
 * @param array $element1FormInput
 * @param array $element2FormInput
 *
 * @return string
 *
 */
function shared_form_input_coller_serrer($element1FormInput, $element2FormInput) {
  $html = '';
  if ($element1FormInput && $element2FormInput) {
    $html = '<div class="form-item form-type-textfield form-item-'.str_replace('_', '-', $element1FormInput['#name']).'">';
    $html .= '<label for="'.$element1FormInput['#id'].'">' . $element1FormInput['#title'] . '</label>';
    $html .= theme('textfield', $element1FormInput);
    $html .= theme('textfield', $element2FormInput);
    $suffix2 = '';
    if (isset($element2FormInput['#field_suffix'])) {
      $suffix2 = $element2FormInput['#field_suffix'];
    }
    $html .= '<span class="field-suffix">'. $suffix2 . '<span class="spinner">&nbsp;</span></span>';
    
    // Comme drupal n'arrive pas à gérer (avec le #tree) l'affichage des messages d'erreur
    // On le récupère via #name et on l'affiche en dur
    if ($element1FormInput["#tree"]) {
      $errors = form_get_errors();
      $error_element_1 = isset($errors[$element1FormInput["#name"]]) ? $errors[$element1FormInput["#name"]] : null;
      $error_element_2 = isset($errors[$element2FormInput["#name"]]) ? $errors[$element2FormInput["#name"]] : null;
    } else {
      // Si on n'est pas dans le #tree alors tout va bien
      // on laisse drupal gérer l'affichage des erreurs
      $error_element_1 = form_get_error($element1FormInput);
      $error_element_2 = form_get_error($element2FormInput);
    }
    
    if ($error_element_1
        || $error_element_2) {
      $html .= '<div class="messages-inline">'.$error_element_1 . '<br />'
          . $error_element_2.'</div>';
    }
    $html .= '</div>';
  }
  return $html;
}

function convert_float($value){
    return floatval(str_replace(',', '.', $value));
}

/**
 * shared_form_input_presque_coller_serrer
 *
 * permet d'aligner 2 champs
 *
 * @param array $element1FormInput
 * @param array $element2FormInput
 *
 * @return string
 *
 */
function shared_form_input_presque_coller_serrer($element1FormInput, $element2FormInput) {
  $html = '';

  if ($element1FormInput && $element2FormInput) {
    $html = '<div class="form-item form-type-textfield form-item-'.str_replace('_', '-', $element1FormInput['#name']).'" presque-cc-items>';
    $html .= '<label class="presque-cc-label" for="'.$element1FormInput['#id'].'">' . $element1FormInput['#title'] . '</label>';
    $html .= '<div class="presque-cc">';
    $html .= '<div class="presque-cc-1">';
    $html .= theme('textfield', $element1FormInput);
    if (isset($element1FormInput['#field_suffix'])) {
      $html .= '<span class="field-suffix">'.$element1FormInput['#field_suffix'].'</span>';
    }
    $html .= '</div>';
    $html .= '<div class="presque-cc-2">';
    $html .= theme('textfield', $element2FormInput);
    if (isset($element2FormInput['#field_suffix'])) {
      $html .= '<span class="field-suffix">'.$element2FormInput['#field_suffix'].'</span>';
    }
    $html .= '</div></div>';
    if (form_get_error($element1FormInput)
        || form_get_error($element2FormInput)) {
          $html .= '<div class="messages-inline">'.form_get_error($element1FormInput)
          . form_get_error($element2FormInput).'</div>';
        }
        $html .= '</div>';
  }
  return $html;
}


/**
 * shared_form_view_input
 *
 * Faire l'html pour view input
 *
 * @param array $elementFormInput
 *
 * @return string
 *
 */
function shared_form_view_input($elementFormInput) {
  $html = '<div class="form-view">';
  $html .= '<label for="'.$elementFormInput['#id'].'">' . $elementFormInput['#title'] . '</label>';
  $html .= '<div class="view-value">' . $elementFormInput['#value'] . '</div>';
  $html .= '</div>';
  return $html;
}

/**
 * shared_form_view_select
 *
 * Faire l'html pour view select
 *
 * @param array $elementFormInput
 *
 * @return string
 *
 */
function shared_form_view_select($elementFormSelect) {

  $value = $elementFormSelect['#options'][$elementFormSelect['#value']];
  $html = '<div class="form-view">';
  $html .= '<label for="'.$elementFormSelect['#id'].'">' . $elementFormSelect['#title'] . '</label>';
  $html .= '<div class="view-value">' . $value . '</div>';
  $html .= '</div>';
  return $html;
}


/**
 * shared_form_view_input
 *
 * Faire l'html pour view input
 *
 * @param array $elementFormInput
 *
 * @return string
 *
 */
function shared_form_view_input_compte($elementFormInput) {
  $html = '<div class="form-view">';
  //   $html .= '<label for="'.$elementFormInput['#id'].'">' . $elementFormInput['#title'] . '</label>';
  $html .= '<div class="view-value">' . $elementFormInput['#value'] . '</div>';
  $html .= '</div>';
  return $html;
}

/**
 * shared_form_view_select
 *
 * Faire l'html pour view select
 *
 * @param array $elementFormInput
 *
 * @return string
 *
 */
function shared_form_view_select_compte($elementFormSelect) {

  $value = $elementFormSelect['#options'][$elementFormSelect['#value']];
  $html = '<div class="form-view">';
  //   $html .= '<label for="'.$elementFormSelect['#id'].'">' . $elementFormSelect['#title'] . '</label>';
  $html .= '<div class="view-value">' . $value . '</div>';
  $html .= '</div>';
  return $html;
}


function shared_clean_file_name($file_name) {
  $file_name = strtolower(str_replace(" ", "", trim($file_name)));
  $file_name = strtr($file_name, 'ÁÀÂÄÃÅÇÉÈÊËÍÏÎÌÑÓÒÔÖÕÚÙÛÜÝ', 'AAAAAACEEEEEIIIINOOOOOUUUUY');
  $file_name = strtr($file_name, 'áàâäãåçéèêëíìîïñóòôöõúùûüýÿ', 'aaaaaaceeeeiiiinooooouuuuyy');
  return $file_name;
}

/**
 * shared_form_view_checkboxes
 *
 * Faire l'html pour view checkbox
 *
 * @param array $elementFormInput
 *
 * @return string
 *
 */
function shared_form_view_checkboxes($elementFormInput) {
  $html = '<div class="form-view">';
  $html .= '<label for="'.$elementFormInput['#id'].'">' . $elementFormInput['#title'] . '</label>';
  foreach ($elementFormInput['#options'] as $key => $value) {
    if (array_key_exists($key, $elementFormInput['#value'])) {
      $html .= '<div class="view-checkbox-value view-checked">' . $elementFormInput['#options'][$key] . '</div>';
    } else {
      $html .= '<div class="view-checkbox-value view-not-checked">' . $elementFormInput['#options'][$key] . '</div>';
    }
  }
  $html .= '</div>';
  return $html;
}


/**
 * shared_form_view_checkboxes
 *
 * Faire l'html pour view checkbox
 *
 * @param array $elementFormInput
 *
 * @return string
 *
 */
function shared_form_view_checkboxes_compte($elementFormInput) {
  $html = '<div class="form-view">';
  $html .= '<label for="'.$elementFormInput['#id'].'">' . $elementFormInput['#title'] . '</label>';
  foreach ($elementFormInput['#options'] as $key => $value) {
    if (array_key_exists($key, $elementFormInput['#value'])) {
      $html .= '<div class="view-checkbox-value view-checked">' . $elementFormInput['#options'][$key] . '</div>';
    }
  }
  $html .= '</div>';
  return $html;
}


#field_suffix

// <div class="form-item form-type-textfield form-item-duration-main-learning">
// <label for="edit-duration-main-learning">dont enseignements généraux<span class="label-suffix">en heures</span></label>
// <input type="text" id="edit-duration-main-learning" name="duration_main_learning" value="-1" size="60" maxlength="128" class="form-text error">
//   <span class="field-suffix">
//     <a id="duration_main_learning_info" class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-original-title="le message Explication des heures" style="float:none;">
//     </a>
//   </span>
// <div class="messages-inline">Le champ dont enseignements généraux&lt;span class="label-suffix"&gt;en heures&lt;/span&gt; doit comprendre une valeur numéraire positive</div></div>

