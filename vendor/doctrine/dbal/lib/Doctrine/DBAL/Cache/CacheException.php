<?php

namespace Doctrine\DBAL\Cache;

use Doctrine\DBAL\Exception;

/**
 * @psalm-immutable
 */
<<<<<<< HEAD
class CacheException extends Exception
=======
class CacheException extends DBALException
>>>>>>> 002e7d8d0185d58fb9bd541347c9eeaa0d429d94
{
    /**
     * @return CacheException
     */
    public static function noCacheKey()
    {
        return new self('No cache key was set.');
    }

    /**
     * @return CacheException
     */
    public static function noResultDriverConfigured()
    {
        return new self('Trying to cache a query but no result driver is configured.');
    }
}
