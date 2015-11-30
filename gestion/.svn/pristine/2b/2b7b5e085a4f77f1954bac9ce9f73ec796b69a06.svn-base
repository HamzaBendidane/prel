<?php
/**
 *
 * @author RME
 *
 */
class AllUserAdefim extends AbstractCallback
{

    /**
     * (non-PHPdoc)
     * @see AbstractCallback::getListeUser()
     *
     * Fonction pour récupérer tous les utilisateurs ADEFIM
     *
     */
    public function getListeUser() {

        $users = array();

        db_set_active();

        $rids = array (
                8,  // CONSEILLER ADEFIM
                9,  // DIRECTEUR ADEFIM
                10, // GESTIONNAIRE ADEFIM
                12, // REFERENT ADEFIM
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