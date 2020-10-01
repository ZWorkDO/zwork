<?php

namespace Doctrine\DBAL\Driver\OCI8;

use Doctrine\DBAL\Driver\AbstractOracleDriver;
<<<<<<< HEAD
use Doctrine\DBAL\Exception;
=======
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94

use const OCI_NO_AUTO_COMMIT;

/**
 * A Doctrine DBAL driver for the Oracle OCI8 PHP extensions.
 */
class Driver extends AbstractOracleDriver
{
    /**
     * {@inheritdoc}
     */
    public function connect(array $params, $username = null, $password = null, array $driverOptions = [])
    {
        try {
            return new Connection(
                (string) $username,
                (string) $password,
                $this->_constructDsn($params),
                $params['charset'] ?? '',
                $params['sessionMode'] ?? OCI_NO_AUTO_COMMIT,
                $params['persistent'] ?? false
            );
        } catch (OCI8Exception $e) {
            throw Exception::driverException($this, $e);
        }
    }

    /**
     * Constructs the Oracle DSN.
     *
     * @param mixed[] $params
     *
     * @return string The DSN.
     */
    protected function _constructDsn(array $params)
    {
        return $this->getEasyConnectString($params);
    }

    /**
     * {@inheritdoc}
     *
     * @deprecated
     */
    public function getName()
    {
        return 'oci8';
    }
}
