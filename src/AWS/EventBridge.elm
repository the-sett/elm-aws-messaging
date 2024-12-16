module AWS.EventBridge exposing
    ( service
    , activateEventSource, cancelReplay, createApiDestination, createArchive, createConnection, createEndpoint, createEventBus
    , createPartnerEventSource, deactivateEventSource, deauthorizeConnection, deleteApiDestination, deleteArchive, deleteConnection
    , deleteEndpoint, deleteEventBus, deletePartnerEventSource, deleteRule, describeApiDestination, describeArchive, describeConnection
    , describeEndpoint, describeEventBus, describeEventSource, describePartnerEventSource, describeReplay, describeRule, disableRule
    , enableRule, listApiDestinations, listArchives, listConnections, listEndpoints, listEventBuses, listEventSources
    , listPartnerEventSourceAccounts, listPartnerEventSources, listReplays, listRuleNamesByTarget, listRules, listTagsForResource
    , listTargetsByRule, putEvents, putPartnerEvents, putPermission, putRule, putTargets, removePermission, removeTargets, startReplay
    , tagResource, testEventPattern, untagResource, updateApiDestination, updateArchive, updateConnection, updateEndpoint, updateEventBus
    , ActivateEventSourceRequest, ApiDestination, ApiDestinationHttpMethod(..), ApiDestinationResponseList, ApiDestinationState(..)
    , AppSyncParameters, Archive, ArchiveResponseList, ArchiveState(..), AssignPublicIp(..), AwsVpcConfiguration, BatchArrayProperties
    , BatchParameters, BatchRetryStrategy, CancelReplayRequest, CancelReplayResponse, CapacityProviderStrategy
    , CapacityProviderStrategyItem, Condition, Connection, ConnectionApiKeyAuthResponseParameters, ConnectionAuthResponseParameters
    , ConnectionAuthorizationType(..), ConnectionBasicAuthResponseParameters, ConnectionBodyParameter, ConnectionBodyParametersList
    , ConnectionHeaderParameter, ConnectionHeaderParametersList, ConnectionHttpParameters, ConnectionOauthClientResponseParameters
    , ConnectionOauthHttpMethod(..), ConnectionOauthResponseParameters, ConnectionQueryStringParameter
    , ConnectionQueryStringParametersList, ConnectionResponseList, ConnectionState(..), CreateApiDestinationRequest
    , CreateApiDestinationResponse, CreateArchiveRequest, CreateArchiveResponse, CreateConnectionApiKeyAuthRequestParameters
    , CreateConnectionAuthRequestParameters, CreateConnectionBasicAuthRequestParameters
    , CreateConnectionOauthClientRequestParameters, CreateConnectionOauthRequestParameters, CreateConnectionRequest
    , CreateConnectionResponse, CreateEndpointRequest, CreateEndpointResponse, CreateEventBusRequest, CreateEventBusResponse
    , CreatePartnerEventSourceRequest, CreatePartnerEventSourceResponse, DeactivateEventSourceRequest, DeadLetterConfig
    , DeauthorizeConnectionRequest, DeauthorizeConnectionResponse, DeleteApiDestinationRequest, DeleteApiDestinationResponse
    , DeleteArchiveRequest, DeleteArchiveResponse, DeleteConnectionRequest, DeleteConnectionResponse, DeleteEndpointRequest
    , DeleteEndpointResponse, DeleteEventBusRequest, DeletePartnerEventSourceRequest, DeleteRuleRequest, DescribeApiDestinationRequest
    , DescribeApiDestinationResponse, DescribeArchiveRequest, DescribeArchiveResponse, DescribeConnectionRequest
    , DescribeConnectionResponse, DescribeEndpointRequest, DescribeEndpointResponse, DescribeEventBusRequest, DescribeEventBusResponse
    , DescribeEventSourceRequest, DescribeEventSourceResponse, DescribePartnerEventSourceRequest, DescribePartnerEventSourceResponse
    , DescribeReplayRequest, DescribeReplayResponse, DescribeRuleRequest, DescribeRuleResponse, DisableRuleRequest, EcsParameters
    , EnableRuleRequest, Endpoint, EndpointEventBus, EndpointEventBusList, EndpointList, EndpointState(..), EventBus, EventBusList
    , EventResourceList, EventSource, EventSourceList, EventSourceState(..), FailoverConfig, HeaderParametersMap, HttpParameters
    , InputTransformer, KinesisParameters, LaunchType(..), ListApiDestinationsRequest, ListApiDestinationsResponse, ListArchivesRequest
    , ListArchivesResponse, ListConnectionsRequest, ListConnectionsResponse, ListEndpointsRequest, ListEndpointsResponse
    , ListEventBusesRequest, ListEventBusesResponse, ListEventSourcesRequest, ListEventSourcesResponse
    , ListPartnerEventSourceAccountsRequest, ListPartnerEventSourceAccountsResponse, ListPartnerEventSourcesRequest
    , ListPartnerEventSourcesResponse, ListReplaysRequest, ListReplaysResponse, ListRuleNamesByTargetRequest
    , ListRuleNamesByTargetResponse, ListRulesRequest, ListRulesResponse, ListTagsForResourceRequest, ListTagsForResourceResponse
    , ListTargetsByRuleRequest, ListTargetsByRuleResponse, NetworkConfiguration, PartnerEventSource, PartnerEventSourceAccount
    , PartnerEventSourceAccountList, PartnerEventSourceList, PathParameterList, PlacementConstraint, PlacementConstraintType(..)
    , PlacementConstraints, PlacementStrategies, PlacementStrategy, PlacementStrategyType(..), Primary, PropagateTags(..), PutEventsRequest
    , PutEventsRequestEntry, PutEventsRequestEntryList, PutEventsResponse, PutEventsResultEntry, PutEventsResultEntryList
    , PutPartnerEventsRequest, PutPartnerEventsRequestEntry, PutPartnerEventsRequestEntryList, PutPartnerEventsResponse
    , PutPartnerEventsResultEntry, PutPartnerEventsResultEntryList, PutPermissionRequest, PutRuleRequest, PutRuleResponse
    , PutTargetsRequest, PutTargetsResponse, PutTargetsResultEntry, PutTargetsResultEntryList, QueryStringParametersMap
    , RedshiftDataParameters, RemovePermissionRequest, RemoveTargetsRequest, RemoveTargetsResponse, RemoveTargetsResultEntry
    , RemoveTargetsResultEntryList, Replay, ReplayDestination, ReplayDestinationFilters, ReplayList, ReplayState(..), ReplicationConfig
    , ReplicationState(..), RetryPolicy, RoutingConfig, Rule, RuleNameList, RuleResponseList, RuleState(..), RunCommandParameters, RunCommandTarget
    , RunCommandTargetValues, RunCommandTargets, SageMakerPipelineParameter, SageMakerPipelineParameterList
    , SageMakerPipelineParameters, Secondary, Sqls, SqsParameters, StartReplayRequest, StartReplayResponse, StringList, Tag, TagKeyList, TagList
    , TagResourceRequest, TagResourceResponse, Target, TargetIdList, TargetList, TestEventPatternRequest, TestEventPatternResponse
    , TransformerPaths, UntagResourceRequest, UntagResourceResponse, UpdateApiDestinationRequest, UpdateApiDestinationResponse
    , UpdateArchiveRequest, UpdateArchiveResponse, UpdateConnectionApiKeyAuthRequestParameters
    , UpdateConnectionAuthRequestParameters, UpdateConnectionBasicAuthRequestParameters
    , UpdateConnectionOauthClientRequestParameters, UpdateConnectionOauthRequestParameters, UpdateConnectionRequest
    , UpdateConnectionResponse, UpdateEndpointRequest, UpdateEndpointResponse, UpdateEventBusRequest, UpdateEventBusResponse
    , apiDestinationHttpMethod, apiDestinationState, archiveState, assignPublicIp, connectionAuthorizationType
    , connectionOauthHttpMethod, connectionState, endpointState, eventSourceState, launchType, placementConstraintType
    , placementStrategyType, propagateTags, replayState, replicationState, ruleState
    )

{-| Amazon EventBridge helps you to respond to state changes in your Amazon Web Services resources. When your resources change state, they automatically send events to an event stream. You can create rules that match selected events in the stream and route them to targets to take action. You can also use rules to take action on a predetermined schedule. For example, you can configure rules to:

  - Automatically invoke an Lambda function to update DNS entries when an event notifies you that Amazon EC2 instance enters the running state. Direct specific API records from CloudTrail to an Amazon Kinesis data stream for detailed analysis of potential security or availability risks. Periodically invoke a built-in target to create a snapshot of an Amazon EBS volume.

For more information about the features of Amazon EventBridge, see the `Amazon EventBridge User Guide`.


# Service definition.

@docs service


# Service endpoints.

@docs activateEventSource, cancelReplay, createApiDestination, createArchive, createConnection, createEndpoint, createEventBus
@docs createPartnerEventSource, deactivateEventSource, deauthorizeConnection, deleteApiDestination, deleteArchive, deleteConnection
@docs deleteEndpoint, deleteEventBus, deletePartnerEventSource, deleteRule, describeApiDestination, describeArchive, describeConnection
@docs describeEndpoint, describeEventBus, describeEventSource, describePartnerEventSource, describeReplay, describeRule, disableRule
@docs enableRule, listApiDestinations, listArchives, listConnections, listEndpoints, listEventBuses, listEventSources
@docs listPartnerEventSourceAccounts, listPartnerEventSources, listReplays, listRuleNamesByTarget, listRules, listTagsForResource
@docs listTargetsByRule, putEvents, putPartnerEvents, putPermission, putRule, putTargets, removePermission, removeTargets, startReplay
@docs tagResource, testEventPattern, untagResource, updateApiDestination, updateArchive, updateConnection, updateEndpoint, updateEventBus


# API data model.

@docs ActivateEventSourceRequest, ApiDestination, ApiDestinationHttpMethod, ApiDestinationResponseList, ApiDestinationState
@docs AppSyncParameters, Archive, ArchiveResponseList, ArchiveState, AssignPublicIp, AwsVpcConfiguration, BatchArrayProperties
@docs BatchParameters, BatchRetryStrategy, CancelReplayRequest, CancelReplayResponse, CapacityProviderStrategy
@docs CapacityProviderStrategyItem, Condition, Connection, ConnectionApiKeyAuthResponseParameters, ConnectionAuthResponseParameters
@docs ConnectionAuthorizationType, ConnectionBasicAuthResponseParameters, ConnectionBodyParameter, ConnectionBodyParametersList
@docs ConnectionHeaderParameter, ConnectionHeaderParametersList, ConnectionHttpParameters, ConnectionOauthClientResponseParameters
@docs ConnectionOauthHttpMethod, ConnectionOauthResponseParameters, ConnectionQueryStringParameter
@docs ConnectionQueryStringParametersList, ConnectionResponseList, ConnectionState, CreateApiDestinationRequest
@docs CreateApiDestinationResponse, CreateArchiveRequest, CreateArchiveResponse, CreateConnectionApiKeyAuthRequestParameters
@docs CreateConnectionAuthRequestParameters, CreateConnectionBasicAuthRequestParameters
@docs CreateConnectionOauthClientRequestParameters, CreateConnectionOauthRequestParameters, CreateConnectionRequest
@docs CreateConnectionResponse, CreateEndpointRequest, CreateEndpointResponse, CreateEventBusRequest, CreateEventBusResponse
@docs CreatePartnerEventSourceRequest, CreatePartnerEventSourceResponse, DeactivateEventSourceRequest, DeadLetterConfig
@docs DeauthorizeConnectionRequest, DeauthorizeConnectionResponse, DeleteApiDestinationRequest, DeleteApiDestinationResponse
@docs DeleteArchiveRequest, DeleteArchiveResponse, DeleteConnectionRequest, DeleteConnectionResponse, DeleteEndpointRequest
@docs DeleteEndpointResponse, DeleteEventBusRequest, DeletePartnerEventSourceRequest, DeleteRuleRequest, DescribeApiDestinationRequest
@docs DescribeApiDestinationResponse, DescribeArchiveRequest, DescribeArchiveResponse, DescribeConnectionRequest
@docs DescribeConnectionResponse, DescribeEndpointRequest, DescribeEndpointResponse, DescribeEventBusRequest, DescribeEventBusResponse
@docs DescribeEventSourceRequest, DescribeEventSourceResponse, DescribePartnerEventSourceRequest, DescribePartnerEventSourceResponse
@docs DescribeReplayRequest, DescribeReplayResponse, DescribeRuleRequest, DescribeRuleResponse, DisableRuleRequest, EcsParameters
@docs EnableRuleRequest, Endpoint, EndpointEventBus, EndpointEventBusList, EndpointList, EndpointState, EventBus, EventBusList
@docs EventResourceList, EventSource, EventSourceList, EventSourceState, FailoverConfig, HeaderParametersMap, HttpParameters
@docs InputTransformer, KinesisParameters, LaunchType, ListApiDestinationsRequest, ListApiDestinationsResponse, ListArchivesRequest
@docs ListArchivesResponse, ListConnectionsRequest, ListConnectionsResponse, ListEndpointsRequest, ListEndpointsResponse
@docs ListEventBusesRequest, ListEventBusesResponse, ListEventSourcesRequest, ListEventSourcesResponse
@docs ListPartnerEventSourceAccountsRequest, ListPartnerEventSourceAccountsResponse, ListPartnerEventSourcesRequest
@docs ListPartnerEventSourcesResponse, ListReplaysRequest, ListReplaysResponse, ListRuleNamesByTargetRequest
@docs ListRuleNamesByTargetResponse, ListRulesRequest, ListRulesResponse, ListTagsForResourceRequest, ListTagsForResourceResponse
@docs ListTargetsByRuleRequest, ListTargetsByRuleResponse, NetworkConfiguration, PartnerEventSource, PartnerEventSourceAccount
@docs PartnerEventSourceAccountList, PartnerEventSourceList, PathParameterList, PlacementConstraint, PlacementConstraintType
@docs PlacementConstraints, PlacementStrategies, PlacementStrategy, PlacementStrategyType, Primary, PropagateTags, PutEventsRequest
@docs PutEventsRequestEntry, PutEventsRequestEntryList, PutEventsResponse, PutEventsResultEntry, PutEventsResultEntryList
@docs PutPartnerEventsRequest, PutPartnerEventsRequestEntry, PutPartnerEventsRequestEntryList, PutPartnerEventsResponse
@docs PutPartnerEventsResultEntry, PutPartnerEventsResultEntryList, PutPermissionRequest, PutRuleRequest, PutRuleResponse
@docs PutTargetsRequest, PutTargetsResponse, PutTargetsResultEntry, PutTargetsResultEntryList, QueryStringParametersMap
@docs RedshiftDataParameters, RemovePermissionRequest, RemoveTargetsRequest, RemoveTargetsResponse, RemoveTargetsResultEntry
@docs RemoveTargetsResultEntryList, Replay, ReplayDestination, ReplayDestinationFilters, ReplayList, ReplayState, ReplicationConfig
@docs ReplicationState, RetryPolicy, RoutingConfig, Rule, RuleNameList, RuleResponseList, RuleState, RunCommandParameters, RunCommandTarget
@docs RunCommandTargetValues, RunCommandTargets, SageMakerPipelineParameter, SageMakerPipelineParameterList
@docs SageMakerPipelineParameters, Secondary, Sqls, SqsParameters, StartReplayRequest, StartReplayResponse, StringList, Tag, TagKeyList, TagList
@docs TagResourceRequest, TagResourceResponse, Target, TargetIdList, TargetList, TestEventPatternRequest, TestEventPatternResponse
@docs TransformerPaths, UntagResourceRequest, UntagResourceResponse, UpdateApiDestinationRequest, UpdateApiDestinationResponse
@docs UpdateArchiveRequest, UpdateArchiveResponse, UpdateConnectionApiKeyAuthRequestParameters
@docs UpdateConnectionAuthRequestParameters, UpdateConnectionBasicAuthRequestParameters
@docs UpdateConnectionOauthClientRequestParameters, UpdateConnectionOauthRequestParameters, UpdateConnectionRequest
@docs UpdateConnectionResponse, UpdateEndpointRequest, UpdateEndpointResponse, UpdateEventBusRequest, UpdateEventBusResponse
@docs apiDestinationHttpMethod, apiDestinationState, archiveState, assignPublicIp, connectionAuthorizationType
@docs connectionOauthHttpMethod, connectionState, endpointState, eventSourceState, launchType, placementConstraintType
@docs placementStrategyType, propagateTags, replayState, replicationState, ruleState

-}

import AWS.Config
import AWS.Http
import AWS.KVDecode exposing (KVDecoder)
import AWS.Service
import Codec exposing (Codec)
import Dict exposing (Dict)
import Enum exposing (Enum)
import Json.Decode exposing (Decoder, Value)
import Json.Decode.Pipeline as Pipeline
import Json.Encode exposing (Value)
import Json.Encode.Optional as EncodeOpt


{-| Configuration for this service.
-}
service : AWS.Config.Region -> AWS.Service.Service
service region =
    AWS.Config.defineRegional "events" "2015-10-07" AWS.Config.JSON AWS.Config.SignV4 region
        |> AWS.Config.withJsonVersion "1.1"
        |> AWS.Config.withTargetPrefix "AWSEvents"
        |> AWS.Service.service


