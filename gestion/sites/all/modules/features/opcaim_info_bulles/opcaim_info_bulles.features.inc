<?php
/**
 * @file
 * opcaim_info_bulles.features.inc
 */

/**
 * Implements hook_node_info().
 */
function opcaim_info_bulles_node_info() {
  $items = array(
    'info_bulle' => array(
      'name' => t('Info_bulle'),
      'base' => 'node_content',
      'description' => t('Message des infos-bulles'),
      'has_title' => '1',
      'title_label' => t('Titre'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
