<?php

function dgf_get_breadcrumb($etapes, $form_id_en_cours) {

  $breadcrumb = '<div id="steps" class="clearfix">';

  $i = 1;
  foreach ($etapes as $key => $etape) {
    if (in_array($form_id_en_cours, $etape)) {
      $breadcrumb .= '<div class="step active">';
    } else {
      $breadcrumb .= '<div class="step">';
    }

    $breadcrumb .= '  <div class="text">' . $key . '</div>';
    $breadcrumb .= '  <div class="number-container">';
    $breadcrumb .= '    <span class="number">'. $i .'</span>';
    $breadcrumb .= '  </div>';
    $breadcrumb .= '  <div class="selector-bar"></div>';
    $breadcrumb .= '</div>';

    $i++;
  }
  $breadcrumb .= '</div>';

  return $breadcrumb;
}

