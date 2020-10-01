<?php

namespace Doctrine\DBAL\Driver\PDOSqlsrv;

<<<<<<< HEAD
use Doctrine\DBAL\Driver\PDO;
use Doctrine\DBAL\Driver\Result;
=======
use Doctrine\DBAL\Driver\PDOConnection;
use PDO;
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94

/**
 * Sqlsrv Connection implementation.
 *
 * @deprecated Use {@link PDO\SQLSrv\Connection} instead.
 */
class Connection extends PDO\Connection
{
    /**
     * @internal The connection can be only instantiated by its driver.
     *
     * {@inheritdoc}
     */
    public function __construct($dsn, $user = null, $password = null, ?array $options = null)
    {
        parent::__construct($dsn, $user, $password, $options);
        $this->setAttribute(\PDO::ATTR_STATEMENT_CLASS, [PDO\SQLSrv\Statement::class, []]);
    }

    /**
     * {@inheritDoc}
     */
    public function lastInsertId($name = null)
    {
        if ($name === null) {
            return parent::lastInsertId($name);
        }

        $stmt = $this->prepare('SELECT CONVERT(VARCHAR(MAX), current_value) FROM sys.sequences WHERE name = ?');
        $stmt->execute([$name]);

<<<<<<< HEAD
        if ($stmt instanceof Result) {
            return $stmt->fetchOne();
        }

=======
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
        return $stmt->fetchColumn();
    }
}
