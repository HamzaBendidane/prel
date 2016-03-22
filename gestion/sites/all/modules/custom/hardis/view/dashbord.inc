<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 27/08/2015
 * Time: 19:20
 */
class view_dashbord extends list_common{

    public function display(){

        $aes = new tools_token_aes();
         $test = $aes->encrypt('hammza');
        $decript = $aes->decrypt($test);

        $token = new tools_token_token();
        $str = $token->createToken(1);

        return array("page" => current_path().' '.request_path().' '.request_uri() .' '.$test.' '.$decript.' '.$token->createToken(1));
    }
}