{-| Updates the specified event bus.
-}
updateEventBus : UpdateEventBusRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateEventBusResponse
updateEventBus req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "KmsKeyIdentifier", val.kmsKeyIdentifier ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "DeadLetterConfig", val.deadLetterConfig )
                |> EncodeOpt.optionalField (Codec.encoder deadLetterConfigCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nameFld kmsKeyIdentifierFld descriptionFld deadLetterConfigFld arnFld ->
                { arn = arnFld
                , deadLetterConfig = deadLetterConfigFld
                , description = descriptionFld
                , kmsKeyIdentifier = kmsKeyIdentifierFld
                , name = nameFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "KmsKeyIdentifier" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "DeadLetterConfig"
                    (Json.Decode.maybe (Codec.decoder deadLetterConfigCodec))
                    Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateEventBus" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Update an existing endpoint. For more information about global endpoints, see `Making applications Regional-fault tolerant with global endpoints and event replication` in the Amazon EventBridge User Guide .
-}
updateEndpoint : UpdateEndpointRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateEndpointResponse
updateEndpoint req =
    let
        encoder val =
            [ ( "RoutingConfig", val.routingConfig ) |> EncodeOpt.optionalField (Codec.encoder routingConfigCodec)
            , ( "RoleArn", val.roleArn ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "ReplicationConfig", val.replicationConfig )
                |> EncodeOpt.optionalField (Codec.encoder replicationConfigCodec)
            , ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "EventBuses", val.eventBuses ) |> EncodeOpt.optionalField (Codec.encoder endpointEventBusListCodec)
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateFld routingConfigFld roleArnFld replicationConfigFld nameFld eventBusesFld endpointUrlFld endpointIdFld arnFld ->
                { arn = arnFld
                , endpointId = endpointIdFld
                , endpointUrl = endpointUrlFld
                , eventBuses = eventBusesFld
                , name = nameFld
                , replicationConfig = replicationConfigFld
                , roleArn = roleArnFld
                , routingConfig = routingConfigFld
                , state = stateFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "State" (Json.Decode.maybe endpointStateDecoder) Nothing
                |> Pipeline.optional "RoutingConfig" (Json.Decode.maybe (Codec.decoder routingConfigCodec)) Nothing
                |> Pipeline.optional "RoleArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "ReplicationConfig"
                    (Json.Decode.maybe (Codec.decoder replicationConfigCodec))
                    Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventBuses" (Json.Decode.maybe (Codec.decoder endpointEventBusListCodec)) Nothing
                |> Pipeline.optional "EndpointUrl" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EndpointId" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateEndpoint" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Updates settings for a connection.
-}
updateConnection : UpdateConnectionRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateConnectionResponse
updateConnection req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "AuthorizationType", val.authorizationType )
                |> EncodeOpt.optionalField (Codec.encoder connectionAuthorizationTypeCodec)
            , ( "AuthParameters", val.authParameters )
                |> EncodeOpt.optionalField updateConnectionAuthRequestParametersEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\lastModifiedTimeFld lastAuthorizedTimeFld creationTimeFld connectionStateFld connectionArnFld ->
                { connectionArn = connectionArnFld
                , connectionState = connectionStateFld
                , creationTime = creationTimeFld
                , lastAuthorizedTime = lastAuthorizedTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastAuthorizedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ConnectionState" (Json.Decode.maybe (Codec.decoder connectionStateCodec)) Nothing
                |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateConnection" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Updates the specified archive.
-}
updateArchive : UpdateArchiveRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateArchiveResponse
updateArchive req =
    let
        encoder val =
            [ ( "RetentionDays", val.retentionDays ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventPattern", val.eventPattern ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "ArchiveName", val.archiveName ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld creationTimeFld archiveArnFld ->
                { archiveArn = archiveArnFld
                , creationTime = creationTimeFld
                , state = stateFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder archiveStateCodec)) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ArchiveArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateArchive" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Updates an API destination.
-}
updateApiDestination : UpdateApiDestinationRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateApiDestinationResponse
updateApiDestination req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "InvocationRateLimitPerSecond", val.invocationRateLimitPerSecond )
                |> EncodeOpt.optionalField Json.Encode.int
            , ( "InvocationEndpoint", val.invocationEndpoint ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "HttpMethod", val.httpMethod ) |> EncodeOpt.optionalField (Codec.encoder apiDestinationHttpMethodCodec)
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "ConnectionArn", val.connectionArn ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\lastModifiedTimeFld creationTimeFld apiDestinationStateFld apiDestinationArnFld ->
                { apiDestinationArn = apiDestinationArnFld
                , apiDestinationState = apiDestinationStateFld
                , creationTime = creationTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ApiDestinationState" (Json.Decode.maybe apiDestinationStateDecoder) Nothing
                |> Pipeline.optional "ApiDestinationArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateApiDestination" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge (CloudWatch Events), rules and event buses can be tagged.
-}
untagResource : UntagResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
untagResource req =
    let
        encoder val =
            [ ( "TagKeys", val.tagKeys ) |> EncodeOpt.field tagKeyListEncoder
            , ( "ResourceARN", val.resourceArn ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "UntagResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Tests whether the specified event pattern matches the provided event.

Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.

-}
testEventPattern : TestEventPatternRequest -> AWS.Http.Request AWS.Http.AWSAppError TestEventPatternResponse
testEventPattern req =
    let
        encoder val =
            [ ( "EventPattern", val.eventPattern ) |> EncodeOpt.field Json.Encode.string
            , ( "Event", val.event ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\resultFld -> { result = resultFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Result" (Json.Decode.maybe Json.Decode.bool) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "TestEventPattern" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values. In EventBridge, rules and event buses can be tagged.

Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.

You can use the `TagResource` action with a resource that already has tags. If you specify a new tag key, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.

You can associate as many as 50 tags with a resource.

-}
tagResource : TagResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
tagResource req =
    let
        encoder val =
            [ ( "Tags", val.tags ) |> EncodeOpt.field (Codec.encoder tagListCodec)
            , ( "ResourceARN", val.resourceArn ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "TagResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Starts the specified replay. Events are not necessarily replayed in the exact same order that they were added to the archive. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you specify an `EventStartTime` and an `EventEndTime` that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use `DescribeReplay` to determine the progress of a replay. The value returned for `EventLastReplayedTime` indicates the time within the specified time range associated with the last event replayed.
-}
startReplay : StartReplayRequest -> AWS.Http.Request AWS.Http.AWSAppError StartReplayResponse
startReplay req =
    let
        encoder val =
            [ ( "ReplayName", val.replayName ) |> EncodeOpt.field Json.Encode.string
            , ( "EventStartTime", val.eventStartTime ) |> EncodeOpt.field Json.Encode.string
            , ( "EventSourceArn", val.eventSourceArn ) |> EncodeOpt.field Json.Encode.string
            , ( "EventEndTime", val.eventEndTime ) |> EncodeOpt.field Json.Encode.string
            , ( "Destination", val.destination ) |> EncodeOpt.field (Codec.encoder replayDestinationCodec)
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld replayStartTimeFld replayArnFld ->
                { replayArn = replayArnFld
                , replayStartTime = replayStartTimeFld
                , state = stateFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder replayStateCodec)) Nothing
                |> Pipeline.optional "ReplayStartTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ReplayArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "StartReplay" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.

A successful execution of `RemoveTargets` doesn't guarantee all targets are removed from the rule, it means that the target(s) listed in the request are removed.

When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Allow a short period of time for changes to take effect.

This action can partially fail if too many requests are made at the same time. If that happens, `FailedEntryCount` is non-zero in the response and each entry in `FailedEntries` provides the ID of the failed target and the error code.

The maximum number of entries per request is 10.

-}
removeTargets : RemoveTargetsRequest -> AWS.Http.Request AWS.Http.AWSAppError RemoveTargetsResponse
removeTargets req =
    let
        encoder val =
            [ ( "Rule", val.rule ) |> EncodeOpt.field Json.Encode.string
            , ( "Ids", val.ids ) |> EncodeOpt.field targetIdListEncoder
            , ( "Force", val.force ) |> EncodeOpt.optionalField Json.Encode.bool
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failedEntryCountFld failedEntriesFld ->
                { failedEntries = failedEntriesFld, failedEntryCount = failedEntryCountFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "FailedEntryCount" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "FailedEntries" (Json.Decode.maybe removeTargetsResultEntryListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "RemoveTargets" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Revokes the permission of another Amazon Web Services account to be able to put events to the specified event bus. Specify the account to revoke by the `StatementId` value that you associated with the account when you granted it permission with `PutPermission`. You can find the `StatementId` by using `DescribeEventBus`.
-}
removePermission : RemovePermissionRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
removePermission req =
    let
        encoder val =
            [ ( "StatementId", val.statementId ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "RemoveAllPermissions", val.removeAllPermissions ) |> EncodeOpt.optionalField Json.Encode.bool
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
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


{-| Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.

Targets are the resources that are invoked when a rule is triggered.

The maximum number of entries per request is 10.

Each rule can have up to five (5) targets associated with it at one time.

For a list of services you can configure as targets for events, see `EventBridge targets` in the Amazon EventBridge User Guide .

Creating rules with built-in targets is supported only in the Amazon Web Services Management Console. The built-in targets are:

  -     `Amazon EBS CreateSnapshot API call`     `Amazon EC2 RebootInstances API call`     `Amazon EC2 StopInstances API call`     `Amazon EC2 TerminateInstances API call`

For some target types, `PutTargets` provides target-specific parameters. If the target is a Kinesis data stream, you can optionally specify which shard the event goes to by using the `KinesisParameters` argument. To invoke a command on multiple EC2 instances with one rule, you can use the `RunCommandParameters` field.

To be able to make API calls against the resources that you own, Amazon EventBridge needs the appropriate permissions:

  - For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies. For EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway APIs, EventBridge relies on IAM roles that you specify in the `RoleARN` argument in `PutTargets`.

For more information, see `Authentication and Access Control` in the Amazon EventBridge User Guide .

If another Amazon Web Services account is in the same region and has granted you permission (using `PutPermission`), you can send events to that account. Set that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the `Arn` value when you run `PutTargets`. If your account sends events to another account, your account is charged for each sent event. Each event sent to another account is charged as a custom event. The account receiving the event is not charged. For more information, see `Amazon EventBridge Pricing`.

`Input`, `InputPath`, and `InputTransformer` are not available with `PutTarget` if the target is an event bus of a different Amazon Web Services account.

If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a `RoleArn` with proper permissions in the `Target` structure. For more information, see `Sending and Receiving Events Between Amazon Web Services Accounts` in the Amazon EventBridge User Guide.

If you have an IAM role on a cross-account event bus target, a `PutTargets` call without a role on the same target (same `Id` and `Arn`) will not remove the role.

For more information about enabling cross-account events, see `PutPermission`.

Input, InputPath, and InputTransformer are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:

  - If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target). If Input is specified in the form of valid JSON, then the matched event is overridden with this constant. If InputPath is specified in the form of JSONPath (for example, `$.detail`), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed). If InputTransformer is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.

When you specify `InputPath` or `InputTransformer`, you must use JSON dot notation, not bracket notation.

When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Allow a short period of time for changes to take effect.

This action can partially fail if too many requests are made at the same time. If that happens, `FailedEntryCount` is non-zero in the response and each entry in `FailedEntries` provides the ID of the failed target and the error code.

-}
putTargets : PutTargetsRequest -> AWS.Http.Request AWS.Http.AWSAppError PutTargetsResponse
putTargets req =
    let
        encoder val =
            [ ( "Targets", val.targets ) |> EncodeOpt.field (Codec.encoder targetListCodec)
            , ( "Rule", val.rule ) |> EncodeOpt.field Json.Encode.string
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failedEntryCountFld failedEntriesFld ->
                { failedEntries = failedEntriesFld, failedEntryCount = failedEntryCountFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "FailedEntryCount" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "FailedEntries" (Json.Decode.maybe putTargetsResultEntryListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutTargets" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using `DisableRule`.

A single rule watches for events from a single event bus. Events generated by Amazon Web Services services go to your account's default event bus. Events generated by SaaS partner services or applications go to the matching partner event bus. If you have custom applications or services, you can specify whether their events go to your default event bus or a custom event bus that you have created. For more information, see `CreateEventBus`.

If you are updating an existing rule, the rule is replaced with what you specify in this `PutRule` command. If you omit arguments in `PutRule`, the old values for those arguments are not kept. Instead, they are replaced with null values.

When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Allow a short period of time for changes to take effect.

A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.

When you initially create a rule, you can optionally assign one or more tags to the rule. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only rules with certain tag values. To use the `PutRule` operation and assign tags, you must have both the `events:PutRule` and `events:TagResource` permissions.

If you are updating an existing rule, any tags you specify in the `PutRule` operation are ignored. To update the tags of an existing rule, use `TagResource` and `UntagResource`.

Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.

In EventBridge, it is possible to create rules that lead to infinite loops, where a rule is fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 bucket, and trigger software to change them to the desired state. If the rule is not written carefully, the subsequent change to the ACLs fires the rule again, creating an infinite loop.

To prevent this, write the rules so that the triggered actions do not re-fire the same rule. For example, your rule could fire only if ACLs are found to be in a bad state, instead of after any change.

An infinite loop can quickly cause higher than expected charges. We recommend that you use budgeting, which alerts you when charges exceed your specified limit. For more information, see `Managing Your Costs with Budgets`.

-}
putRule : PutRuleRequest -> AWS.Http.Request AWS.Http.AWSAppError PutRuleResponse
putRule req =
    let
        encoder val =
            [ ( "Tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagListCodec)
            , ( "State", val.state ) |> EncodeOpt.optionalField (Codec.encoder ruleStateCodec)
            , ( "ScheduleExpression", val.scheduleExpression ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "RoleArn", val.roleArn ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "EventPattern", val.eventPattern ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\ruleArnFld -> { ruleArn = ruleArnFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "RuleArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutRule" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Running `PutPermission` permits the specified Amazon Web Services account or Amazon Web Services organization to put events to the specified event bus. Amazon EventBridge (CloudWatch Events) rules in your account are triggered by these events arriving to an event bus in your account.

For another account to send events to your account, that external account must have an EventBridge rule with your account's event bus as a target.

To enable multiple Amazon Web Services accounts to put events to your event bus, run `PutPermission` once for each of these accounts. Or, if all the accounts are members of the same Amazon Web Services organization, you can run `PutPermission` once specifying `Principal` as "\*" and specifying the Amazon Web Services organization ID in `Condition`, to grant permissions to all accounts in that organization.

If you grant permissions using an organization, then accounts in that organization must specify a `RoleArn` with proper permissions when they use `PutTarget` to add your account's event bus as a target. For more information, see `Sending and Receiving Events Between Amazon Web Services Accounts` in the Amazon EventBridge User Guide.

The permission policy on the event bus cannot exceed 10 KB in size.

-}
putPermission : PutPermissionRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
putPermission req =
    let
        encoder val =
            [ ( "StatementId", val.statementId ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Principal", val.principal ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Policy", val.policy ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Condition", val.condition ) |> EncodeOpt.optionalField conditionEncoder
            , ( "Action", val.action ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "PutPermission" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web Services customers do not use this operation.

For information on calculating event batch size, see `Calculating EventBridge PutEvents event entry size` in the EventBridge User Guide.

-}
putPartnerEvents : PutPartnerEventsRequest -> AWS.Http.Request AWS.Http.AWSAppError PutPartnerEventsResponse
putPartnerEvents req =
    let
        encoder val =
            [ ( "Entries", val.entries ) |> EncodeOpt.field putPartnerEventsRequestEntryListEncoder ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failedEntryCountFld entriesFld -> { entries = entriesFld, failedEntryCount = failedEntryCountFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "FailedEntryCount" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "Entries" (Json.Decode.maybe putPartnerEventsResultEntryListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutPartnerEvents" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Sends custom events to Amazon EventBridge so that they can be matched to rules.

The maximum size for a PutEvents event entry is 256 KB. Entry size is calculated including the event and any necessary characters and keys of the JSON representation of the event. To learn more, see `Calculating PutEvents event entry size` in the Amazon EventBridge User Guide

PutEvents accepts the data in JSON format. For the JSON number (integer) data type, the constraints are: a minimum value of -9,223,372,036,854,775,808 and a maximum value of 9,223,372,036,854,775,807.

PutEvents will only process nested JSON up to 1100 levels deep.

-}
putEvents : PutEventsRequest -> AWS.Http.Request AWS.Http.AWSAppError PutEventsResponse
putEvents req =
    let
        encoder val =
            [ ( "Entries", val.entries ) |> EncodeOpt.field putEventsRequestEntryListEncoder
            , ( "EndpointId", val.endpointId ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failedEntryCountFld entriesFld -> { entries = entriesFld, failedEntryCount = failedEntryCountFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "FailedEntryCount" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "Entries" (Json.Decode.maybe putEventsResultEntryListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutEvents" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists the targets assigned to the specified rule.

The maximum number of results per page for requests is 100.

-}
listTargetsByRule : ListTargetsByRuleRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTargetsByRuleResponse
listTargetsByRule req =
    let
        encoder val =
            [ ( "Rule", val.rule ) |> EncodeOpt.field Json.Encode.string
            , ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\targetsFld nextTokenFld -> { nextToken = nextTokenFld, targets = targetsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Targets" (Json.Decode.maybe (Codec.decoder targetListCodec)) Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTargetsByRule" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses can be tagged.
-}
listTagsForResource : ListTagsForResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTagsForResourceResponse
listTagsForResource req =
    let
        encoder val =
            [ ( "ResourceARN", val.resourceArn ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tagsFld -> { tags = tagsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Tags" (Json.Decode.maybe (Codec.decoder tagListCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTagsForResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a prefix to match to the rule names.

The maximum number of results per page for requests is 100.

ListRules does not list the targets of a rule. To see the targets associated with a rule, use `ListTargetsByRule`.

-}
listRules : ListRulesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListRulesResponse
listRules req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\rulesFld nextTokenFld -> { nextToken = nextTokenFld, rules = rulesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Rules" (Json.Decode.maybe ruleResponseListDecoder) Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListRules" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge can invoke a specific target in your account.

The maximum number of results per page for requests is 100.

-}
listRuleNamesByTarget : ListRuleNamesByTargetRequest -> AWS.Http.Request AWS.Http.AWSAppError ListRuleNamesByTargetResponse
listRuleNamesByTarget req =
    let
        encoder val =
            [ ( "TargetArn", val.targetArn ) |> EncodeOpt.field Json.Encode.string
            , ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\ruleNamesFld nextTokenFld -> { nextToken = nextTokenFld, ruleNames = ruleNamesFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "RuleNames" (Json.Decode.maybe ruleNameListDecoder) Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListRuleNamesByTarget" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists your replays. You can either list all the replays or you can provide a prefix to match to the replay names. Filter parameters are exclusive.
-}
listReplays : ListReplaysRequest -> AWS.Http.Request AWS.Http.AWSAppError ListReplaysResponse
listReplays req =
    let
        encoder val =
            [ ( "State", val.state ) |> EncodeOpt.optionalField (Codec.encoder replayStateCodec)
            , ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventSourceArn", val.eventSourceArn ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\replaysFld nextTokenFld -> { nextToken = nextTokenFld, replays = replaysFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Replays" (Json.Decode.maybe replayListDecoder) Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListReplays" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| An SaaS partner can use this operation to list all the partner event source names that they have created. This operation is not used by Amazon Web Services customers.
-}
listPartnerEventSources : ListPartnerEventSourcesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListPartnerEventSourcesResponse
listPartnerEventSources req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.field Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\partnerEventSourcesFld nextTokenFld ->
                { nextToken = nextTokenFld, partnerEventSources = partnerEventSourcesFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "PartnerEventSources" (Json.Decode.maybe partnerEventSourceListDecoder) Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListPartnerEventSources" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| An SaaS partner can use this operation to display the Amazon Web Services account ID that a particular partner event source name is associated with. This operation is not used by Amazon Web Services customers.
-}
listPartnerEventSourceAccounts :
    ListPartnerEventSourceAccountsRequest
    -> AWS.Http.Request AWS.Http.AWSAppError ListPartnerEventSourceAccountsResponse
listPartnerEventSourceAccounts req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventSourceName", val.eventSourceName ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\partnerEventSourceAccountsFld nextTokenFld ->
                { nextToken = nextTokenFld, partnerEventSourceAccounts = partnerEventSourceAccountsFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional
                    "PartnerEventSourceAccounts"
                    (Json.Decode.maybe partnerEventSourceAccountListDecoder)
                    Nothing
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListPartnerEventSourceAccounts" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| You can use this to see all the partner event sources that have been shared with your Amazon Web Services account. For more information about partner event sources, see `CreateEventBus`.
-}
listEventSources : ListEventSourcesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListEventSourcesResponse
listEventSources req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld eventSourcesFld -> { eventSources = eventSourcesFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventSources" (Json.Decode.maybe eventSourceListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListEventSources" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists all the event buses in your account, including the default event bus, custom event buses, and partner event buses.
-}
listEventBuses : ListEventBusesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListEventBusesResponse
listEventBuses req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld eventBusesFld -> { eventBuses = eventBusesFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventBuses" (Json.Decode.maybe eventBusListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListEventBuses" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| List the global endpoints associated with this account. For more information about global endpoints, see `Making applications Regional-fault tolerant with global endpoints and event replication` in the Amazon EventBridge User Guide .
-}
listEndpoints : ListEndpointsRequest -> AWS.Http.Request AWS.Http.AWSAppError ListEndpointsResponse
listEndpoints req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "MaxResults", val.maxResults ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "HomeRegion", val.homeRegion ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld endpointsFld -> { endpoints = endpointsFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Endpoints" (Json.Decode.maybe endpointListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListEndpoints" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves a list of connections from the account.
-}
listConnections : ListConnectionsRequest -> AWS.Http.Request AWS.Http.AWSAppError ListConnectionsResponse
listConnections req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "ConnectionState", val.connectionState ) |> EncodeOpt.optionalField (Codec.encoder connectionStateCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld connectionsFld -> { connections = connectionsFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Connections" (Json.Decode.maybe connectionResponseListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListConnections" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists your archives. You can either list all the archives or you can provide a prefix to match to the archive names. Filter parameters are exclusive.
-}
listArchives : ListArchivesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListArchivesResponse
listArchives req =
    let
        encoder val =
            [ ( "State", val.state ) |> EncodeOpt.optionalField (Codec.encoder archiveStateCodec)
            , ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventSourceArn", val.eventSourceArn ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld archivesFld -> { archives = archivesFld, nextToken = nextTokenFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Archives" (Json.Decode.maybe archiveResponseListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListArchives" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves a list of API destination in the account in the current Region.
-}
listApiDestinations : ListApiDestinationsRequest -> AWS.Http.Request AWS.Http.AWSAppError ListApiDestinationsResponse
listApiDestinations req =
    let
        encoder val =
            [ ( "NextToken", val.nextToken ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "NamePrefix", val.namePrefix ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Limit", val.limit ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "ConnectionArn", val.connectionArn ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld apiDestinationsFld -> { apiDestinations = apiDestinationsFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "NextToken" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ApiDestinations" (Json.Decode.maybe apiDestinationResponseListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListApiDestinations" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Enables the specified rule. If the rule does not exist, the operation fails.

When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Allow a short period of time for changes to take effect.

-}
enableRule : EnableRuleRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
enableRule req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "EnableRule" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.

When you disable a rule, incoming events might continue to match to the disabled rule. Allow a short period of time for changes to take effect.

-}
disableRule : DisableRuleRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
disableRule req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DisableRule" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes the specified rule.

DescribeRule does not list the targets of a rule. To see the targets associated with a rule, use `ListTargetsByRule`.

-}
describeRule : DescribeRuleRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeRuleResponse
describeRule req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateFld scheduleExpressionFld roleArnFld nameFld managedByFld eventPatternFld eventBusNameFld descriptionFld createdByFld arnFld ->
                { arn = arnFld
                , createdBy = createdByFld
                , description = descriptionFld
                , eventBusName = eventBusNameFld
                , eventPattern = eventPatternFld
                , managedBy = managedByFld
                , name = nameFld
                , roleArn = roleArnFld
                , scheduleExpression = scheduleExpressionFld
                , state = stateFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder ruleStateCodec)) Nothing
                |> Pipeline.optional "ScheduleExpression" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "RoleArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ManagedBy" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventPattern" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventBusName" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreatedBy" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeRule" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves details about a replay. Use `DescribeReplay` to determine the progress of a running replay. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you use `StartReplay` and specify an `EventStartTime` and an `EventEndTime` that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use `DescribeReplay` to determine the progress of a replay. The value returned for `EventLastReplayedTime` indicates the time within the specified time range associated with the last event replayed.
-}
describeReplay : DescribeReplayRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeReplayResponse
describeReplay req =
    let
        encoder val =
            [ ( "ReplayName", val.replayName ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld replayStartTimeFld replayNameFld replayEndTimeFld replayArnFld eventStartTimeFld eventSourceArnFld eventLastReplayedTimeFld eventEndTimeFld destinationFld descriptionFld ->
                { description = descriptionFld
                , destination = destinationFld
                , eventEndTime = eventEndTimeFld
                , eventLastReplayedTime = eventLastReplayedTimeFld
                , eventSourceArn = eventSourceArnFld
                , eventStartTime = eventStartTimeFld
                , replayArn = replayArnFld
                , replayEndTime = replayEndTimeFld
                , replayName = replayNameFld
                , replayStartTime = replayStartTimeFld
                , state = stateFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder replayStateCodec)) Nothing
                |> Pipeline.optional "ReplayStartTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ReplayName" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ReplayEndTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ReplayArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventStartTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventSourceArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventLastReplayedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventEndTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Destination" (Json.Decode.maybe (Codec.decoder replayDestinationCodec)) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeReplay" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| An SaaS partner can use this operation to list details about a partner event source that they have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web Services customers can use `DescribeEventSource` to see details about a partner event source that is shared with them.
-}
describePartnerEventSource : DescribePartnerEventSourceRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribePartnerEventSourceResponse
describePartnerEventSource req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nameFld arnFld -> { arn = arnFld, name = nameFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribePartnerEventSource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| This operation lists details about a partner event source that is shared with your account.
-}
describeEventSource : DescribeEventSourceRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeEventSourceResponse
describeEventSource req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateFld nameFld expirationTimeFld creationTimeFld createdByFld arnFld ->
                { arn = arnFld
                , createdBy = createdByFld
                , creationTime = creationTimeFld
                , expirationTime = expirationTimeFld
                , name = nameFld
                , state = stateFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "State" (Json.Decode.maybe eventSourceStateDecoder) Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ExpirationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreatedBy" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeEventSource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Displays details about an event bus in your account. This can include the external Amazon Web Services accounts that are permitted to write events to your default event bus, and the associated policy. For custom event buses and partner event buses, it displays the name, ARN, policy, state, and creation time.

To enable your account to receive events from other accounts on its default event bus, use `PutPermission`.

For more information about partner event buses, see `CreateEventBus`.

-}
describeEventBus : DescribeEventBusRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeEventBusResponse
describeEventBus req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.optionalField Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\policyFld nameFld lastModifiedTimeFld kmsKeyIdentifierFld descriptionFld deadLetterConfigFld creationTimeFld arnFld ->
                { arn = arnFld
                , creationTime = creationTimeFld
                , deadLetterConfig = deadLetterConfigFld
                , description = descriptionFld
                , kmsKeyIdentifier = kmsKeyIdentifierFld
                , lastModifiedTime = lastModifiedTimeFld
                , name = nameFld
                , policy = policyFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "Policy" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "KmsKeyIdentifier" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "DeadLetterConfig"
                    (Json.Decode.maybe (Codec.decoder deadLetterConfigCodec))
                    Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeEventBus" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Get the information about an existing global endpoint. For more information about global endpoints, see `Making applications Regional-fault tolerant with global endpoints and event replication` in the Amazon EventBridge User Guide .
-}
describeEndpoint : DescribeEndpointRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeEndpointResponse
describeEndpoint req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "HomeRegion", val.homeRegion ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld routingConfigFld roleArnFld replicationConfigFld nameFld lastModifiedTimeFld eventBusesFld endpointUrlFld endpointIdFld descriptionFld creationTimeFld arnFld ->
                { arn = arnFld
                , creationTime = creationTimeFld
                , description = descriptionFld
                , endpointId = endpointIdFld
                , endpointUrl = endpointUrlFld
                , eventBuses = eventBusesFld
                , lastModifiedTime = lastModifiedTimeFld
                , name = nameFld
                , replicationConfig = replicationConfigFld
                , roleArn = roleArnFld
                , routingConfig = routingConfigFld
                , state = stateFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe endpointStateDecoder) Nothing
                |> Pipeline.optional "RoutingConfig" (Json.Decode.maybe (Codec.decoder routingConfigCodec)) Nothing
                |> Pipeline.optional "RoleArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "ReplicationConfig"
                    (Json.Decode.maybe (Codec.decoder replicationConfigCodec))
                    Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventBuses" (Json.Decode.maybe (Codec.decoder endpointEventBusListCodec)) Nothing
                |> Pipeline.optional "EndpointUrl" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EndpointId" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeEndpoint" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves details about a connection.
-}
describeConnection : DescribeConnectionRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeConnectionResponse
describeConnection req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld secretArnFld nameFld lastModifiedTimeFld lastAuthorizedTimeFld descriptionFld creationTimeFld connectionStateFld connectionArnFld authorizationTypeFld authParametersFld ->
                { authParameters = authParametersFld
                , authorizationType = authorizationTypeFld
                , connectionArn = connectionArnFld
                , connectionState = connectionStateFld
                , creationTime = creationTimeFld
                , description = descriptionFld
                , lastAuthorizedTime = lastAuthorizedTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                , name = nameFld
                , secretArn = secretArnFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "SecretArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastAuthorizedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ConnectionState" (Json.Decode.maybe (Codec.decoder connectionStateCodec)) Nothing
                |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "AuthorizationType"
                    (Json.Decode.maybe (Codec.decoder connectionAuthorizationTypeCodec))
                    Nothing
                |> Pipeline.optional
                    "AuthParameters"
                    (Json.Decode.maybe connectionAuthResponseParametersDecoder)
                    Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeConnection" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves details about an archive.
-}
describeArchive : DescribeArchiveRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeArchiveResponse
describeArchive req =
    let
        encoder val =
            [ ( "ArchiveName", val.archiveName ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld sizeBytesFld retentionDaysFld eventSourceArnFld eventPatternFld eventCountFld descriptionFld creationTimeFld archiveNameFld archiveArnFld ->
                { archiveArn = archiveArnFld
                , archiveName = archiveNameFld
                , creationTime = creationTimeFld
                , description = descriptionFld
                , eventCount = eventCountFld
                , eventPattern = eventPatternFld
                , eventSourceArn = eventSourceArnFld
                , retentionDays = retentionDaysFld
                , sizeBytes = sizeBytesFld
                , state = stateFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder archiveStateCodec)) Nothing
                |> Pipeline.optional "SizeBytes" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "RetentionDays" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "EventSourceArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventPattern" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventCount" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ArchiveName" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ArchiveArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeArchive" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves details about an API destination.
-}
describeApiDestination : DescribeApiDestinationRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeApiDestinationResponse
describeApiDestination req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nameFld lastModifiedTimeFld invocationRateLimitPerSecondFld invocationEndpointFld httpMethodFld descriptionFld creationTimeFld connectionArnFld apiDestinationStateFld apiDestinationArnFld ->
                { apiDestinationArn = apiDestinationArnFld
                , apiDestinationState = apiDestinationStateFld
                , connectionArn = connectionArnFld
                , creationTime = creationTimeFld
                , description = descriptionFld
                , httpMethod = httpMethodFld
                , invocationEndpoint = invocationEndpointFld
                , invocationRateLimitPerSecond = invocationRateLimitPerSecondFld
                , lastModifiedTime = lastModifiedTimeFld
                , name = nameFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "InvocationRateLimitPerSecond" (Json.Decode.maybe Json.Decode.int) Nothing
                |> Pipeline.optional "InvocationEndpoint" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "HttpMethod"
                    (Json.Decode.maybe (Codec.decoder apiDestinationHttpMethodCodec))
                    Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ApiDestinationState" (Json.Decode.maybe apiDestinationStateDecoder) Nothing
                |> Pipeline.optional "ApiDestinationArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeApiDestination" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified rule.

Before you can delete the rule, you must remove all targets, using `RemoveTargets`.

When you delete a rule, incoming events might continue to match to the deleted rule. Allow a short period of time for changes to take effect.

If you call delete rule multiple times for the same rule, all calls will succeed. When you call delete rule for a non-existent custom eventbus, `ResourceNotFoundException` is returned.

Managed rules are rules created and managed by another Amazon Web Services service on your behalf. These rules are created by those other Amazon Web Services services to support functionality in those services. You can delete these rules using the `Force` option, but you should do so only if you are sure the other service is not still using that rule.

-}
deleteRule : DeleteRuleRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteRule req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "Force", val.force ) |> EncodeOpt.optionalField Json.Encode.bool
            , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteRule" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-|

<p>This operation is used by SaaS partners to delete a partner event source. This operation is not used by Amazon Web Services customers.</p> <p>When you delete an event source, the status of the corresponding partner event bus in the Amazon Web Services customer account becomes DELETED.</p> <p/>

-}
deletePartnerEventSource : DeletePartnerEventSourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deletePartnerEventSource req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "Account", val.account ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeletePartnerEventSource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified custom event bus or partner event bus. All rules associated with this event bus need to be deleted. You can't delete your account's default event bus.
-}
deleteEventBus : DeleteEventBusRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteEventBus req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteEventBus" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Delete an existing global endpoint. For more information about global endpoints, see `Making applications Regional-fault tolerant with global endpoints and event replication` in the Amazon EventBridge User Guide .
-}
deleteEndpoint : DeleteEndpointRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteEndpoint req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteEndpoint" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes a connection.
-}
deleteConnection : DeleteConnectionRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteConnectionResponse
deleteConnection req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\lastModifiedTimeFld lastAuthorizedTimeFld creationTimeFld connectionStateFld connectionArnFld ->
                { connectionArn = connectionArnFld
                , connectionState = connectionStateFld
                , creationTime = creationTimeFld
                , lastAuthorizedTime = lastAuthorizedTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastAuthorizedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ConnectionState" (Json.Decode.maybe (Codec.decoder connectionStateCodec)) Nothing
                |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteConnection" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified archive.
-}
deleteArchive : DeleteArchiveRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteArchive req =
    let
        encoder val =
            [ ( "ArchiveName", val.archiveName ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteArchive" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified API destination.
-}
deleteApiDestination : DeleteApiDestinationRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deleteApiDestination req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeleteApiDestination" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Removes all authorization parameters from the connection. This lets you remove the secret from the connection so you can reuse it without having to create a new connection.
-}
deauthorizeConnection : DeauthorizeConnectionRequest -> AWS.Http.Request AWS.Http.AWSAppError DeauthorizeConnectionResponse
deauthorizeConnection req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\lastModifiedTimeFld lastAuthorizedTimeFld creationTimeFld connectionStateFld connectionArnFld ->
                { connectionArn = connectionArnFld
                , connectionState = connectionStateFld
                , creationTime = creationTimeFld
                , lastAuthorizedTime = lastAuthorizedTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "LastAuthorizedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ConnectionState" (Json.Decode.maybe (Codec.decoder connectionStateCodec)) Nothing
                |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeauthorizeConnection" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| You can use this operation to temporarily stop receiving events from the specified partner event source. The matching event bus is not deleted.

When you deactivate a partner event source, the source goes into PENDING state. If it remains in PENDING state for more than two weeks, it is deleted.

To activate a deactivated partner event source, use `ActivateEventSource`.

-}
deactivateEventSource : DeactivateEventSourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
deactivateEventSource req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "DeactivateEventSource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Called by an SaaS partner to create a partner event source. This operation is not used by Amazon Web Services customers.

Each partner event source can be used by one Amazon Web Services account to create a matching partner event bus in that Amazon Web Services account. A SaaS partner must create one partner event source for each Amazon Web Services account that wants to receive those event types.

A partner event source creates events based on resources within the SaaS partner's service or application.

An Amazon Web Services account that creates a partner event bus that matches the partner event source can use that event bus to receive events from the partner, and then process them using Amazon Web Services Events rules and targets.

Partner event source names follow this format:

partner\_name/event\_namespace/event\_name``

  -     partner_name is determined during partner registration, and identifies the partner to Amazon Web Services customers.     event_namespace is determined by the partner, and is a way for the partner to categorize their events.    event_name is determined by the partner, and should uniquely identify an event-generating resource within the partner system.  The event_name must be unique across all Amazon Web Services customers. This is because the event source is a shared resource between the partner and customer accounts, and each partner event source unique in the partner account.

The combination of event\_namespace and event\_name should help Amazon Web Services customers decide whether to create an event bus to receive these events.

-}
createPartnerEventSource : CreatePartnerEventSourceRequest -> AWS.Http.Request AWS.Http.AWSAppError CreatePartnerEventSourceResponse
createPartnerEventSource req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "Account", val.account ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\eventSourceArnFld -> { eventSourceArn = eventSourceArnFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "EventSourceArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreatePartnerEventSource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates a new event bus within your account. This can be a custom event bus which you can use to receive events from your custom applications and services, or it can be a partner event bus which can be matched to a partner event source.
-}
createEventBus : CreateEventBusRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateEventBusResponse
createEventBus req =
    let
        encoder val =
            [ ( "Tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagListCodec)
            , ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "KmsKeyIdentifier", val.kmsKeyIdentifier ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "EventSourceName", val.eventSourceName ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "DeadLetterConfig", val.deadLetterConfig )
                |> EncodeOpt.optionalField (Codec.encoder deadLetterConfigCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\kmsKeyIdentifierFld eventBusArnFld descriptionFld deadLetterConfigFld ->
                { deadLetterConfig = deadLetterConfigFld
                , description = descriptionFld
                , eventBusArn = eventBusArnFld
                , kmsKeyIdentifier = kmsKeyIdentifierFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "KmsKeyIdentifier" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventBusArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "DeadLetterConfig"
                    (Json.Decode.maybe (Codec.decoder deadLetterConfigCodec))
                    Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateEventBus" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates a global endpoint. Global endpoints improve your application's availability by making it regional-fault tolerant. To do this, you define a primary and secondary Region with event buses in each Region. You also create a Amazon Route 53 health check that will tell EventBridge to route events to the secondary Region when an "unhealthy" state is encountered and events will be routed back to the primary Region when the health check reports a "healthy" state.
-}
createEndpoint : CreateEndpointRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateEndpointResponse
createEndpoint req =
    let
        encoder val =
            [ ( "RoutingConfig", val.routingConfig ) |> EncodeOpt.field (Codec.encoder routingConfigCodec)
            , ( "RoleArn", val.roleArn ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "ReplicationConfig", val.replicationConfig )
                |> EncodeOpt.optionalField (Codec.encoder replicationConfigCodec)
            , ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "EventBuses", val.eventBuses ) |> EncodeOpt.field (Codec.encoder endpointEventBusListCodec)
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateFld routingConfigFld roleArnFld replicationConfigFld nameFld eventBusesFld arnFld ->
                { arn = arnFld
                , eventBuses = eventBusesFld
                , name = nameFld
                , replicationConfig = replicationConfigFld
                , roleArn = roleArnFld
                , routingConfig = routingConfigFld
                , state = stateFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "State" (Json.Decode.maybe endpointStateDecoder) Nothing
                |> Pipeline.optional "RoutingConfig" (Json.Decode.maybe (Codec.decoder routingConfigCodec)) Nothing
                |> Pipeline.optional "RoleArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional
                    "ReplicationConfig"
                    (Json.Decode.maybe (Codec.decoder replicationConfigCodec))
                    Nothing
                |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "EventBuses" (Json.Decode.maybe (Codec.decoder endpointEventBusListCodec)) Nothing
                |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateEndpoint" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates a connection. A connection defines the authorization type and credentials to use for authorization with an API destination HTTP endpoint.
-}
createConnection : CreateConnectionRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateConnectionResponse
createConnection req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "AuthorizationType", val.authorizationType )
                |> EncodeOpt.field (Codec.encoder connectionAuthorizationTypeCodec)
            , ( "AuthParameters", val.authParameters ) |> EncodeOpt.field createConnectionAuthRequestParametersEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\lastModifiedTimeFld creationTimeFld connectionStateFld connectionArnFld ->
                { connectionArn = connectionArnFld
                , connectionState = connectionStateFld
                , creationTime = creationTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ConnectionState" (Json.Decode.maybe (Codec.decoder connectionStateCodec)) Nothing
                |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateConnection" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates an archive of events with the specified settings. When you create an archive, incoming events might not immediately start being sent to the archive. Allow a short period of time for changes to take effect. If you do not specify a pattern to filter events sent to the archive, all events are sent to the archive except replayed events. Replayed events are not sent to an archive.

  - Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if: You call `CreateArchive``` on an event bus set to use a customer managed key for encryption. You call `CreateDiscoverer``` on an event bus set to use a customer managed key for encryption. You call `UpdatedEventBus``` to set a customer managed key on an event bus with an archives or schema discovery enabled. To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see `Data encryption in EventBridge` in the Amazon EventBridge User Guide.

-}
createArchive : CreateArchiveRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateArchiveResponse
createArchive req =
    let
        encoder val =
            [ ( "RetentionDays", val.retentionDays ) |> EncodeOpt.optionalField Json.Encode.int
            , ( "EventSourceArn", val.eventSourceArn ) |> EncodeOpt.field Json.Encode.string
            , ( "EventPattern", val.eventPattern ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "ArchiveName", val.archiveName ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld creationTimeFld archiveArnFld ->
                { archiveArn = archiveArnFld
                , creationTime = creationTimeFld
                , state = stateFld
                , stateReason = stateReasonFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder archiveStateCodec)) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ArchiveArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateArchive" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates an API destination, which is an HTTP invocation endpoint configured as a target for events.

API destinations do not support private destinations, such as interface VPC endpoints.

For more information, see `API destinations` in the EventBridge User Guide.

-}
createApiDestination : CreateApiDestinationRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateApiDestinationResponse
createApiDestination req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string
            , ( "InvocationRateLimitPerSecond", val.invocationRateLimitPerSecond )
                |> EncodeOpt.optionalField Json.Encode.int
            , ( "InvocationEndpoint", val.invocationEndpoint ) |> EncodeOpt.field Json.Encode.string
            , ( "HttpMethod", val.httpMethod ) |> EncodeOpt.field (Codec.encoder apiDestinationHttpMethodCodec)
            , ( "Description", val.description ) |> EncodeOpt.optionalField Json.Encode.string
            , ( "ConnectionArn", val.connectionArn ) |> EncodeOpt.field Json.Encode.string
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\lastModifiedTimeFld creationTimeFld apiDestinationStateFld apiDestinationArnFld ->
                { apiDestinationArn = apiDestinationArnFld
                , apiDestinationState = apiDestinationStateFld
                , creationTime = creationTimeFld
                , lastModifiedTime = lastModifiedTimeFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "ApiDestinationState" (Json.Decode.maybe apiDestinationStateDecoder) Nothing
                |> Pipeline.optional "ApiDestinationArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateApiDestination" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Cancels the specified replay.
-}
cancelReplay : CancelReplayRequest -> AWS.Http.Request AWS.Http.AWSAppError CancelReplayResponse
cancelReplay req =
    let
        encoder val =
            [ ( "ReplayName", val.replayName ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\stateReasonFld stateFld replayArnFld ->
                { replayArn = replayArnFld, state = stateFld, stateReason = stateReasonFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing
                |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder replayStateCodec)) Nothing
                |> Pipeline.optional "ReplayArn" (Json.Decode.maybe Json.Decode.string) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CancelReplay" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Activates a partner event source that has been deactivated. Once activated, your matching event bus will start receiving events from the event source.
-}
activateEventSource : ActivateEventSourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
activateEventSource req =
    let
        encoder val =
            [ ( "Name", val.name ) |> EncodeOpt.field Json.Encode.string ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "ActivateEventSource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| The UpdateEventBusResponse data model.
-}
type alias UpdateEventBusResponse =
    { arn : Maybe String
    , deadLetterConfig : Maybe DeadLetterConfig
    , description : Maybe String
    , kmsKeyIdentifier : Maybe String
    , name : Maybe String
    }


{-| The UpdateEventBusRequest data model.
-}
type alias UpdateEventBusRequest =
    { deadLetterConfig : Maybe DeadLetterConfig
    , description : Maybe String
    , kmsKeyIdentifier : Maybe String
    , name : Maybe String
    }


{-| The UpdateEndpointResponse data model.
-}
type alias UpdateEndpointResponse =
    { arn : Maybe String
    , endpointId : Maybe String
    , endpointUrl : Maybe String
    , eventBuses : Maybe EndpointEventBusList
    , name : Maybe String
    , replicationConfig : Maybe ReplicationConfig
    , roleArn : Maybe String
    , routingConfig : Maybe RoutingConfig
    , state : Maybe EndpointState
    }


{-| The UpdateEndpointRequest data model.
-}
type alias UpdateEndpointRequest =
    { description : Maybe String
    , eventBuses : Maybe EndpointEventBusList
    , name : String
    , replicationConfig : Maybe ReplicationConfig
    , roleArn : Maybe String
    , routingConfig : Maybe RoutingConfig
    }


{-| The UpdateConnectionResponse data model.
-}
type alias UpdateConnectionResponse =
    { connectionArn : Maybe String
    , connectionState : Maybe ConnectionState
    , creationTime : Maybe String
    , lastAuthorizedTime : Maybe String
    , lastModifiedTime : Maybe String
    }


{-| The UpdateConnectionRequest data model.
-}
type alias UpdateConnectionRequest =
    { authParameters : Maybe UpdateConnectionAuthRequestParameters
    , authorizationType : Maybe ConnectionAuthorizationType
    , description : Maybe String
    , name : String
    }


{-| The UpdateConnectionOauthRequestParameters data model.
-}
type alias UpdateConnectionOauthRequestParameters =
    { authorizationEndpoint : Maybe String
    , clientParameters : Maybe UpdateConnectionOauthClientRequestParameters
    , httpMethod : Maybe ConnectionOauthHttpMethod
    , oauthHttpParameters : Maybe ConnectionHttpParameters
    }


{-| The UpdateConnectionOauthClientRequestParameters data model.
-}
type alias UpdateConnectionOauthClientRequestParameters =
    { clientId : Maybe String, clientSecret : Maybe String }


{-| The UpdateConnectionBasicAuthRequestParameters data model.
-}
type alias UpdateConnectionBasicAuthRequestParameters =
    { password : Maybe String, username : Maybe String }


{-| The UpdateConnectionAuthRequestParameters data model.
-}
type alias UpdateConnectionAuthRequestParameters =
    { apiKeyAuthParameters : Maybe UpdateConnectionApiKeyAuthRequestParameters
    , basicAuthParameters : Maybe UpdateConnectionBasicAuthRequestParameters
    , invocationHttpParameters : Maybe ConnectionHttpParameters
    , oauthParameters : Maybe UpdateConnectionOauthRequestParameters
    }


{-| The UpdateConnectionApiKeyAuthRequestParameters data model.
-}
type alias UpdateConnectionApiKeyAuthRequestParameters =
    { apiKeyName : Maybe String, apiKeyValue : Maybe String }


{-| The UpdateArchiveResponse data model.
-}
type alias UpdateArchiveResponse =
    { archiveArn : Maybe String, creationTime : Maybe String, state : Maybe ArchiveState, stateReason : Maybe String }


{-| The UpdateArchiveRequest data model.
-}
type alias UpdateArchiveRequest =
    { archiveName : String, description : Maybe String, eventPattern : Maybe String, retentionDays : Maybe Int }


{-| The UpdateApiDestinationResponse data model.
-}
type alias UpdateApiDestinationResponse =
    { apiDestinationArn : Maybe String
    , apiDestinationState : Maybe ApiDestinationState
    , creationTime : Maybe String
    , lastModifiedTime : Maybe String
    }


{-| The UpdateApiDestinationRequest data model.
-}
type alias UpdateApiDestinationRequest =
    { connectionArn : Maybe String
    , description : Maybe String
    , httpMethod : Maybe ApiDestinationHttpMethod
    , invocationEndpoint : Maybe String
    , invocationRateLimitPerSecond : Maybe Int
    , name : String
    }


{-| The UntagResourceResponse data model.
-}
type alias UntagResourceResponse =
    {}


{-| The UntagResourceRequest data model.
-}
type alias UntagResourceRequest =
    { resourceArn : String, tagKeys : TagKeyList }


{-| The TransformerPaths data model.
-}
type alias TransformerPaths =
    Dict String String


{-| The TestEventPatternResponse data model.
-}
type alias TestEventPatternResponse =
    { result : Maybe Bool }


{-| The TestEventPatternRequest data model.
-}
type alias TestEventPatternRequest =
    { event : String, eventPattern : String }


{-| The TargetList data model.
-}
type alias TargetList =
    List Target


{-| The TargetIdList data model.
-}
type alias TargetIdList =
    List String


{-| The Target data model.
-}
type alias Target =
    { appSyncParameters : Maybe AppSyncParameters
    , arn : String
    , batchParameters : Maybe BatchParameters
    , deadLetterConfig : Maybe DeadLetterConfig
    , ecsParameters : Maybe EcsParameters
    , httpParameters : Maybe HttpParameters
    , id : String
    , input : Maybe String
    , inputPath : Maybe String
    , inputTransformer : Maybe InputTransformer
    , kinesisParameters : Maybe KinesisParameters
    , redshiftDataParameters : Maybe RedshiftDataParameters
    , retryPolicy : Maybe RetryPolicy
    , roleArn : Maybe String
    , runCommandParameters : Maybe RunCommandParameters
    , sageMakerPipelineParameters : Maybe SageMakerPipelineParameters
    , sqsParameters : Maybe SqsParameters
    }


{-| The TagResourceResponse data model.
-}
type alias TagResourceResponse =
    {}


{-| The TagResourceRequest data model.
-}
type alias TagResourceRequest =
    { resourceArn : String, tags : TagList }


{-| The TagList data model.
-}
type alias TagList =
    List Tag


{-| The TagKeyList data model.
-}
type alias TagKeyList =
    List String


{-| The Tag data model.
-}
type alias Tag =
    { key : String, value : String }


{-| The StringList data model.
-}
type alias StringList =
    List String


{-| The StartReplayResponse data model.
-}
type alias StartReplayResponse =
    { replayArn : Maybe String, replayStartTime : Maybe String, state : Maybe ReplayState, stateReason : Maybe String }


{-| The StartReplayRequest data model.
-}
type alias StartReplayRequest =
    { description : Maybe String
    , destination : ReplayDestination
    , eventEndTime : String
    , eventSourceArn : String
    , eventStartTime : String
    , replayName : String
    }


{-| The SqsParameters data model.
-}
type alias SqsParameters =
    { messageGroupId : Maybe String }


{-| The Sqls data model.
-}
type alias Sqls =
    List String


{-| The Secondary data model.
-}
type alias Secondary =
    { route : String }


{-| The SageMakerPipelineParameters data model.
-}
type alias SageMakerPipelineParameters =
    { pipelineParameterList : Maybe SageMakerPipelineParameterList }


{-| The SageMakerPipelineParameterList data model.
-}
type alias SageMakerPipelineParameterList =
    List SageMakerPipelineParameter


{-| The SageMakerPipelineParameter data model.
-}
type alias SageMakerPipelineParameter =
    { name : String, value : String }


{-| The RunCommandTargets data model.
-}
type alias RunCommandTargets =
    List RunCommandTarget


{-| The RunCommandTargetValues data model.
-}
type alias RunCommandTargetValues =
    List String


{-| The RunCommandTarget data model.
-}
type alias RunCommandTarget =
    { key : String, values : RunCommandTargetValues }


{-| The RunCommandParameters data model.
-}
type alias RunCommandParameters =
    { runCommandTargets : RunCommandTargets }


{-| The RuleState data model.
-}
type RuleState
    = RuleStateEnabled
    | RuleStateDisabled
    | RuleStateEnabledWithAllCloudtrailManagementEvents


{-| The RuleState data model.
-}
ruleState : Enum RuleState
ruleState =
    Enum.define
        [ RuleStateEnabled, RuleStateDisabled, RuleStateEnabledWithAllCloudtrailManagementEvents ]
        (\val ->
            case val of
                RuleStateEnabled ->
                    "ENABLED"

                RuleStateDisabled ->
                    "DISABLED"

                RuleStateEnabledWithAllCloudtrailManagementEvents ->
                    "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS"
        )


{-| The RuleResponseList data model.
-}
type alias RuleResponseList =
    List Rule


{-| The RuleNameList data model.
-}
type alias RuleNameList =
    List String


{-| The Rule data model.
-}
type alias Rule =
    { arn : Maybe String
    , description : Maybe String
    , eventBusName : Maybe String
    , eventPattern : Maybe String
    , managedBy : Maybe String
    , name : Maybe String
    , roleArn : Maybe String
    , scheduleExpression : Maybe String
    , state : Maybe RuleState
    }


{-| The RoutingConfig data model.
-}
type alias RoutingConfig =
    { failoverConfig : FailoverConfig }


{-| The RetryPolicy data model.
-}
type alias RetryPolicy =
    { maximumEventAgeInSeconds : Maybe Int, maximumRetryAttempts : Maybe Int }


{-| The ReplicationState data model.
-}
type ReplicationState
    = ReplicationStateEnabled
    | ReplicationStateDisabled


{-| The ReplicationState data model.
-}
replicationState : Enum ReplicationState
replicationState =
    Enum.define
        [ ReplicationStateEnabled, ReplicationStateDisabled ]
        (\val ->
            case val of
                ReplicationStateEnabled ->
                    "ENABLED"

                ReplicationStateDisabled ->
                    "DISABLED"
        )


{-| The ReplicationConfig data model.
-}
type alias ReplicationConfig =
    { state : Maybe ReplicationState }


{-| The ReplayState data model.
-}
type ReplayState
    = ReplayStateStarting
    | ReplayStateRunning
    | ReplayStateCancelling
    | ReplayStateCompleted
    | ReplayStateCancelled
    | ReplayStateFailed


{-| The ReplayState data model.
-}
replayState : Enum ReplayState
replayState =
    Enum.define
        [ ReplayStateStarting
        , ReplayStateRunning
        , ReplayStateCancelling
        , ReplayStateCompleted
        , ReplayStateCancelled
        , ReplayStateFailed
        ]
        (\val ->
            case val of
                ReplayStateStarting ->
                    "STARTING"

                ReplayStateRunning ->
                    "RUNNING"

                ReplayStateCancelling ->
                    "CANCELLING"

                ReplayStateCompleted ->
                    "COMPLETED"

                ReplayStateCancelled ->
                    "CANCELLED"

                ReplayStateFailed ->
                    "FAILED"
        )


{-| The ReplayList data model.
-}
type alias ReplayList =
    List Replay


{-| The ReplayDestinationFilters data model.
-}
type alias ReplayDestinationFilters =
    List String


{-| The ReplayDestination data model.
-}
type alias ReplayDestination =
    { arn : String, filterArns : Maybe ReplayDestinationFilters }


{-| The Replay data model.
-}
type alias Replay =
    { eventEndTime : Maybe String
    , eventLastReplayedTime : Maybe String
    , eventSourceArn : Maybe String
    , eventStartTime : Maybe String
    , replayEndTime : Maybe String
    , replayName : Maybe String
    , replayStartTime : Maybe String
    , state : Maybe ReplayState
    , stateReason : Maybe String
    }


{-| The RemoveTargetsResultEntryList data model.
-}
type alias RemoveTargetsResultEntryList =
    List RemoveTargetsResultEntry


{-| The RemoveTargetsResultEntry data model.
-}
type alias RemoveTargetsResultEntry =
    { errorCode : Maybe String, errorMessage : Maybe String, targetId : Maybe String }


{-| The RemoveTargetsResponse data model.
-}
type alias RemoveTargetsResponse =
    { failedEntries : Maybe RemoveTargetsResultEntryList, failedEntryCount : Maybe Int }


{-| The RemoveTargetsRequest data model.
-}
type alias RemoveTargetsRequest =
    { eventBusName : Maybe String, force : Maybe Bool, ids : TargetIdList, rule : String }


{-| The RemovePermissionRequest data model.
-}
type alias RemovePermissionRequest =
    { eventBusName : Maybe String, removeAllPermissions : Maybe Bool, statementId : Maybe String }


{-| The RedshiftDataParameters data model.
-}
type alias RedshiftDataParameters =
    { database : String
    , dbUser : Maybe String
    , secretManagerArn : Maybe String
    , sql : Maybe String
    , sqls : Maybe Sqls
    , statementName : Maybe String
    , withEvent : Maybe Bool
    }


{-| The QueryStringParametersMap data model.
-}
type alias QueryStringParametersMap =
    Dict String String


{-| The PutTargetsResultEntryList data model.
-}
type alias PutTargetsResultEntryList =
    List PutTargetsResultEntry


{-| The PutTargetsResultEntry data model.
-}
type alias PutTargetsResultEntry =
    { errorCode : Maybe String, errorMessage : Maybe String, targetId : Maybe String }


{-| The PutTargetsResponse data model.
-}
type alias PutTargetsResponse =
    { failedEntries : Maybe PutTargetsResultEntryList, failedEntryCount : Maybe Int }


{-| The PutTargetsRequest data model.
-}
type alias PutTargetsRequest =
    { eventBusName : Maybe String, rule : String, targets : TargetList }


{-| The PutRuleResponse data model.
-}
type alias PutRuleResponse =
    { ruleArn : Maybe String }


{-| The PutRuleRequest data model.
-}
type alias PutRuleRequest =
    { description : Maybe String
    , eventBusName : Maybe String
    , eventPattern : Maybe String
    , name : String
    , roleArn : Maybe String
    , scheduleExpression : Maybe String
    , state : Maybe RuleState
    , tags : Maybe TagList
    }


{-| The PutPermissionRequest data model.
-}
type alias PutPermissionRequest =
    { action : Maybe String
    , condition : Maybe Condition
    , eventBusName : Maybe String
    , policy : Maybe String
    , principal : Maybe String
    , statementId : Maybe String
    }


{-| The PutPartnerEventsResultEntryList data model.
-}
type alias PutPartnerEventsResultEntryList =
    List PutPartnerEventsResultEntry


{-| The PutPartnerEventsResultEntry data model.
-}
type alias PutPartnerEventsResultEntry =
    { errorCode : Maybe String, errorMessage : Maybe String, eventId : Maybe String }


{-| The PutPartnerEventsResponse data model.
-}
type alias PutPartnerEventsResponse =
    { entries : Maybe PutPartnerEventsResultEntryList, failedEntryCount : Maybe Int }


{-| The PutPartnerEventsRequestEntryList data model.
-}
type alias PutPartnerEventsRequestEntryList =
    List PutPartnerEventsRequestEntry


{-| The PutPartnerEventsRequestEntry data model.
-}
type alias PutPartnerEventsRequestEntry =
    { detail : Maybe String
    , detailType : Maybe String
    , resources : Maybe EventResourceList
    , source : Maybe String
    , time : Maybe String
    }


{-| The PutPartnerEventsRequest data model.
-}
type alias PutPartnerEventsRequest =
    { entries : PutPartnerEventsRequestEntryList }


{-| The PutEventsResultEntryList data model.
-}
type alias PutEventsResultEntryList =
    List PutEventsResultEntry


{-| The PutEventsResultEntry data model.
-}
type alias PutEventsResultEntry =
    { errorCode : Maybe String, errorMessage : Maybe String, eventId : Maybe String }


{-| The PutEventsResponse data model.
-}
type alias PutEventsResponse =
    { entries : Maybe PutEventsResultEntryList, failedEntryCount : Maybe Int }


{-| The PutEventsRequestEntryList data model.
-}
type alias PutEventsRequestEntryList =
    List PutEventsRequestEntry


{-| The PutEventsRequestEntry data model.
-}
type alias PutEventsRequestEntry =
    { detail : Maybe String
    , detailType : Maybe String
    , eventBusName : Maybe String
    , resources : Maybe EventResourceList
    , source : Maybe String
    , time : Maybe String
    , traceHeader : Maybe String
    }


{-| The PutEventsRequest data model.
-}
type alias PutEventsRequest =
    { endpointId : Maybe String, entries : PutEventsRequestEntryList }


{-| The PropagateTags data model.
-}
type PropagateTags
    = PropagateTagsTaskDefinition


{-| The PropagateTags data model.
-}
propagateTags : Enum PropagateTags
propagateTags =
    Enum.define
        [ PropagateTagsTaskDefinition ]
        (\val ->
            case val of
                PropagateTagsTaskDefinition ->
                    "TASK_DEFINITION"
        )


{-| The Primary data model.
-}
type alias Primary =
    { healthCheck : String }


{-| The PlacementStrategyType data model.
-}
type PlacementStrategyType
    = PlacementStrategyTypeRandom
    | PlacementStrategyTypeSpread
    | PlacementStrategyTypeBinpack


{-| The PlacementStrategyType data model.
-}
placementStrategyType : Enum PlacementStrategyType
placementStrategyType =
    Enum.define
        [ PlacementStrategyTypeRandom, PlacementStrategyTypeSpread, PlacementStrategyTypeBinpack ]
        (\val ->
            case val of
                PlacementStrategyTypeRandom ->
                    "random"

                PlacementStrategyTypeSpread ->
                    "spread"

                PlacementStrategyTypeBinpack ->
                    "binpack"
        )


{-| The PlacementStrategy data model.
-}
type alias PlacementStrategy =
    { field : Maybe String, type_ : Maybe PlacementStrategyType }


{-| The PlacementStrategies data model.
-}
type alias PlacementStrategies =
    List PlacementStrategy


{-| The PlacementConstraints data model.
-}
type alias PlacementConstraints =
    List PlacementConstraint


{-| The PlacementConstraintType data model.
-}
type PlacementConstraintType
    = PlacementConstraintTypeDistinctInstance
    | PlacementConstraintTypeMemberOf


{-| The PlacementConstraintType data model.
-}
placementConstraintType : Enum PlacementConstraintType
placementConstraintType =
    Enum.define
        [ PlacementConstraintTypeDistinctInstance, PlacementConstraintTypeMemberOf ]
        (\val ->
            case val of
                PlacementConstraintTypeDistinctInstance ->
                    "distinctInstance"

                PlacementConstraintTypeMemberOf ->
                    "memberOf"
        )


{-| The PlacementConstraint data model.
-}
type alias PlacementConstraint =
    { expression : Maybe String, type_ : Maybe PlacementConstraintType }


{-| The PathParameterList data model.
-}
type alias PathParameterList =
    List String


{-| The PartnerEventSourceList data model.
-}
type alias PartnerEventSourceList =
    List PartnerEventSource


{-| The PartnerEventSourceAccountList data model.
-}
type alias PartnerEventSourceAccountList =
    List PartnerEventSourceAccount


{-| The PartnerEventSourceAccount data model.
-}
type alias PartnerEventSourceAccount =
    { account : Maybe String
    , creationTime : Maybe String
    , expirationTime : Maybe String
    , state : Maybe EventSourceState
    }


{-| The PartnerEventSource data model.
-}
type alias PartnerEventSource =
    { arn : Maybe String, name : Maybe String }


{-| The NetworkConfiguration data model.
-}
type alias NetworkConfiguration =
    { awsvpcConfiguration : Maybe AwsVpcConfiguration }


{-| The ListTargetsByRuleResponse data model.
-}
type alias ListTargetsByRuleResponse =
    { nextToken : Maybe String, targets : Maybe TargetList }


{-| The ListTargetsByRuleRequest data model.
-}
type alias ListTargetsByRuleRequest =
    { eventBusName : Maybe String, limit : Maybe Int, nextToken : Maybe String, rule : String }


{-| The ListTagsForResourceResponse data model.
-}
type alias ListTagsForResourceResponse =
    { tags : Maybe TagList }


{-| The ListTagsForResourceRequest data model.
-}
type alias ListTagsForResourceRequest =
    { resourceArn : String }


{-| The ListRulesResponse data model.
-}
type alias ListRulesResponse =
    { nextToken : Maybe String, rules : Maybe RuleResponseList }


{-| The ListRulesRequest data model.
-}
type alias ListRulesRequest =
    { eventBusName : Maybe String, limit : Maybe Int, namePrefix : Maybe String, nextToken : Maybe String }


{-| The ListRuleNamesByTargetResponse data model.
-}
type alias ListRuleNamesByTargetResponse =
    { nextToken : Maybe String, ruleNames : Maybe RuleNameList }


{-| The ListRuleNamesByTargetRequest data model.
-}
type alias ListRuleNamesByTargetRequest =
    { eventBusName : Maybe String, limit : Maybe Int, nextToken : Maybe String, targetArn : String }


{-| The ListReplaysResponse data model.
-}
type alias ListReplaysResponse =
    { nextToken : Maybe String, replays : Maybe ReplayList }


{-| The ListReplaysRequest data model.
-}
type alias ListReplaysRequest =
    { eventSourceArn : Maybe String
    , limit : Maybe Int
    , namePrefix : Maybe String
    , nextToken : Maybe String
    , state : Maybe ReplayState
    }


{-| The ListPartnerEventSourcesResponse data model.
-}
type alias ListPartnerEventSourcesResponse =
    { nextToken : Maybe String, partnerEventSources : Maybe PartnerEventSourceList }


{-| The ListPartnerEventSourcesRequest data model.
-}
type alias ListPartnerEventSourcesRequest =
    { limit : Maybe Int, namePrefix : String, nextToken : Maybe String }


{-| The ListPartnerEventSourceAccountsResponse data model.
-}
type alias ListPartnerEventSourceAccountsResponse =
    { nextToken : Maybe String, partnerEventSourceAccounts : Maybe PartnerEventSourceAccountList }


{-| The ListPartnerEventSourceAccountsRequest data model.
-}
type alias ListPartnerEventSourceAccountsRequest =
    { eventSourceName : String, limit : Maybe Int, nextToken : Maybe String }


{-| The ListEventSourcesResponse data model.
-}
type alias ListEventSourcesResponse =
    { eventSources : Maybe EventSourceList, nextToken : Maybe String }


{-| The ListEventSourcesRequest data model.
-}
type alias ListEventSourcesRequest =
    { limit : Maybe Int, namePrefix : Maybe String, nextToken : Maybe String }


{-| The ListEventBusesResponse data model.
-}
type alias ListEventBusesResponse =
    { eventBuses : Maybe EventBusList, nextToken : Maybe String }


{-| The ListEventBusesRequest data model.
-}
type alias ListEventBusesRequest =
    { limit : Maybe Int, namePrefix : Maybe String, nextToken : Maybe String }


{-| The ListEndpointsResponse data model.
-}
type alias ListEndpointsResponse =
    { endpoints : Maybe EndpointList, nextToken : Maybe String }


{-| The ListEndpointsRequest data model.
-}
type alias ListEndpointsRequest =
    { homeRegion : Maybe String, maxResults : Maybe Int, namePrefix : Maybe String, nextToken : Maybe String }


{-| The ListConnectionsResponse data model.
-}
type alias ListConnectionsResponse =
    { connections : Maybe ConnectionResponseList, nextToken : Maybe String }


{-| The ListConnectionsRequest data model.
-}
type alias ListConnectionsRequest =
    { connectionState : Maybe ConnectionState, limit : Maybe Int, namePrefix : Maybe String, nextToken : Maybe String }


{-| The ListArchivesResponse data model.
-}
type alias ListArchivesResponse =
    { archives : Maybe ArchiveResponseList, nextToken : Maybe String }


{-| The ListArchivesRequest data model.
-}
type alias ListArchivesRequest =
    { eventSourceArn : Maybe String
    , limit : Maybe Int
    , namePrefix : Maybe String
    , nextToken : Maybe String
    , state : Maybe ArchiveState
    }


{-| The ListApiDestinationsResponse data model.
-}
type alias ListApiDestinationsResponse =
    { apiDestinations : Maybe ApiDestinationResponseList, nextToken : Maybe String }


{-| The ListApiDestinationsRequest data model.
-}
type alias ListApiDestinationsRequest =
    { connectionArn : Maybe String, limit : Maybe Int, namePrefix : Maybe String, nextToken : Maybe String }


{-| The LaunchType data model.
-}
type LaunchType
    = LaunchTypeEc2
    | LaunchTypeFargate
    | LaunchTypeExternal


{-| The LaunchType data model.
-}
launchType : Enum LaunchType
launchType =
    Enum.define
        [ LaunchTypeEc2, LaunchTypeFargate, LaunchTypeExternal ]
        (\val ->
            case val of
                LaunchTypeEc2 ->
                    "EC2"

                LaunchTypeFargate ->
                    "FARGATE"

                LaunchTypeExternal ->
                    "EXTERNAL"
        )


{-| The KinesisParameters data model.
-}
type alias KinesisParameters =
    { partitionKeyPath : String }


{-| The InputTransformer data model.
-}
type alias InputTransformer =
    { inputPathsMap : Maybe TransformerPaths, inputTemplate : String }


{-| The HttpParameters data model.
-}
type alias HttpParameters =
    { headerParameters : Maybe HeaderParametersMap
    , pathParameterValues : Maybe PathParameterList
    , queryStringParameters : Maybe QueryStringParametersMap
    }


{-| The HeaderParametersMap data model.
-}
type alias HeaderParametersMap =
    Dict String String


{-| The FailoverConfig data model.
-}
type alias FailoverConfig =
    { primary : Primary, secondary : Secondary }


{-| The EventSourceState data model.
-}
type EventSourceState
    = EventSourceStatePending
    | EventSourceStateActive
    | EventSourceStateDeleted


{-| The EventSourceState data model.
-}
eventSourceState : Enum EventSourceState
eventSourceState =
    Enum.define
        [ EventSourceStatePending, EventSourceStateActive, EventSourceStateDeleted ]
        (\val ->
            case val of
                EventSourceStatePending ->
                    "PENDING"

                EventSourceStateActive ->
                    "ACTIVE"

                EventSourceStateDeleted ->
                    "DELETED"
        )


{-| The EventSourceList data model.
-}
type alias EventSourceList =
    List EventSource


{-| The EventSource data model.
-}
type alias EventSource =
    { arn : Maybe String
    , createdBy : Maybe String
    , creationTime : Maybe String
    , expirationTime : Maybe String
    , name : Maybe String
    , state : Maybe EventSourceState
    }


{-| The EventResourceList data model.
-}
type alias EventResourceList =
    List String


{-| The EventBusList data model.
-}
type alias EventBusList =
    List EventBus


{-| The EventBus data model.
-}
type alias EventBus =
    { arn : Maybe String
    , creationTime : Maybe String
    , description : Maybe String
    , lastModifiedTime : Maybe String
    , name : Maybe String
    , policy : Maybe String
    }


{-| The EndpointState data model.
-}
type EndpointState
    = EndpointStateActive
    | EndpointStateCreating
    | EndpointStateUpdating
    | EndpointStateDeleting
    | EndpointStateCreateFailed
    | EndpointStateUpdateFailed
    | EndpointStateDeleteFailed


{-| The EndpointState data model.
-}
endpointState : Enum EndpointState
endpointState =
    Enum.define
        [ EndpointStateActive
        , EndpointStateCreating
        , EndpointStateUpdating
        , EndpointStateDeleting
        , EndpointStateCreateFailed
        , EndpointStateUpdateFailed
        , EndpointStateDeleteFailed
        ]
        (\val ->
            case val of
                EndpointStateActive ->
                    "ACTIVE"

                EndpointStateCreating ->
                    "CREATING"

                EndpointStateUpdating ->
                    "UPDATING"

                EndpointStateDeleting ->
                    "DELETING"

                EndpointStateCreateFailed ->
                    "CREATE_FAILED"

                EndpointStateUpdateFailed ->
                    "UPDATE_FAILED"

                EndpointStateDeleteFailed ->
                    "DELETE_FAILED"
        )


{-| The EndpointList data model.
-}
type alias EndpointList =
    List Endpoint


{-| The EndpointEventBusList data model.
-}
type alias EndpointEventBusList =
    List EndpointEventBus


{-| The EndpointEventBus data model.
-}
type alias EndpointEventBus =
    { eventBusArn : String }


{-| The Endpoint data model.
-}
type alias Endpoint =
    { arn : Maybe String
    , creationTime : Maybe String
    , description : Maybe String
    , endpointId : Maybe String
    , endpointUrl : Maybe String
    , eventBuses : Maybe EndpointEventBusList
    , lastModifiedTime : Maybe String
    , name : Maybe String
    , replicationConfig : Maybe ReplicationConfig
    , roleArn : Maybe String
    , routingConfig : Maybe RoutingConfig
    , state : Maybe EndpointState
    , stateReason : Maybe String
    }


{-| The EnableRuleRequest data model.
-}
type alias EnableRuleRequest =
    { eventBusName : Maybe String, name : String }


{-| The EcsParameters data model.
-}
type alias EcsParameters =
    { capacityProviderStrategy : Maybe CapacityProviderStrategy
    , enableEcsmanagedTags : Maybe Bool
    , enableExecuteCommand : Maybe Bool
    , group : Maybe String
    , launchType : Maybe LaunchType
    , networkConfiguration : Maybe NetworkConfiguration
    , placementConstraints : Maybe PlacementConstraints
    , placementStrategy : Maybe PlacementStrategies
    , platformVersion : Maybe String
    , propagateTags : Maybe PropagateTags
    , referenceId : Maybe String
    , tags : Maybe TagList
    , taskCount : Maybe Int
    , taskDefinitionArn : String
    }


{-| The DisableRuleRequest data model.
-}
type alias DisableRuleRequest =
    { eventBusName : Maybe String, name : String }


{-| The DescribeRuleResponse data model.
-}
type alias DescribeRuleResponse =
    { arn : Maybe String
    , createdBy : Maybe String
    , description : Maybe String
    , eventBusName : Maybe String
    , eventPattern : Maybe String
    , managedBy : Maybe String
    , name : Maybe String
    , roleArn : Maybe String
    , scheduleExpression : Maybe String
    , state : Maybe RuleState
    }


{-| The DescribeRuleRequest data model.
-}
type alias DescribeRuleRequest =
    { eventBusName : Maybe String, name : String }


{-| The DescribeReplayResponse data model.
-}
type alias DescribeReplayResponse =
    { description : Maybe String
    , destination : Maybe ReplayDestination
    , eventEndTime : Maybe String
    , eventLastReplayedTime : Maybe String
    , eventSourceArn : Maybe String
    , eventStartTime : Maybe String
    , replayArn : Maybe String
    , replayEndTime : Maybe String
    , replayName : Maybe String
    , replayStartTime : Maybe String
    , state : Maybe ReplayState
    , stateReason : Maybe String
    }


{-| The DescribeReplayRequest data model.
-}
type alias DescribeReplayRequest =
    { replayName : String }


{-| The DescribePartnerEventSourceResponse data model.
-}
type alias DescribePartnerEventSourceResponse =
    { arn : Maybe String, name : Maybe String }


{-| The DescribePartnerEventSourceRequest data model.
-}
type alias DescribePartnerEventSourceRequest =
    { name : String }


{-| The DescribeEventSourceResponse data model.
-}
type alias DescribeEventSourceResponse =
    { arn : Maybe String
    , createdBy : Maybe String
    , creationTime : Maybe String
    , expirationTime : Maybe String
    , name : Maybe String
    , state : Maybe EventSourceState
    }


{-| The DescribeEventSourceRequest data model.
-}
type alias DescribeEventSourceRequest =
    { name : String }


{-| The DescribeEventBusResponse data model.
-}
type alias DescribeEventBusResponse =
    { arn : Maybe String
    , creationTime : Maybe String
    , deadLetterConfig : Maybe DeadLetterConfig
    , description : Maybe String
    , kmsKeyIdentifier : Maybe String
    , lastModifiedTime : Maybe String
    , name : Maybe String
    , policy : Maybe String
    }


{-| The DescribeEventBusRequest data model.
-}
type alias DescribeEventBusRequest =
    { name : Maybe String }


{-| The DescribeEndpointResponse data model.
-}
type alias DescribeEndpointResponse =
    { arn : Maybe String
    , creationTime : Maybe String
    , description : Maybe String
    , endpointId : Maybe String
    , endpointUrl : Maybe String
    , eventBuses : Maybe EndpointEventBusList
    , lastModifiedTime : Maybe String
    , name : Maybe String
    , replicationConfig : Maybe ReplicationConfig
    , roleArn : Maybe String
    , routingConfig : Maybe RoutingConfig
    , state : Maybe EndpointState
    , stateReason : Maybe String
    }


{-| The DescribeEndpointRequest data model.
-}
type alias DescribeEndpointRequest =
    { homeRegion : Maybe String, name : String }


{-| The DescribeConnectionResponse data model.
-}
type alias DescribeConnectionResponse =
    { authParameters : Maybe ConnectionAuthResponseParameters
    , authorizationType : Maybe ConnectionAuthorizationType
    , connectionArn : Maybe String
    , connectionState : Maybe ConnectionState
    , creationTime : Maybe String
    , description : Maybe String
    , lastAuthorizedTime : Maybe String
    , lastModifiedTime : Maybe String
    , name : Maybe String
    , secretArn : Maybe String
    , stateReason : Maybe String
    }


{-| The DescribeConnectionRequest data model.
-}
type alias DescribeConnectionRequest =
    { name : String }


{-| The DescribeArchiveResponse data model.
-}
type alias DescribeArchiveResponse =
    { archiveArn : Maybe String
    , archiveName : Maybe String
    , creationTime : Maybe String
    , description : Maybe String
    , eventCount : Maybe Int
    , eventPattern : Maybe String
    , eventSourceArn : Maybe String
    , retentionDays : Maybe Int
    , sizeBytes : Maybe Int
    , state : Maybe ArchiveState
    , stateReason : Maybe String
    }


{-| The DescribeArchiveRequest data model.
-}
type alias DescribeArchiveRequest =
    { archiveName : String }


{-| The DescribeApiDestinationResponse data model.
-}
type alias DescribeApiDestinationResponse =
    { apiDestinationArn : Maybe String
    , apiDestinationState : Maybe ApiDestinationState
    , connectionArn : Maybe String
    , creationTime : Maybe String
    , description : Maybe String
    , httpMethod : Maybe ApiDestinationHttpMethod
    , invocationEndpoint : Maybe String
    , invocationRateLimitPerSecond : Maybe Int
    , lastModifiedTime : Maybe String
    , name : Maybe String
    }


{-| The DescribeApiDestinationRequest data model.
-}
type alias DescribeApiDestinationRequest =
    { name : String }


{-| The DeleteRuleRequest data model.
-}
type alias DeleteRuleRequest =
    { eventBusName : Maybe String, force : Maybe Bool, name : String }


{-| The DeletePartnerEventSourceRequest data model.
-}
type alias DeletePartnerEventSourceRequest =
    { account : String, name : String }


{-| The DeleteEventBusRequest data model.
-}
type alias DeleteEventBusRequest =
    { name : String }


{-| The DeleteEndpointResponse data model.
-}
type alias DeleteEndpointResponse =
    {}


{-| The DeleteEndpointRequest data model.
-}
type alias DeleteEndpointRequest =
    { name : String }


{-| The DeleteConnectionResponse data model.
-}
type alias DeleteConnectionResponse =
    { connectionArn : Maybe String
    , connectionState : Maybe ConnectionState
    , creationTime : Maybe String
    , lastAuthorizedTime : Maybe String
    , lastModifiedTime : Maybe String
    }


{-| The DeleteConnectionRequest data model.
-}
type alias DeleteConnectionRequest =
    { name : String }


{-| The DeleteArchiveResponse data model.
-}
type alias DeleteArchiveResponse =
    {}


{-| The DeleteArchiveRequest data model.
-}
type alias DeleteArchiveRequest =
    { archiveName : String }


{-| The DeleteApiDestinationResponse data model.
-}
type alias DeleteApiDestinationResponse =
    {}


{-| The DeleteApiDestinationRequest data model.
-}
type alias DeleteApiDestinationRequest =
    { name : String }


{-| The DeauthorizeConnectionResponse data model.
-}
type alias DeauthorizeConnectionResponse =
    { connectionArn : Maybe String
    , connectionState : Maybe ConnectionState
    , creationTime : Maybe String
    , lastAuthorizedTime : Maybe String
    , lastModifiedTime : Maybe String
    }


{-| The DeauthorizeConnectionRequest data model.
-}
type alias DeauthorizeConnectionRequest =
    { name : String }


{-| The DeadLetterConfig data model.
-}
type alias DeadLetterConfig =
    { arn : Maybe String }


{-| The DeactivateEventSourceRequest data model.
-}
type alias DeactivateEventSourceRequest =
    { name : String }


{-| The CreatePartnerEventSourceResponse data model.
-}
type alias CreatePartnerEventSourceResponse =
    { eventSourceArn : Maybe String }


{-| The CreatePartnerEventSourceRequest data model.
-}
type alias CreatePartnerEventSourceRequest =
    { account : String, name : String }


{-| The CreateEventBusResponse data model.
-}
type alias CreateEventBusResponse =
    { deadLetterConfig : Maybe DeadLetterConfig
    , description : Maybe String
    , eventBusArn : Maybe String
    , kmsKeyIdentifier : Maybe String
    }


{-| The CreateEventBusRequest data model.
-}
type alias CreateEventBusRequest =
    { deadLetterConfig : Maybe DeadLetterConfig
    , description : Maybe String
    , eventSourceName : Maybe String
    , kmsKeyIdentifier : Maybe String
    , name : String
    , tags : Maybe TagList
    }


{-| The CreateEndpointResponse data model.
-}
type alias CreateEndpointResponse =
    { arn : Maybe String
    , eventBuses : Maybe EndpointEventBusList
    , name : Maybe String
    , replicationConfig : Maybe ReplicationConfig
    , roleArn : Maybe String
    , routingConfig : Maybe RoutingConfig
    , state : Maybe EndpointState
    }


{-| The CreateEndpointRequest data model.
-}
type alias CreateEndpointRequest =
    { description : Maybe String
    , eventBuses : EndpointEventBusList
    , name : String
    , replicationConfig : Maybe ReplicationConfig
    , roleArn : Maybe String
    , routingConfig : RoutingConfig
    }


{-| The CreateConnectionResponse data model.
-}
type alias CreateConnectionResponse =
    { connectionArn : Maybe String
    , connectionState : Maybe ConnectionState
    , creationTime : Maybe String
    , lastModifiedTime : Maybe String
    }


{-| The CreateConnectionRequest data model.
-}
type alias CreateConnectionRequest =
    { authParameters : CreateConnectionAuthRequestParameters
    , authorizationType : ConnectionAuthorizationType
    , description : Maybe String
    , name : String
    }


{-| The CreateConnectionOauthRequestParameters data model.
-}
type alias CreateConnectionOauthRequestParameters =
    { authorizationEndpoint : String
    , clientParameters : CreateConnectionOauthClientRequestParameters
    , httpMethod : ConnectionOauthHttpMethod
    , oauthHttpParameters : Maybe ConnectionHttpParameters
    }


{-| The CreateConnectionOauthClientRequestParameters data model.
-}
type alias CreateConnectionOauthClientRequestParameters =
    { clientId : String, clientSecret : String }


{-| The CreateConnectionBasicAuthRequestParameters data model.
-}
type alias CreateConnectionBasicAuthRequestParameters =
    { password : String, username : String }


{-| The CreateConnectionAuthRequestParameters data model.
-}
type alias CreateConnectionAuthRequestParameters =
    { apiKeyAuthParameters : Maybe CreateConnectionApiKeyAuthRequestParameters
    , basicAuthParameters : Maybe CreateConnectionBasicAuthRequestParameters
    , invocationHttpParameters : Maybe ConnectionHttpParameters
    , oauthParameters : Maybe CreateConnectionOauthRequestParameters
    }


{-| The CreateConnectionApiKeyAuthRequestParameters data model.
-}
type alias CreateConnectionApiKeyAuthRequestParameters =
    { apiKeyName : String, apiKeyValue : String }


{-| The CreateArchiveResponse data model.
-}
type alias CreateArchiveResponse =
    { archiveArn : Maybe String, creationTime : Maybe String, state : Maybe ArchiveState, stateReason : Maybe String }


{-| The CreateArchiveRequest data model.
-}
type alias CreateArchiveRequest =
    { archiveName : String
    , description : Maybe String
    , eventPattern : Maybe String
    , eventSourceArn : String
    , retentionDays : Maybe Int
    }


{-| The CreateApiDestinationResponse data model.
-}
type alias CreateApiDestinationResponse =
    { apiDestinationArn : Maybe String
    , apiDestinationState : Maybe ApiDestinationState
    , creationTime : Maybe String
    , lastModifiedTime : Maybe String
    }


{-| The CreateApiDestinationRequest data model.
-}
type alias CreateApiDestinationRequest =
    { connectionArn : String
    , description : Maybe String
    , httpMethod : ApiDestinationHttpMethod
    , invocationEndpoint : String
    , invocationRateLimitPerSecond : Maybe Int
    , name : String
    }


{-| The ConnectionState data model.
-}
type ConnectionState
    = ConnectionStateCreating
    | ConnectionStateUpdating
    | ConnectionStateDeleting
    | ConnectionStateAuthorized
    | ConnectionStateDeauthorized
    | ConnectionStateAuthorizing
    | ConnectionStateDeauthorizing


{-| The ConnectionState data model.
-}
connectionState : Enum ConnectionState
connectionState =
    Enum.define
        [ ConnectionStateCreating
        , ConnectionStateUpdating
        , ConnectionStateDeleting
        , ConnectionStateAuthorized
        , ConnectionStateDeauthorized
        , ConnectionStateAuthorizing
        , ConnectionStateDeauthorizing
        ]
        (\val ->
            case val of
                ConnectionStateCreating ->
                    "CREATING"

                ConnectionStateUpdating ->
                    "UPDATING"

                ConnectionStateDeleting ->
                    "DELETING"

                ConnectionStateAuthorized ->
                    "AUTHORIZED"

                ConnectionStateDeauthorized ->
                    "DEAUTHORIZED"

                ConnectionStateAuthorizing ->
                    "AUTHORIZING"

                ConnectionStateDeauthorizing ->
                    "DEAUTHORIZING"
        )


{-| The ConnectionResponseList data model.
-}
type alias ConnectionResponseList =
    List Connection


{-| The ConnectionQueryStringParametersList data model.
-}
type alias ConnectionQueryStringParametersList =
    List ConnectionQueryStringParameter


{-| The ConnectionQueryStringParameter data model.
-}
type alias ConnectionQueryStringParameter =
    { isValueSecret : Maybe Bool, key : Maybe String, value : Maybe String }


{-| The ConnectionOauthResponseParameters data model.
-}
type alias ConnectionOauthResponseParameters =
    { authorizationEndpoint : Maybe String
    , clientParameters : Maybe ConnectionOauthClientResponseParameters
    , httpMethod : Maybe ConnectionOauthHttpMethod
    , oauthHttpParameters : Maybe ConnectionHttpParameters
    }


{-| The ConnectionOauthHttpMethod data model.
-}
type ConnectionOauthHttpMethod
    = ConnectionOauthHttpMethodGet
    | ConnectionOauthHttpMethodPost
    | ConnectionOauthHttpMethodPut


{-| The ConnectionOauthHttpMethod data model.
-}
connectionOauthHttpMethod : Enum ConnectionOauthHttpMethod
connectionOauthHttpMethod =
    Enum.define
        [ ConnectionOauthHttpMethodGet, ConnectionOauthHttpMethodPost, ConnectionOauthHttpMethodPut ]
        (\val ->
            case val of
                ConnectionOauthHttpMethodGet ->
                    "GET"

                ConnectionOauthHttpMethodPost ->
                    "POST"

                ConnectionOauthHttpMethodPut ->
                    "PUT"
        )


{-| The ConnectionOauthClientResponseParameters data model.
-}
type alias ConnectionOauthClientResponseParameters =
    { clientId : Maybe String }


{-| The ConnectionHttpParameters data model.
-}
type alias ConnectionHttpParameters =
    { bodyParameters : Maybe ConnectionBodyParametersList
    , headerParameters : Maybe ConnectionHeaderParametersList
    , queryStringParameters : Maybe ConnectionQueryStringParametersList
    }


{-| The ConnectionHeaderParametersList data model.
-}
type alias ConnectionHeaderParametersList =
    List ConnectionHeaderParameter


{-| The ConnectionHeaderParameter data model.
-}
type alias ConnectionHeaderParameter =
    { isValueSecret : Maybe Bool, key : Maybe String, value : Maybe String }


{-| The ConnectionBodyParametersList data model.
-}
type alias ConnectionBodyParametersList =
    List ConnectionBodyParameter


{-| The ConnectionBodyParameter data model.
-}
type alias ConnectionBodyParameter =
    { isValueSecret : Maybe Bool, key : Maybe String, value : Maybe String }


{-| The ConnectionBasicAuthResponseParameters data model.
-}
type alias ConnectionBasicAuthResponseParameters =
    { username : Maybe String }


{-| The ConnectionAuthorizationType data model.
-}
type ConnectionAuthorizationType
    = ConnectionAuthorizationTypeBasic
    | ConnectionAuthorizationTypeOauthClientCredentials
    | ConnectionAuthorizationTypeApiKey


{-| The ConnectionAuthorizationType data model.
-}
connectionAuthorizationType : Enum ConnectionAuthorizationType
connectionAuthorizationType =
    Enum.define
        [ ConnectionAuthorizationTypeBasic
        , ConnectionAuthorizationTypeOauthClientCredentials
        , ConnectionAuthorizationTypeApiKey
        ]
        (\val ->
            case val of
                ConnectionAuthorizationTypeBasic ->
                    "BASIC"

                ConnectionAuthorizationTypeOauthClientCredentials ->
                    "OAUTH_CLIENT_CREDENTIALS"

                ConnectionAuthorizationTypeApiKey ->
                    "API_KEY"
        )


{-| The ConnectionAuthResponseParameters data model.
-}
type alias ConnectionAuthResponseParameters =
    { apiKeyAuthParameters : Maybe ConnectionApiKeyAuthResponseParameters
    , basicAuthParameters : Maybe ConnectionBasicAuthResponseParameters
    , invocationHttpParameters : Maybe ConnectionHttpParameters
    , oauthParameters : Maybe ConnectionOauthResponseParameters
    }


{-| The ConnectionApiKeyAuthResponseParameters data model.
-}
type alias ConnectionApiKeyAuthResponseParameters =
    { apiKeyName : Maybe String }


{-| The Connection data model.
-}
type alias Connection =
    { authorizationType : Maybe ConnectionAuthorizationType
    , connectionArn : Maybe String
    , connectionState : Maybe ConnectionState
    , creationTime : Maybe String
    , lastAuthorizedTime : Maybe String
    , lastModifiedTime : Maybe String
    , name : Maybe String
    , stateReason : Maybe String
    }


{-| The Condition data model.
-}
type alias Condition =
    { key : String, type_ : String, value : String }


{-| The CapacityProviderStrategyItem data model.
-}
type alias CapacityProviderStrategyItem =
    { base : Maybe Int, capacityProvider : String, weight : Maybe Int }


{-| The CapacityProviderStrategy data model.
-}
type alias CapacityProviderStrategy =
    List CapacityProviderStrategyItem


{-| The CancelReplayResponse data model.
-}
type alias CancelReplayResponse =
    { replayArn : Maybe String, state : Maybe ReplayState, stateReason : Maybe String }


{-| The CancelReplayRequest data model.
-}
type alias CancelReplayRequest =
    { replayName : String }


{-| The BatchRetryStrategy data model.
-}
type alias BatchRetryStrategy =
    { attempts : Maybe Int }


{-| The BatchParameters data model.
-}
type alias BatchParameters =
    { arrayProperties : Maybe BatchArrayProperties
    , jobDefinition : String
    , jobName : String
    , retryStrategy : Maybe BatchRetryStrategy
    }


{-| The BatchArrayProperties data model.
-}
type alias BatchArrayProperties =
    { size : Maybe Int }


{-| The AwsVpcConfiguration data model.
-}
type alias AwsVpcConfiguration =
    { assignPublicIp : Maybe AssignPublicIp, securityGroups : Maybe StringList, subnets : StringList }


{-| The AssignPublicIp data model.
-}
type AssignPublicIp
    = AssignPublicIpEnabled
    | AssignPublicIpDisabled


{-| The AssignPublicIp data model.
-}
assignPublicIp : Enum AssignPublicIp
assignPublicIp =
    Enum.define
        [ AssignPublicIpEnabled, AssignPublicIpDisabled ]
        (\val ->
            case val of
                AssignPublicIpEnabled ->
                    "ENABLED"

                AssignPublicIpDisabled ->
                    "DISABLED"
        )


{-| The ArchiveState data model.
-}
type ArchiveState
    = ArchiveStateEnabled
    | ArchiveStateDisabled
    | ArchiveStateCreating
    | ArchiveStateUpdating
    | ArchiveStateCreateFailed
    | ArchiveStateUpdateFailed


{-| The ArchiveState data model.
-}
archiveState : Enum ArchiveState
archiveState =
    Enum.define
        [ ArchiveStateEnabled
        , ArchiveStateDisabled
        , ArchiveStateCreating
        , ArchiveStateUpdating
        , ArchiveStateCreateFailed
        , ArchiveStateUpdateFailed
        ]
        (\val ->
            case val of
                ArchiveStateEnabled ->
                    "ENABLED"

                ArchiveStateDisabled ->
                    "DISABLED"

                ArchiveStateCreating ->
                    "CREATING"

                ArchiveStateUpdating ->
                    "UPDATING"

                ArchiveStateCreateFailed ->
                    "CREATE_FAILED"

                ArchiveStateUpdateFailed ->
                    "UPDATE_FAILED"
        )


{-| The ArchiveResponseList data model.
-}
type alias ArchiveResponseList =
    List Archive


{-| The Archive data model.
-}
type alias Archive =
    { archiveName : Maybe String
    , creationTime : Maybe String
    , eventCount : Maybe Int
    , eventSourceArn : Maybe String
    , retentionDays : Maybe Int
    , sizeBytes : Maybe Int
    , state : Maybe ArchiveState
    , stateReason : Maybe String
    }


{-| The AppSyncParameters data model.
-}
type alias AppSyncParameters =
    { graphQloperation : Maybe String }


{-| The ApiDestinationState data model.
-}
type ApiDestinationState
    = ApiDestinationStateActive
    | ApiDestinationStateInactive


{-| The ApiDestinationState data model.
-}
apiDestinationState : Enum ApiDestinationState
apiDestinationState =
    Enum.define
        [ ApiDestinationStateActive, ApiDestinationStateInactive ]
        (\val ->
            case val of
                ApiDestinationStateActive ->
                    "ACTIVE"

                ApiDestinationStateInactive ->
                    "INACTIVE"
        )


{-| The ApiDestinationResponseList data model.
-}
type alias ApiDestinationResponseList =
    List ApiDestination


{-| The ApiDestinationHttpMethod data model.
-}
type ApiDestinationHttpMethod
    = ApiDestinationHttpMethodPost
    | ApiDestinationHttpMethodGet
    | ApiDestinationHttpMethodHead
    | ApiDestinationHttpMethodOptions
    | ApiDestinationHttpMethodPut
    | ApiDestinationHttpMethodPatch
    | ApiDestinationHttpMethodDelete


{-| The ApiDestinationHttpMethod data model.
-}
apiDestinationHttpMethod : Enum ApiDestinationHttpMethod
apiDestinationHttpMethod =
    Enum.define
        [ ApiDestinationHttpMethodPost
        , ApiDestinationHttpMethodGet
        , ApiDestinationHttpMethodHead
        , ApiDestinationHttpMethodOptions
        , ApiDestinationHttpMethodPut
        , ApiDestinationHttpMethodPatch
        , ApiDestinationHttpMethodDelete
        ]
        (\val ->
            case val of
                ApiDestinationHttpMethodPost ->
                    "POST"

                ApiDestinationHttpMethodGet ->
                    "GET"

                ApiDestinationHttpMethodHead ->
                    "HEAD"

                ApiDestinationHttpMethodOptions ->
                    "OPTIONS"

                ApiDestinationHttpMethodPut ->
                    "PUT"

                ApiDestinationHttpMethodPatch ->
                    "PATCH"

                ApiDestinationHttpMethodDelete ->
                    "DELETE"
        )


{-| The ApiDestination data model.
-}
type alias ApiDestination =
    { apiDestinationArn : Maybe String
    , apiDestinationState : Maybe ApiDestinationState
    , connectionArn : Maybe String
    , creationTime : Maybe String
    , httpMethod : Maybe ApiDestinationHttpMethod
    , invocationEndpoint : Maybe String
    , invocationRateLimitPerSecond : Maybe Int
    , lastModifiedTime : Maybe String
    , name : Maybe String
    }


{-| The ActivateEventSourceRequest data model.
-}
type alias ActivateEventSourceRequest =
    { name : String }


{-| Decoder for ApiDestination.
-}
apiDestinationDecoder : Decoder ApiDestination
apiDestinationDecoder =
    Json.Decode.succeed ApiDestination
        |> Pipeline.optional "ApiDestinationArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ApiDestinationState" (Json.Decode.maybe apiDestinationStateDecoder) Nothing
        |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "HttpMethod" (Json.Decode.maybe (Codec.decoder apiDestinationHttpMethodCodec)) Nothing
        |> Pipeline.optional "InvocationEndpoint" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "InvocationRateLimitPerSecond" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Codec for ApiDestinationHttpMethod.
-}
apiDestinationHttpMethodCodec : Codec ApiDestinationHttpMethod
apiDestinationHttpMethodCodec =
    Codec.build (Enum.encoder apiDestinationHttpMethod) (Enum.decoder apiDestinationHttpMethod)


{-| Decoder for ApiDestinationResponseList.
-}
apiDestinationResponseListDecoder : Decoder ApiDestinationResponseList
apiDestinationResponseListDecoder =
    Json.Decode.list apiDestinationDecoder


{-| Decoder for ApiDestinationState.
-}
apiDestinationStateDecoder : Decoder ApiDestinationState
apiDestinationStateDecoder =
    Enum.decoder apiDestinationState


{-| Codec for AppSyncParameters.
-}
appSyncParametersCodec : Codec AppSyncParameters
appSyncParametersCodec =
    Codec.object AppSyncParameters
        |> Codec.optionalField "GraphQLOperation" .graphQloperation Codec.string
        |> Codec.buildObject


{-| Decoder for Archive.
-}
archiveDecoder : Decoder Archive
archiveDecoder =
    Json.Decode.succeed Archive
        |> Pipeline.optional "ArchiveName" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventCount" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "EventSourceArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "RetentionDays" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "SizeBytes" (Json.Decode.maybe Json.Decode.int) Nothing
        |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder archiveStateCodec)) Nothing
        |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for ArchiveResponseList.
-}
archiveResponseListDecoder : Decoder ArchiveResponseList
archiveResponseListDecoder =
    Json.Decode.list archiveDecoder


{-| Codec for ArchiveState.
-}
archiveStateCodec : Codec ArchiveState
archiveStateCodec =
    Codec.build (Enum.encoder archiveState) (Enum.decoder archiveState)


{-| Codec for AssignPublicIp.
-}
assignPublicIpCodec : Codec AssignPublicIp
assignPublicIpCodec =
    Codec.build (Enum.encoder assignPublicIp) (Enum.decoder assignPublicIp)


{-| Codec for AwsVpcConfiguration.
-}
awsVpcConfigurationCodec : Codec AwsVpcConfiguration
awsVpcConfigurationCodec =
    Codec.object AwsVpcConfiguration
        |> Codec.optionalField "AssignPublicIp" .assignPublicIp assignPublicIpCodec
        |> Codec.optionalField "SecurityGroups" .securityGroups stringListCodec
        |> Codec.field "Subnets" .subnets stringListCodec
        |> Codec.buildObject


{-| Codec for BatchArrayProperties.
-}
batchArrayPropertiesCodec : Codec BatchArrayProperties
batchArrayPropertiesCodec =
    Codec.object BatchArrayProperties |> Codec.optionalField "Size" .size Codec.int |> Codec.buildObject


{-| Codec for BatchParameters.
-}
batchParametersCodec : Codec BatchParameters
batchParametersCodec =
    Codec.object BatchParameters
        |> Codec.optionalField "ArrayProperties" .arrayProperties batchArrayPropertiesCodec
        |> Codec.field "JobDefinition" .jobDefinition Codec.string
        |> Codec.field "JobName" .jobName Codec.string
        |> Codec.optionalField "RetryStrategy" .retryStrategy batchRetryStrategyCodec
        |> Codec.buildObject


{-| Codec for BatchRetryStrategy.
-}
batchRetryStrategyCodec : Codec BatchRetryStrategy
batchRetryStrategyCodec =
    Codec.object BatchRetryStrategy |> Codec.optionalField "Attempts" .attempts Codec.int |> Codec.buildObject


{-| Codec for CapacityProviderStrategy.
-}
capacityProviderStrategyCodec : Codec CapacityProviderStrategy
capacityProviderStrategyCodec =
    Codec.list capacityProviderStrategyItemCodec


{-| Codec for CapacityProviderStrategyItem.
-}
capacityProviderStrategyItemCodec : Codec CapacityProviderStrategyItem
capacityProviderStrategyItemCodec =
    Codec.object CapacityProviderStrategyItem
        |> Codec.optionalField "base" .base Codec.int
        |> Codec.field "capacityProvider" .capacityProvider Codec.string
        |> Codec.optionalField "weight" .weight Codec.int
        |> Codec.buildObject


{-| Encoder for Condition.
-}
conditionEncoder : Condition -> Value
conditionEncoder val =
    [ ( "Key", val.key ) |> EncodeOpt.field Json.Encode.string
    , ( "Type", val.type_ ) |> EncodeOpt.field Json.Encode.string
    , ( "Value", val.value ) |> EncodeOpt.field Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Decoder for Connection.
-}
connectionDecoder : Decoder Connection
connectionDecoder =
    Json.Decode.succeed Connection
        |> Pipeline.optional
            "AuthorizationType"
            (Json.Decode.maybe (Codec.decoder connectionAuthorizationTypeCodec))
            Nothing
        |> Pipeline.optional "ConnectionArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ConnectionState" (Json.Decode.maybe (Codec.decoder connectionStateCodec)) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "LastAuthorizedTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for ConnectionApiKeyAuthResponseParameters.
-}
connectionApiKeyAuthResponseParametersDecoder : Decoder ConnectionApiKeyAuthResponseParameters
connectionApiKeyAuthResponseParametersDecoder =
    Json.Decode.succeed ConnectionApiKeyAuthResponseParameters
        |> Pipeline.optional "ApiKeyName" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for ConnectionAuthResponseParameters.
-}
connectionAuthResponseParametersDecoder : Decoder ConnectionAuthResponseParameters
connectionAuthResponseParametersDecoder =
    Json.Decode.succeed ConnectionAuthResponseParameters
        |> Pipeline.optional
            "ApiKeyAuthParameters"
            (Json.Decode.maybe connectionApiKeyAuthResponseParametersDecoder)
            Nothing
        |> Pipeline.optional
            "BasicAuthParameters"
            (Json.Decode.maybe connectionBasicAuthResponseParametersDecoder)
            Nothing
        |> Pipeline.optional
            "InvocationHttpParameters"
            (Json.Decode.maybe (Codec.decoder connectionHttpParametersCodec))
            Nothing
        |> Pipeline.optional "OAuthParameters" (Json.Decode.maybe connectionOauthResponseParametersDecoder) Nothing


{-| Codec for ConnectionAuthorizationType.
-}
connectionAuthorizationTypeCodec : Codec ConnectionAuthorizationType
connectionAuthorizationTypeCodec =
    Codec.build (Enum.encoder connectionAuthorizationType) (Enum.decoder connectionAuthorizationType)


{-| Decoder for ConnectionBasicAuthResponseParameters.
-}
connectionBasicAuthResponseParametersDecoder : Decoder ConnectionBasicAuthResponseParameters
connectionBasicAuthResponseParametersDecoder =
    Json.Decode.succeed ConnectionBasicAuthResponseParameters
        |> Pipeline.optional "Username" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Codec for ConnectionBodyParameter.
-}
connectionBodyParameterCodec : Codec ConnectionBodyParameter
connectionBodyParameterCodec =
    Codec.object ConnectionBodyParameter
        |> Codec.optionalField "IsValueSecret" .isValueSecret Codec.bool
        |> Codec.optionalField "Key" .key Codec.string
        |> Codec.optionalField "Value" .value Codec.string
        |> Codec.buildObject


{-| Codec for ConnectionBodyParametersList.
-}
connectionBodyParametersListCodec : Codec ConnectionBodyParametersList
connectionBodyParametersListCodec =
    Codec.list connectionBodyParameterCodec


{-| Codec for ConnectionHeaderParameter.
-}
connectionHeaderParameterCodec : Codec ConnectionHeaderParameter
connectionHeaderParameterCodec =
    Codec.object ConnectionHeaderParameter
        |> Codec.optionalField "IsValueSecret" .isValueSecret Codec.bool
        |> Codec.optionalField "Key" .key Codec.string
        |> Codec.optionalField "Value" .value Codec.string
        |> Codec.buildObject


{-| Codec for ConnectionHeaderParametersList.
-}
connectionHeaderParametersListCodec : Codec ConnectionHeaderParametersList
connectionHeaderParametersListCodec =
    Codec.list connectionHeaderParameterCodec


{-| Codec for ConnectionHttpParameters.
-}
connectionHttpParametersCodec : Codec ConnectionHttpParameters
connectionHttpParametersCodec =
    Codec.object ConnectionHttpParameters
        |> Codec.optionalField "BodyParameters" .bodyParameters connectionBodyParametersListCodec
        |> Codec.optionalField "HeaderParameters" .headerParameters connectionHeaderParametersListCodec
        |> Codec.optionalField "QueryStringParameters" .queryStringParameters connectionQueryStringParametersListCodec
        |> Codec.buildObject


{-| Decoder for ConnectionOauthClientResponseParameters.
-}
connectionOauthClientResponseParametersDecoder : Decoder ConnectionOauthClientResponseParameters
connectionOauthClientResponseParametersDecoder =
    Json.Decode.succeed ConnectionOauthClientResponseParameters
        |> Pipeline.optional "ClientID" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Codec for ConnectionOauthHttpMethod.
-}
connectionOauthHttpMethodCodec : Codec ConnectionOauthHttpMethod
connectionOauthHttpMethodCodec =
    Codec.build (Enum.encoder connectionOauthHttpMethod) (Enum.decoder connectionOauthHttpMethod)


{-| Decoder for ConnectionOauthResponseParameters.
-}
connectionOauthResponseParametersDecoder : Decoder ConnectionOauthResponseParameters
connectionOauthResponseParametersDecoder =
    Json.Decode.succeed ConnectionOauthResponseParameters
        |> Pipeline.optional "AuthorizationEndpoint" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional
            "ClientParameters"
            (Json.Decode.maybe connectionOauthClientResponseParametersDecoder)
            Nothing
        |> Pipeline.optional "HttpMethod" (Json.Decode.maybe (Codec.decoder connectionOauthHttpMethodCodec)) Nothing
        |> Pipeline.optional
            "OAuthHttpParameters"
            (Json.Decode.maybe (Codec.decoder connectionHttpParametersCodec))
            Nothing


{-| Codec for ConnectionQueryStringParameter.
-}
connectionQueryStringParameterCodec : Codec ConnectionQueryStringParameter
connectionQueryStringParameterCodec =
    Codec.object ConnectionQueryStringParameter
        |> Codec.optionalField "IsValueSecret" .isValueSecret Codec.bool
        |> Codec.optionalField "Key" .key Codec.string
        |> Codec.optionalField "Value" .value Codec.string
        |> Codec.buildObject


{-| Codec for ConnectionQueryStringParametersList.
-}
connectionQueryStringParametersListCodec : Codec ConnectionQueryStringParametersList
connectionQueryStringParametersListCodec =
    Codec.list connectionQueryStringParameterCodec


{-| Decoder for ConnectionResponseList.
-}
connectionResponseListDecoder : Decoder ConnectionResponseList
connectionResponseListDecoder =
    Json.Decode.list connectionDecoder


{-| Codec for ConnectionState.
-}
connectionStateCodec : Codec ConnectionState
connectionStateCodec =
    Codec.build (Enum.encoder connectionState) (Enum.decoder connectionState)


{-| Encoder for CreateConnectionApiKeyAuthRequestParameters.
-}
createConnectionApiKeyAuthRequestParametersEncoder : CreateConnectionApiKeyAuthRequestParameters -> Value
createConnectionApiKeyAuthRequestParametersEncoder val =
    [ ( "ApiKeyName", val.apiKeyName ) |> EncodeOpt.field Json.Encode.string
    , ( "ApiKeyValue", val.apiKeyValue ) |> EncodeOpt.field Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for CreateConnectionAuthRequestParameters.
-}
createConnectionAuthRequestParametersEncoder : CreateConnectionAuthRequestParameters -> Value
createConnectionAuthRequestParametersEncoder val =
    [ ( "ApiKeyAuthParameters", val.apiKeyAuthParameters )
        |> EncodeOpt.optionalField createConnectionApiKeyAuthRequestParametersEncoder
    , ( "BasicAuthParameters", val.basicAuthParameters )
        |> EncodeOpt.optionalField createConnectionBasicAuthRequestParametersEncoder
    , ( "InvocationHttpParameters", val.invocationHttpParameters )
        |> EncodeOpt.optionalField (Codec.encoder connectionHttpParametersCodec)
    , ( "OAuthParameters", val.oauthParameters )
        |> EncodeOpt.optionalField createConnectionOauthRequestParametersEncoder
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for CreateConnectionBasicAuthRequestParameters.
-}
createConnectionBasicAuthRequestParametersEncoder : CreateConnectionBasicAuthRequestParameters -> Value
createConnectionBasicAuthRequestParametersEncoder val =
    [ ( "Password", val.password ) |> EncodeOpt.field Json.Encode.string
    , ( "Username", val.username ) |> EncodeOpt.field Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for CreateConnectionOauthClientRequestParameters.
-}
createConnectionOauthClientRequestParametersEncoder : CreateConnectionOauthClientRequestParameters -> Value
createConnectionOauthClientRequestParametersEncoder val =
    [ ( "ClientID", val.clientId ) |> EncodeOpt.field Json.Encode.string
    , ( "ClientSecret", val.clientSecret ) |> EncodeOpt.field Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for CreateConnectionOauthRequestParameters.
-}
createConnectionOauthRequestParametersEncoder : CreateConnectionOauthRequestParameters -> Value
createConnectionOauthRequestParametersEncoder val =
    [ ( "AuthorizationEndpoint", val.authorizationEndpoint ) |> EncodeOpt.field Json.Encode.string
    , ( "ClientParameters", val.clientParameters )
        |> EncodeOpt.field createConnectionOauthClientRequestParametersEncoder
    , ( "HttpMethod", val.httpMethod ) |> EncodeOpt.field (Codec.encoder connectionOauthHttpMethodCodec)
    , ( "OAuthHttpParameters", val.oauthHttpParameters )
        |> EncodeOpt.optionalField (Codec.encoder connectionHttpParametersCodec)
    ]
        |> EncodeOpt.objectMaySkip


{-| Codec for DeadLetterConfig.
-}
deadLetterConfigCodec : Codec DeadLetterConfig
deadLetterConfigCodec =
    Codec.object DeadLetterConfig |> Codec.optionalField "Arn" .arn Codec.string |> Codec.buildObject


{-| Codec for EcsParameters.
-}
ecsParametersCodec : Codec EcsParameters
ecsParametersCodec =
    Codec.object EcsParameters
        |> Codec.optionalField "CapacityProviderStrategy" .capacityProviderStrategy capacityProviderStrategyCodec
        |> Codec.optionalField "EnableECSManagedTags" .enableEcsmanagedTags Codec.bool
        |> Codec.optionalField "EnableExecuteCommand" .enableExecuteCommand Codec.bool
        |> Codec.optionalField "Group" .group Codec.string
        |> Codec.optionalField "LaunchType" .launchType launchTypeCodec
        |> Codec.optionalField "NetworkConfiguration" .networkConfiguration networkConfigurationCodec
        |> Codec.optionalField "PlacementConstraints" .placementConstraints placementConstraintsCodec
        |> Codec.optionalField "PlacementStrategy" .placementStrategy placementStrategiesCodec
        |> Codec.optionalField "PlatformVersion" .platformVersion Codec.string
        |> Codec.optionalField "PropagateTags" .propagateTags propagateTagsCodec
        |> Codec.optionalField "ReferenceId" .referenceId Codec.string
        |> Codec.optionalField "Tags" .tags tagListCodec
        |> Codec.optionalField "TaskCount" .taskCount Codec.int
        |> Codec.field "TaskDefinitionArn" .taskDefinitionArn Codec.string
        |> Codec.buildObject


{-| Decoder for Endpoint.
-}
endpointDecoder : Decoder Endpoint
endpointDecoder =
    Json.Decode.succeed Endpoint
        |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EndpointId" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EndpointUrl" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventBuses" (Json.Decode.maybe (Codec.decoder endpointEventBusListCodec)) Nothing
        |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ReplicationConfig" (Json.Decode.maybe (Codec.decoder replicationConfigCodec)) Nothing
        |> Pipeline.optional "RoleArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "RoutingConfig" (Json.Decode.maybe (Codec.decoder routingConfigCodec)) Nothing
        |> Pipeline.optional "State" (Json.Decode.maybe endpointStateDecoder) Nothing
        |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Codec for EndpointEventBus.
-}
endpointEventBusCodec : Codec EndpointEventBus
endpointEventBusCodec =
    Codec.object EndpointEventBus |> Codec.field "EventBusArn" .eventBusArn Codec.string |> Codec.buildObject


{-| Codec for EndpointEventBusList.
-}
endpointEventBusListCodec : Codec EndpointEventBusList
endpointEventBusListCodec =
    Codec.list endpointEventBusCodec


{-| Decoder for EndpointList.
-}
endpointListDecoder : Decoder EndpointList
endpointListDecoder =
    Json.Decode.list endpointDecoder


{-| Decoder for EndpointState.
-}
endpointStateDecoder : Decoder EndpointState
endpointStateDecoder =
    Enum.decoder endpointState


{-| Decoder for EventBus.
-}
eventBusDecoder : Decoder EventBus
eventBusDecoder =
    Json.Decode.succeed EventBus
        |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "LastModifiedTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Policy" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for EventBusList.
-}
eventBusListDecoder : Decoder EventBusList
eventBusListDecoder =
    Json.Decode.list eventBusDecoder


{-| Encoder for EventResourceList.
-}
eventResourceListEncoder : EventResourceList -> Value
eventResourceListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Decoder for EventSource.
-}
eventSourceDecoder : Decoder EventSource
eventSourceDecoder =
    Json.Decode.succeed EventSource
        |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreatedBy" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ExpirationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "State" (Json.Decode.maybe eventSourceStateDecoder) Nothing


{-| Decoder for EventSourceList.
-}
eventSourceListDecoder : Decoder EventSourceList
eventSourceListDecoder =
    Json.Decode.list eventSourceDecoder


{-| Decoder for EventSourceState.
-}
eventSourceStateDecoder : Decoder EventSourceState
eventSourceStateDecoder =
    Enum.decoder eventSourceState


{-| Codec for FailoverConfig.
-}
failoverConfigCodec : Codec FailoverConfig
failoverConfigCodec =
    Codec.object FailoverConfig
        |> Codec.field "Primary" .primary primaryCodec
        |> Codec.field "Secondary" .secondary secondaryCodec
        |> Codec.buildObject


{-| Codec for HeaderParametersMap.
-}
headerParametersMapCodec : Codec HeaderParametersMap
headerParametersMapCodec =
    Codec.dict Codec.string


{-| Codec for HttpParameters.
-}
httpParametersCodec : Codec HttpParameters
httpParametersCodec =
    Codec.object HttpParameters
        |> Codec.optionalField "HeaderParameters" .headerParameters headerParametersMapCodec
        |> Codec.optionalField "PathParameterValues" .pathParameterValues pathParameterListCodec
        |> Codec.optionalField "QueryStringParameters" .queryStringParameters queryStringParametersMapCodec
        |> Codec.buildObject


{-| Codec for InputTransformer.
-}
inputTransformerCodec : Codec InputTransformer
inputTransformerCodec =
    Codec.object InputTransformer
        |> Codec.optionalField "InputPathsMap" .inputPathsMap transformerPathsCodec
        |> Codec.field "InputTemplate" .inputTemplate Codec.string
        |> Codec.buildObject


{-| Codec for KinesisParameters.
-}
kinesisParametersCodec : Codec KinesisParameters
kinesisParametersCodec =
    Codec.object KinesisParameters |> Codec.field "PartitionKeyPath" .partitionKeyPath Codec.string |> Codec.buildObject


{-| Codec for LaunchType.
-}
launchTypeCodec : Codec LaunchType
launchTypeCodec =
    Codec.build (Enum.encoder launchType) (Enum.decoder launchType)


{-| Codec for NetworkConfiguration.
-}
networkConfigurationCodec : Codec NetworkConfiguration
networkConfigurationCodec =
    Codec.object NetworkConfiguration
        |> Codec.optionalField "awsvpcConfiguration" .awsvpcConfiguration awsVpcConfigurationCodec
        |> Codec.buildObject


{-| Decoder for PartnerEventSource.
-}
partnerEventSourceDecoder : Decoder PartnerEventSource
partnerEventSourceDecoder =
    Json.Decode.succeed PartnerEventSource
        |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for PartnerEventSourceAccount.
-}
partnerEventSourceAccountDecoder : Decoder PartnerEventSourceAccount
partnerEventSourceAccountDecoder =
    Json.Decode.succeed PartnerEventSourceAccount
        |> Pipeline.optional "Account" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "CreationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ExpirationTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "State" (Json.Decode.maybe eventSourceStateDecoder) Nothing


{-| Decoder for PartnerEventSourceAccountList.
-}
partnerEventSourceAccountListDecoder : Decoder PartnerEventSourceAccountList
partnerEventSourceAccountListDecoder =
    Json.Decode.list partnerEventSourceAccountDecoder


{-| Decoder for PartnerEventSourceList.
-}
partnerEventSourceListDecoder : Decoder PartnerEventSourceList
partnerEventSourceListDecoder =
    Json.Decode.list partnerEventSourceDecoder


{-| Codec for PathParameterList.
-}
pathParameterListCodec : Codec PathParameterList
pathParameterListCodec =
    Codec.list Codec.string


{-| Codec for PlacementConstraint.
-}
placementConstraintCodec : Codec PlacementConstraint
placementConstraintCodec =
    Codec.object PlacementConstraint
        |> Codec.optionalField "expression" .expression Codec.string
        |> Codec.optionalField "type" .type_ placementConstraintTypeCodec
        |> Codec.buildObject


{-| Codec for PlacementConstraintType.
-}
placementConstraintTypeCodec : Codec PlacementConstraintType
placementConstraintTypeCodec =
    Codec.build (Enum.encoder placementConstraintType) (Enum.decoder placementConstraintType)


{-| Codec for PlacementConstraints.
-}
placementConstraintsCodec : Codec PlacementConstraints
placementConstraintsCodec =
    Codec.list placementConstraintCodec


{-| Codec for PlacementStrategies.
-}
placementStrategiesCodec : Codec PlacementStrategies
placementStrategiesCodec =
    Codec.list placementStrategyCodec


{-| Codec for PlacementStrategy.
-}
placementStrategyCodec : Codec PlacementStrategy
placementStrategyCodec =
    Codec.object PlacementStrategy
        |> Codec.optionalField "field" .field Codec.string
        |> Codec.optionalField "type" .type_ placementStrategyTypeCodec
        |> Codec.buildObject


{-| Codec for PlacementStrategyType.
-}
placementStrategyTypeCodec : Codec PlacementStrategyType
placementStrategyTypeCodec =
    Codec.build (Enum.encoder placementStrategyType) (Enum.decoder placementStrategyType)


{-| Codec for Primary.
-}
primaryCodec : Codec Primary
primaryCodec =
    Codec.object Primary |> Codec.field "HealthCheck" .healthCheck Codec.string |> Codec.buildObject


{-| Codec for PropagateTags.
-}
propagateTagsCodec : Codec PropagateTags
propagateTagsCodec =
    Codec.build (Enum.encoder propagateTags) (Enum.decoder propagateTags)


{-| Encoder for PutEventsRequestEntry.
-}
putEventsRequestEntryEncoder : PutEventsRequestEntry -> Value
putEventsRequestEntryEncoder val =
    [ ( "Detail", val.detail ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "DetailType", val.detailType ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "EventBusName", val.eventBusName ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "Resources", val.resources ) |> EncodeOpt.optionalField eventResourceListEncoder
    , ( "Source", val.source ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "Time", val.time ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "TraceHeader", val.traceHeader ) |> EncodeOpt.optionalField Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for PutEventsRequestEntryList.
-}
putEventsRequestEntryListEncoder : PutEventsRequestEntryList -> Value
putEventsRequestEntryListEncoder val =
    Json.Encode.list putEventsRequestEntryEncoder val


{-| Decoder for PutEventsResultEntry.
-}
putEventsResultEntryDecoder : Decoder PutEventsResultEntry
putEventsResultEntryDecoder =
    Json.Decode.succeed PutEventsResultEntry
        |> Pipeline.optional "ErrorCode" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ErrorMessage" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventId" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for PutEventsResultEntryList.
-}
putEventsResultEntryListDecoder : Decoder PutEventsResultEntryList
putEventsResultEntryListDecoder =
    Json.Decode.list putEventsResultEntryDecoder


