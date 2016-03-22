<?php
if (!function_exists('opcaim_form_element')) {
    function opcaim_form_element($variables)
    {
        $element = &$variables ['element'];

        // This function is invoked as theme wrapper, but the rendered form element
        // may not necessarily have been processed by form_builder().
        $element += array(
            '#title_display' => 'before',
        );


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
                    $output .= '<div class="control-label">' . $errors[$variables['element']['#name']] . '</div>';

                }
            }
        }

        $output .= "</div>\n";

        return $output;
    }
}
function login_form($form, &$form_state) {
  $form['username'] = array(
      '#type' => 'textfield',
      '#title' => t('Votre compte'),
      '#attributes' => array('class' => array('form-username')),
  );
  $form['password'] = array(
      '#type' => 'password',
      '#title' => t('Votre mot de passe'),
      '#attributes' => array('class' => array('form-password')),
  );
  $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('OK'),
      '#attributes' => array('class' => array('btn')),
  );

  return $form;
}


function login_site_form($form, &$form_state) {

    $form['username'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array('class' => array('form-username'),'placeholder' => 'IDENTIFIANT'),
    );
    $form['password'] = array(
        '#type' => 'password',
        '#title' => t(''),
        '#attributes' => array('class' => array('form-password'),'placeholder' => 'MOT DE PASSE'),
    );
    $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('CONNEXION'),
        '#attributes' => array('class' => array('btn-xxx')),
        '#submit' => array('check_login_submit'),
    );

    return $form;
}

function password_form_site($form, &$form_state) {

    $form['username'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array('class' => array('form-username'),'placeholder' => 'IDENTIFIANT'),
    );

    $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Valider'),
        '#attributes' => array('class' => array('btn-xxx')),
        '#submit' => array('password_forgot'),
    );

    return $form;
}
function login_password_forgot_form($form, &$form_state) {

  $form['email'] = array(
      '#type' => 'textfield',
      '#attributes' => array(
          'class' => array('form-email'),
          'placeholder' => array('Email')
      
      ),
  );
  $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('OK'),
      '#attributes' => array('class' => array('btn')),
  );
  return $form;
}