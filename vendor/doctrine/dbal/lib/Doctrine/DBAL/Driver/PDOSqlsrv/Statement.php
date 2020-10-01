<?php

namespace Doctrine\DBAL\Driver\PDOSqlsrv;

use Doctrine\DBAL\Driver\PDO;
use Doctrine\DBAL\ParameterType;

/**
 * PDO SQL Server Statement
 *
 * @deprecated Use {@link PDO\SQLSrv\Statement} instead.
 */
class Statement extends PDO\Statement
{
    /**
     * {@inheritdoc}
     */
    public function bindParam($param, &$variable, $type = ParameterType::STRING, $length = null, $driverOptions = null)
    {
<<<<<<< HEAD
        switch ($type) {
            case ParameterType::LARGE_OBJECT:
            case ParameterType::BINARY:
                if ($driverOptions === null) {
                    $driverOptions = \PDO::SQLSRV_ENCODING_BINARY;
                }

                break;

            case ParameterType::ASCII:
                $type          = ParameterType::STRING;
                $length        = 0;
                $driverOptions = \PDO::SQLSRV_ENCODING_SYSTEM;
                break;
=======
        if (
            ($type === ParameterType::LARGE_OBJECT || $type === ParameterType::BINARY)
            && $driverOptions === null
        ) {
            $driverOptions = PDO::SQLSRV_ENCODING_BINARY;
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
        }

        return parent::bindParam($param, $variable, $type, $length, $driverOptions);
    }

    /**
     * {@inheritdoc}
     */
    public function bindValue($param, $value, $type = ParameterType::STRING)
    {
        return $this->bindParam($param, $value, $type);
    }
}