{-| Encoder for PutPartnerEventsRequestEntry.
-}
putPartnerEventsRequestEntryEncoder : PutPartnerEventsRequestEntry -> Value
putPartnerEventsRequestEntryEncoder val =
    [ ( "Detail", val.detail ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "DetailType", val.detailType ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "Resources", val.resources ) |> EncodeOpt.optionalField eventResourceListEncoder
    , ( "Source", val.source ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "Time", val.time ) |> EncodeOpt.optionalField Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for PutPartnerEventsRequestEntryList.
-}
putPartnerEventsRequestEntryListEncoder : PutPartnerEventsRequestEntryList -> Value
putPartnerEventsRequestEntryListEncoder val =
    Json.Encode.list putPartnerEventsRequestEntryEncoder val


{-| Decoder for PutPartnerEventsResultEntry.
-}
putPartnerEventsResultEntryDecoder : Decoder PutPartnerEventsResultEntry
putPartnerEventsResultEntryDecoder =
    Json.Decode.succeed PutPartnerEventsResultEntry
        |> Pipeline.optional "ErrorCode" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ErrorMessage" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventId" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for PutPartnerEventsResultEntryList.
-}
putPartnerEventsResultEntryListDecoder : Decoder PutPartnerEventsResultEntryList
putPartnerEventsResultEntryListDecoder =
    Json.Decode.list putPartnerEventsResultEntryDecoder


