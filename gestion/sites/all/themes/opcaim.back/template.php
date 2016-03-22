<?php

function opcaim_js_alter(&$javascript) {
  $jQuery_url = drupal_get_path('theme', 'opcaim') . '/js/jquery-1.11.2.js';
  $javascript['misc/jquery.js']['data']    = $jQuery_url;

  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/ie7.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/bootstrap/js/bootstrap.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/bootstrap-datepicker.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/bootstrap-datepicker.fr.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/jquery-ui.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/jquery.cookie.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/jquery.url.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('module', 'shared') . '/js/shared.js', array('weight' => -1));
  drupal_add_js(drupal_get_path('theme', 'opcaim') . '/js/script.js', array('weight' => -1));
}

function opcaim_select($variables) {
	$element = $variables ['element'];
	element_set_attributes($element, array('id', 'name', 'size'));
	_form_set_class($element, array('form-select'));
	_form_set_class($divelement, array('form-select styled-select'));

	if (in_array('error', $element ['#attributes']['class'])) {
	  _form_set_class($divelement, array('errorCustomSelect'));
	}

	return '<div' . drupal_attributes($divelement ['#attributes']) .'><select' . drupal_attributes($element ['#attributes']) . '>' . form_select_options($element) . '</select></div>';
}

function opcaim_form_element($variables) {
  $element = &$variables ['element'];

  // This function is invoked as theme wrapper, but the rendered form element
  // may not necessarily have been processed by form_builder().
  $element += array(
      '#title_display' => 'before',
  );

  // Add element #id for #type 'item'.
  if (isset($element ['#markup']) && !empty($element ['#id'])) {
    $attributes ['id'] = $element ['#id'];
  }
  // Add element's #type and #name as class to aid with JS/CSS selectors.
  $attributes ['class'] = array('form-item');
  if (!empty($element ['#type'])) {
    $attributes ['class'][] = 'form-type-' . strtr($element ['#type'], '_', '-');
  }
  if (!empty($element ['#name'])) {
    $attributes ['class'][] = 'form-item-' . strtr($element ['#name'], array(' ' => '-', '_' => '-', '[' => '-', ']' => ''));
  }
  // Add a class for disabled elements to facilitate cross-browser styling.
  if (!empty($element ['#attributes']['disabled'])) {
    $attributes ['class'][] = 'form-disabled';
  }
  $output = '<div' . drupal_attributes($attributes) . '>' . "\n";

  // If #title is not set, we don't display any label or required marker.
  if (!isset($element ['#title'])) {
    $element ['#title_display'] = 'none';
  }
  $prefix = isset($element ['#field_prefix']) ? '<span class="field-prefix">' . $element ['#field_prefix'] . '</span> ' : '';
  $suffix = isset($element ['#field_suffix']) ? ' <span class="field-suffix">' . $element ['#field_suffix'] . '</span>' : '';

  switch ($element ['#title_display']) {
  	case 'before':
  	case 'invisible':
  	  $output .= ' ' . theme('form_element_label', $variables);
  	  $output .= ' ' . $prefix . $element ['#children'] . $suffix . "\n";
  	  break;

  	case 'after':
  	  $output .= ' ' . $prefix . $element ['#children'] . $suffix;
  	  $output .= ' ' . theme('form_element_label', $variables) . "\n";
  	  break;

  	case 'none':
  	case 'attribute':
  	  // Output no label and no required marker, only the children.
  	  $output .= ' ' . $prefix . $element ['#children'] . $suffix . "\n";
  	  break;
  }

  if (!empty($element ['#description'])) {
    $output .= '<div class="description">' . $element ['#description'] . "</div>\n";
  }

  $errors = form_get_errors();

  if (isset($variables['element']['#name']) && $errors) {
    if ($variables['element']['#type'] !== 'radio') {
      if (array_key_exists($variables['element']['#name'], $errors)) {
        $class = null;
        if ($variables['element']['#type'] === 'radios') {
          $class = 'messages-inline error-radios';
        } else if ($variables['element']['#type'] === 'file') {
          $class = 'messages-inline-left';
        } else {
          $class = 'messages-inline';
        }
        $output .= '<div class="'.$class.'">' . $errors[$variables['element']['#name']] . '</div>';

      }
    }
  }

  $output .= "</div>\n";

  return $output;
}

function opcaim_preprocess_status_messages(&$variables) {
  $form_errors = form_get_errors();

  // on parcours les erreurs du formulaire pour les retirer de la session
  if (!$form_errors) {
    return;
  }
  foreach ($form_errors as $form_error) {
    if (isset($_SESSION['messages']['error'])) {
      $pos = array_search($form_error, $_SESSION['messages']['error']);
      if ($pos !== FALSE) {
        unset($_SESSION['messages']['error'][$pos]);
      }
    }
  }

  // On fait un unset si on a plus d'erreur, sinon on a l'affichage de la div
  if (empty($_SESSION['messages']['error'])) {
    unset($_SESSION['messages']['error']);
  }
}



function opcaim_form_element_label($variables) {
  $element = $variables ['element'];
  
  // This is also used in the installer, pre-database setup.
  $t = get_t();

  // If title and required marker are both empty, output no label.
  if ((!isset($element ['#title']) || $element ['#title'] === '') && empty($element ['#required'])) {
    return '';
  }

  // If the element is required, a required marker is appended to the label.
  $required = !empty($element ['#required']) ? theme('form_required_marker', array('element' => $element)) : '';

  $title = filter_xss_admin($element ['#title']);

  $attributes = array();
  // Style the label as class option to display inline with the element.
  if ($element ['#title_display'] == 'after') {
    $attributes ['class'] = 'option';
  }
  // Show label only to screen readers to avoid disruption in visual flows.
  elseif ($element ['#title_display'] == 'invisible') {
    $attributes ['class'] = 'element-invisible';
  }

  if (!empty($element ['#id'])) {
    $attributes ['for'] = $element ['#id'];
  }
  
  // Ajout d'un trim dans les balises label
  // The leading whitespace helps visually separate fields from inline labels.
  return ' <label' . drupal_attributes($attributes) . '>' . trim($t('!title !required', array('!title' => $title, '!required' => $required))) . "</label>\n";
}