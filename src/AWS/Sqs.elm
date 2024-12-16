module AWS.Sqs exposing
    ( service
    , addPermission, cancelMessageMoveTask, changeMessageVisibility, changeMessageVisibilityBatch, createQueue, deleteMessage
    , deleteMessageBatch, deleteQueue, getQueueAttributes, getQueueUrl, listDeadLetterSourceQueues, listMessageMoveTasks, listQueueTags
    , listQueues, purgeQueue, receiveMessage, removePermission, sendMessage, sendMessageBatch, setQueueAttributes, startMessageMoveTask
    , tagQueue, untagQueue
    , ActionNameList, AddPermissionRequest, AttributeNameList, AwsaccountIdList, BatchResultErrorEntry, BatchResultErrorEntryList
    , BinaryList, CancelMessageMoveTaskRequest, CancelMessageMoveTaskResult, ChangeMessageVisibilityBatchRequest
    , ChangeMessageVisibilityBatchRequestEntry, ChangeMessageVisibilityBatchRequestEntryList, ChangeMessageVisibilityBatchResult
    , ChangeMessageVisibilityBatchResultEntry, ChangeMessageVisibilityBatchResultEntryList, ChangeMessageVisibilityRequest
    , CreateQueueRequest, CreateQueueResult, DeleteMessageBatchRequest, DeleteMessageBatchRequestEntry
    , DeleteMessageBatchRequestEntryList, DeleteMessageBatchResult, DeleteMessageBatchResultEntry, DeleteMessageBatchResultEntryList
    , DeleteMessageRequest, DeleteQueueRequest, GetQueueAttributesRequest, GetQueueAttributesResult, GetQueueUrlRequest
    , GetQueueUrlResult, ListDeadLetterSourceQueuesRequest, ListDeadLetterSourceQueuesResult, ListMessageMoveTasksRequest
    , ListMessageMoveTasksResult, ListMessageMoveTasksResultEntry, ListMessageMoveTasksResultEntryList, ListQueueTagsRequest
    , ListQueueTagsResult, ListQueuesRequest, ListQueuesResult, Message, MessageAttributeNameList, MessageAttributeValue
    , MessageBodyAttributeMap, MessageBodySystemAttributeMap, MessageList, MessageSystemAttributeList, MessageSystemAttributeMap
    , MessageSystemAttributeName(..), MessageSystemAttributeNameForSends(..), MessageSystemAttributeValue, PurgeQueueRequest
    , QueueAttributeMap, QueueAttributeName(..), QueueUrlList, ReceiveMessageRequest, ReceiveMessageResult, RemovePermissionRequest
    , SendMessageBatchRequest, SendMessageBatchRequestEntry, SendMessageBatchRequestEntryList, SendMessageBatchResult
    , SendMessageBatchResultEntry, SendMessageBatchResultEntryList, SendMessageRequest, SendMessageResult, SetQueueAttributesRequest
    , StartMessageMoveTaskRequest, StartMessageMoveTaskResult, StringList, TagKeyList, TagMap, TagQueueRequest, UntagQueueRequest
    , messageSystemAttributeName, messageSystemAttributeNameForSends, queueAttributeName
    )

{-| Welcome to the Amazon SQS API Reference.

Amazon SQS is a reliable, highly-scalable hosted queue for storing messages as they travel between applications or microservices. Amazon SQS moves data between distributed application components and helps you decouple these components.

For information on the permissions you need to use this API, see `Identity and access management` in the Amazon SQS Developer Guide.

You can use `Amazon Web Services SDKs` to access Amazon SQS using your favorite programming language. The SDKs perform tasks such as the following automatically:

  - Cryptographically sign your service requests Retry requests Handle error responses

Additional information

  -     `Amazon SQS Product Page`     Amazon SQS Developer Guide     `Making API Requests`     `Amazon SQS Message Attributes`     `Amazon SQS Dead-Letter Queues`       Amazon SQS in the Command Line Interface` `     Amazon Web Services General Reference     `Regions and Endpoints`


# Service definition.

@docs service


# Service endpoints.

@docs addPermission, cancelMessageMoveTask, changeMessageVisibility, changeMessageVisibilityBatch, createQueue, deleteMessage
@docs deleteMessageBatch, deleteQueue, getQueueAttributes, getQueueUrl, listDeadLetterSourceQueues, listMessageMoveTasks, listQueueTags
@docs listQueues, purgeQueue, receiveMessage, removePermission, sendMessage, sendMessageBatch, setQueueAttributes, startMessageMoveTask
@docs tagQueue, untagQueue


# API data model.

@docs ActionNameList, AddPermissionRequest, AttributeNameList, AwsaccountIdList, BatchResultErrorEntry, BatchResultErrorEntryList
@docs BinaryList, CancelMessageMoveTaskRequest, CancelMessageMoveTaskResult, ChangeMessageVisibilityBatchRequest
@docs ChangeMessageVisibilityBatchRequestEntry, ChangeMessageVisibilityBatchRequestEntryList, ChangeMessageVisibilityBatchResult
@docs ChangeMessageVisibilityBatchResultEntry, ChangeMessageVisibilityBatchResultEntryList, ChangeMessageVisibilityRequest
@docs CreateQueueRequest, CreateQueueResult, DeleteMessageBatchRequest, DeleteMessageBatchRequestEntry
@docs DeleteMessageBatchRequestEntryList, DeleteMessageBatchResult, DeleteMessageBatchResultEntry, DeleteMessageBatchResultEntryList
@docs DeleteMessageRequest, DeleteQueueRequest, GetQueueAttributesRequest, GetQueueAttributesResult, GetQueueUrlRequest
@docs GetQueueUrlResult, ListDeadLetterSourceQueuesRequest, ListDeadLetterSourceQueuesResult, ListMessageMoveTasksRequest
@docs ListMessageMoveTasksResult, ListMessageMoveTasksResultEntry, ListMessageMoveTasksResultEntryList, ListQueueTagsRequest
@docs ListQueueTagsResult, ListQueuesRequest, ListQueuesResult, Message, MessageAttributeNameList, MessageAttributeValue
@docs MessageBodyAttributeMap, MessageBodySystemAttributeMap, MessageList, MessageSystemAttributeList, MessageSystemAttributeMap
@docs MessageSystemAttributeName, MessageSystemAttributeNameForSends, MessageSystemAttributeValue, PurgeQueueRequest
@docs QueueAttributeMap, QueueAttributeName, QueueUrlList, ReceiveMessageRequest, ReceiveMessageResult, RemovePermissionRequest
@docs SendMessageBatchRequest, SendMessageBatchRequestEntry, SendMessageBatchRequestEntryList, SendMessageBatchResult
@docs SendMessageBatchResultEntry, SendMessageBatchResultEntryList, SendMessageRequest, SendMessageResult, SetQueueAttributesRequest
@docs StartMessageMoveTaskRequest, StartMessageMoveTaskResult, StringList, TagKeyList, TagMap, TagQueueRequest, UntagQueueRequest
@docs messageSystemAttributeName, messageSystemAttributeNameForSends, queueAttributeName

-}

import AWS.Config
import AWS.Http
import AWS.KVDecode exposing (KVDecoder)
import AWS.Service
import Codec exposing (Codec)
import Dict exposing (Dict)
import Dict.Enum
import Enum exposing (Enum)
import Json.Decode exposing (Decoder, Value)
import Json.Decode.Pipeline as Pipeline
import Json.Encode exposing (Value)
import Json.Encode.Optional as EncodeOpt


{-| Configuration for this service.
-}
service : AWS.Config.Region -> AWS.Service.Service
service region =
    AWS.Config.defineRegional "sqs" "2012-11-05" AWS.Config.JSON AWS.Config.SignV4 region
        |> AWS.Config.withJsonVersion "1.0"
        |> AWS.Config.withTargetPrefix "AmazonSQS"
        |> AWS.Service.service


