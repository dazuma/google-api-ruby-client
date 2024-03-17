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
    module MemcacheV1
      
      # Request for ApplyParameters.
      class ApplyParametersRequest
        include Google::Apis::Core::Hashable
      
        # Whether to apply instance-level parameter group to all nodes. If set to true,
        # users are restricted from specifying individual nodes, and `ApplyParameters`
        # updates all nodes within the instance.
        # Corresponds to the JSON property `applyAll`
        # @return [Boolean]
        attr_accessor :apply_all
        alias_method :apply_all?, :apply_all
      
        # Nodes to which the instance-level parameter group is applied.
        # Corresponds to the JSON property `nodeIds`
        # @return [Array<String>]
        attr_accessor :node_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apply_all = args[:apply_all] if args.key?(:apply_all)
          @node_ids = args[:node_ids] if args.key?(:node_ids)
        end
      end
      
      # The request message for Operations.CancelOperation.
      class CancelOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Time window specified for daily operations.
      class DailyCycle
        include Google::Apis::Core::Hashable
      
        # Output only. Duration of the time window, set by service producer.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Represents a time of day. The date and time zone are either not significant or
        # are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startTime`
        # @return [Google::Apis::MemcacheV1::TimeOfDay]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration = args[:duration] if args.key?(:duration)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Represents a whole or partial calendar date, such as a birthday. The time of
      # day and time zone are either specified elsewhere or are insignificant. The
      # date is relative to the Gregorian Calendar. This can represent one of the
      # following: * A full date, with non-zero year, month, and day values. * A month
      # and day, with a zero year (for example, an anniversary). * A year on its own,
      # with a zero month and a zero day. * A year and month, with a zero day (for
      # example, a credit card expiration date). Related types: * google.type.
      # TimeOfDay * google.type.DateTime * google.protobuf.Timestamp
      class Date
        include Google::Apis::Core::Hashable
      
        # Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to
        # specify a year by itself or a year and month where the day isn't significant.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of a year. Must be from 1 to 12, or 0 to specify a year without a month
        # and day.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of the date. Must be from 1 to 9999, or 0 to specify a date without a
        # year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # DenyMaintenancePeriod definition. Maintenance is forbidden within the deny
      # period. The start_date must be less than the end_date.
      class DenyMaintenancePeriod
        include Google::Apis::Core::Hashable
      
        # Represents a whole or partial calendar date, such as a birthday. The time of
        # day and time zone are either specified elsewhere or are insignificant. The
        # date is relative to the Gregorian Calendar. This can represent one of the
        # following: * A full date, with non-zero year, month, and day values. * A month
        # and day, with a zero year (for example, an anniversary). * A year on its own,
        # with a zero month and a zero day. * A year and month, with a zero day (for
        # example, a credit card expiration date). Related types: * google.type.
        # TimeOfDay * google.type.DateTime * google.protobuf.Timestamp
        # Corresponds to the JSON property `endDate`
        # @return [Google::Apis::MemcacheV1::Date]
        attr_accessor :end_date
      
        # Represents a whole or partial calendar date, such as a birthday. The time of
        # day and time zone are either specified elsewhere or are insignificant. The
        # date is relative to the Gregorian Calendar. This can represent one of the
        # following: * A full date, with non-zero year, month, and day values. * A month
        # and day, with a zero year (for example, an anniversary). * A year on its own,
        # with a zero month and a zero day. * A year and month, with a zero day (for
        # example, a credit card expiration date). Related types: * google.type.
        # TimeOfDay * google.type.DateTime * google.protobuf.Timestamp
        # Corresponds to the JSON property `startDate`
        # @return [Google::Apis::MemcacheV1::Date]
        attr_accessor :start_date
      
        # Represents a time of day. The date and time zone are either not significant or
        # are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `time`
        # @return [Google::Apis::MemcacheV1::TimeOfDay]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @start_date = args[:start_date] if args.key?(:start_date)
          @time = args[:time] if args.key?(:time)
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
      
      # Metadata for the given google.cloud.location.Location.
      class GoogleCloudMemcacheV1LocationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The set of available zones in the location. The map is keyed by
        # the lowercase ID of each zone, as defined by GCE. These keys can be specified
        # in the `zones` field when creating a Memcached instance.
        # Corresponds to the JSON property `availableZones`
        # @return [Hash<String,Google::Apis::MemcacheV1::GoogleCloudMemcacheV1ZoneMetadata>]
        attr_accessor :available_zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_zones = args[:available_zones] if args.key?(:available_zones)
        end
      end
      
      # Maintenance policy per instance.
      class GoogleCloudMemcacheV1MaintenancePolicy
        include Google::Apis::Core::Hashable
      
        # Output only. The time when the policy was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Description of what this policy is for. Create/Update methods return
        # INVALID_ARGUMENT if the length is greater than 512.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. The time when the policy was updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Required. Maintenance window that is applied to resources covered by this
        # policy. Minimum 1. For the current version, the maximum number of
        # weekly_maintenance_windows is expected to be one.
        # Corresponds to the JSON property `weeklyMaintenanceWindow`
        # @return [Array<Google::Apis::MemcacheV1::WeeklyMaintenanceWindow>]
        attr_accessor :weekly_maintenance_window
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @update_time = args[:update_time] if args.key?(:update_time)
          @weekly_maintenance_window = args[:weekly_maintenance_window] if args.key?(:weekly_maintenance_window)
        end
      end
      
      # Represents the metadata of a long-running operation.
      class GoogleCloudMemcacheV1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. API version used to start the operation.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # Output only. Identifies whether the user has requested cancellation of the
        # operation. Operations that have successfully been cancelled have Operation.
        # error value with a google.rpc.Status.code of 1, corresponding to `Code.
        # CANCELLED`.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # Output only. Time when the operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Time when the operation finished running.
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
      
      # Request for UpgradeInstance.
      class GoogleCloudMemcacheV1UpgradeInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Required. Specifies the target version of memcached engine to upgrade to.
        # Corresponds to the JSON property `memcacheVersion`
        # @return [String]
        attr_accessor :memcache_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @memcache_version = args[:memcache_version] if args.key?(:memcache_version)
        end
      end
      
      # 
      class GoogleCloudMemcacheV1ZoneMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Instance represents the interface for SLM services to actuate the state of
      # control plane resources. Example Instance in JSON, where consumer-project-
      # number=123456, producer-project-id=cloud-sql: ```json Instance: ` "name": "
      # projects/123456/locations/us-east1/instances/prod-instance", "create_time": ` "
      # seconds": 1526406431, `, "labels": ` "env": "prod", "foo": "bar" `, "state":
      # READY, "software_versions": ` "software_update": "cloud-sql-09-28-2018", `, "
      # maintenance_policy_names": ` "UpdatePolicy": "projects/123456/locations/us-
      # east1/maintenancePolicies/prod-update-policy", ` "tenant_project_id": "cloud-
      # sql-test-tenant", "producer_metadata": ` "cloud-sql-tier": "basic", "cloud-sql-
      # instance-size": "1G", `, "provisioned_resources": [ ` "resource-type": "
      # compute-instance", "resource-url": "https://www.googleapis.com/compute/v1/
      # projects/cloud-sql/zones/us-east1-b/instances/vm-1", ` ], "
      # maintenance_schedules": ` "csa_rollout": ` "start_time": ` "seconds":
      # 1526406431, `, "end_time": ` "seconds": 1535406431, `, `, "ncsa_rollout": ` "
      # start_time": ` "seconds": 1526406431, `, "end_time": ` "seconds": 1535406431, `
      # , ` `, "consumer_defined_name": "my-sql-instance1", ` ``` LINT.IfChange
      class GoogleCloudSaasacceleratorManagementProvidersV1Instance
        include Google::Apis::Core::Hashable
      
        # consumer_defined_name is the name of the instance set by the service consumers.
        # Generally this is different from the `name` field which reperesents the
        # system-assigned id of the instance which the service consumers do not
        # recognize. This is a required field for tenants onboarding to Maintenance
        # Window notifications (go/slm-rollout-maintenance-policies#prerequisites).
        # Corresponds to the JSON property `consumerDefinedName`
        # @return [String]
        attr_accessor :consumer_defined_name
      
        # Output only. Timestamp when the resource was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. The instance_type of this instance of format: projects/`
        # project_number`/locations/`location_id`/instanceTypes/`instance_type_id`.
        # Instance Type represents a high-level tier or SKU of the service that this
        # instance belong to. When enabled(eg: Maintenance Rollout), Rollout uses '
        # instance_type' along with 'software_versions' to determine whether instance
        # needs an update or not.
        # Corresponds to the JSON property `instanceType`
        # @return [String]
        attr_accessor :instance_type
      
        # Optional. Resource labels to represent user provided metadata. Each label is a
        # key-value pair, where both the key and the value are arbitrary strings
        # provided by the user.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Optional. The MaintenancePolicies that have been attached to the instance. The
        # key must be of the type name of the oneof policy name defined in
        # MaintenancePolicy, and the referenced policy must define the same policy type.
        # For details, please refer to go/mr-user-guide. Should not be set if
        # maintenance_settings.maintenance_policies is set.
        # Corresponds to the JSON property `maintenancePolicyNames`
        # @return [Hash<String,String>]
        attr_accessor :maintenance_policy_names
      
        # The MaintenanceSchedule contains the scheduling information of published
        # maintenance schedule with same key as software_versions.
        # Corresponds to the JSON property `maintenanceSchedules`
        # @return [Hash<String,Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSchedule>]
        attr_accessor :maintenance_schedules
      
        # Maintenance settings associated with instance. Allows service producers and
        # end users to assign settings that controls maintenance on this instance.
        # Corresponds to the JSON property `maintenanceSettings`
        # @return [Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSettings]
        attr_accessor :maintenance_settings
      
        # Unique name of the resource. It uses the form: `projects/`project_number`/
        # locations/`location_id`/instances/`instance_id`` Note: This name is passed,
        # stored and logged across the rollout system. So use of consumer project_id or
        # any other consumer PII in the name is strongly discouraged for wipeout (go/
        # wipeout) compliance. See go/elysium/project_ids#storage-guidance for more
        # details.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. notification_parameter are information that service producers may
        # like to include that is not relevant to Rollout. This parameter will only be
        # passed to Gamma and Cloud Logging for notification/logging purpose.
        # Corresponds to the JSON property `notificationParameters`
        # @return [Hash<String,Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1NotificationParameter>]
        attr_accessor :notification_parameters
      
        # Output only. Custom string attributes used primarily to expose producer-
        # specific information in monitoring dashboards. See go/get-instance-metadata.
        # Corresponds to the JSON property `producerMetadata`
        # @return [Hash<String,String>]
        attr_accessor :producer_metadata
      
        # Output only. The list of data plane resources provisioned for this instance, e.
        # g. compute VMs. See go/get-instance-metadata.
        # Corresponds to the JSON property `provisionedResources`
        # @return [Array<Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1ProvisionedResource>]
        attr_accessor :provisioned_resources
      
        # Link to the SLM instance template. Only populated when updating SLM instances
        # via SSA's Actuation service adaptor. Service producers with custom control
        # plane (e.g. Cloud SQL) doesn't need to populate this field. Instead they
        # should use software_versions.
        # Corresponds to the JSON property `slmInstanceTemplate`
        # @return [String]
        attr_accessor :slm_instance_template
      
        # SloMetadata contains resources required for proper SLO classification of the
        # instance.
        # Corresponds to the JSON property `sloMetadata`
        # @return [Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1SloMetadata]
        attr_accessor :slo_metadata
      
        # Software versions that are used to deploy this instance. This can be mutated
        # by rollout services.
        # Corresponds to the JSON property `softwareVersions`
        # @return [Hash<String,String>]
        attr_accessor :software_versions
      
        # Output only. Current lifecycle state of the resource (e.g. if it's being
        # created or ready to use).
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. ID of the associated GCP tenant project. See go/get-instance-
        # metadata.
        # Corresponds to the JSON property `tenantProjectId`
        # @return [String]
        attr_accessor :tenant_project_id
      
        # Output only. Timestamp when the resource was last modified.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_defined_name = args[:consumer_defined_name] if args.key?(:consumer_defined_name)
          @create_time = args[:create_time] if args.key?(:create_time)
          @instance_type = args[:instance_type] if args.key?(:instance_type)
          @labels = args[:labels] if args.key?(:labels)
          @maintenance_policy_names = args[:maintenance_policy_names] if args.key?(:maintenance_policy_names)
          @maintenance_schedules = args[:maintenance_schedules] if args.key?(:maintenance_schedules)
          @maintenance_settings = args[:maintenance_settings] if args.key?(:maintenance_settings)
          @name = args[:name] if args.key?(:name)
          @notification_parameters = args[:notification_parameters] if args.key?(:notification_parameters)
          @producer_metadata = args[:producer_metadata] if args.key?(:producer_metadata)
          @provisioned_resources = args[:provisioned_resources] if args.key?(:provisioned_resources)
          @slm_instance_template = args[:slm_instance_template] if args.key?(:slm_instance_template)
          @slo_metadata = args[:slo_metadata] if args.key?(:slo_metadata)
          @software_versions = args[:software_versions] if args.key?(:software_versions)
          @state = args[:state] if args.key?(:state)
          @tenant_project_id = args[:tenant_project_id] if args.key?(:tenant_project_id)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Maintenance schedule which is exposed to customer and potentially end user,
      # indicating published upcoming future maintenance schedule
      class GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSchedule
        include Google::Apis::Core::Hashable
      
        # This field is deprecated, and will be always set to true since reschedule can
        # happen multiple times now. This field should not be removed until all service
        # producers remove this for their customers.
        # Corresponds to the JSON property `canReschedule`
        # @return [Boolean]
        attr_accessor :can_reschedule
        alias_method :can_reschedule?, :can_reschedule
      
        # The scheduled end time for the maintenance.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The rollout management policy this maintenance schedule is associated with.
        # When doing reschedule update request, the reschedule should be against this
        # given policy.
        # Corresponds to the JSON property `rolloutManagementPolicy`
        # @return [String]
        attr_accessor :rollout_management_policy
      
        # schedule_deadline_time is the time deadline any schedule start time cannot go
        # beyond, including reschedule. It's normally the initial schedule start time
        # plus maintenance window length (1 day or 1 week). Maintenance cannot be
        # scheduled to start beyond this deadline.
        # Corresponds to the JSON property `scheduleDeadlineTime`
        # @return [String]
        attr_accessor :schedule_deadline_time
      
        # The scheduled start time for the maintenance.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @can_reschedule = args[:can_reschedule] if args.key?(:can_reschedule)
          @end_time = args[:end_time] if args.key?(:end_time)
          @rollout_management_policy = args[:rollout_management_policy] if args.key?(:rollout_management_policy)
          @schedule_deadline_time = args[:schedule_deadline_time] if args.key?(:schedule_deadline_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Maintenance settings associated with instance. Allows service producers and
      # end users to assign settings that controls maintenance on this instance.
      class GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSettings
        include Google::Apis::Core::Hashable
      
        # Optional. Exclude instance from maintenance. When true, rollout service will
        # not attempt maintenance on the instance. Rollout service will include the
        # instance in reported rollout progress as not attempted.
        # Corresponds to the JSON property `exclude`
        # @return [Boolean]
        attr_accessor :exclude
        alias_method :exclude?, :exclude
      
        # Optional. If the update call is triggered from rollback, set the value as true.
        # Corresponds to the JSON property `isRollback`
        # @return [Boolean]
        attr_accessor :is_rollback
        alias_method :is_rollback?, :is_rollback
      
        # Optional. The MaintenancePolicies that have been attached to the instance. The
        # key must be of the type name of the oneof policy name defined in
        # MaintenancePolicy, and the embedded policy must define the same policy type.
        # For details, please refer to go/mr-user-guide. Should not be set if
        # maintenance_policy_names is set. If only the name is needed, then only
        # populate MaintenancePolicy.name.
        # Corresponds to the JSON property `maintenancePolicies`
        # @return [Hash<String,Google::Apis::MemcacheV1::MaintenancePolicy>]
        attr_accessor :maintenance_policies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclude = args[:exclude] if args.key?(:exclude)
          @is_rollback = args[:is_rollback] if args.key?(:is_rollback)
          @maintenance_policies = args[:maintenance_policies] if args.key?(:maintenance_policies)
        end
      end
      
      # Node information for custom per-node SLO implementations. SSA does not support
      # per-node SLO, but producers can populate per-node information in SloMetadata
      # for custom precomputations. SSA Eligibility Exporter will emit per-node metric
      # based on this information.
      class GoogleCloudSaasacceleratorManagementProvidersV1NodeSloMetadata
        include Google::Apis::Core::Hashable
      
        # The location of the node, if different from instance location.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The id of the node. This should be equal to SaasInstanceNode.node_id.
        # Corresponds to the JSON property `nodeId`
        # @return [String]
        attr_accessor :node_id
      
        # PerSliSloEligibility is a mapping from an SLI name to eligibility.
        # Corresponds to the JSON property `perSliEligibility`
        # @return [Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1PerSliSloEligibility]
        attr_accessor :per_sli_eligibility
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @node_id = args[:node_id] if args.key?(:node_id)
          @per_sli_eligibility = args[:per_sli_eligibility] if args.key?(:per_sli_eligibility)
        end
      end
      
      # Contains notification related data.
      class GoogleCloudSaasacceleratorManagementProvidersV1NotificationParameter
        include Google::Apis::Core::Hashable
      
        # Optional. Array of string values. e.g. instance's replica information.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # PerSliSloEligibility is a mapping from an SLI name to eligibility.
      class GoogleCloudSaasacceleratorManagementProvidersV1PerSliSloEligibility
        include Google::Apis::Core::Hashable
      
        # An entry in the eligibilities map specifies an eligibility for a particular
        # SLI for the given instance. The SLI key in the name must be a valid SLI name
        # specified in the Eligibility Exporter binary flags otherwise an error will be
        # emitted by Eligibility Exporter and the oncaller will be alerted. If an SLI
        # has been defined in the binary flags but the eligibilities map does not
        # contain it, the corresponding SLI time series will not be emitted by the
        # Eligibility Exporter. This ensures a smooth rollout and compatibility between
        # the data produced by different versions of the Eligibility Exporters. If
        # eligibilities map contains a key for an SLI which has not been declared in the
        # binary flags, there will be an error message emitted in the Eligibility
        # Exporter log and the metric for the SLI in question will not be emitted.
        # Corresponds to the JSON property `eligibilities`
        # @return [Hash<String,Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1SloEligibility>]
        attr_accessor :eligibilities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @eligibilities = args[:eligibilities] if args.key?(:eligibilities)
        end
      end
      
      # Describes provisioned dataplane resources.
      class GoogleCloudSaasacceleratorManagementProvidersV1ProvisionedResource
        include Google::Apis::Core::Hashable
      
        # Type of the resource. This can be either a GCP resource or a custom one (e.g.
        # another cloud provider's VM). For GCP compute resources use singular form of
        # the names listed in GCP compute API documentation (https://cloud.google.com/
        # compute/docs/reference/rest/v1/), prefixed with 'compute-', for example: '
        # compute-instance', 'compute-disk', 'compute-autoscaler'.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        # URL identifying the resource, e.g. "https://www.googleapis.com/compute/v1/
        # projects/...)".
        # Corresponds to the JSON property `resourceUrl`
        # @return [String]
        attr_accessor :resource_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
          @resource_url = args[:resource_url] if args.key?(:resource_url)
        end
      end
      
      # SloEligibility is a tuple containing eligibility value: true if an instance is
      # eligible for SLO calculation or false if it should be excluded from all SLO-
      # related calculations along with a user-defined reason.
      class GoogleCloudSaasacceleratorManagementProvidersV1SloEligibility
        include Google::Apis::Core::Hashable
      
        # Whether an instance is eligible or ineligible.
        # Corresponds to the JSON property `eligible`
        # @return [Boolean]
        attr_accessor :eligible
        alias_method :eligible?, :eligible
      
        # User-defined reason for the current value of instance eligibility. Usually,
        # this can be directly mapped to the internal state. An empty reason is allowed.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @eligible = args[:eligible] if args.key?(:eligible)
          @reason = args[:reason] if args.key?(:reason)
        end
      end
      
      # SloMetadata contains resources required for proper SLO classification of the
      # instance.
      class GoogleCloudSaasacceleratorManagementProvidersV1SloMetadata
        include Google::Apis::Core::Hashable
      
        # Optional. List of nodes. Some producers need to use per-node metadata to
        # calculate SLO. This field allows such producers to publish per-node SLO meta
        # data, which will be consumed by SSA Eligibility Exporter and published in the
        # form of per node metric to Monarch.
        # Corresponds to the JSON property `nodes`
        # @return [Array<Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1NodeSloMetadata>]
        attr_accessor :nodes
      
        # PerSliSloEligibility is a mapping from an SLI name to eligibility.
        # Corresponds to the JSON property `perSliEligibility`
        # @return [Google::Apis::MemcacheV1::GoogleCloudSaasacceleratorManagementProvidersV1PerSliSloEligibility]
        attr_accessor :per_sli_eligibility
      
        # Name of the SLO tier the Instance belongs to. This name will be expected to
        # match the tiers specified in the service SLO configuration. Field is mandatory
        # and must not be empty.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nodes = args[:nodes] if args.key?(:nodes)
          @per_sli_eligibility = args[:per_sli_eligibility] if args.key?(:per_sli_eligibility)
          @tier = args[:tier] if args.key?(:tier)
        end
      end
      
      # A Memorystore for Memcached instance
      class Instance
        include Google::Apis::Core::Hashable
      
        # The full name of the Google Compute Engine [network](/compute/docs/networks-
        # and-firewalls#networks) to which the instance is connected. If left
        # unspecified, the `default` network will be used.
        # Corresponds to the JSON property `authorizedNetwork`
        # @return [String]
        attr_accessor :authorized_network
      
        # Output only. The time the instance was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Endpoint for the Discovery API.
        # Corresponds to the JSON property `discoveryEndpoint`
        # @return [String]
        attr_accessor :discovery_endpoint
      
        # User provided name for the instance, which is only used for display purposes.
        # Cannot be more than 80 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # List of messages that describe the current state of the Memcached instance.
        # Corresponds to the JSON property `instanceMessages`
        # @return [Array<Google::Apis::MemcacheV1::InstanceMessage>]
        attr_accessor :instance_messages
      
        # Resource labels to represent user-provided metadata. Refer to cloud
        # documentation on labels for more details. https://cloud.google.com/compute/
        # docs/labeling-resources
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Maintenance policy per instance.
        # Corresponds to the JSON property `maintenancePolicy`
        # @return [Google::Apis::MemcacheV1::GoogleCloudMemcacheV1MaintenancePolicy]
        attr_accessor :maintenance_policy
      
        # Upcoming maintenance schedule.
        # Corresponds to the JSON property `maintenanceSchedule`
        # @return [Google::Apis::MemcacheV1::MaintenanceSchedule]
        attr_accessor :maintenance_schedule
      
        # Output only. The full version of memcached server running on this instance.
        # System automatically determines the full memcached version for an instance
        # based on the input MemcacheVersion. The full version format will be "memcached-
        # 1.5.16".
        # Corresponds to the JSON property `memcacheFullVersion`
        # @return [String]
        attr_accessor :memcache_full_version
      
        # Output only. List of Memcached nodes. Refer to Node message for more details.
        # Corresponds to the JSON property `memcacheNodes`
        # @return [Array<Google::Apis::MemcacheV1::Node>]
        attr_accessor :memcache_nodes
      
        # The major version of Memcached software. If not provided, latest supported
        # version will be used. Currently the latest supported major version is `
        # MEMCACHE_1_5`. The minor version will be automatically determined by our
        # system based on the latest supported minor version.
        # Corresponds to the JSON property `memcacheVersion`
        # @return [String]
        attr_accessor :memcache_version
      
        # Required. Unique name of the resource in this scope including project and
        # location using the form: `projects/`project_id`/locations/`location_id`/
        # instances/`instance_id`` Note: Memcached instances are managed and addressed
        # at the regional level so `location_id` here refers to a Google Cloud region;
        # however, users may choose which zones Memcached nodes should be provisioned in
        # within an instance. Refer to zones field for more details.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration for a Memcached Node.
        # Corresponds to the JSON property `nodeConfig`
        # @return [Google::Apis::MemcacheV1::NodeConfig]
        attr_accessor :node_config
      
        # Required. Number of nodes in the Memcached instance.
        # Corresponds to the JSON property `nodeCount`
        # @return [Fixnum]
        attr_accessor :node_count
      
        # User defined parameters to apply to the memcached process on each node.
        # Corresponds to the JSON property `parameters`
        # @return [Google::Apis::MemcacheV1::MemcacheParameters]
        attr_accessor :parameters
      
        # Optional. Contains the id of allocated IP address ranges associated with the
        # private service access connection for example, "test-default" associated with
        # IP range 10.0.0.0/29.
        # Corresponds to the JSON property `reservedIpRangeId`
        # @return [Array<String>]
        attr_accessor :reserved_ip_range_id
      
        # Output only. The state of this Memcached instance.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The time the instance was updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Zones in which Memcached nodes should be provisioned. Memcached nodes will be
        # equally distributed across these zones. If not provided, the service will by
        # default create nodes in all zones in the region for the instance.
        # Corresponds to the JSON property `zones`
        # @return [Array<String>]
        attr_accessor :zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authorized_network = args[:authorized_network] if args.key?(:authorized_network)
          @create_time = args[:create_time] if args.key?(:create_time)
          @discovery_endpoint = args[:discovery_endpoint] if args.key?(:discovery_endpoint)
          @display_name = args[:display_name] if args.key?(:display_name)
          @instance_messages = args[:instance_messages] if args.key?(:instance_messages)
          @labels = args[:labels] if args.key?(:labels)
          @maintenance_policy = args[:maintenance_policy] if args.key?(:maintenance_policy)
          @maintenance_schedule = args[:maintenance_schedule] if args.key?(:maintenance_schedule)
          @memcache_full_version = args[:memcache_full_version] if args.key?(:memcache_full_version)
          @memcache_nodes = args[:memcache_nodes] if args.key?(:memcache_nodes)
          @memcache_version = args[:memcache_version] if args.key?(:memcache_version)
          @name = args[:name] if args.key?(:name)
          @node_config = args[:node_config] if args.key?(:node_config)
          @node_count = args[:node_count] if args.key?(:node_count)
          @parameters = args[:parameters] if args.key?(:parameters)
          @reserved_ip_range_id = args[:reserved_ip_range_id] if args.key?(:reserved_ip_range_id)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
          @zones = args[:zones] if args.key?(:zones)
        end
      end
      
      # 
      class InstanceMessage
        include Google::Apis::Core::Hashable
      
        # A code that correspond to one type of user-facing message.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Message on memcached instance which will be exposed to users.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Response for ListInstances.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # A list of Memcached instances in the project in the specified location, or
        # across all locations. If the `location_id` in the parent field of the request
        # is "-", all regions available to the project are queried, and the results
        # aggregated.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::MemcacheV1::Instance>]
        attr_accessor :instances
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Locations that could not be reached.
        # Corresponds to the JSON property `unreachable`
        # @return [Array<String>]
        attr_accessor :unreachable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::MemcacheV1::Location>]
        attr_accessor :locations
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::MemcacheV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # A resource that represents a Google Cloud location.
      class Location
        include Google::Apis::Core::Hashable
      
        # The friendly name for this location, typically a nearby city name. For example,
        # "Tokyo".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cross-service attributes for the location. For example `"cloud.googleapis.com/
        # region": "us-east1"`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The canonical id for this location. For example: `"us-east1"`.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Service-specific metadata. For example the available capacity at the given
        # location.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Resource name for the location, which may vary between implementations. For
        # example: `"projects/example-project/locations/us-east1"`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @location_id = args[:location_id] if args.key?(:location_id)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metadata for the given google.cloud.location.Location.
      class LocationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The set of available zones in the location. The map is keyed by
        # the lowercase ID of each zone, as defined by GCE. These keys can be specified
        # in the `zones` field when creating a Memcached instance.
        # Corresponds to the JSON property `availableZones`
        # @return [Hash<String,Google::Apis::MemcacheV1::ZoneMetadata>]
        attr_accessor :available_zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_zones = args[:available_zones] if args.key?(:available_zones)
        end
      end
      
      # Defines policies to service maintenance events.
      class MaintenancePolicy
        include Google::Apis::Core::Hashable
      
        # Output only. The time when the resource was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optional. Description of what this policy is for. Create/Update methods return
        # INVALID_ARGUMENT if the length is greater than 512.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. Resource labels to represent user provided metadata. Each label is a
        # key-value pair, where both the key and the value are arbitrary strings
        # provided by the user.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. MaintenancePolicy name using the form: `projects/`project_id`/
        # locations/`location_id`/maintenancePolicies/`maintenance_policy_id`` where `
        # project_id` refers to a GCP consumer project ID, `location_id` refers to a GCP
        # region/zone, `maintenance_policy_id` must be 1-63 characters long and match
        # the regular expression `[a-z0-9]([-a-z0-9]*[a-z0-9])?`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. The state of the policy.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Maintenance policy applicable to instance updates.
        # Corresponds to the JSON property `updatePolicy`
        # @return [Google::Apis::MemcacheV1::UpdatePolicy]
        attr_accessor :update_policy
      
        # Output only. The time when the resource was updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
          @update_policy = args[:update_policy] if args.key?(:update_policy)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Upcoming maintenance schedule.
      class MaintenanceSchedule
        include Google::Apis::Core::Hashable
      
        # Output only. The end time of any upcoming scheduled maintenance for this
        # instance.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. The deadline that the maintenance schedule start time can not go
        # beyond, including reschedule.
        # Corresponds to the JSON property `scheduleDeadlineTime`
        # @return [String]
        attr_accessor :schedule_deadline_time
      
        # Output only. The start time of any upcoming scheduled maintenance for this
        # instance.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @schedule_deadline_time = args[:schedule_deadline_time] if args.key?(:schedule_deadline_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # MaintenanceWindow definition.
      class MaintenanceWindow
        include Google::Apis::Core::Hashable
      
        # Time window specified for daily operations.
        # Corresponds to the JSON property `dailyCycle`
        # @return [Google::Apis::MemcacheV1::DailyCycle]
        attr_accessor :daily_cycle
      
        # Time window specified for weekly operations.
        # Corresponds to the JSON property `weeklyCycle`
        # @return [Google::Apis::MemcacheV1::WeeklyCycle]
        attr_accessor :weekly_cycle
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @daily_cycle = args[:daily_cycle] if args.key?(:daily_cycle)
          @weekly_cycle = args[:weekly_cycle] if args.key?(:weekly_cycle)
        end
      end
      
      # 
      class MemcacheParameters
        include Google::Apis::Core::Hashable
      
        # Output only. The unique ID associated with this set of parameters. Users can
        # use this id to determine if the parameters associated with the instance differ
        # from the parameters associated with the nodes. A discrepancy between parameter
        # ids can inform users that they may need to take action to apply parameters on
        # nodes.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # User defined set of parameters to use in the memcached process.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,String>]
        attr_accessor :params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @params = args[:params] if args.key?(:params)
        end
      end
      
      # 
      class Node
        include Google::Apis::Core::Hashable
      
        # Output only. Hostname or IP address of the Memcached node used by the clients
        # to connect to the Memcached server on this node.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # Output only. The full version of memcached server running on this node. e.g. -
        # memcached-1.5.16
        # Corresponds to the JSON property `memcacheFullVersion`
        # @return [String]
        attr_accessor :memcache_full_version
      
        # Output only. Major version of memcached server running on this node, e.g.
        # MEMCACHE_1_5
        # Corresponds to the JSON property `memcacheVersion`
        # @return [String]
        attr_accessor :memcache_version
      
        # Output only. Identifier of the Memcached node. The node id does not include
        # project or location like the Memcached instance name.
        # Corresponds to the JSON property `nodeId`
        # @return [String]
        attr_accessor :node_id
      
        # User defined parameters currently applied to the node.
        # Corresponds to the JSON property `parameters`
        # @return [Google::Apis::MemcacheV1::MemcacheParameters]
        attr_accessor :parameters
      
        # Output only. The port number of the Memcached server on this node.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        # Output only. Current state of the Memcached node.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. Location (GCP Zone) for the Memcached node.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host = args[:host] if args.key?(:host)
          @memcache_full_version = args[:memcache_full_version] if args.key?(:memcache_full_version)
          @memcache_version = args[:memcache_version] if args.key?(:memcache_version)
          @node_id = args[:node_id] if args.key?(:node_id)
          @parameters = args[:parameters] if args.key?(:parameters)
          @port = args[:port] if args.key?(:port)
          @state = args[:state] if args.key?(:state)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Configuration for a Memcached Node.
      class NodeConfig
        include Google::Apis::Core::Hashable
      
        # Required. Number of cpus per Memcached node.
        # Corresponds to the JSON property `cpuCount`
        # @return [Fixnum]
        attr_accessor :cpu_count
      
        # Required. Memory size in MiB for each Memcached node.
        # Corresponds to the JSON property `memorySizeMb`
        # @return [Fixnum]
        attr_accessor :memory_size_mb
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cpu_count = args[:cpu_count] if args.key?(:cpu_count)
          @memory_size_mb = args[:memory_size_mb] if args.key?(:memory_size_mb)
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
        # @return [Google::Apis::MemcacheV1::Status]
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
      
      # Represents the metadata of a long-running operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. API version used to start the operation.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # Output only. Identifies whether the user has requested cancellation of the
        # operation. Operations that have successfully been cancelled have Operation.
        # error value with a google.rpc.Status.code of 1, corresponding to `Code.
        # CANCELLED`.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # Output only. Time when the operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Time when the operation finished running.
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
      
      # Request for RescheduleMaintenance.
      class RescheduleMaintenanceRequest
        include Google::Apis::Core::Hashable
      
        # Required. If reschedule type is SPECIFIC_TIME, must set up schedule_time as
        # well.
        # Corresponds to the JSON property `rescheduleType`
        # @return [String]
        attr_accessor :reschedule_type
      
        # Timestamp when the maintenance shall be rescheduled to if reschedule_type=
        # SPECIFIC_TIME, in RFC 3339 format, for example `2012-11-15T16:19:00.094Z`.
        # Corresponds to the JSON property `scheduleTime`
        # @return [String]
        attr_accessor :schedule_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reschedule_type = args[:reschedule_type] if args.key?(:reschedule_type)
          @schedule_time = args[:schedule_time] if args.key?(:schedule_time)
        end
      end
      
      # Configure the schedule.
      class Schedule
        include Google::Apis::Core::Hashable
      
        # Allows to define schedule that runs specified day of the week.
        # Corresponds to the JSON property `day`
        # @return [String]
        attr_accessor :day
      
        # Output only. Duration of the time window, set by service producer.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Represents a time of day. The date and time zone are either not significant or
        # are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startTime`
        # @return [Google::Apis::MemcacheV1::TimeOfDay]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @duration = args[:duration] if args.key?(:duration)
          @start_time = args[:start_time] if args.key?(:start_time)
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
      
      # Represents a time of day. The date and time zone are either not significant or
      # are specified elsewhere. An API may choose to allow leap seconds. Related
      # types are google.type.Date and `google.protobuf.Timestamp`.
      class TimeOfDay
        include Google::Apis::Core::Hashable
      
        # Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to
        # allow the value "24:00:00" for scenarios like business closing time.
        # Corresponds to the JSON property `hours`
        # @return [Fixnum]
        attr_accessor :hours
      
        # Minutes of hour of day. Must be from 0 to 59.
        # Corresponds to the JSON property `minutes`
        # @return [Fixnum]
        attr_accessor :minutes
      
        # Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # Seconds of minutes of the time. Must normally be from 0 to 59. An API may
        # allow the value 60 if it allows leap-seconds.
        # Corresponds to the JSON property `seconds`
        # @return [Fixnum]
        attr_accessor :seconds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hours = args[:hours] if args.key?(:hours)
          @minutes = args[:minutes] if args.key?(:minutes)
          @nanos = args[:nanos] if args.key?(:nanos)
          @seconds = args[:seconds] if args.key?(:seconds)
        end
      end
      
      # Request for UpdateParameters.
      class UpdateParametersRequest
        include Google::Apis::Core::Hashable
      
        # The parameters to apply to the instance.
        # Corresponds to the JSON property `parameters`
        # @return [Google::Apis::MemcacheV1::MemcacheParameters]
        attr_accessor :parameters
      
        # Required. Mask of fields to update.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parameters = args[:parameters] if args.key?(:parameters)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Maintenance policy applicable to instance updates.
      class UpdatePolicy
        include Google::Apis::Core::Hashable
      
        # Optional. Relative scheduling channel applied to resource.
        # Corresponds to the JSON property `channel`
        # @return [String]
        attr_accessor :channel
      
        # Deny Maintenance Period that is applied to resource to indicate when
        # maintenance is forbidden. The protocol supports zero-to-many such periods, but
        # the current SLM Rollout implementation only supports zero-to-one.
        # Corresponds to the JSON property `denyMaintenancePeriods`
        # @return [Array<Google::Apis::MemcacheV1::DenyMaintenancePeriod>]
        attr_accessor :deny_maintenance_periods
      
        # MaintenanceWindow definition.
        # Corresponds to the JSON property `window`
        # @return [Google::Apis::MemcacheV1::MaintenanceWindow]
        attr_accessor :window
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @channel = args[:channel] if args.key?(:channel)
          @deny_maintenance_periods = args[:deny_maintenance_periods] if args.key?(:deny_maintenance_periods)
          @window = args[:window] if args.key?(:window)
        end
      end
      
      # Time window specified for weekly operations.
      class WeeklyCycle
        include Google::Apis::Core::Hashable
      
        # User can specify multiple windows in a week. Minimum of 1 window.
        # Corresponds to the JSON property `schedule`
        # @return [Array<Google::Apis::MemcacheV1::Schedule>]
        attr_accessor :schedule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @schedule = args[:schedule] if args.key?(:schedule)
        end
      end
      
      # Time window specified for weekly operations.
      class WeeklyMaintenanceWindow
        include Google::Apis::Core::Hashable
      
        # Required. Allows to define schedule that runs specified day of the week.
        # Corresponds to the JSON property `day`
        # @return [String]
        attr_accessor :day
      
        # Required. Duration of the time window.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Represents a time of day. The date and time zone are either not significant or
        # are specified elsewhere. An API may choose to allow leap seconds. Related
        # types are google.type.Date and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `startTime`
        # @return [Google::Apis::MemcacheV1::TimeOfDay]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @duration = args[:duration] if args.key?(:duration)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # 
      class ZoneMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
    end
  end
end
