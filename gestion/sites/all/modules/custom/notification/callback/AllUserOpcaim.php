<?php
/**
 *
 * @author RME
 *
 */
class AllUserOpcaim extends AbstractCallback
{

    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     *
     * Fonction pour récupérer tous les utilisateurs OPCAIM
     *
     */
    public function getListeUser() {

        $users = array();

        db_set_active();

        $rids = array (
                6, // ADMIN OPCAIM
                13 // SUPER ADMIN OPCAIM
        );

        $query = db_select('users_roles', 'ur')
                    ->fields('ur', array('uid'))
                    ->condition('rid', $rids, 'IN');

        $results = $query->execute()->fetchAll();

        foreach ($results as $result) {
            $users[] = $result->uid;
        }

        $users = array_unique($users);

        return $users;

    }

}