{-| Remove cost allocation tags from the specified Amazon SQS queue. For an overview, see `Tagging Your Amazon SQS Queues` in the Amazon SQS Developer Guide.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.

-}
untagQueue : UntagQueueRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
untagQueue req =
    let
        encoder val =
            [ ( "TagKeys", val.tagKeys ) |> EncodeOpt.field tagKeyListEncoder
            , ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "UntagQueue" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Add cost allocation tags to the specified Amazon SQS queue. For an overview, see `Tagging Your Amazon SQS Queues` in the Amazon SQS Developer Guide.

When you use queue tags, keep the following guidelines in mind:

  - Adding more than 50 tags to a queue isn't recommended. Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings. Tags are case-sensitive. A new tag with a key identical to that of an existing tag overwrites the existing tag.

For a full list of tag restrictions, see `Quotas related to queues` in the Amazon SQS Developer Guide.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.

-}
tagQueue : TagQueueRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
tagQueue req =
    let
        encoder val =
            [ ( "Tags", val.tags ) |> EncodeOpt.field (Codec.encoder tagMapCodec)
            , ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "TagQueue" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Starts an asynchronous task to move messages from a specified source queue to a specified destination queue.

  -     This action is currently limited to supporting message redrive from queues that are configured as `dead-letter queues (DLQs)` of other Amazon SQS queues only. Non-SQS queue sources of dead-letter queues, such as Lambda or Amazon SNS topics, are currently not supported.   In dead-letter queues redrive context, the `StartMessageMoveTask` the source queue is the DLQ, while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.   Only one active message movement task is supported per queue at any given time.

-}
startMessageMoveTask : StartMessageMoveTaskRequest -> AWS.Http.Request AWS.Http.AWSAppError StartMessageMoveTaskResult
startMessageMoveTask req =
    let
        encoder val =
            [ ( "SourceArn", val.sourceArn ) |> EncodeOpt.field Json.Encode.string
            , ( "MaxNumberOfMessagesPerSecond", val.maxNumberOfMessagesPerSecond )
                |> EncodeOpt.optionalField Json.Encode.int
            , ( "DestinationArn", val.destinationArn ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskHandleFld -> { taskHandle = taskHandleFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "TaskHandle" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "StartMessageMoveTask" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Sets the value of one or more queue attributes, like a policy. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the `MessageRetentionPeriod` attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the `MessageRetentionPeriod` is reduced below the age of existing messages.

  -     In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.   Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.   To remove the ability to change queue permissions, you must deny permission to the `AddPermission`, `RemovePermission`, and `SetQueueAttributes` actions in your IAM policy.

-}
setQueueAttributes : SetQueueAttributesRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
setQueueAttributes req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "Attributes", val.attributes ) |> EncodeOpt.field (Codec.encoder queueAttributeMapCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "SetQueueAttributes" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| You can use `SendMessageBatch` to send up to 10 messages to the specified queue by assigning either identical or different values to each message (or by not assigning values at all). This is a batch version of `SendMessage``.` For a FIFO queue, multiple messages within a single batch are enqueued in the order they are sent.

The result of sending each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of `200`.

The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KiB (262,144 bytes).

A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the `W3C specification for characters`. `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` | `#x10000` to `#x10FFFF` Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with `U+FFFD` before storing the message in the queue, as long as the message body contains at least one valid character.

If you don't specify the `DelaySeconds` parameter for an entry, Amazon SQS uses the default value for the queue.

-}
sendMessageBatch : SendMessageBatchRequest -> AWS.Http.Request AWS.Http.AWSAppError SendMessageBatchResult
sendMessageBatch req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "Entries", val.entries ) |> EncodeOpt.field sendMessageBatchRequestEntryListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\successfulFld failedFld -> { failed = failedFld, successful = successfulFld }) |> Json.Decode.succeed)
                |> Pipeline.required "Successful" sendMessageBatchResultEntryListDecoder
                |> Pipeline.required "Failed" batchResultErrorEntryListDecoder
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "SendMessageBatch" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Delivers a message to the specified queue.

A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the `W3C specification for characters`. `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` | `#x10000` to `#x10FFFF` Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with `U+FFFD` before storing the message in the queue, as long as the message body contains at least one valid character.

