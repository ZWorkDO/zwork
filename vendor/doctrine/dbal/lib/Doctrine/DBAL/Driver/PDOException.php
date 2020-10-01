<?php

namespace Doctrine\DBAL\Driver;

use Doctrine\DBAL\Driver\PDO\Exception;

/**
<<<<<<< HEAD
 * @deprecated Use {@link Exception} instead
=======
 * Tiny wrapper for PDOException instances to implement the {@link DriverException} interface.
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
 *
 * @psalm-immutable
 */
class PDOException extends \PDOException implements DriverException
{
    /**
     * The driver specific error code.
     *
     * @var int|string|null
     */
    private $errorCode;

    /**
     * The SQLSTATE of the driver.
     *
     * @var string|null
     */
    private $sqlState;

    /**
     * @param \PDOException $exception The PDO exception to wrap.
     */
    public function __construct(\PDOException $exception)
    {
        parent::__construct($exception->getMessage(), 0, $exception);

        $this->code      = $exception->getCode();
        $this->errorInfo = $exception->errorInfo;
        $this->errorCode = $exception->errorInfo[1] ?? $exception->getCode();
        $this->sqlState  = $exception->errorInfo[0] ?? $exception->getCode();
    }

    /**
     * {@inheritdoc}
     */
    public function getErrorCode()
    {
        return $this->errorCode;
    }

    /**
     * {@inheritdoc}
     */
    public function getSQLState()
    {
        return $this->sqlState;
    }
}