{-| Decoder for PutTargetsResultEntry.
-}
putTargetsResultEntryDecoder : Decoder PutTargetsResultEntry
putTargetsResultEntryDecoder =
    Json.Decode.succeed PutTargetsResultEntry
        |> Pipeline.optional "ErrorCode" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ErrorMessage" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "TargetId" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for PutTargetsResultEntryList.
-}
putTargetsResultEntryListDecoder : Decoder PutTargetsResultEntryList
putTargetsResultEntryListDecoder =
    Json.Decode.list putTargetsResultEntryDecoder


{-| Codec for QueryStringParametersMap.
-}
queryStringParametersMapCodec : Codec QueryStringParametersMap
queryStringParametersMapCodec =
    Codec.dict Codec.string


{-| Codec for RedshiftDataParameters.
-}
redshiftDataParametersCodec : Codec RedshiftDataParameters
redshiftDataParametersCodec =
    Codec.object RedshiftDataParameters
        |> Codec.field "Database" .database Codec.string
        |> Codec.optionalField "DbUser" .dbUser Codec.string
        |> Codec.optionalField "SecretManagerArn" .secretManagerArn Codec.string
        |> Codec.optionalField "Sql" .sql Codec.string
        |> Codec.optionalField "Sqls" .sqls sqlsCodec
        |> Codec.optionalField "StatementName" .statementName Codec.string
        |> Codec.optionalField "WithEvent" .withEvent Codec.bool
        |> Codec.buildObject