-}
sendMessage : SendMessageRequest -> AWS.Http.Request AWS.Http.AWSAppError SendMessageResult
sendMessage req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "MessageSystemAttributes", val.messageSystemAttributes )
                |> EncodeOpt.optionalField messageBodySystemAttributeMapEncoder
            , ( "MessageGroupId", val.messageGroupId ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "MessageDeduplicationId", val.messageDeduplicationId ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "MessageBody", val.messageBody ) |> EncodeOpt.field Json.Encode.string
            , ( "MessageAttributes", val.messageAttributes )
                |> EncodeOpt.optionalField (Codec.encoder messageBodyAttributeMapCodec)
            , ( "DelaySeconds", val.delaySeconds ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\sequenceNumberFld messageIdFld md5OfMessageSystemAttributesFld md5OfMessageBodyFld md5OfMessageAttributesFld ->
                { md5OfMessageAttributes = md5OfMessageAttributesFld
                , md5OfMessageBody = md5OfMessageBodyFld
                , md5OfMessageSystemAttributes = md5OfMessageSystemAttributesFld
                , messageId = messageIdFld
                , sequenceNumber = sequenceNumberFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "SequenceNumber" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "MessageId" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "MD5OfMessageSystemAttributes" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "MD5OfMessageBody" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "MD5OfMessageAttributes" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "SendMessage" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Revokes any permissions in the queue policy that matches the specified `Label` parameter.

  -     Only the owner of a queue can remove permissions from it.   Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.   To remove the ability to change queue permissions, you must deny permission to the `AddPermission`, `RemovePermission`, and `SetQueueAttributes` actions in your IAM policy.

-}
removePermission : RemovePermissionRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
removePermission req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "Label", val.label ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "RemovePermission" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves one or more messages (up to 10), from the specified queue. Using the `WaitTimeSeconds` parameter enables long-poll support. For more information, see `Amazon SQS Long Polling` in the Amazon SQS Developer Guide.

Short poll is the default behavior where a weighted random set of machines is sampled on a `ReceiveMessage` call. Thus, only the messages on the sampled machines are returned. If the number of messages in the queue is small (fewer than 1,000), you most likely get fewer messages than you requested per `ReceiveMessage` call. If the number of messages in the queue is extremely small, you might not receive any messages in a particular `ReceiveMessage` response. If this happens, repeat the request.

For each message returned, the response includes the following:

  - The message body. An MD5 digest of the message body. For information about MD5, see `RFC1321`. The `MessageId` you received when you sent the message to the queue. The receipt handle. The message attributes. An MD5 digest of the message attributes.

The receipt handle is the identifier you must provide when deleting the message. For more information, see `Queue and Message Identifiers` in the Amazon SQS Developer Guide.

You can provide the `VisibilityTimeout` parameter in your request. The parameter is applied to the messages that Amazon SQS returns in the response. If you don't include the parameter, the overall visibility timeout for the queue is used for the returned messages. For more information, see `Visibility Timeout` in the Amazon SQS Developer Guide.

A message that isn't deleted or a message whose visibility isn't extended before the visibility timeout expires counts as a failed receive. Depending on the configuration of the queue, the message might be sent to the dead-letter queue.

In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.

-}
receiveMessage : ReceiveMessageRequest -> AWS.Http.Request AWS.Http.AWSAppError ReceiveMessageResult
receiveMessage req =
    let
        encoder val =
            [ ( "WaitTimeSeconds", val.waitTimeSeconds ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "VisibilityTimeout", val.visibilityTimeout ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "ReceiveRequestAttemptId", val.receiveRequestAttemptId ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "MessageSystemAttributeNames", val.messageSystemAttributeNames )
                |> EncodeOpt.optionalField messageSystemAttributeListEncoder
            , ( "MessageAttributeNames", val.messageAttributeNames )
                |> EncodeOpt.optionalField messageAttributeNameListEncoder
            , ( "MaxNumberOfMessages", val.maxNumberOfMessages ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "AttributeNames", val.attributeNames ) |> EncodeOpt.optionalField attributeNameListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\messagesFld -> { messages = messagesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Messages" (Json.Decode.maybe messageListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ReceiveMessage" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes available messages in a queue (including in-flight messages) specified by the `QueueURL` parameter.

When you use the `PurgeQueue` action, you can't retrieve any messages deleted from a queue. The message deletion process takes up to 60 seconds. We recommend waiting for 60 seconds regardless of your queue's size.

Messages sent to the queue before you call `PurgeQueue` might be received but are deleted within the next minute.

Messages sent to the queue after you call `PurgeQueue` might be deleted while the queue is being purged.

-}
purgeQueue : PurgeQueueRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
purgeQueue req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "PurgeQueue" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of your queues in the current region. The response includes a maximum of 1,000 results. If you specify a value for the optional `QueueNamePrefix` parameter, only queues with a name that begins with the specified value are returned.

The `listQueues` methods supports pagination. Set parameter `MaxResults` in the request to specify the maximum number of results to be returned in the response. If you do not set `MaxResults`, the response includes a maximum of 1,000 results. If you set `MaxResults` and there are additional results to display, the response includes a value for `NextToken`. Use `NextToken` as a parameter in your next request to `listQueues` to receive the next page of results.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.

-}
listQueues : ListQueuesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListQueuesResult
listQueues req =
    let
        encoder val =
            [ ( "QueueNamePrefix", val.queueNamePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "MaxResults", val.maxResults ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\queueUrlsFld nextTokenFld -> { nextToken = nextTokenFld, queueUrls = queueUrlsFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "QueueUrls" (Json.Decode.maybe queueUrlListDecoder) Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListQueues" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| List all cost allocation tags added to the specified Amazon SQS queue. For an overview, see `Tagging Your Amazon SQS Queues` in the Amazon SQS Developer Guide.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.

-}
listQueueTags : ListQueueTagsRequest -> AWS.Http.Request AWS.Http.AWSAppError ListQueueTagsResult
listQueueTags req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tagsFld -> { tags = tagsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Tags" (Json.Decode.maybe (Codec.decoder tagMapCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListQueueTags" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Gets the most recent message movement tasks (up to 10) under a specific source queue.

  -     This action is currently limited to supporting message redrive from `dead-letter queues (DLQs)` only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.    Only one active message movement task is supported per queue at any given time.

-}
listMessageMoveTasks : ListMessageMoveTasksRequest -> AWS.Http.Request AWS.Http.AWSAppError ListMessageMoveTasksResult
listMessageMoveTasks req =
    let
        encoder val =
            [ ( "SourceArn", val.sourceArn ) |> EncodeOpt.field Json.Encode.string
            , ( "MaxResults", val.maxResults ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\resultsFld -> { results = resultsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Results" (Json.Decode.maybe listMessageMoveTasksResultEntryListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListMessageMoveTasks" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of your queues that have the `RedrivePolicy` queue attribute configured with a dead-letter queue.

The `ListDeadLetterSourceQueues` methods supports pagination. Set parameter `MaxResults` in the request to specify the maximum number of results to be returned in the response. If you do not set `MaxResults`, the response includes a maximum of 1,000 results. If you set `MaxResults` and there are additional results to display, the response includes a value for `NextToken`. Use `NextToken` as a parameter in your next request to `ListDeadLetterSourceQueues` to receive the next page of results.

For more information about using dead-letter queues, see `Using Amazon SQS Dead-Letter Queues` in the Amazon SQS Developer Guide.

-}
listDeadLetterSourceQueues : ListDeadLetterSourceQueuesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListDeadLetterSourceQueuesResult
listDeadLetterSourceQueues req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "MaxResults", val.maxResults ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\queueUrlsFld nextTokenFld -> { nextToken = nextTokenFld, queueUrls = queueUrlsFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.required "queueUrls" queueUrlListDecoder
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListDeadLetterSourceQueues" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns the URL of an existing Amazon SQS queue.

To access a queue that belongs to another AWS account, use the `QueueOwnerAWSAccountId` parameter to specify the account ID of the queue's owner. The queue's owner must grant you permission to access the queue. For more information about shared queue access, see `AddPermission``` or see `Allow Developers to Write Messages to a Shared Queue` in the Amazon SQS Developer Guide.

-}
getQueueUrl : GetQueueUrlRequest -> AWS.Http.Request AWS.Http.AWSAppError GetQueueUrlResult
getQueueUrl req =
    let
        encoder val =
            [ ( "QueueOwnerAWSAccountId", val.queueOwnerAwsaccountId ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "QueueName", val.queueName ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\queueUrlFld -> { queueUrl = queueUrlFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "QueueUrl" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetQueueUrl" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Gets attributes for the specified queue.

To determine whether a queue is `FIFO`, you can check whether `QueueName` ends with the `.fifo` suffix.

-}
getQueueAttributes : GetQueueAttributesRequest -> AWS.Http.Request AWS.Http.AWSAppError GetQueueAttributesResult
getQueueAttributes req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "AttributeNames", val.attributeNames ) |> EncodeOpt.optionalField attributeNameListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\attributesFld -> { attributes = attributesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Attributes" (Json.Decode.maybe (Codec.decoder queueAttributeMapCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetQueueAttributes" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the queue specified by the `QueueUrl`, regardless of the queue's contents.

Be careful with the `DeleteQueue` action: When you delete a queue, any messages in the queue are no longer available.

When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving that queue during the 60 seconds might succeed. For example, a `SendMessage``` request might succeed, but after 60 seconds the queue and the message you sent no longer exist.

When you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide. The delete operation uses the HTTP `GET` verb.

-}
deleteQueue : DeleteQueueRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteQueue req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteQueue" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes up to ten messages from the specified queue. This is a batch version of `DeleteMessage``.` The result of the action on each message is reported individually in the response.

Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of `200`.

-}
deleteMessageBatch : DeleteMessageBatchRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteMessageBatchResult
deleteMessageBatch req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "Entries", val.entries ) |> EncodeOpt.field deleteMessageBatchRequestEntryListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\successfulFld failedFld -> { failed = failedFld, successful = successfulFld }) |> Json.Decode.succeed)
                |> Pipeline.required "Successful" deleteMessageBatchResultEntryListDecoder
                |> Pipeline.required "Failed" batchResultErrorEntryListDecoder
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteMessageBatch" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified message from the specified queue. To select the message to delete, use the `ReceiptHandle` of the message (not the `MessageId` which you receive when you send the message). Amazon SQS can delete a message from a queue even if a visibility timeout setting causes the message to be locked by another consumer. Amazon SQS automatically deletes messages left in a queue longer than the retention period configured for the queue.

The `ReceiptHandle` is associated with a specific instance of receiving a message. If you receive a message more than once, the `ReceiptHandle` is different each time you receive a message. When you use the `DeleteMessage` action, you must provide the most recently received `ReceiptHandle` for the message (otherwise, the request succeeds, but the message will not be deleted). For standard queues, it is possible to receive a message even after you delete it. This might happen on rare occasions if one of the servers which stores a copy of the message is unavailable when you send the request to delete the message. The copy remains on the server and might be returned to you during a subsequent receive request. You should ensure that your application is idempotent, so that receiving a message more than once does not cause issues.

-}
deleteMessage : DeleteMessageRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteMessage req =
    let
        encoder val =
            [ ( "ReceiptHandle", val.receiptHandle ) |> EncodeOpt.field Json.Encode.string
            , ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteMessage" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep the following in mind:

  - If you don't specify the `FifoQueue` attribute, Amazon SQS creates a standard queue. You can't change the queue type after you create it and you can't convert an existing standard queue into a FIFO queue. You must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue. For more information, see `Moving From a Standard Queue to a FIFO Queue` in the Amazon SQS Developer Guide. If you don't provide a value for an attribute, the queue is created with the default value for the attribute. If you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.

To successfully create a new queue, you must provide a queue name that adheres to the `limits related to queues` and is unique within the scope of your queues.

After you create a queue, you must wait at least one second after the queue is created to be able to use the queue.

To get the queue URL, use the `GetQueueUrl``` action. `GetQueueUrl``` requires only the `QueueName` parameter. be aware of existing queue names:

  - If you provide the name of an existing queue along with the exact names and values of all the queue's attributes, `CreateQueue` returns the queue URL for the existing queue. If the queue name, attribute names, or attribute values don't match an existing queue, `CreateQueue` returns an error.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.

-}
createQueue : CreateQueueRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateQueueResult
createQueue req =
    let
        encoder val =
            [ ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagMapCodec)
            , ( "QueueName", val.queueName ) |> EncodeOpt.field Json.Encode.string
            , ( "Attributes", val.attributes ) |> EncodeOpt.optionalField (Codec.encoder queueAttributeMapCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\queueUrlFld -> { queueUrl = queueUrlFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "QueueUrl" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateQueue" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Changes the visibility timeout of multiple messages. This is a batch version of `ChangeMessageVisibility``.` The result of the action on each message is reported individually in the response. You can send up to 10 `ChangeMessageVisibility``` requests with each `ChangeMessageVisibilityBatch` action.

Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of `200`.

-}
changeMessageVisibilityBatch : ChangeMessageVisibilityBatchRequest -> AWS.Http.Request AWS.Http.AWSAppError ChangeMessageVisibilityBatchResult
changeMessageVisibilityBatch req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "Entries", val.entries ) |> EncodeOpt.field changeMessageVisibilityBatchRequestEntryListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\successfulFld failedFld -> { failed = failedFld, successful = successfulFld }) |> Json.Decode.succeed)
                |> Pipeline.required "Successful" changeMessageVisibilityBatchResultEntryListDecoder
                |> Pipeline.required "Failed" batchResultErrorEntryListDecoder
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ChangeMessageVisibilityBatch" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Changes the visibility timeout of a specified message in a queue to a new value. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. For more information, see `Visibility Timeout` in the Amazon SQS Developer Guide.

