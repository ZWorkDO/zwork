<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dataproc/v1/workflow_templates.proto

namespace Google\Cloud\Dataproc\V1;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * The cluster operation triggered by a workflow.
 *
 * Generated from protobuf message <code>google.cloud.dataproc.v1.ClusterOperation</code>
 */
class ClusterOperation extends \Google\Protobuf\Internal\Message
{
    /**
     * Output only. The id of the cluster operation.
     *
     * Generated from protobuf field <code>string operation_id = 1;</code>
     */
    private $operation_id = '';
    /**
     * Output only. Error, if operation failed.
     *
     * Generated from protobuf field <code>string error = 2;</code>
     */
    private $error = '';
    /**
     * Output only. Indicates the operation is done.
     *
     * Generated from protobuf field <code>bool done = 3;</code>
     */
    private $done = false;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type string $operation_id
     *           Output only. The id of the cluster operation.
     *     @type string $error
     *           Output only. Error, if operation failed.
     *     @type bool $done
     *           Output only. Indicates the operation is done.
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Google\Cloud\Dataproc\V1\WorkflowTemplates::initOnce();
        parent::__construct($data);
    }

    /**
     * Output only. The id of the cluster operation.
     *
     * Generated from protobuf field <code>string operation_id = 1;</code>
     * @return string
     */
    public function getOperationId()
    {
        return $this->operation_id;
    }

    /**
     * Output only. The id of the cluster operation.
     *
     * Generated from protobuf field <code>string operation_id = 1;</code>
     * @param string $var
     * @return $this
     */
    public function setOperationId($var)
    {
        GPBUtil::checkString($var, True);
        $this->operation_id = $var;

        return $this;
    }

    /**
     * Output only. Error, if operation failed.
     *
     * Generated from protobuf field <code>string error = 2;</code>
     * @return string
     */
    public function getError()
    {
        return $this->error;
    }

    /**
     * Output only. Error, if operation failed.
     *
     * Generated from protobuf field <code>string error = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setError($var)
    {
        GPBUtil::checkString($var, True);
        $this->error = $var;

        return $this;
    }

    /**
     * Output only. Indicates the operation is done.
     *
     * Generated from protobuf field <code>bool done = 3;</code>
     * @return bool
     */
    public function getDone()
    {
        return $this->done;
    }

    /**
     * Output only. Indicates the operation is done.
     *
     * Generated from protobuf field <code>bool done = 3;</code>
     * @param bool $var
     * @return $this
     */
    public function setDone($var)
    {
        GPBUtil::checkBool($var);
        $this->done = $var;

        return $this;
    }

}