{-| Decoder for RemoveTargetsResultEntry.
-}
removeTargetsResultEntryDecoder : Decoder RemoveTargetsResultEntry
removeTargetsResultEntryDecoder =
    Json.Decode.succeed RemoveTargetsResultEntry
        |> Pipeline.optional "ErrorCode" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ErrorMessage" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "TargetId" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Decoder for RemoveTargetsResultEntryList.
-}
removeTargetsResultEntryListDecoder : Decoder RemoveTargetsResultEntryList
removeTargetsResultEntryListDecoder =
    Json.Decode.list removeTargetsResultEntryDecoder


{-| Decoder for Replay.
-}
replayDecoder : Decoder Replay
replayDecoder =
    Json.Decode.succeed Replay
        |> Pipeline.optional "EventEndTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventLastReplayedTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventSourceArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventStartTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ReplayEndTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ReplayName" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ReplayStartTime" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder replayStateCodec)) Nothing
        |> Pipeline.optional "StateReason" (Json.Decode.maybe Json.Decode.string) Nothing


{-| Codec for ReplayDestination.
-}
replayDestinationCodec : Codec ReplayDestination
replayDestinationCodec =
    Codec.object ReplayDestination
        |> Codec.field "Arn" .arn Codec.string
        |> Codec.optionalField "FilterArns" .filterArns replayDestinationFiltersCodec
        |> Codec.buildObject


