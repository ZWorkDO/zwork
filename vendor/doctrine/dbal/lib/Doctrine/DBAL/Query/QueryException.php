<?php

namespace Doctrine\DBAL\Query;

<<<<<<< HEAD
use Doctrine\DBAL\Exception;
=======
use Doctrine\DBAL\DBALException;
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94

use function implode;

/**
 * @psalm-immutable
 */
<<<<<<< HEAD
class QueryException extends Exception
=======
class QueryException extends DBALException
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
{
    /**
     * @param string   $alias
     * @param string[] $registeredAliases
     *
     * @return QueryException
     */
    public static function unknownAlias($alias, $registeredAliases)
    {
        return new self("The given alias '" . $alias . "' is not part of " .
            'any FROM or JOIN clause table. The currently registered ' .
            'aliases are: ' . implode(', ', $registeredAliases) . '.');
    }

    /**
     * @param string   $alias
     * @param string[] $registeredAliases
     *
     * @return QueryException
     */
    public static function nonUniqueAlias($alias, $registeredAliases)
    {
        return new self("The given alias '" . $alias . "' is not unique " .
            'in FROM and JOIN clause table. The currently registered ' .
            'aliases are: ' . implode(', ', $registeredAliases) . '.');
    }
}