For example, if the default timeout for a queue is 60 seconds, 15 seconds have elapsed since you received the message, and you send a ChangeMessageVisibility call with `VisibilityTimeout` set to 10 seconds, the 10 seconds begin to count from the time that you make the `ChangeMessageVisibility` call. Thus, any attempt to change the visibility timeout or to delete that message 10 seconds after you initially change the visibility timeout (a total of 25 seconds) might result in an error.

An Amazon SQS message has three basic states:

  - Sent to a queue by a producer. Received from the queue by a consumer. Deleted from the queue.

A message is considered to be stored after it is sent to a queue by a producer, but not yet received from the queue by a consumer (that is, between states 1 and 2). There is no limit to the number of stored messages. A message is considered to be in flight after it is received from a queue by a consumer, but not yet deleted from the queue (that is, between states 2 and 3). There is a limit to the number of in flight messages.

Limits that apply to in flight messages are unrelated to the unlimited number of stored messages.

For most standard queues (depending on queue traffic and message backlog), there can be a maximum of approximately 120,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns the `OverLimit` error message. To avoid reaching the limit, you should delete messages from the queue after they're processed. You can also increase the number of queues you use to process your messages. To request a limit increase, `file a support request`.

For FIFO queues, there can be a maximum of 20,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns no error messages.

If you attempt to set the `VisibilityTimeout` to a value greater than the maximum time left, Amazon SQS returns an error. Amazon SQS doesn't automatically recalculate and increase the timeout to the maximum remaining time. Unlike with a queue, when you change the visibility timeout for a specific message the timeout value is applied immediately but isn't saved in memory for that message. If you don't delete a message after it is received, the visibility timeout for the message reverts to the original timeout value (not to the value you set using the `ChangeMessageVisibility` action) the next time the message is received.