{-| Codec for ReplayDestinationFilters.
-}
replayDestinationFiltersCodec : Codec ReplayDestinationFilters
replayDestinationFiltersCodec =
    Codec.list Codec.string


{-| Decoder for ReplayList.
-}
replayListDecoder : Decoder ReplayList
replayListDecoder =
    Json.Decode.list replayDecoder


{-| Codec for ReplayState.
-}
replayStateCodec : Codec ReplayState
replayStateCodec =
    Codec.build (Enum.encoder replayState) (Enum.decoder replayState)


{-| Codec for ReplicationConfig.
-}
replicationConfigCodec : Codec ReplicationConfig
replicationConfigCodec =
    Codec.object ReplicationConfig |> Codec.optionalField "State" .state replicationStateCodec |> Codec.buildObject


{-| Codec for ReplicationState.
-}
replicationStateCodec : Codec ReplicationState
replicationStateCodec =
    Codec.build (Enum.encoder replicationState) (Enum.decoder replicationState)


{-| Codec for RetryPolicy.
-}
retryPolicyCodec : Codec RetryPolicy
retryPolicyCodec =
    Codec.object RetryPolicy
        |> Codec.optionalField "MaximumEventAgeInSeconds" .maximumEventAgeInSeconds Codec.int
        |> Codec.optionalField "MaximumRetryAttempts" .maximumRetryAttempts Codec.int
        |> Codec.buildObject


