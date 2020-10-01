<?php

namespace Doctrine\DBAL\Driver\SQLSrv;

use Doctrine\DBAL\Driver\AbstractDriverException;
<<<<<<< HEAD
use Doctrine\DBAL\Driver\SQLSrv\Exception\Error;

/**
 * @deprecated Use {@link Exception} instead
 *
=======

use function rtrim;
use function sqlsrv_errors;

use const SQLSRV_ERR_ERRORS;

/**
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
 * @psalm-immutable
 */
class SQLSrvException extends AbstractDriverException
{
    /**
     * Helper method to turn sql server errors into exception.
     *
     * @return SQLSrvException
     */
    public static function fromSqlSrvErrors()
    {
        return Error::new();
    }
}