-}
changeMessageVisibility : ChangeMessageVisibilityRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
changeMessageVisibility req =
    let
        encoder val =
            [ ( "VisibilityTimeout", val.visibilityTimeout ) |> EncodeOpt.field Json.Encode.int
            , ( "ReceiptHandle", val.receiptHandle ) |> EncodeOpt.field Json.Encode.string
            , ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "ChangeMessageVisibility" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Cancels a specified message movement task. A message movement can only be cancelled when the current status is RUNNING. Cancelling a message movement task does not revert the messages that have already been moved. It can only stop the messages that have not been moved yet.

  -     This action is currently limited to supporting message redrive from `dead-letter queues (DLQs)` only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.    Only one active message movement task is supported per queue at any given time.

-}
cancelMessageMoveTask : CancelMessageMoveTaskRequest -> AWS.Http.Request AWS.Http.AWSAppError CancelMessageMoveTaskResult
cancelMessageMoveTask req =
    let
        encoder val =
            [ ( "TaskHandle", val.taskHandle ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\approximateNumberOfMessagesMovedFld ->
                { approximateNumberOfMessagesMoved = approximateNumberOfMessagesMovedFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "ApproximateNumberOfMessagesMoved" (Json.Decode.maybe Json.Decode.int) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CancelMessageMoveTask" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Adds a permission to a queue for a specific `principal`. This allows sharing access to the queue.

When you create a queue, you have full control access rights for the queue. Only you, the owner of the queue, can grant or deny permissions to the queue. For more information about these permissions, see `Allow Developers to Write Messages to a Shared Queue` in the Amazon SQS Developer Guide.

  -      `AddPermission` generates a policy for you. You can use  `SetQueueAttributes`` ` to upload your policy. For more information, see `Using Custom Policies with the Amazon SQS Access Policy Language` in the Amazon SQS Developer Guide.   An Amazon SQS policy can have a maximum of seven actions per statement.   To remove the ability to change queue permissions, you must deny permission to the `AddPermission`, `RemovePermission`, and `SetQueueAttributes` actions in your IAM policy.   Amazon SQS `AddPermission` does not support adding a non-account principal.

Cross-account permissions don't apply to this action. For more information, see `Grant cross-account permissions to a role and a username` in the Amazon SQS Developer Guide.

-}
addPermission : AddPermissionRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
addPermission req =
    let
        encoder val =
            [ ( "QueueUrl", val.queueUrl ) |> EncodeOpt.field Json.Encode.string
            , ( "Label", val.label ) |> EncodeOpt.field Json.Encode.string
            , ( "Actions", val.actions ) |> EncodeOpt.field actionNameListEncoder
            , ( "AWSAccountIds", val.awsaccountIds ) |> EncodeOpt.field awsaccountIdListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "AddPermission" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| The UntagQueueRequest data model.
-}
type alias UntagQueueRequest =
    { queueUrl : String, tagKeys : TagKeyList }


{-| The TagQueueRequest data model.
-}
type alias TagQueueRequest =
    { queueUrl : String, tags : TagMap }


{-| The TagMap data model.
-}
type alias TagMap =
    Dict String String


{-| The TagKeyList data model.
-}
type alias TagKeyList =
    List String


{-| The StringList data model.
-}
type alias StringList =
    List String


{-| The StartMessageMoveTaskResult data model.
-}
type alias StartMessageMoveTaskResult =
    { taskHandle : Maybe String }


{-| The StartMessageMoveTaskRequest data model.
-}
type alias StartMessageMoveTaskRequest =
    { destinationArn : Maybe String, maxNumberOfMessagesPerSecond : Maybe Int, sourceArn : String }


{-| The SetQueueAttributesRequest data model.
-}
type alias SetQueueAttributesRequest =
    { attributes : QueueAttributeMap, queueUrl : String }


{-| The SendMessageResult data model.
-}
type alias SendMessageResult =
    { md5OfMessageAttributes : Maybe String
    , md5OfMessageBody : Maybe String
    , md5OfMessageSystemAttributes : Maybe String
    , messageId : Maybe String
    , sequenceNumber : Maybe String
    }


{-| The SendMessageRequest data model.
-}
type alias SendMessageRequest =
    { delaySeconds : Maybe Int
    , messageAttributes : Maybe MessageBodyAttributeMap
    , messageBody : String
    , messageDeduplicationId : Maybe String
    , messageGroupId : Maybe String
    , messageSystemAttributes : Maybe MessageBodySystemAttributeMap
    , queueUrl : String
    }


{-| The SendMessageBatchResultEntryList data model.
-}
type alias SendMessageBatchResultEntryList =
    List SendMessageBatchResultEntry


{-| The SendMessageBatchResultEntry data model.
-}
type alias SendMessageBatchResultEntry =
    { id : String
    , md5OfMessageAttributes : Maybe String
    , md5OfMessageBody : String
    , md5OfMessageSystemAttributes : Maybe String
    , messageId : String
    , sequenceNumber : Maybe String
    }


{-| The SendMessageBatchResult data model.
-}
type alias SendMessageBatchResult =
    { failed : BatchResultErrorEntryList, successful : SendMessageBatchResultEntryList }


{-| The SendMessageBatchRequestEntryList data model.
-}
type alias SendMessageBatchRequestEntryList =
    List SendMessageBatchRequestEntry


{-| The SendMessageBatchRequestEntry data model.
-}
type alias SendMessageBatchRequestEntry =
    { delaySeconds : Maybe Int
    , id : String
    , messageAttributes : Maybe MessageBodyAttributeMap
    , messageBody : String
    , messageDeduplicationId : Maybe String
    , messageGroupId : Maybe String
    , messageSystemAttributes : Maybe MessageBodySystemAttributeMap
    }


{-| The SendMessageBatchRequest data model.
-}
type alias SendMessageBatchRequest =
    { entries : SendMessageBatchRequestEntryList, queueUrl : String }


{-| The RemovePermissionRequest data model.
-}
type alias RemovePermissionRequest =
    { label : String, queueUrl : String }


{-| The ReceiveMessageResult data model.
-}
type alias ReceiveMessageResult =
    { messages : Maybe MessageList }


{-| The ReceiveMessageRequest data model.
-}
type alias ReceiveMessageRequest =
    { attributeNames : Maybe AttributeNameList
    , maxNumberOfMessages : Maybe Int
    , messageAttributeNames : Maybe MessageAttributeNameList
    , messageSystemAttributeNames : Maybe MessageSystemAttributeList
    , queueUrl : String
    , receiveRequestAttemptId : Maybe String
    , visibilityTimeout : Maybe Int
    , waitTimeSeconds : Maybe Int
    }


{-| The QueueUrlList data model.
-}
type alias QueueUrlList =
    List String


{-| The QueueAttributeName data model.
-}
type QueueAttributeName
    = QueueAttributeNameAll
    | QueueAttributeNamePolicy
    | QueueAttributeNameVisibilityTimeout
    | QueueAttributeNameMaximumMessageSize
    | QueueAttributeNameMessageRetentionPeriod
    | QueueAttributeNameApproximateNumberOfMessages
    | QueueAttributeNameApproximateNumberOfMessagesNotVisible
    | QueueAttributeNameCreatedTimestamp
    | QueueAttributeNameLastModifiedTimestamp
    | QueueAttributeNameQueueArn
    | QueueAttributeNameApproximateNumberOfMessagesDelayed
    | QueueAttributeNameDelaySeconds
    | QueueAttributeNameReceiveMessageWaitTimeSeconds
    | QueueAttributeNameRedrivePolicy
    | QueueAttributeNameFifoQueue
    | QueueAttributeNameContentBasedDeduplication
    | QueueAttributeNameKmsMasterKeyId
    | QueueAttributeNameKmsDataKeyReusePeriodSeconds
    | QueueAttributeNameDeduplicationScope
    | QueueAttributeNameFifoThroughputLimit
    | QueueAttributeNameRedriveAllowPolicy
    | QueueAttributeNameSqsManagedSseEnabled


{-| The QueueAttributeName data model.
-}
queueAttributeName : Enum QueueAttributeName
queueAttributeName =
    Enum.define
        [ QueueAttributeNameAll
        , QueueAttributeNamePolicy
        , QueueAttributeNameVisibilityTimeout
        , QueueAttributeNameMaximumMessageSize
        , QueueAttributeNameMessageRetentionPeriod
        , QueueAttributeNameApproximateNumberOfMessages
        , QueueAttributeNameApproximateNumberOfMessagesNotVisible
        , QueueAttributeNameCreatedTimestamp
        , QueueAttributeNameLastModifiedTimestamp
        , QueueAttributeNameQueueArn
        , QueueAttributeNameApproximateNumberOfMessagesDelayed
        , QueueAttributeNameDelaySeconds
        , QueueAttributeNameReceiveMessageWaitTimeSeconds
        , QueueAttributeNameRedrivePolicy
        , QueueAttributeNameFifoQueue
        , QueueAttributeNameContentBasedDeduplication
        , QueueAttributeNameKmsMasterKeyId
        , QueueAttributeNameKmsDataKeyReusePeriodSeconds
        , QueueAttributeNameDeduplicationScope
        , QueueAttributeNameFifoThroughputLimit
        , QueueAttributeNameRedriveAllowPolicy
        , QueueAttributeNameSqsManagedSseEnabled
        ]
        (\val ->
            case val of
                QueueAttributeNameAll ->
                    "All"

                QueueAttributeNamePolicy ->
                    "Policy"

                QueueAttributeNameVisibilityTimeout ->
                    "VisibilityTimeout"

                QueueAttributeNameMaximumMessageSize ->
                    "MaximumMessageSize"

                QueueAttributeNameMessageRetentionPeriod ->
                    "MessageRetentionPeriod"

                QueueAttributeNameApproximateNumberOfMessages ->
                    "ApproximateNumberOfMessages"

                QueueAttributeNameApproximateNumberOfMessagesNotVisible ->
                    "ApproximateNumberOfMessagesNotVisible"

                QueueAttributeNameCreatedTimestamp ->
                    "CreatedTimestamp"

                QueueAttributeNameLastModifiedTimestamp ->
                    "LastModifiedTimestamp"

                QueueAttributeNameQueueArn ->
                    "QueueArn"

                QueueAttributeNameApproximateNumberOfMessagesDelayed ->
                    "ApproximateNumberOfMessagesDelayed"

                QueueAttributeNameDelaySeconds ->
                    "DelaySeconds"

                QueueAttributeNameReceiveMessageWaitTimeSeconds ->
                    "ReceiveMessageWaitTimeSeconds"

                QueueAttributeNameRedrivePolicy ->
                    "RedrivePolicy"

                QueueAttributeNameFifoQueue ->
                    "FifoQueue"

                QueueAttributeNameContentBasedDeduplication ->
                    "ContentBasedDeduplication"

                QueueAttributeNameKmsMasterKeyId ->
                    "KmsMasterKeyId"

                QueueAttributeNameKmsDataKeyReusePeriodSeconds ->
                    "KmsDataKeyReusePeriodSeconds"

                QueueAttributeNameDeduplicationScope ->
                    "DeduplicationScope"

                QueueAttributeNameFifoThroughputLimit ->
                    "FifoThroughputLimit"

                QueueAttributeNameRedriveAllowPolicy ->
                    "RedriveAllowPolicy"

                QueueAttributeNameSqsManagedSseEnabled ->
                    "SqsManagedSseEnabled"
        )


{-| The QueueAttributeMap data model.
-}
type alias QueueAttributeMap =
    Dict.Enum.Dict QueueAttributeName String


{-| The PurgeQueueRequest data model.
-}
type alias PurgeQueueRequest =
    { queueUrl : String }


{-| The MessageSystemAttributeValue data model.
-}
type alias MessageSystemAttributeValue =
    { binaryListValues : Maybe BinaryList
    , binaryValue : Maybe String
    , dataType : String
    , stringListValues : Maybe StringList
    , stringValue : Maybe String
    }


{-| The MessageSystemAttributeNameForSends data model.
-}
type MessageSystemAttributeNameForSends
    = MessageSystemAttributeNameForSendsAwstraceHeader


{-| The MessageSystemAttributeNameForSends data model.
-}
messageSystemAttributeNameForSends : Enum MessageSystemAttributeNameForSends
messageSystemAttributeNameForSends =
    Enum.define
        [ MessageSystemAttributeNameForSendsAwstraceHeader ]
        (\val ->
            case val of
                MessageSystemAttributeNameForSendsAwstraceHeader ->
                    "AWSTraceHeader"
        )


{-| The MessageSystemAttributeName data model.
-}
type MessageSystemAttributeName
    = MessageSystemAttributeNameAll
    | MessageSystemAttributeNameSenderId
    | MessageSystemAttributeNameSentTimestamp
    | MessageSystemAttributeNameApproximateReceiveCount
    | MessageSystemAttributeNameApproximateFirstReceiveTimestamp
    | MessageSystemAttributeNameSequenceNumber
    | MessageSystemAttributeNameMessageDeduplicationId
    | MessageSystemAttributeNameMessageGroupId
    | MessageSystemAttributeNameAwstraceHeader
    | MessageSystemAttributeNameDeadLetterQueueSourceArn


{-| The MessageSystemAttributeName data model.
-}
messageSystemAttributeName : Enum MessageSystemAttributeName
messageSystemAttributeName =
    Enum.define
        [ MessageSystemAttributeNameAll
        , MessageSystemAttributeNameSenderId
        , MessageSystemAttributeNameSentTimestamp
        , MessageSystemAttributeNameApproximateReceiveCount
        , MessageSystemAttributeNameApproximateFirstReceiveTimestamp
        , MessageSystemAttributeNameSequenceNumber
        , MessageSystemAttributeNameMessageDeduplicationId
        , MessageSystemAttributeNameMessageGroupId
        , MessageSystemAttributeNameAwstraceHeader
        , MessageSystemAttributeNameDeadLetterQueueSourceArn
        ]
        (\val ->
            case val of
                MessageSystemAttributeNameAll ->
                    "All"

                MessageSystemAttributeNameSenderId ->
                    "SenderId"

                MessageSystemAttributeNameSentTimestamp ->
                    "SentTimestamp"

                MessageSystemAttributeNameApproximateReceiveCount ->
                    "ApproximateReceiveCount"

                MessageSystemAttributeNameApproximateFirstReceiveTimestamp ->
                    "ApproximateFirstReceiveTimestamp"

                MessageSystemAttributeNameSequenceNumber ->
                    "SequenceNumber"

                MessageSystemAttributeNameMessageDeduplicationId ->
                    "MessageDeduplicationId"

                MessageSystemAttributeNameMessageGroupId ->
                    "MessageGroupId"

                MessageSystemAttributeNameAwstraceHeader ->
                    "AWSTraceHeader"

                MessageSystemAttributeNameDeadLetterQueueSourceArn ->
                    "DeadLetterQueueSourceArn"
        )


{-| The MessageSystemAttributeMap data model.
-}
type alias MessageSystemAttributeMap =
    Dict.Enum.Dict MessageSystemAttributeName String


{-| The MessageSystemAttributeList data model.
-}
type alias MessageSystemAttributeList =
    List MessageSystemAttributeName


{-| The MessageList data model.
-}
type alias MessageList =
    List Message


{-| The MessageBodySystemAttributeMap data model.
-}
type alias MessageBodySystemAttributeMap =
    Dict.Enum.Dict MessageSystemAttributeNameForSends MessageSystemAttributeValue


{-| The MessageBodyAttributeMap data model.
-}
type alias MessageBodyAttributeMap =
    Dict String MessageAttributeValue


{-| The MessageAttributeValue data model.
-}
type alias MessageAttributeValue =
    { binaryListValues : Maybe BinaryList
    , binaryValue : Maybe String
    , dataType : String
    , stringListValues : Maybe StringList
    , stringValue : Maybe String
    }


{-| The MessageAttributeNameList data model.
-}
type alias MessageAttributeNameList =
    List String


{-| The Message data model.
-}
type alias Message =
    { attributes : Maybe MessageSystemAttributeMap
    , body : Maybe String
    , md5OfBody : Maybe String
    , md5OfMessageAttributes : Maybe String
    , messageAttributes : Maybe MessageBodyAttributeMap
    , messageId : Maybe String
    , receiptHandle : Maybe String
    }


{-| The ListQueuesResult data model.
-}
type alias ListQueuesResult =
    { nextToken : Maybe String, queueUrls : Maybe QueueUrlList }


{-| The ListQueuesRequest data model.
-}
type alias ListQueuesRequest =
    { maxResults : Maybe Int, nextToken : Maybe String, queueNamePrefix : Maybe String }


{-| The ListQueueTagsResult data model.
-}
type alias ListQueueTagsResult =
    { tags : Maybe TagMap }


{-| The ListQueueTagsRequest data model.
-}
type alias ListQueueTagsRequest =
    { queueUrl : String }


{-| The ListMessageMoveTasksResultEntryList data model.
-}
type alias ListMessageMoveTasksResultEntryList =
    List ListMessageMoveTasksResultEntry


{-| The ListMessageMoveTasksResultEntry data model.
-}
type alias ListMessageMoveTasksResultEntry =
    { approximateNumberOfMessagesMoved : Maybe Int
    , approximateNumberOfMessagesToMove : Maybe Int
    , destinationArn : Maybe String
    , failureReason : Maybe String
    , maxNumberOfMessagesPerSecond : Maybe Int
    , sourceArn : Maybe String
    , startedTimestamp : Maybe Int
    , status : Maybe String
    , taskHandle : Maybe String
    }


{-| The ListMessageMoveTasksResult data model.
-}
type alias ListMessageMoveTasksResult =
    { results : Maybe ListMessageMoveTasksResultEntryList }


{-| The ListMessageMoveTasksRequest data model.
-}
type alias ListMessageMoveTasksRequest =
    { maxResults : Maybe Int, sourceArn : String }


{-| The ListDeadLetterSourceQueuesResult data model.
-}
type alias ListDeadLetterSourceQueuesResult =
    { nextToken : Maybe String, queueUrls : QueueUrlList }


{-| The ListDeadLetterSourceQueuesRequest data model.
-}
type alias ListDeadLetterSourceQueuesRequest =
    { maxResults : Maybe Int, nextToken : Maybe String, queueUrl : String }


{-| The GetQueueUrlResult data model.
-}
type alias GetQueueUrlResult =
    { queueUrl : Maybe String }


{-| The GetQueueUrlRequest data model.
-}
type alias GetQueueUrlRequest =
    { queueName : String, queueOwnerAwsaccountId : Maybe String }


{-| The GetQueueAttributesResult data model.
-}
type alias GetQueueAttributesResult =
    { attributes : Maybe QueueAttributeMap }


{-| The GetQueueAttributesRequest data model.
-}
type alias GetQueueAttributesRequest =
    { attributeNames : Maybe AttributeNameList, queueUrl : String }


{-| The DeleteQueueRequest data model.
-}
type alias DeleteQueueRequest =
    { queueUrl : String }


{-| The DeleteMessageRequest data model.
-}
type alias DeleteMessageRequest =
    { queueUrl : String, receiptHandle : String }


{-| The DeleteMessageBatchResultEntryList data model.
-}
type alias DeleteMessageBatchResultEntryList =
    List DeleteMessageBatchResultEntry


{-| The DeleteMessageBatchResultEntry data model.
-}
type alias DeleteMessageBatchResultEntry =
    { id : String }


{-| The DeleteMessageBatchResult data model.
-}
type alias DeleteMessageBatchResult =
    { failed : BatchResultErrorEntryList, successful : DeleteMessageBatchResultEntryList }


{-| The DeleteMessageBatchRequestEntryList data model.
-}
type alias DeleteMessageBatchRequestEntryList =
    List DeleteMessageBatchRequestEntry


{-| The DeleteMessageBatchRequestEntry data model.
-}
type alias DeleteMessageBatchRequestEntry =
    { id : String, receiptHandle : String }


{-| The DeleteMessageBatchRequest data model.
-}
type alias DeleteMessageBatchRequest =
    { entries : DeleteMessageBatchRequestEntryList, queueUrl : String }


{-| The CreateQueueResult data model.
-}
type alias CreateQueueResult =
    { queueUrl : Maybe String }


{-| The CreateQueueRequest data model.
-}
type alias CreateQueueRequest =
    { attributes : Maybe QueueAttributeMap, queueName : String, tags : Maybe TagMap }


{-| The ChangeMessageVisibilityRequest data model.
-}
type alias ChangeMessageVisibilityRequest =
    { queueUrl : String, receiptHandle : String, visibilityTimeout : Int }


{-| The ChangeMessageVisibilityBatchResultEntryList data model.
-}
type alias ChangeMessageVisibilityBatchResultEntryList =
    List ChangeMessageVisibilityBatchResultEntry


{-| The ChangeMessageVisibilityBatchResultEntry data model.
-}
type alias ChangeMessageVisibilityBatchResultEntry =
    { id : String }


{-| The ChangeMessageVisibilityBatchResult data model.
-}
type alias ChangeMessageVisibilityBatchResult =
    { failed : BatchResultErrorEntryList, successful : ChangeMessageVisibilityBatchResultEntryList }


{-| The ChangeMessageVisibilityBatchRequestEntryList data model.
-}
type alias ChangeMessageVisibilityBatchRequestEntryList =
    List ChangeMessageVisibilityBatchRequestEntry


{-| The ChangeMessageVisibilityBatchRequestEntry data model.
-}
type alias ChangeMessageVisibilityBatchRequestEntry =
    { id : String, receiptHandle : String, visibilityTimeout : Maybe Int }


{-| The ChangeMessageVisibilityBatchRequest data model.
-}
type alias ChangeMessageVisibilityBatchRequest =
    { entries : ChangeMessageVisibilityBatchRequestEntryList, queueUrl : String }


{-| The CancelMessageMoveTaskResult data model.
-}
type alias CancelMessageMoveTaskResult =
    { approximateNumberOfMessagesMoved : Maybe Int }


{-| The CancelMessageMoveTaskRequest data model.
-}
type alias CancelMessageMoveTaskRequest =
    { taskHandle : String }


{-| The BinaryList data model.
-}
type alias BinaryList =
    List String


{-| The BatchResultErrorEntryList data model.
-}
type alias BatchResultErrorEntryList =
    List BatchResultErrorEntry


{-| The BatchResultErrorEntry data model.
-}
type alias BatchResultErrorEntry =
    { code : String, id : String, message : Maybe String, senderFault : Bool }


{-| The AttributeNameList data model.
-}
type alias AttributeNameList =
    List QueueAttributeName


{-| The AddPermissionRequest data model.
-}
type alias AddPermissionRequest =
    { awsaccountIds : AwsaccountIdList, actions : ActionNameList, label : String, queueUrl : String }


{-| The ActionNameList data model.
-}
type alias ActionNameList =
    List String


{-| The AwsaccountIdList data model.
-}
type alias AwsaccountIdList =
    List String


{-| Encoder for AwsaccountIdList.
-}
awsaccountIdListEncoder : AwsaccountIdList -> Value
awsaccountIdListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Encoder for ActionNameList.
-}
actionNameListEncoder : ActionNameList -> Value
actionNameListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Encoder for AttributeNameList.
-}
attributeNameListEncoder : AttributeNameList -> Value
attributeNameListEncoder val =
    Json.Encode.list (Codec.encoder queueAttributeNameCodec) val


