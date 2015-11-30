<?php

function shared_cache_get($key){
    if (function_exists('wincache_ucache_get')){
        return wincache_ucache_get(md5($key));
    }return false;
}

function shared_cache_set($key,$data){

    if (function_exists('wincache_ucache_set')){
        return wincache_ucache_set(md5($key),$data);
    }return false;
}

function shared_array_search($from,$needle,$array){
    $aReturn = array();
    foreach($array as $key => $value){
        if (stripos($value->$from,$needle) !== false ){
            $aReturn[] = $value;
        }
    }
    return $aReturn;
}