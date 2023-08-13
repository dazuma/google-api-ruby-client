# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module AnalyticshubV1
      
      # Specifies the audit configuration for a service. The configuration determines
      # which permission types are logged, and what identities, if any, are exempted
      # from logging. An AuditConfig must have one or more AuditLogConfigs. If there
      # are AuditConfigs for both `allServices` and a specific service, the union of
      # the two AuditConfigs is used for that service: the log_types specified in each
      # AuditConfig are enabled, and the exempted_members in each AuditLogConfig are
      # exempted. Example Policy with multiple AuditConfigs: ` "audit_configs": [ ` "
      # service": "allServices", "audit_log_configs": [ ` "log_type": "DATA_READ", "
      # exempted_members": [ "user:jose@example.com" ] `, ` "log_type": "DATA_WRITE" `,
      # ` "log_type": "ADMIN_READ" ` ] `, ` "service": "sampleservice.googleapis.com",
      # "audit_log_configs": [ ` "log_type": "DATA_READ" `, ` "log_type": "DATA_WRITE"
      # , "exempted_members": [ "user:aliya@example.com" ] ` ] ` ] ` For sampleservice,
      # this policy enables DATA_READ, DATA_WRITE and ADMIN_READ logging. It also
      # exempts `jose@example.com` from DATA_READ logging, and `aliya@example.com`
      # from DATA_WRITE logging.
      class AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::AnalyticshubV1::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # Specifies a service that will be enabled for audit logging. For example, `
        # storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices` is a special
        # value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Provides the configuration for logging a type of permissions. Example: ` "
      # audit_log_configs": [ ` "log_type": "DATA_READ", "exempted_members": [ "user:
      # jose@example.com" ] `, ` "log_type": "DATA_WRITE" ` ] ` This enables '
      # DATA_READ' and 'DATA_WRITE' logging, while exempting jose@example.com from
      # DATA_READ logging.
      class AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of permission.
        # Follows the same format of Binding.members.
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # The log type that this config enables.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # A reference to a shared dataset. It is an existing BigQuery dataset with a
      # collection of objects such as tables and views that you want to share with
      # subscribers. When subscriber's subscribe to a listing, Analytics Hub creates a
      # linked dataset in the subscriber's project. A Linked dataset is an opaque,
      # read-only BigQuery dataset that serves as a _symbolic link_ to a shared
      # dataset.
      class BigQueryDatasetSource
        include Google::Apis::Core::Hashable
      
        # Resource name of the dataset source for this listing. e.g. `projects/myproject/
        # datasets/123`
        # Corresponds to the JSON property `dataset`
        # @return [String]
        attr_accessor :dataset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset = args[:dataset] if args.key?(:dataset)
        end
      end
      
      # Associates `members`, or principals, with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents a textual expression in the Common Expression Language (CEL) syntax.
        # CEL is a C-like expression language. The syntax and semantics of CEL are
        # documented at https://github.com/google/cel-spec. Example (Comparison): title:
        # "Summary size limit" description: "Determines if a summary is less than 100
        # chars" expression: "document.summary.size() < 100" Example (Equality): title: "
        # Requestor is owner" description: "Determines if requestor is the document
        # owner" expression: "document.owner == request.auth.claims.email" Example (
        # Logic): title: "Public documents" description: "Determine whether the document
        # should be publicly visible" expression: "document.type != 'private' &&
        # document.type != 'internal'" Example (Data Manipulation): title: "Notification
        # string" description: "Create a notification string with a timestamp."
        # expression: "'New message received at ' + string(document.create_time)" The
        # exact variables and functions that may be referenced within an expression are
        # determined by the service that evaluates it. See the service documentation for
        # additional information.
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::AnalyticshubV1::Expr]
        attr_accessor :condition
      
        # Specifies the principals requesting access for a Google Cloud resource. `
        # members` can have the following values: * `allUsers`: A special identifier
        # that represents anyone who is on the internet; with or without a Google
        # account. * `allAuthenticatedUsers`: A special identifier that represents
        # anyone who is authenticated with a Google account or a service account. Does
        # not include identities that come from external identity providers (IdPs)
        # through identity federation. * `user:`emailid``: An email address that
        # represents a specific Google account. For example, `alice@example.com` . * `
        # serviceAccount:`emailid``: An email address that represents a Google service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`. * `
        # serviceAccount:`projectid`.svc.id.goog[`namespace`/`kubernetes-sa`]`: An
        # identifier for a [Kubernetes service account](https://cloud.google.com/
        # kubernetes-engine/docs/how-to/kubernetes-service-accounts). For example, `my-
        # project.svc.id.goog[my-namespace/my-kubernetes-sa]`. * `group:`emailid``: An
        # email address that represents a Google group. For example, `admins@example.com`
        # . * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`. * `deleted:
        # user:`emailid`?uid=`uniqueid``: An email address (plus unique identifier)
        # representing a user that has been recently deleted. For example, `alice@
        # example.com?uid=123456789012345678901`. If the user is recovered, this value
        # reverts to `user:`emailid`` and the recovered user retains the role in the
        # binding. * `deleted:serviceAccount:`emailid`?uid=`uniqueid``: An email address
        # (plus unique identifier) representing a service account that has been recently
        # deleted. For example, `my-other-app@appspot.gserviceaccount.com?uid=
        # 123456789012345678901`. If the service account is undeleted, this value
        # reverts to `serviceAccount:`emailid`` and the undeleted service account
        # retains the role in the binding. * `deleted:group:`emailid`?uid=`uniqueid``:
        # An email address (plus unique identifier) representing a Google group that has
        # been recently deleted. For example, `admins@example.com?uid=
        # 123456789012345678901`. If the group is recovered, this value reverts to `
        # group:`emailid`` and the recovered group retains the role in the binding.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to the list of `members`, or principals. For example, `
        # roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # A data exchange is a container that lets you share data. Along with the
      # descriptive information about the data exchange, it contains listings that
      # reference shared datasets.
      class DataExchange
        include Google::Apis::Core::Hashable
      
        # Optional. Description of the data exchange. The description must not contain
        # Unicode non-characters as well as C0 and C1 control codes except tabs (HT),
        # new lines (LF), carriage returns (CR), and page breaks (FF). Default value is
        # an empty string. Max length: 2000 bytes.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. Human-readable display name of the data exchange. The display name
        # must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-),
        # spaces ( ), ampersands (&) and must not start or end with spaces. Default
        # value is an empty string. Max length: 63 bytes.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. Documentation describing the data exchange.
        # Corresponds to the JSON property `documentation`
        # @return [String]
        attr_accessor :documentation
      
        # Optional. Base64 encoded image representing the data exchange. Max Size: 3.
        # 0MiB Expected image dimensions are 512x512 pixels, however the API only
        # performs validation on size of the encoded data. Note: For byte fields, the
        # content of the fields are base64-encoded (which increases the size of the data
        # by 33-36%) when using JSON on the wire.
        # Corresponds to the JSON property `icon`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :icon
      
        # Output only. Number of listings contained in the data exchange.
        # Corresponds to the JSON property `listingCount`
        # @return [Fixnum]
        attr_accessor :listing_count
      
        # Output only. The resource name of the data exchange. e.g. `projects/myproject/
        # locations/US/dataExchanges/123`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Email or URL of the primary point of contact of the data exchange.
        # Max Length: 1000 bytes.
        # Corresponds to the JSON property `primaryContact`
        # @return [String]
        attr_accessor :primary_contact
      
        # Sharing environment is a behavior model for sharing data within a data
        # exchange. This option is configurable for a data exchange.
        # Corresponds to the JSON property `sharingEnvironmentConfig`
        # @return [Google::Apis::AnalyticshubV1::SharingEnvironmentConfig]
        attr_accessor :sharing_environment_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @documentation = args[:documentation] if args.key?(:documentation)
          @icon = args[:icon] if args.key?(:icon)
          @listing_count = args[:listing_count] if args.key?(:listing_count)
          @name = args[:name] if args.key?(:name)
          @primary_contact = args[:primary_contact] if args.key?(:primary_contact)
          @sharing_environment_config = args[:sharing_environment_config] if args.key?(:sharing_environment_config)
        end
      end
      
      # Contains details of the data provider.
      class DataProvider
        include Google::Apis::Core::Hashable
      
        # Optional. Name of the data provider.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Email or URL of the data provider. Max Length: 1000 bytes.
        # Corresponds to the JSON property `primaryContact`
        # @return [String]
        attr_accessor :primary_contact
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @primary_contact = args[:primary_contact] if args.key?(:primary_contact)
        end
      end
      
      # Data Clean Room (DCR), used for privacy-safe and secured data sharing.
      class DcrExchangeConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Default Analytics Hub data exchange, used for secured data sharing.
      class DefaultExchangeConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Defines the destination bigquery dataset.
      class DestinationDataset
        include Google::Apis::Core::Hashable
      
        # Contains the reference that identifies a destination bigquery dataset.
        # Corresponds to the JSON property `datasetReference`
        # @return [Google::Apis::AnalyticshubV1::DestinationDatasetReference]
        attr_accessor :dataset_reference
      
        # Optional. A user-friendly description of the dataset.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. A descriptive name for the dataset.
        # Corresponds to the JSON property `friendlyName`
        # @return [String]
        attr_accessor :friendly_name
      
        # Optional. The labels associated with this dataset. You can use these to
        # organize and group your datasets. You can set this property when inserting or
        # updating a dataset. See https://cloud.google.com/resource-manager/docs/
        # creating-managing-labels for more information.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The geographic location where the dataset should reside. See https://
        # cloud.google.com/bigquery/docs/locations for supported locations.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_reference = args[:dataset_reference] if args.key?(:dataset_reference)
          @description = args[:description] if args.key?(:description)
          @friendly_name = args[:friendly_name] if args.key?(:friendly_name)
          @labels = args[:labels] if args.key?(:labels)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # Contains the reference that identifies a destination bigquery dataset.
      class DestinationDatasetReference
        include Google::Apis::Core::Hashable
      
        # Required. A unique ID for this dataset, without the project name. The ID must
        # contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The
        # maximum length is 1,024 characters.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # Required. The ID of the project containing this dataset.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance: service Foo ` rpc Bar(google.
      # protobuf.Empty) returns (google.protobuf.Empty); `
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents a textual expression in the Common Expression Language (CEL) syntax.
      # CEL is a C-like expression language. The syntax and semantics of CEL are
      # documented at https://github.com/google/cel-spec. Example (Comparison): title:
      # "Summary size limit" description: "Determines if a summary is less than 100
      # chars" expression: "document.summary.size() < 100" Example (Equality): title: "
      # Requestor is owner" description: "Determines if requestor is the document
      # owner" expression: "document.owner == request.auth.claims.email" Example (
      # Logic): title: "Public documents" description: "Determine whether the document
      # should be publicly visible" expression: "document.type != 'private' &&
      # document.type != 'internal'" Example (Data Manipulation): title: "Notification
      # string" description: "Create a notification string with a timestamp."
      # expression: "'New message received at ' + string(document.create_time)" The
      # exact variables and functions that may be referenced within an expression are
      # determined by the service that evaluates it. See the service documentation for
      # additional information.
      class Expr
        include Google::Apis::Core::Hashable
      
        # Optional. Description of the expression. This is a longer text which describes
        # the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in Common Expression Language syntax.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # Optional. String indicating the location of the expression for error reporting,
        # e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Optional. Title for the expression, i.e. a short string describing its purpose.
        # This can be used e.g. in UIs which allow to enter the expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::AnalyticshubV1::GetPolicyOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Encapsulates settings provided to GetIamPolicy.
      class GetPolicyOptions
        include Google::Apis::Core::Hashable
      
        # Optional. The maximum policy version that will be used to format the policy.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected. Requests for policies with any conditional role bindings must
        # specify version 3. Policies with no conditional role bindings may specify any
        # valid value or leave the field unset. The policy in the response might use the
        # policy version that you specified, or it might use a lower policy version. For
        # example, if you specify version 3, but the policy has no conditional role
        # bindings, the response uses version 1. To learn which resources support
        # conditions in their IAM policies, see the [IAM documentation](https://cloud.
        # google.com/iam/help/conditions/resource-policies).
        # Corresponds to the JSON property `requestedPolicyVersion`
        # @return [Fixnum]
        attr_accessor :requested_policy_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requested_policy_version = args[:requested_policy_version] if args.key?(:requested_policy_version)
        end
      end
      
      # Reference to a linked resource tracked by this Subscription.
      class LinkedResource
        include Google::Apis::Core::Hashable
      
        # Output only. Name of the linked dataset, e.g. projects/subscriberproject/
        # datasets/linked_dataset
        # Corresponds to the JSON property `linkedDataset`
        # @return [String]
        attr_accessor :linked_dataset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @linked_dataset = args[:linked_dataset] if args.key?(:linked_dataset)
        end
      end
      
      # Message for response to the list of data exchanges.
      class ListDataExchangesResponse
        include Google::Apis::Core::Hashable
      
        # The list of data exchanges.
        # Corresponds to the JSON property `dataExchanges`
        # @return [Array<Google::Apis::AnalyticshubV1::DataExchange>]
        attr_accessor :data_exchanges
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_exchanges = args[:data_exchanges] if args.key?(:data_exchanges)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Message for response to the list of Listings.
      class ListListingsResponse
        include Google::Apis::Core::Hashable
      
        # The list of Listing.
        # Corresponds to the JSON property `listings`
        # @return [Array<Google::Apis::AnalyticshubV1::Listing>]
        attr_accessor :listings
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @listings = args[:listings] if args.key?(:listings)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Message for response to listing data exchanges in an organization and location.
      class ListOrgDataExchangesResponse
        include Google::Apis::Core::Hashable
      
        # The list of data exchanges.
        # Corresponds to the JSON property `dataExchanges`
        # @return [Array<Google::Apis::AnalyticshubV1::DataExchange>]
        attr_accessor :data_exchanges
      
        # A token to request the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_exchanges = args[:data_exchanges] if args.key?(:data_exchanges)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Message for response to the listing of shared resource subscriptions.
      class ListSharedResourceSubscriptionsResponse
        include Google::Apis::Core::Hashable
      
        # Next page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of subscriptions.
        # Corresponds to the JSON property `sharedResourceSubscriptions`
        # @return [Array<Google::Apis::AnalyticshubV1::Subscription>]
        attr_accessor :shared_resource_subscriptions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @shared_resource_subscriptions = args[:shared_resource_subscriptions] if args.key?(:shared_resource_subscriptions)
        end
      end
      
      # Message for response to the listing of subscriptions.
      class ListSubscriptionsResponse
        include Google::Apis::Core::Hashable
      
        # Next page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of subscriptions.
        # Corresponds to the JSON property `subscriptions`
        # @return [Array<Google::Apis::AnalyticshubV1::Subscription>]
        attr_accessor :subscriptions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @subscriptions = args[:subscriptions] if args.key?(:subscriptions)
        end
      end
      
      # A listing is what gets published into a data exchange that a subscriber can
      # subscribe to. It contains a reference to the data source along with
      # descriptive information that will help subscribers find and subscribe the data.
      class Listing
        include Google::Apis::Core::Hashable
      
        # A reference to a shared dataset. It is an existing BigQuery dataset with a
        # collection of objects such as tables and views that you want to share with
        # subscribers. When subscriber's subscribe to a listing, Analytics Hub creates a
        # linked dataset in the subscriber's project. A Linked dataset is an opaque,
        # read-only BigQuery dataset that serves as a _symbolic link_ to a shared
        # dataset.
        # Corresponds to the JSON property `bigqueryDataset`
        # @return [Google::Apis::AnalyticshubV1::BigQueryDatasetSource]
        attr_accessor :bigquery_dataset
      
        # Optional. Categories of the listing. Up to two categories are allowed.
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # Contains details of the data provider.
        # Corresponds to the JSON property `dataProvider`
        # @return [Google::Apis::AnalyticshubV1::DataProvider]
        attr_accessor :data_provider
      
        # Optional. Short description of the listing. The description must not contain
        # Unicode non-characters and C0 and C1 control codes except tabs (HT), new lines
        # (LF), carriage returns (CR), and page breaks (FF). Default value is an empty
        # string. Max length: 2000 bytes.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. Human-readable display name of the listing. The display name must
        # contain only Unicode letters, numbers (0-9), underscores (_), dashes (-),
        # spaces ( ), ampersands (&) and can't start or end with spaces. Default value
        # is an empty string. Max length: 63 bytes.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. Documentation describing the listing.
        # Corresponds to the JSON property `documentation`
        # @return [String]
        attr_accessor :documentation
      
        # Optional. Base64 encoded image representing the listing. Max Size: 3.0MiB
        # Expected image dimensions are 512x512 pixels, however the API only performs
        # validation on size of the encoded data. Note: For byte fields, the contents of
        # the field are base64-encoded (which increases the size of the data by 33-36%)
        # when using JSON on the wire.
        # Corresponds to the JSON property `icon`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :icon
      
        # Output only. The resource name of the listing. e.g. `projects/myproject/
        # locations/US/dataExchanges/123/listings/456`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Email or URL of the primary point of contact of the listing. Max
        # Length: 1000 bytes.
        # Corresponds to the JSON property `primaryContact`
        # @return [String]
        attr_accessor :primary_contact
      
        # Contains details of the listing publisher.
        # Corresponds to the JSON property `publisher`
        # @return [Google::Apis::AnalyticshubV1::Publisher]
        attr_accessor :publisher
      
        # Optional. Email or URL of the request access of the listing. Subscribers can
        # use this reference to request access. Max Length: 1000 bytes.
        # Corresponds to the JSON property `requestAccess`
        # @return [String]
        attr_accessor :request_access
      
        # Restricted export config, used to configure restricted export on linked
        # dataset.
        # Corresponds to the JSON property `restrictedExportConfig`
        # @return [Google::Apis::AnalyticshubV1::RestrictedExportConfig]
        attr_accessor :restricted_export_config
      
        # Output only. Current state of the listing.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_dataset = args[:bigquery_dataset] if args.key?(:bigquery_dataset)
          @categories = args[:categories] if args.key?(:categories)
          @data_provider = args[:data_provider] if args.key?(:data_provider)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @documentation = args[:documentation] if args.key?(:documentation)
          @icon = args[:icon] if args.key?(:icon)
          @name = args[:name] if args.key?(:name)
          @primary_contact = args[:primary_contact] if args.key?(:primary_contact)
          @publisher = args[:publisher] if args.key?(:publisher)
          @request_access = args[:request_access] if args.key?(:request_access)
          @restricted_export_config = args[:restricted_export_config] if args.key?(:restricted_export_config)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress. If `true`
        # , the operation is completed, and either `error` or `response` is available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more
        # about this error model and how to work with it in the [API Design Guide](https:
        # //cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::AnalyticshubV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the `name` should
        # be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal, successful response of the operation. If the original method
        # returns no data on success, such as `Delete`, the response is `google.protobuf.
        # Empty`. If the original method is standard `Get`/`Create`/`Update`, the
        # response should be the resource. For other methods, the response should have
        # the type `XxxResponse`, where `Xxx` is the original method name. For example,
        # if the original method name is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # Represents the metadata of the long-running operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. API version used to start the operation.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # Output only. Identifies whether the user has requested cancellation of the
        # operation. Operations that have been cancelled successfully have Operation.
        # error value with a google.rpc.Status.code of 1, corresponding to `Code.
        # CANCELLED`.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # Output only. The time the operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The time the operation finished running.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. Human-readable status of the operation, if any.
        # Corresponds to the JSON property `statusDetail`
        # @return [String]
        attr_accessor :status_detail
      
        # Output only. Server-defined resource path for the target of the operation.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # Output only. Name of the verb executed by the operation.
        # Corresponds to the JSON property `verb`
        # @return [String]
        attr_accessor :verb
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @cancel_requested = args[:cancel_requested] if args.key?(:cancel_requested)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @status_detail = args[:status_detail] if args.key?(:status_detail)
          @target = args[:target] if args.key?(:target)
          @verb = args[:verb] if args.key?(:verb)
        end
      end
      
      # An Identity and Access Management (IAM) policy, which specifies access
      # controls for Google Cloud resources. A `Policy` is a collection of `bindings`.
      # A `binding` binds one or more `members`, or principals, to a single `role`.
      # Principals can be user accounts, service accounts, Google groups, and domains (
      # such as G Suite). A `role` is a named list of permissions; each `role` can be
      # an IAM predefined role or a user-created custom role. For some types of Google
      # Cloud resources, a `binding` can also specify a `condition`, which is a
      # logical expression that allows access to a resource only if the expression
      # evaluates to `true`. A condition can add constraints based on attributes of
      # the request, the resource, or both. To learn which resources support
      # conditions in their IAM policies, see the [IAM documentation](https://cloud.
      # google.com/iam/help/conditions/resource-policies). **JSON example:** ``` ` "
      # bindings": [ ` "role": "roles/resourcemanager.organizationAdmin", "members": [
      # "user:mike@example.com", "group:admins@example.com", "domain:google.com", "
      # serviceAccount:my-project-id@appspot.gserviceaccount.com" ] `, ` "role": "
      # roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com"
      # ], "condition": ` "title": "expirable access", "description": "Does not grant
      # access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:
      # 00:00.000Z')", ` ` ], "etag": "BwWWja0YfJA=", "version": 3 ` ``` **YAML
      # example:** ``` bindings: - members: - user:mike@example.com - group:admins@
      # example.com - domain:google.com - serviceAccount:my-project-id@appspot.
      # gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: -
      # user:eve@example.com role: roles/resourcemanager.organizationViewer condition:
      # title: expirable access description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z') etag:
      # BwWWja0YfJA= version: 3 ``` For a description of IAM and its features, see the
      # [IAM documentation](https://cloud.google.com/iam/docs/).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::AnalyticshubV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members`, or principals, with a `role`. Optionally, may
        # specify a `condition` that determines how and when the `bindings` are applied.
        # Each of the `bindings` must contain at least one principal. The `bindings` in
        # a `Policy` can refer to up to 1,500 principals; up to 250 of these principals
        # can be Google groups. Each occurrence of a principal counts towards these
        # limits. For example, if the `bindings` grant 50 different roles to `user:alice@
        # example.com`, and not to any other principal, then you can add another 1,450
        # principals to the `bindings` in the `Policy`.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::AnalyticshubV1::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help prevent
        # simultaneous updates of a policy from overwriting each other. It is strongly
        # suggested that systems make use of the `etag` in the read-modify-write cycle
        # to perform policy updates in order to avoid race conditions: An `etag` is
        # returned in the response to `getIamPolicy`, and systems are expected to put
        # that etag in the request to `setIamPolicy` to ensure that their change will be
        # applied to the same version of the policy. **Important:** If you use IAM
        # Conditions, you must include the `etag` field whenever you call `setIamPolicy`.
        # If you omit this field, then IAM allows you to overwrite a version `3` policy
        # with a version `1` policy, and all of the conditions in the version `3` policy
        # are lost.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy. Valid values are `0`, `1`, and `3`.
        # Requests that specify an invalid value are rejected. Any operation that
        # affects conditional role bindings must specify version `3`. This requirement
        # applies to the following operations: * Getting a policy that includes a
        # conditional role binding * Adding a conditional role binding to a policy *
        # Changing a conditional role binding in a policy * Removing any role binding,
        # with or without a condition, from a policy that includes conditions **
        # Important:** If you use IAM Conditions, you must include the `etag` field
        # whenever you call `setIamPolicy`. If you omit this field, then IAM allows you
        # to overwrite a version `3` policy with a version `1` policy, and all of the
        # conditions in the version `3` policy are lost. If a policy does not include
        # any conditions, operations on that policy may specify any valid version or
        # leave the field unset. To learn which resources support conditions in their
        # IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/
        # conditions/resource-policies).
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_configs = args[:audit_configs] if args.key?(:audit_configs)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Contains details of the listing publisher.
      class Publisher
        include Google::Apis::Core::Hashable
      
        # Optional. Name of the listing publisher.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Email or URL of the listing publisher. Max Length: 1000 bytes.
        # Corresponds to the JSON property `primaryContact`
        # @return [String]
        attr_accessor :primary_contact
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @primary_contact = args[:primary_contact] if args.key?(:primary_contact)
        end
      end
      
      # Message for refreshing a subscription.
      class RefreshSubscriptionRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Message for response when you refresh a subscription.
      class RefreshSubscriptionResponse
        include Google::Apis::Core::Hashable
      
        # A subscription represents a subscribers' access to a particular set of
        # published data. It contains references to associated listings, data exchanges,
        # and linked datasets. TODO(b/267528977) Consider port the new resource to
        # v1beta1 and dataexchange APIs.
        # Corresponds to the JSON property `subscription`
        # @return [Google::Apis::AnalyticshubV1::Subscription]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Restricted export config, used to configure restricted export on linked
      # dataset.
      class RestrictedExportConfig
        include Google::Apis::Core::Hashable
      
        # Optional. If true, enable restricted export.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Output only. If true, restrict direct table access(read api/tabledata.list) on
        # linked table.
        # Corresponds to the JSON property `restrictDirectTableAccess`
        # @return [Boolean]
        attr_accessor :restrict_direct_table_access
        alias_method :restrict_direct_table_access?, :restrict_direct_table_access
      
        # Optional. If true, restrict export of query result derived from restricted
        # linked dataset table.
        # Corresponds to the JSON property `restrictQueryResult`
        # @return [Boolean]
        attr_accessor :restrict_query_result
        alias_method :restrict_query_result?, :restrict_query_result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
          @restrict_direct_table_access = args[:restrict_direct_table_access] if args.key?(:restrict_direct_table_access)
          @restrict_query_result = args[:restrict_query_result] if args.key?(:restrict_query_result)
        end
      end
      
      # Message for revoking a subscription.
      class RevokeSubscriptionRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Message for response when you revoke a subscription.
      class RevokeSubscriptionResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # An Identity and Access Management (IAM) policy, which specifies access
        # controls for Google Cloud resources. A `Policy` is a collection of `bindings`.
        # A `binding` binds one or more `members`, or principals, to a single `role`.
        # Principals can be user accounts, service accounts, Google groups, and domains (
        # such as G Suite). A `role` is a named list of permissions; each `role` can be
        # an IAM predefined role or a user-created custom role. For some types of Google
        # Cloud resources, a `binding` can also specify a `condition`, which is a
        # logical expression that allows access to a resource only if the expression
        # evaluates to `true`. A condition can add constraints based on attributes of
        # the request, the resource, or both. To learn which resources support
        # conditions in their IAM policies, see the [IAM documentation](https://cloud.
        # google.com/iam/help/conditions/resource-policies). **JSON example:** ``` ` "
        # bindings": [ ` "role": "roles/resourcemanager.organizationAdmin", "members": [
        # "user:mike@example.com", "group:admins@example.com", "domain:google.com", "
        # serviceAccount:my-project-id@appspot.gserviceaccount.com" ] `, ` "role": "
        # roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com"
        # ], "condition": ` "title": "expirable access", "description": "Does not grant
        # access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:
        # 00:00.000Z')", ` ` ], "etag": "BwWWja0YfJA=", "version": 3 ` ``` **YAML
        # example:** ``` bindings: - members: - user:mike@example.com - group:admins@
        # example.com - domain:google.com - serviceAccount:my-project-id@appspot.
        # gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: -
        # user:eve@example.com role: roles/resourcemanager.organizationViewer condition:
        # title: expirable access description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z') etag:
        # BwWWja0YfJA= version: 3 ``` For a description of IAM and its features, see the
        # [IAM documentation](https://cloud.google.com/iam/docs/).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::AnalyticshubV1::Policy]
        attr_accessor :policy
      
        # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only
        # the fields in the mask will be modified. If no mask is provided, the following
        # default mask is used: `paths: "bindings, etag"`
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Sharing environment is a behavior model for sharing data within a data
      # exchange. This option is configurable for a data exchange.
      class SharingEnvironmentConfig
        include Google::Apis::Core::Hashable
      
        # Data Clean Room (DCR), used for privacy-safe and secured data sharing.
        # Corresponds to the JSON property `dcrExchangeConfig`
        # @return [Google::Apis::AnalyticshubV1::DcrExchangeConfig]
        attr_accessor :dcr_exchange_config
      
        # Default Analytics Hub data exchange, used for secured data sharing.
        # Corresponds to the JSON property `defaultExchangeConfig`
        # @return [Google::Apis::AnalyticshubV1::DefaultExchangeConfig]
        attr_accessor :default_exchange_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dcr_exchange_config = args[:dcr_exchange_config] if args.key?(:dcr_exchange_config)
          @default_exchange_config = args[:default_exchange_config] if args.key?(:default_exchange_config)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by [
      # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
      # data: error code, error message, and error details. You can find out more
      # about this error model and how to work with it in the [API Design Guide](https:
      # //cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details. There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Message for subscribing to a Data Exchange.
      class SubscribeDataExchangeRequest
        include Google::Apis::Core::Hashable
      
        # Required. The parent resource path of the Subscription. e.g. `projects/
        # subscriberproject/locations/US`
        # Corresponds to the JSON property `destination`
        # @return [String]
        attr_accessor :destination
      
        # Email of the subscriber.
        # Corresponds to the JSON property `subscriberContact`
        # @return [String]
        attr_accessor :subscriber_contact
      
        # Required. Name of the subscription to create. e.g. `subscription1`
        # Corresponds to the JSON property `subscription`
        # @return [String]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination = args[:destination] if args.key?(:destination)
          @subscriber_contact = args[:subscriber_contact] if args.key?(:subscriber_contact)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Message for response when you subscribe to a Data Exchange.
      class SubscribeDataExchangeResponse
        include Google::Apis::Core::Hashable
      
        # A subscription represents a subscribers' access to a particular set of
        # published data. It contains references to associated listings, data exchanges,
        # and linked datasets. TODO(b/267528977) Consider port the new resource to
        # v1beta1 and dataexchange APIs.
        # Corresponds to the JSON property `subscription`
        # @return [Google::Apis::AnalyticshubV1::Subscription]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # Message for subscribing to a listing.
      class SubscribeListingRequest
        include Google::Apis::Core::Hashable
      
        # Defines the destination bigquery dataset.
        # Corresponds to the JSON property `destinationDataset`
        # @return [Google::Apis::AnalyticshubV1::DestinationDataset]
        attr_accessor :destination_dataset
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination_dataset = args[:destination_dataset] if args.key?(:destination_dataset)
        end
      end
      
      # Message for response when you subscribe to a listing.
      class SubscribeListingResponse
        include Google::Apis::Core::Hashable
      
        # A subscription represents a subscribers' access to a particular set of
        # published data. It contains references to associated listings, data exchanges,
        # and linked datasets. TODO(b/267528977) Consider port the new resource to
        # v1beta1 and dataexchange APIs.
        # Corresponds to the JSON property `subscription`
        # @return [Google::Apis::AnalyticshubV1::Subscription]
        attr_accessor :subscription
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subscription = args[:subscription] if args.key?(:subscription)
        end
      end
      
      # A subscription represents a subscribers' access to a particular set of
      # published data. It contains references to associated listings, data exchanges,
      # and linked datasets. TODO(b/267528977) Consider port the new resource to
      # v1beta1 and dataexchange APIs.
      class Subscription
        include Google::Apis::Core::Hashable
      
        # Output only. Timestamp when the subscription was created.
        # Corresponds to the JSON property `creationTime`
        # @return [String]
        attr_accessor :creation_time
      
        # Output only. Resource name of the source Data Exchange. e.g. projects/123/
        # locations/US/dataExchanges/456
        # Corresponds to the JSON property `dataExchange`
        # @return [String]
        attr_accessor :data_exchange
      
        # Output only. Timestamp when the subscription was last modified.
        # Corresponds to the JSON property `lastModifyTime`
        # @return [String]
        attr_accessor :last_modify_time
      
        # Output only. Map of listing resource names to associated linked resource, e.g.
        # projects/123/locations/US/dataExchanges/456/listings/789 -> projects/123/
        # datasets/my_dataset For listing-level subscriptions, this is a map of size 1.
        # Only contains values if state == STATE_ACTIVE.
        # Corresponds to the JSON property `linkedDatasetMap`
        # @return [Hash<String,Google::Apis::AnalyticshubV1::LinkedResource>]
        attr_accessor :linked_dataset_map
      
        # Output only. Resource name of the source Listing. e.g. projects/123/locations/
        # US/dataExchanges/456/listings/789
        # Corresponds to the JSON property `listing`
        # @return [String]
        attr_accessor :listing
      
        # Output only. The resource name of the subscription. e.g. `projects/myproject/
        # locations/US/subscriptions/123`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Display name of the project of this subscription.
        # Corresponds to the JSON property `organizationDisplayName`
        # @return [String]
        attr_accessor :organization_display_name
      
        # Output only. Organization of the project this subscription belongs to.
        # Corresponds to the JSON property `organizationId`
        # @return [String]
        attr_accessor :organization_id
      
        # Output only. Current state of the subscription.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. Email of the subscriber.
        # Corresponds to the JSON property `subscriberContact`
        # @return [String]
        attr_accessor :subscriber_contact
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @data_exchange = args[:data_exchange] if args.key?(:data_exchange)
          @last_modify_time = args[:last_modify_time] if args.key?(:last_modify_time)
          @linked_dataset_map = args[:linked_dataset_map] if args.key?(:linked_dataset_map)
          @listing = args[:listing] if args.key?(:listing)
          @name = args[:name] if args.key?(:name)
          @organization_display_name = args[:organization_display_name] if args.key?(:organization_display_name)
          @organization_id = args[:organization_id] if args.key?(:organization_id)
          @state = args[:state] if args.key?(:state)
          @subscriber_contact = args[:subscriber_contact] if args.key?(:subscriber_contact)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with wildcards
        # (such as `*` or `storage.*`) are not allowed. For more information see [IAM
        # Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
    end
  end
end