{-| Codec for RoutingConfig.
-}
routingConfigCodec : Codec RoutingConfig
routingConfigCodec =
    Codec.object RoutingConfig |> Codec.field "FailoverConfig" .failoverConfig failoverConfigCodec |> Codec.buildObject


{-| Decoder for Rule.
-}
ruleDecoder : Decoder Rule
ruleDecoder =
    Json.Decode.succeed Rule
        |> Pipeline.optional "Arn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Description" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventBusName" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "EventPattern" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ManagedBy" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "Name" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "RoleArn" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "ScheduleExpression" (Json.Decode.maybe Json.Decode.string) Nothing
        |> Pipeline.optional "State" (Json.Decode.maybe (Codec.decoder ruleStateCodec)) Nothing


{-| Decoder for RuleNameList.
-}
ruleNameListDecoder : Decoder RuleNameList
ruleNameListDecoder =
    Json.Decode.list Json.Decode.string


{-| Decoder for RuleResponseList.
-}
ruleResponseListDecoder : Decoder RuleResponseList
ruleResponseListDecoder =
    Json.Decode.list ruleDecoder


{-| Codec for RuleState.
-}
ruleStateCodec : Codec RuleState
ruleStateCodec =
    Codec.build (Enum.encoder ruleState) (Enum.decoder ruleState)


