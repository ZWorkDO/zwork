<?php

namespace Doctrine\DBAL\Driver\SQLSrv;

use Doctrine\DBAL\Driver\AbstractSQLServerDriver;
<<<<<<< HEAD
use Doctrine\DBAL\Driver\AbstractSQLServerDriver\Exception\PortWithoutHost;
=======
use Doctrine\DBAL\Driver\AbstractSQLServerDriver\PortWithoutHost;
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94

/**
 * Driver for ext/sqlsrv.
 */
class Driver extends AbstractSQLServerDriver
{
    /**
     * {@inheritdoc}
     */
    public function connect(array $params, $username = null, $password = null, array $driverOptions = [])
    {
        $serverName = '';

        if (isset($params['host'])) {
            $serverName = $params['host'];

            if (isset($params['port'])) {
                $serverName .= ',' . $params['port'];
            }
        } elseif (isset($params['port'])) {
            throw PortWithoutHost::new();
        }

        if (isset($params['dbname'])) {
            $driverOptions['Database'] = $params['dbname'];
        }

        if (isset($params['charset'])) {
            $driverOptions['CharacterSet'] = $params['charset'];
        }

        if ($username !== null) {
            $driverOptions['UID'] = $username;
        }

        if ($password !== null) {
            $driverOptions['PWD'] = $password;
        }

        if (! isset($driverOptions['ReturnDatesAsStrings'])) {
            $driverOptions['ReturnDatesAsStrings'] = 1;
        }

        return new Connection($serverName, $driverOptions);
    }

    /**
     * {@inheritdoc}
     *
     * @deprecated
     */
    public function getName()
    {
        return 'sqlsrv';
    }
}
