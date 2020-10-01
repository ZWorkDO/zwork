<?php

namespace Doctrine\DBAL\Driver\OCI8;

use Doctrine\DBAL\Driver\AbstractDriverException;

/**
<<<<<<< HEAD
 * @deprecated Use {@link Exception} instead
 *
=======
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
 * @psalm-immutable
 */
class OCI8Exception extends AbstractDriverException
{
    /**
     * @param mixed[]|false $error
     *
     * @return OCI8Exception
     */
    public static function fromErrorInfo($error)
    {
        if ($error === false) {
            return new self('Database error occurred but no error information was retrieved from the driver.');
        }

        return new self($error['message'], null, $error['code']);
    }
}
