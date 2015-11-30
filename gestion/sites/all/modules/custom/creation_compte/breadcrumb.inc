<?php

function creation_compte_get_breadcrumb($etapes, $active_page) {

  $breadcrumb = '<div id="steps" class="clearfix">';

  $i = 1;
  foreach ($etapes as $key => $etape) {
    if (in_array($active_page, $etape)) {
      $breadcrumb .= '<div class="step active">';
    } else {
      $breadcrumb .= '<div class="step">';
    }

    $breadcrumb .= '  <div class="text">' . $key . '</div>';
    $breadcrumb .= '  <div class="number-container">';
    $breadcrumb .= '    <span class="number">'. $i .'</span>';
    $breadcrumb .= '  </div>';
    $breadcrumb .= '  <div class="active-bar"></div>';
    $breadcrumb .= '</div>';

    $i++;
  }

  $breadcrumb .= '<div class="steps-right pull-right">
				<span class="v-aligner"></span><div class="text-container">
					<div class="title">Vous souhaitez créer</div>
					<div class="subtitle">un compte utilisateur</div>
				</div>';
  
  $breadcrumb .= '</div>';
  $breadcrumb .= '  <div class="selector-bar"></div>';
  return $breadcrumb;
}