{-| Decoder for BatchResultErrorEntry.
-}
batchResultErrorEntryDecoder : Decoder BatchResultErrorEntry
batchResultErrorEntryDecoder =
    Json.Decode.succeed BatchResultErrorEntry
        |> Pipeline.required "Code" Json.Decode.string
        |> Pipeline.required "Id" Json.Decode.string
        |> Pipeline.optional "Message" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.required "SenderFault" Json.Decode.bool


{-| Decoder for BatchResultErrorEntryList.
-}
batchResultErrorEntryListDecoder : Decoder BatchResultErrorEntryList
batchResultErrorEntryListDecoder =
    Json.Decode.list batchResultErrorEntryDecoder


{-| Codec for BinaryList.
-}
binaryListCodec : Codec BinaryList
binaryListCodec =
    Codec.list Codec.string


{-| Encoder for ChangeMessageVisibilityBatchRequestEntry.
-}
changeMessageVisibilityBatchRequestEntryEncoder : ChangeMessageVisibilityBatchRequestEntry -> Value
changeMessageVisibilityBatchRequestEntryEncoder val =
    [ ( "Id", val.id ) |> EncodeOpt.field Json.Encode.string
    , ( "ReceiptHandle", val.receiptHandle ) |> EncodeOpt.field Json.Encode.string
    , ( "VisibilityTimeout", val.visibilityTimeout ) |> EncodeOpt.optionalField Json.Encode.int
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for ChangeMessageVisibilityBatchRequestEntryList.
-}
changeMessageVisibilityBatchRequestEntryListEncoder : ChangeMessageVisibilityBatchRequestEntryList -> Value
changeMessageVisibilityBatchRequestEntryListEncoder val =
    Json.Encode.list changeMessageVisibilityBatchRequestEntryEncoder val