{-| Codec for RunCommandParameters.
-}
runCommandParametersCodec : Codec RunCommandParameters
runCommandParametersCodec =
    Codec.object RunCommandParameters
        |> Codec.field "RunCommandTargets" .runCommandTargets runCommandTargetsCodec
        |> Codec.buildObject


{-| Codec for RunCommandTarget.
-}
runCommandTargetCodec : Codec RunCommandTarget
runCommandTargetCodec =
    Codec.object RunCommandTarget
        |> Codec.field "Key" .key Codec.string
        |> Codec.field "Values" .values runCommandTargetValuesCodec
        |> Codec.buildObject


{-| Codec for RunCommandTargetValues.
-}
runCommandTargetValuesCodec : Codec RunCommandTargetValues
runCommandTargetValuesCodec =
    Codec.list Codec.string


{-| Codec for RunCommandTargets.
-}
runCommandTargetsCodec : Codec RunCommandTargets
runCommandTargetsCodec =
    Codec.list runCommandTargetCodec


{-| Codec for SageMakerPipelineParameter.
-}
sageMakerPipelineParameterCodec : Codec SageMakerPipelineParameter
sageMakerPipelineParameterCodec =
    Codec.object SageMakerPipelineParameter
        |> Codec.field "Name" .name Codec.string
        |> Codec.field "Value" .value Codec.string
        |> Codec.buildObject


{-| Codec for SageMakerPipelineParameterList.
-}
sageMakerPipelineParameterListCodec : Codec SageMakerPipelineParameterList
sageMakerPipelineParameterListCodec =
    Codec.list sageMakerPipelineParameterCodec


{-| Codec for SageMakerPipelineParameters.
-}
sageMakerPipelineParametersCodec : Codec SageMakerPipelineParameters
sageMakerPipelineParametersCodec =
    Codec.object SageMakerPipelineParameters
        |> Codec.optionalField "PipelineParameterList" .pipelineParameterList sageMakerPipelineParameterListCodec
        |> Codec.buildObject


{-| Codec for Secondary.
-}
secondaryCodec : Codec Secondary
secondaryCodec =
    Codec.object Secondary |> Codec.field "Route" .route Codec.string |> Codec.buildObject


{-| Codec for Sqls.
-}
sqlsCodec : Codec Sqls
sqlsCodec =
    Codec.list Codec.string


{-| Codec for SqsParameters.
-}
sqsParametersCodec : Codec SqsParameters
sqsParametersCodec =
    Codec.object SqsParameters |> Codec.optionalField "MessageGroupId" .messageGroupId Codec.string |> Codec.buildObject


{-| Codec for StringList.
-}
stringListCodec : Codec StringList
stringListCodec =
    Codec.list Codec.string


{-| Codec for Tag.
-}
tagCodec : Codec Tag
tagCodec =
    Codec.object Tag
        |> Codec.field "Key" .key Codec.string
        |> Codec.field "Value" .value Codec.string
        |> Codec.buildObject


{-| Encoder for TagKeyList.
-}
tagKeyListEncoder : TagKeyList -> Value
tagKeyListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Codec for TagList.
-}
tagListCodec : Codec TagList
tagListCodec =
    Codec.list tagCodec


{-| Codec for Target.
-}
targetCodec : Codec Target
targetCodec =
    Codec.object Target
        |> Codec.optionalField "AppSyncParameters" .appSyncParameters appSyncParametersCodec
        |> Codec.field "Arn" .arn Codec.string
        |> Codec.optionalField "BatchParameters" .batchParameters batchParametersCodec
        |> Codec.optionalField "DeadLetterConfig" .deadLetterConfig deadLetterConfigCodec
        |> Codec.optionalField "EcsParameters" .ecsParameters ecsParametersCodec
        |> Codec.optionalField "HttpParameters" .httpParameters httpParametersCodec
        |> Codec.field "Id" .id Codec.string
        |> Codec.optionalField "Input" .input Codec.string
        |> Codec.optionalField "InputPath" .inputPath Codec.string
        |> Codec.optionalField "InputTransformer" .inputTransformer inputTransformerCodec
        |> Codec.optionalField "KinesisParameters" .kinesisParameters kinesisParametersCodec
        |> Codec.optionalField "RedshiftDataParameters" .redshiftDataParameters redshiftDataParametersCodec
        |> Codec.optionalField "RetryPolicy" .retryPolicy retryPolicyCodec
        |> Codec.optionalField "RoleArn" .roleArn Codec.string
        |> Codec.optionalField "RunCommandParameters" .runCommandParameters runCommandParametersCodec
        |> Codec.optionalField
            "SageMakerPipelineParameters"
            .sageMakerPipelineParameters
            sageMakerPipelineParametersCodec
        |> Codec.optionalField "SqsParameters" .sqsParameters sqsParametersCodec
        |> Codec.buildObject


{-| Encoder for TargetIdList.
-}
targetIdListEncoder : TargetIdList -> Value
targetIdListEncoder val =
    Json.Encode.list Json.Encode.string val


{-| Codec for TargetList.
-}
targetListCodec : Codec TargetList
targetListCodec =
    Codec.list targetCodec


{-| Codec for TransformerPaths.
-}
transformerPathsCodec : Codec TransformerPaths
transformerPathsCodec =
    Codec.dict Codec.string


{-| Encoder for UpdateConnectionApiKeyAuthRequestParameters.
-}
updateConnectionApiKeyAuthRequestParametersEncoder : UpdateConnectionApiKeyAuthRequestParameters -> Value
updateConnectionApiKeyAuthRequestParametersEncoder val =
    [ ( "ApiKeyName", val.apiKeyName ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "ApiKeyValue", val.apiKeyValue ) |> EncodeOpt.optionalField Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for UpdateConnectionAuthRequestParameters.
-}
updateConnectionAuthRequestParametersEncoder : UpdateConnectionAuthRequestParameters -> Value
updateConnectionAuthRequestParametersEncoder val =
    [ ( "ApiKeyAuthParameters", val.apiKeyAuthParameters )
        |> EncodeOpt.optionalField updateConnectionApiKeyAuthRequestParametersEncoder
    , ( "BasicAuthParameters", val.basicAuthParameters )
        |> EncodeOpt.optionalField updateConnectionBasicAuthRequestParametersEncoder
    , ( "InvocationHttpParameters", val.invocationHttpParameters )
        |> EncodeOpt.optionalField (Codec.encoder connectionHttpParametersCodec)
    , ( "OAuthParameters", val.oauthParameters )
        |> EncodeOpt.optionalField updateConnectionOauthRequestParametersEncoder
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for UpdateConnectionBasicAuthRequestParameters.
-}
updateConnectionBasicAuthRequestParametersEncoder : UpdateConnectionBasicAuthRequestParameters -> Value
updateConnectionBasicAuthRequestParametersEncoder val =
    [ ( "Password", val.password ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "Username", val.username ) |> EncodeOpt.optionalField Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for UpdateConnectionOauthClientRequestParameters.
-}
updateConnectionOauthClientRequestParametersEncoder : UpdateConnectionOauthClientRequestParameters -> Value
updateConnectionOauthClientRequestParametersEncoder val =
    [ ( "ClientID", val.clientId ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "ClientSecret", val.clientSecret ) |> EncodeOpt.optionalField Json.Encode.string
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for UpdateConnectionOauthRequestParameters.
-}
updateConnectionOauthRequestParametersEncoder : UpdateConnectionOauthRequestParameters -> Value
updateConnectionOauthRequestParametersEncoder val =
    [ ( "AuthorizationEndpoint", val.authorizationEndpoint ) |> EncodeOpt.optionalField Json.Encode.string
    , ( "ClientParameters", val.clientParameters )
        |> EncodeOpt.optionalField updateConnectionOauthClientRequestParametersEncoder
    , ( "HttpMethod", val.httpMethod ) |> EncodeOpt.optionalField (Codec.encoder connectionOauthHttpMethodCodec)
    , ( "OAuthHttpParameters", val.oauthHttpParameters )
        |> EncodeOpt.optionalField (Codec.encoder connectionHttpParametersCodec)
    ]
        |> EncodeOpt.objectMaySkip
