<?php

function delete_lieu() {

  if ($_GET['id']){
    $lieu = new db_lieu();
    $lieu->delete($_GET['id']);
    drupal_set_message('je suis trop fort');
    drupal_goto('/lieux_list' );
  }

}

function del_animateur() {

  if ($_GET['id']){
    $lieu = new db_animateur();
    $lieu->delete($_GET['id']);
    drupal_set_message('je suis trop fort');
    drupal_goto('/animateurslist' );
  }

}


function delete_stage() {

  if ($_GET['id']){
    $lieu = new db_stage();
    $lieu->delete($_GET['id']);
    drupal_set_message('je suis trop fort');
    drupal_goto('/stage_list' );
  }

}