{-| Decoder for ChangeMessageVisibilityBatchResultEntry.
-}
changeMessageVisibilityBatchResultEntryDecoder : Decoder ChangeMessageVisibilityBatchResultEntry
changeMessageVisibilityBatchResultEntryDecoder =
    Json.Decode.succeed ChangeMessageVisibilityBatchResultEntry |> Pipeline.required "Id" Json.Decode.string


{-| Decoder for ChangeMessageVisibilityBatchResultEntryList.
-}
changeMessageVisibilityBatchResultEntryListDecoder : Decoder ChangeMessageVisibilityBatchResultEntryList
changeMessageVisibilityBatchResultEntryListDecoder =
    Json.Decode.list changeMessageVisibilityBatchResultEntryDecoder


{-| Encoder for DeleteMessageBatchRequestEntry.
-}
deleteMessageBatchRequestEntryEncoder : DeleteMessageBatchRequestEntry -> Value
deleteMessageBatchRequestEntryEncoder val =
    [ ( "Id", val.id ) |> EncodeOpt.field Json.Encode.string
    , ( "ReceiptHandle", val.receiptHandle ) |> EncodeOpt.field Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for DeleteMessageBatchRequestEntryList.
-}
deleteMessageBatchRequestEntryListEncoder : DeleteMessageBatchRequestEntryList -> Value
deleteMessageBatchRequestEntryListEncoder val =
    Json.Encode.list deleteMessageBatchRequestEntryEncoder val


{-| Decoder for DeleteMessageBatchResultEntry.
-}
deleteMessageBatchResultEntryDecoder : Decoder DeleteMessageBatchResultEntry
deleteMessageBatchResultEntryDecoder =
    Json.Decode.succeed DeleteMessageBatchResultEntry |> Pipeline.required "Id" Json.Decode.string


{-| Decoder for DeleteMessageBatchResultEntryList.
-}
deleteMessageBatchResultEntryListDecoder : Decoder DeleteMessageBatchResultEntryList
deleteMessageBatchResultEntryListDecoder =
    Json.Decode.list deleteMessageBatchResultEntryDecoder


{-| Decoder for ListMessageMoveTasksResultEntry.
-}
listMessageMoveTasksResultEntryDecoder : Decoder ListMessageMoveTasksResultEntry
listMessageMoveTasksResultEntryDecoder =
    Json.Decode.succeed ListMessageMoveTasksResultEntry
        |> Pipeline.optional "ApproximateNumberOfMessagesMoved" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "ApproximateNumberOfMessagesToMove" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "DestinationArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "FailureReason" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "MaxNumberOfMessagesPerSecond" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "SourceArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "StartedTimestamp" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "Status" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "TaskHandle" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for ListMessageMoveTasksResultEntryList.
-}
listMessageMoveTasksResultEntryListDecoder : Decoder ListMessageMoveTasksResultEntryList
listMessageMoveTasksResultEntryListDecoder =
    Json.Decode.list listMessageMoveTasksResultEntryDecoder


{-| Decoder for Message.
-}
messageDecoder : Decoder Message
messageDecoder =
    Json.Decode.succeed Message
        |> Pipeline.optional "Attributes" (Json.Decode.maybe messageSystemAttributeMapDecoder) Nothing
        |> Pipeline.optional "Body" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "MD5OfBody" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "MD5OfMessageAttributes" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional
            "MessageAttributes"
            (Json.Decode.maybe (Codec.decoder messageBodyAttributeMapCodec))
            Nothing
        |> Pipeline.optional "MessageId" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ReceiptHandle" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Encoder for MessageAttributeNameList.
-}
messageAttributeNameListEncoder : MessageAttributeNameList -> Value
messageAttributeNameListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Codec for MessageAttributeValue.
-}
messageAttributeValueCodec : Codec MessageAttributeValue
messageAttributeValueCodec =
    Codec.object MessageAttributeValue
        |> Codec.optionalField "BinaryListValues" .binaryListValues binaryListCodec
        |> Codec.optionalField "BinaryValue" .binaryValue Codec.string
        |> Codec.field "DataType" .dataType Codec.string
        |> Codec.optionalField "StringListValues" .stringListValues stringListCodec
        |> Codec.optionalField "StringValue" .stringValue Codec.string
        |> Codec.buildObject


{-| Codec for MessageBodyAttributeMap.
-}
messageBodyAttributeMapCodec : Codec MessageBodyAttributeMap
messageBodyAttributeMapCodec =
    Codec.dict messageAttributeValueCodec


{-| Encoder for MessageBodySystemAttributeMap.
-}
messageBodySystemAttributeMapEncoder : MessageBodySystemAttributeMap -> Value
messageBodySystemAttributeMapEncoder val =
    Enum.dictEncoder messageSystemAttributeNameForSends messageSystemAttributeValueEncoder val


{-| Decoder for MessageList.
-}
messageListDecoder : Decoder MessageList
messageListDecoder =
    Json.Decode.list messageDecoder


{-| Encoder for MessageSystemAttributeList.
-}
messageSystemAttributeListEncoder : MessageSystemAttributeList -> Value
messageSystemAttributeListEncoder val =
    Json.Encode.list (Codec.encoder messageSystemAttributeNameCodec) val


{-| Decoder for MessageSystemAttributeMap.
-}
messageSystemAttributeMapDecoder : Decoder MessageSystemAttributeMap
messageSystemAttributeMapDecoder =
    Json.Decode.build
        (Enum.dictDecoder messageSystemAttributeName (Json.Decode.decoder Json.Decode.string))
        (Enum.dictDecoder messageSystemAttributeName (Json.Decode.decoder Json.Decode.string))


{-| Codec for MessageSystemAttributeName.
-}
messageSystemAttributeNameCodec : Codec MessageSystemAttributeName
messageSystemAttributeNameCodec =
    Codec.build (Enum.encoder messageSystemAttributeName) (Enum.decoder messageSystemAttributeName)


{-| Encoder for MessageSystemAttributeNameForSends.
-}
messageSystemAttributeNameForSendsEncoder : MessageSystemAttributeNameForSends -> Value
messageSystemAttributeNameForSendsEncoder =
    Enum.encoder messageSystemAttributeNameForSends


{-| Encoder for MessageSystemAttributeValue.
-}
messageSystemAttributeValueEncoder : MessageSystemAttributeValue -> Value
messageSystemAttributeValueEncoder val =
    [ ( "BinaryListValues", val.binaryListValues ) |> EncodeOpt.optionalField (Codec.encoder binaryListCodec)
    , ( "BinaryValue", val.binaryValue ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "DataType", val.dataType ) |> EncodeOpt.field Json.Encode.string
    , ( "StringListValues", val.stringListValues ) |> EncodeOpt.optionalField (Codec.encoder stringListCodec)
    , ( "StringValue", val.stringValue ) |> EncodeOpt.optionalField Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Codec for QueueAttributeMap.
-}
queueAttributeMapCodec : Codec QueueAttributeMap
queueAttributeMapCodec =
    Codec.build
        (Enum.dictEncoder queueAttributeName (Codec.encoder Codec.string))
        (Enum.dictDecoder queueAttributeName (Codec.decoder Codec.string))


{-| Codec for QueueAttributeName.
-}
queueAttributeNameCodec : Codec QueueAttributeName
queueAttributeNameCodec =
    Codec.build (Enum.encoder queueAttributeName) (Enum.decoder queueAttributeName)


{-| Decoder for QueueUrlList.
-}
queueUrlListDecoder : Decoder QueueUrlList
queueUrlListDecoder =
    Json.Decode.list Json.Decode.string


{-| Encoder for SendMessageBatchRequestEntry.
-}
sendMessageBatchRequestEntryEncoder : SendMessageBatchRequestEntry -> Value
sendMessageBatchRequestEntryEncoder val =
    [ ( "DelaySeconds", val.delaySeconds ) |> EncodeOpt.optionalField Json.Encode.int
    , ( "Id", val.id ) |> EncodeOpt.field Json.Encode.string
    , ( "MessageAttributes", val.messageAttributes )
        |> EncodeOpt.optionalField (Codec.encoder messageBodyAttributeMapCodec)
    , ( "MessageBody", val.messageBody ) |> EncodeOpt.field Json.Encode.string
    , ( "MessageDeduplicationId", val.messageDeduplicationId ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "MessageGroupId", val.messageGroupId ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "MessageSystemAttributes", val.messageSystemAttributes )
        |> EncodeOpt.optionalField messageBodySystemAttributeMapEncoder
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for SendMessageBatchRequestEntryList.
-}
sendMessageBatchRequestEntryListEncoder : SendMessageBatchRequestEntryList -> Value
sendMessageBatchRequestEntryListEncoder val =
    Json.Encode.list sendMessageBatchRequestEntryEncoder val


{-| Decoder for SendMessageBatchResultEntry.
-}
sendMessageBatchResultEntryDecoder : Decoder SendMessageBatchResultEntry
sendMessageBatchResultEntryDecoder =
    Json.Decode.succeed SendMessageBatchResultEntry
        |> Pipeline.required "Id" Json.Decode.string
        |> Pipeline.optional "MD5OfMessageAttributes" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.required "MD5OfMessageBody" Json.Decode.string
        |> Pipeline.optional "MD5OfMessageSystemAttributes" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.required "MessageId" Json.Decode.string
        |> Pipeline.optional "SequenceNumber" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for SendMessageBatchResultEntryList.
-}
sendMessageBatchResultEntryListDecoder : Decoder SendMessageBatchResultEntryList
sendMessageBatchResultEntryListDecoder =
    Json.Decode.list sendMessageBatchResultEntryDecoder


{-| Codec for StringList.
-}
stringListCodec : Codec StringList
stringListCodec =
    Codec.list Codec.string


{-| Encoder for TagKeyList.
-}
tagKeyListEncoder : TagKeyList -> Value
tagKeyListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Codec for TagMap.
-}
tagMapCodec : Codec TagMap
tagMapCodec =
    Codec.dict Codec.string
