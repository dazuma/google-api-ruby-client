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
    module DiscoveryengineV1
      
      # `Distribution` contains summary statistics for a population of values. It
      # optionally contains a histogram representing the distribution of those values
      # across a set of buckets. The summary statistics are the count, mean, sum of
      # the squared deviation from the mean, the minimum, and the maximum of the set
      # of population of values. The histogram is based on a sequence of buckets and
      # gives a count of values that fall into each bucket. The boundaries of the
      # buckets are given either explicitly or by formulas for buckets of fixed or
      # exponentially increasing widths. Although it is not forbidden, it is generally
      # a bad idea to include non-finite values (infinities or NaNs) in the population
      # of values, as this will render the `mean` and `sum_of_squared_deviation`
      # fields meaningless.
      class GoogleApiDistribution
        include Google::Apis::Core::Hashable
      
        # The number of values in each bucket of the histogram, as described in `
        # bucket_options`. If the distribution does not have a histogram, then omit this
        # field. If there is a histogram, then the sum of the values in `bucket_counts`
        # must equal the value in the `count` field of the distribution. If present, `
        # bucket_counts` should contain N values, where N is the number of buckets
        # specified in `bucket_options`. If you supply fewer than N values, the
        # remaining values are assumed to be 0. The order of the values in `
        # bucket_counts` follows the bucket numbering schemes described for the three
        # bucket types. The first value must be the count for the underflow bucket (
        # number 0). The next N-2 values are the counts for the finite buckets (number 1
        # through N-2). The N'th value in `bucket_counts` is the count for the overflow
        # bucket (number N-1).
        # Corresponds to the JSON property `bucketCounts`
        # @return [Array<Fixnum>]
        attr_accessor :bucket_counts
      
        # `BucketOptions` describes the bucket boundaries used to create a histogram for
        # the distribution. The buckets can be in a linear sequence, an exponential
        # sequence, or each bucket can be specified explicitly. `BucketOptions` does not
        # include the number of values in each bucket. A bucket has an inclusive lower
        # bound and exclusive upper bound for the values that are counted for that
        # bucket. The upper bound of a bucket must be strictly greater than the lower
        # bound. The sequence of N buckets for a distribution consists of an underflow
        # bucket (number 0), zero or more finite buckets (number 1 through N - 2) and an
        # overflow bucket (number N - 1). The buckets are contiguous: the lower bound of
        # bucket i (i > 0) is the same as the upper bound of bucket i - 1. The buckets
        # span the whole range of finite values: lower bound of the underflow bucket is -
        # infinity and the upper bound of the overflow bucket is +infinity. The finite
        # buckets are so-called because both bounds are finite.
        # Corresponds to the JSON property `bucketOptions`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiDistributionBucketOptions]
        attr_accessor :bucket_options
      
        # The number of values in the population. Must be non-negative. This value must
        # equal the sum of the values in `bucket_counts` if a histogram is provided.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Must be in increasing order of `value` field.
        # Corresponds to the JSON property `exemplars`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleApiDistributionExemplar>]
        attr_accessor :exemplars
      
        # The arithmetic mean of the values in the population. If `count` is zero then
        # this field must be zero.
        # Corresponds to the JSON property `mean`
        # @return [Float]
        attr_accessor :mean
      
        # The range of the population values.
        # Corresponds to the JSON property `range`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiDistributionRange]
        attr_accessor :range
      
        # The sum of squared deviations from the mean of the values in the population.
        # For values x_i this is: Sum[i=1..n]((x_i - mean)^2) Knuth, "The Art of
        # Computer Programming", Vol. 2, page 232, 3rd edition describes Welford's
        # method for accumulating this sum in one pass. If `count` is zero then this
        # field must be zero.
        # Corresponds to the JSON property `sumOfSquaredDeviation`
        # @return [Float]
        attr_accessor :sum_of_squared_deviation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket_counts = args[:bucket_counts] if args.key?(:bucket_counts)
          @bucket_options = args[:bucket_options] if args.key?(:bucket_options)
          @count = args[:count] if args.key?(:count)
          @exemplars = args[:exemplars] if args.key?(:exemplars)
          @mean = args[:mean] if args.key?(:mean)
          @range = args[:range] if args.key?(:range)
          @sum_of_squared_deviation = args[:sum_of_squared_deviation] if args.key?(:sum_of_squared_deviation)
        end
      end
      
      # `BucketOptions` describes the bucket boundaries used to create a histogram for
      # the distribution. The buckets can be in a linear sequence, an exponential
      # sequence, or each bucket can be specified explicitly. `BucketOptions` does not
      # include the number of values in each bucket. A bucket has an inclusive lower
      # bound and exclusive upper bound for the values that are counted for that
      # bucket. The upper bound of a bucket must be strictly greater than the lower
      # bound. The sequence of N buckets for a distribution consists of an underflow
      # bucket (number 0), zero or more finite buckets (number 1 through N - 2) and an
      # overflow bucket (number N - 1). The buckets are contiguous: the lower bound of
      # bucket i (i > 0) is the same as the upper bound of bucket i - 1. The buckets
      # span the whole range of finite values: lower bound of the underflow bucket is -
      # infinity and the upper bound of the overflow bucket is +infinity. The finite
      # buckets are so-called because both bounds are finite.
      class GoogleApiDistributionBucketOptions
        include Google::Apis::Core::Hashable
      
        # Specifies a set of buckets with arbitrary widths. There are `size(bounds) + 1`
        # (= N) buckets. Bucket `i` has the following boundaries: Upper bound (0 <= i <
        # N-1): bounds[i] Lower bound (1 <= i < N); bounds[i - 1] The `bounds` field
        # must contain at least one element. If `bounds` has only one element, then
        # there are no finite buckets, and that single element is the common boundary of
        # the overflow and underflow buckets.
        # Corresponds to the JSON property `explicitBuckets`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiDistributionBucketOptionsExplicit]
        attr_accessor :explicit_buckets
      
        # Specifies an exponential sequence of buckets that have a width that is
        # proportional to the value of the lower bound. Each bucket represents a
        # constant relative uncertainty on a specific value in the bucket. There are `
        # num_finite_buckets + 2` (= N) buckets. Bucket `i` has the following boundaries:
        # Upper bound (0 <= i < N-1): scale * (growth_factor ^ i). Lower bound (1 <= i <
        # N): scale * (growth_factor ^ (i - 1)).
        # Corresponds to the JSON property `exponentialBuckets`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiDistributionBucketOptionsExponential]
        attr_accessor :exponential_buckets
      
        # Specifies a linear sequence of buckets that all have the same width (except
        # overflow and underflow). Each bucket represents a constant absolute
        # uncertainty on the specific value in the bucket. There are `num_finite_buckets
        # + 2` (= N) buckets. Bucket `i` has the following boundaries: Upper bound (0 <=
        # i < N-1): offset + (width * i). Lower bound (1 <= i < N): offset + (width * (i
        # - 1)).
        # Corresponds to the JSON property `linearBuckets`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiDistributionBucketOptionsLinear]
        attr_accessor :linear_buckets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @explicit_buckets = args[:explicit_buckets] if args.key?(:explicit_buckets)
          @exponential_buckets = args[:exponential_buckets] if args.key?(:exponential_buckets)
          @linear_buckets = args[:linear_buckets] if args.key?(:linear_buckets)
        end
      end
      
      # Specifies a set of buckets with arbitrary widths. There are `size(bounds) + 1`
      # (= N) buckets. Bucket `i` has the following boundaries: Upper bound (0 <= i <
      # N-1): bounds[i] Lower bound (1 <= i < N); bounds[i - 1] The `bounds` field
      # must contain at least one element. If `bounds` has only one element, then
      # there are no finite buckets, and that single element is the common boundary of
      # the overflow and underflow buckets.
      class GoogleApiDistributionBucketOptionsExplicit
        include Google::Apis::Core::Hashable
      
        # The values must be monotonically increasing.
        # Corresponds to the JSON property `bounds`
        # @return [Array<Float>]
        attr_accessor :bounds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounds = args[:bounds] if args.key?(:bounds)
        end
      end
      
      # Specifies an exponential sequence of buckets that have a width that is
      # proportional to the value of the lower bound. Each bucket represents a
      # constant relative uncertainty on a specific value in the bucket. There are `
      # num_finite_buckets + 2` (= N) buckets. Bucket `i` has the following boundaries:
      # Upper bound (0 <= i < N-1): scale * (growth_factor ^ i). Lower bound (1 <= i <
      # N): scale * (growth_factor ^ (i - 1)).
      class GoogleApiDistributionBucketOptionsExponential
        include Google::Apis::Core::Hashable
      
        # Must be greater than 1.
        # Corresponds to the JSON property `growthFactor`
        # @return [Float]
        attr_accessor :growth_factor
      
        # Must be greater than 0.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # Must be greater than 0.
        # Corresponds to the JSON property `scale`
        # @return [Float]
        attr_accessor :scale
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @growth_factor = args[:growth_factor] if args.key?(:growth_factor)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @scale = args[:scale] if args.key?(:scale)
        end
      end
      
      # Specifies a linear sequence of buckets that all have the same width (except
      # overflow and underflow). Each bucket represents a constant absolute
      # uncertainty on the specific value in the bucket. There are `num_finite_buckets
      # + 2` (= N) buckets. Bucket `i` has the following boundaries: Upper bound (0 <=
      # i < N-1): offset + (width * i). Lower bound (1 <= i < N): offset + (width * (i
      # - 1)).
      class GoogleApiDistributionBucketOptionsLinear
        include Google::Apis::Core::Hashable
      
        # Must be greater than 0.
        # Corresponds to the JSON property `numFiniteBuckets`
        # @return [Fixnum]
        attr_accessor :num_finite_buckets
      
        # Lower bound of the first bucket.
        # Corresponds to the JSON property `offset`
        # @return [Float]
        attr_accessor :offset
      
        # Must be greater than 0.
        # Corresponds to the JSON property `width`
        # @return [Float]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_finite_buckets = args[:num_finite_buckets] if args.key?(:num_finite_buckets)
          @offset = args[:offset] if args.key?(:offset)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Exemplars are example points that may be used to annotate aggregated
      # distribution values. They are metadata that gives information about a
      # particular value added to a Distribution bucket, such as a trace ID that was
      # active when a value was added. They may contain further information, such as a
      # example values and timestamps, origin, etc.
      class GoogleApiDistributionExemplar
        include Google::Apis::Core::Hashable
      
        # Contextual information about the example value. Examples are: Trace: type.
        # googleapis.com/google.monitoring.v3.SpanContext Literal string: type.
        # googleapis.com/google.protobuf.StringValue Labels dropped during aggregation:
        # type.googleapis.com/google.monitoring.v3.DroppedLabels There may be only a
        # single attachment of any given message type in a single exemplar, and this is
        # enforced by the system.
        # Corresponds to the JSON property `attachments`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :attachments
      
        # The observation (sampling) time of the above value.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Value of the exemplar point. This value determines to which bucket the
        # exemplar belongs.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachments = args[:attachments] if args.key?(:attachments)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The range of the population values.
      class GoogleApiDistributionRange
        include Google::Apis::Core::Hashable
      
        # The maximum of the population values.
        # Corresponds to the JSON property `max`
        # @return [Float]
        attr_accessor :max
      
        # The minimum of the population values.
        # Corresponds to the JSON property `min`
        # @return [Float]
        attr_accessor :min
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max = args[:max] if args.key?(:max)
          @min = args[:min] if args.key?(:min)
        end
      end
      
      # Message that represents an arbitrary HTTP body. It should only be used for
      # payload formats that can't be represented as JSON, such as raw binary or an
      # HTML page. This message can be used both in streaming and non-streaming API
      # methods in the request as well as the response. It can be used as a top-level
      # request field, which is convenient if one wants to extract parameters from
      # either the URL or HTTP template into the request fields and also want access
      # to the raw HTTP body. Example: message GetResourceRequest ` // A unique
      # request id. string request_id = 1; // The raw HTTP body is bound to this field.
      # google.api.HttpBody http_body = 2; ` service ResourceService ` rpc
      # GetResource(GetResourceRequest) returns (google.api.HttpBody); rpc
      # UpdateResource(google.api.HttpBody) returns (google.protobuf.Empty); ` Example
      # with streaming methods: service CaldavService ` rpc GetCalendar(stream google.
      # api.HttpBody) returns (stream google.api.HttpBody); rpc UpdateCalendar(stream
      # google.api.HttpBody) returns (stream google.api.HttpBody); ` Use of this type
      # only changes how the request and response bodies are handled, all other
      # features will continue to work unchanged.
      class GoogleApiHttpBody
        include Google::Apis::Core::Hashable
      
        # The HTTP Content-Type header value specifying the content type of the body.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The HTTP request/response body as raw binary.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Application specific response metadata. Must be set in the first response for
        # streaming APIs.
        # Corresponds to the JSON property `extensions`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :extensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @data = args[:data] if args.key?(:data)
          @extensions = args[:extensions] if args.key?(:extensions)
        end
      end
      
      # A specific metric, identified by specifying values for all of the labels of a `
      # MetricDescriptor`.
      class GoogleApiMetric
        include Google::Apis::Core::Hashable
      
        # The set of label values that uniquely identify this metric. All labels listed
        # in the `MetricDescriptor` must be assigned values.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # An existing metric type, see google.api.MetricDescriptor. For example, `custom.
        # googleapis.com/invoice/paid/amount`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An object representing a resource that can be used for monitoring, logging,
      # billing, or other purposes. Examples include virtual machine instances,
      # databases, and storage devices such as disks. The `type` field identifies a
      # MonitoredResourceDescriptor object that describes the resource's schema.
      # Information in the `labels` field identifies the actual resource and its
      # attributes according to the schema. For example, a particular Compute Engine
      # VM instance could be represented by the following object, because the
      # MonitoredResourceDescriptor for `"gce_instance"` has labels `"project_id"`, `"
      # instance_id"` and `"zone"`: ` "type": "gce_instance", "labels": ` "project_id":
      # "my-project", "instance_id": "12345678901234", "zone": "us-central1-a" ``
      class GoogleApiMonitoredResource
        include Google::Apis::Core::Hashable
      
        # Required. Values for all of the labels listed in the associated monitored
        # resource descriptor. For example, Compute Engine VM instances use the labels `"
        # project_id"`, `"instance_id"`, and `"zone"`.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The monitored resource type. This field must match the `type` field
        # of a MonitoredResourceDescriptor object. For example, the type of a Compute
        # Engine VM instance is `gce_instance`. Some descriptors include the service
        # name in the type; for example, the type of a Datastream stream is `datastream.
        # googleapis.com/Stream`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Auxiliary metadata for a MonitoredResource object. MonitoredResource objects
      # contain the minimum set of information to uniquely identify a monitored
      # resource instance. There is some other useful auxiliary metadata. Monitoring
      # and Logging use an ingestion pipeline to extract metadata for cloud resources
      # of all types, and store the metadata in this message.
      class GoogleApiMonitoredResourceMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. Values for predefined system metadata labels. System labels are a
        # kind of metadata extracted by Google, including "machine_image", "vpc", "
        # subnet_id", "security_group", "name", etc. System label values can be only
        # strings, Boolean values, or a list of strings. For example: ` "name": "my-test-
        # instance", "security_group": ["a", "b", "c"], "spot_instance": false `
        # Corresponds to the JSON property `systemLabels`
        # @return [Hash<String,Object>]
        attr_accessor :system_labels
      
        # Output only. A map of user-defined metadata labels.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @system_labels = args[:system_labels] if args.key?(:system_labels)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # A description of the context in which an error occurred.
      class GoogleCloudDiscoveryengineLoggingErrorContext
        include Google::Apis::Core::Hashable
      
        # HTTP request data that is related to a reported error.
        # Corresponds to the JSON property `httpRequest`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineLoggingHttpRequestContext]
        attr_accessor :http_request
      
        # Indicates a location in the source code of the service for which errors are
        # reported.
        # Corresponds to the JSON property `reportLocation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineLoggingSourceLocation]
        attr_accessor :report_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_request = args[:http_request] if args.key?(:http_request)
          @report_location = args[:report_location] if args.key?(:report_location)
        end
      end
      
      # An error log which is reported to the Error Reporting system.
      class GoogleCloudDiscoveryengineLoggingErrorLog
        include Google::Apis::Core::Hashable
      
        # A description of the context in which an error occurred.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineLoggingErrorContext]
        attr_accessor :context
      
        # The error payload that is populated on LRO import APIs, including the
        # following: * `google.cloud.discoveryengine.v1alpha.DocumentService.
        # ImportDocuments` * `google.cloud.discoveryengine.v1alpha.UserEventService.
        # ImportUserEvents`
        # Corresponds to the JSON property `importPayload`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineLoggingImportErrorContext]
        attr_accessor :import_payload
      
        # A message describing the error.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # The API request payload, represented as a protocol buffer. Most API request
        # types are supported—for example: * `type.googleapis.com/google.cloud.
        # discoveryengine.v1alpha.DocumentService.CreateDocumentRequest` * `type.
        # googleapis.com/google.cloud.discoveryengine.v1alpha.UserEventService.
        # WriteUserEventRequest`
        # Corresponds to the JSON property `requestPayload`
        # @return [Hash<String,Object>]
        attr_accessor :request_payload
      
        # The API response payload, represented as a protocol buffer. This is used to
        # log some "soft errors", where the response is valid but we consider there are
        # some quality issues like unjoined events. The following API responses are
        # supported, and no PII is included: * `google.cloud.discoveryengine.v1alpha.
        # RecommendationService.Recommend` * `google.cloud.discoveryengine.v1alpha.
        # UserEventService.WriteUserEvent` * `google.cloud.discoveryengine.v1alpha.
        # UserEventService.CollectUserEvent`
        # Corresponds to the JSON property `responsePayload`
        # @return [Hash<String,Object>]
        attr_accessor :response_payload
      
        # Describes a running service that sends errors.
        # Corresponds to the JSON property `serviceContext`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineLoggingServiceContext]
        attr_accessor :service_context
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more
        # about this error model and how to work with it in the [API Design Guide](https:
        # //cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DiscoveryengineV1::GoogleRpcStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @import_payload = args[:import_payload] if args.key?(:import_payload)
          @message = args[:message] if args.key?(:message)
          @request_payload = args[:request_payload] if args.key?(:request_payload)
          @response_payload = args[:response_payload] if args.key?(:response_payload)
          @service_context = args[:service_context] if args.key?(:service_context)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # HTTP request data that is related to a reported error.
      class GoogleCloudDiscoveryengineLoggingHttpRequestContext
        include Google::Apis::Core::Hashable
      
        # The HTTP response status code for the request.
        # Corresponds to the JSON property `responseStatusCode`
        # @return [Fixnum]
        attr_accessor :response_status_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @response_status_code = args[:response_status_code] if args.key?(:response_status_code)
        end
      end
      
      # The error payload that is populated on LRO import APIs, including the
      # following: * `google.cloud.discoveryengine.v1alpha.DocumentService.
      # ImportDocuments` * `google.cloud.discoveryengine.v1alpha.UserEventService.
      # ImportUserEvents`
      class GoogleCloudDiscoveryengineLoggingImportErrorContext
        include Google::Apis::Core::Hashable
      
        # The detailed content which caused the error on importing a document.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # Google Cloud Storage file path of the import source. Can be set for batch
        # operation error.
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        # Line number of the content in file. Should be empty for permission or batch
        # operation error.
        # Corresponds to the JSON property `lineNumber`
        # @return [String]
        attr_accessor :line_number
      
        # The operation resource name of the LRO.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        # The detailed content which caused the error on importing a user event.
        # Corresponds to the JSON property `userEvent`
        # @return [String]
        attr_accessor :user_event
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
          @line_number = args[:line_number] if args.key?(:line_number)
          @operation = args[:operation] if args.key?(:operation)
          @user_event = args[:user_event] if args.key?(:user_event)
        end
      end
      
      # Describes a running service that sends errors.
      class GoogleCloudDiscoveryengineLoggingServiceContext
        include Google::Apis::Core::Hashable
      
        # An identifier of the service—for example, `discoveryengine.googleapis.com`.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Indicates a location in the source code of the service for which errors are
      # reported.
      class GoogleCloudDiscoveryengineLoggingSourceLocation
        include Google::Apis::Core::Hashable
      
        # Human-readable name of a function or method—for example, `google.cloud.
        # discoveryengine.v1alpha.RecommendationService.Recommend`.
        # Corresponds to the JSON property `functionName`
        # @return [String]
        attr_accessor :function_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @function_name = args[:function_name] if args.key?(:function_name)
        end
      end
      
      # Configuration data for advance site search.
      class GoogleCloudDiscoveryengineV1AdvancedSiteSearchConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # AlloyDB source import data from.
      class GoogleCloudDiscoveryengineV1AlloyDbSource
        include Google::Apis::Core::Hashable
      
        # Required. The AlloyDB cluster to copy the data from with a length limit of 256
        # characters.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # Required. The AlloyDB database to copy the data from with a length limit of
        # 256 characters.
        # Corresponds to the JSON property `databaseId`
        # @return [String]
        attr_accessor :database_id
      
        # Intermediate Cloud Storage directory used for the import with a length limit
        # of 2,000 characters. Can be specified if one wants to have the AlloyDB export
        # to a specific Cloud Storage directory. Ensure that the AlloyDB service account
        # has the necessary Cloud Storage Admin permissions to access the specified
        # Cloud Storage directory.
        # Corresponds to the JSON property `gcsStagingDir`
        # @return [String]
        attr_accessor :gcs_staging_dir
      
        # Required. The AlloyDB location to copy the data from with a length limit of
        # 256 characters.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # The project ID that contains the AlloyDB source. Has a length limit of 128
        # characters. If not specified, inherits the project ID from the parent request.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Required. The AlloyDB table to copy the data from with a length limit of 256
        # characters.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @database_id = args[:database_id] if args.key?(:database_id)
          @gcs_staging_dir = args[:gcs_staging_dir] if args.key?(:gcs_staging_dir)
          @location_id = args[:location_id] if args.key?(:location_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Defines an answer.
      class GoogleCloudDiscoveryengineV1Answer
        include Google::Apis::Core::Hashable
      
        # Additional answer-skipped reasons. This provides the reason for ignored cases.
        # If nothing is skipped, this field is not set.
        # Corresponds to the JSON property `answerSkippedReasons`
        # @return [Array<String>]
        attr_accessor :answer_skipped_reasons
      
        # The textual answer.
        # Corresponds to the JSON property `answerText`
        # @return [String]
        attr_accessor :answer_text
      
        # Citations.
        # Corresponds to the JSON property `citations`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerCitation>]
        attr_accessor :citations
      
        # Output only. Answer completed timestamp.
        # Corresponds to the JSON property `completeTime`
        # @return [String]
        attr_accessor :complete_time
      
        # Output only. Answer creation timestamp.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # A score in the range of [0, 1] describing how grounded the answer is by the
        # reference chunks.
        # Corresponds to the JSON property `groundingScore`
        # @return [Float]
        attr_accessor :grounding_score
      
        # Optional. Grounding supports.
        # Corresponds to the JSON property `groundingSupports`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerGroundingSupport>]
        attr_accessor :grounding_supports
      
        # Immutable. Fully qualified name `projects/`project`/locations/global/
        # collections/`collection`/engines/`engine`/sessions/*/answers/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Query understanding information.
        # Corresponds to the JSON property `queryUnderstandingInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryUnderstandingInfo]
        attr_accessor :query_understanding_info
      
        # References.
        # Corresponds to the JSON property `references`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerReference>]
        attr_accessor :references
      
        # Suggested related questions.
        # Corresponds to the JSON property `relatedQuestions`
        # @return [Array<String>]
        attr_accessor :related_questions
      
        # The state of the answer generation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Answer generation steps.
        # Corresponds to the JSON property `steps`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStep>]
        attr_accessor :steps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer_skipped_reasons = args[:answer_skipped_reasons] if args.key?(:answer_skipped_reasons)
          @answer_text = args[:answer_text] if args.key?(:answer_text)
          @citations = args[:citations] if args.key?(:citations)
          @complete_time = args[:complete_time] if args.key?(:complete_time)
          @create_time = args[:create_time] if args.key?(:create_time)
          @grounding_score = args[:grounding_score] if args.key?(:grounding_score)
          @grounding_supports = args[:grounding_supports] if args.key?(:grounding_supports)
          @name = args[:name] if args.key?(:name)
          @query_understanding_info = args[:query_understanding_info] if args.key?(:query_understanding_info)
          @references = args[:references] if args.key?(:references)
          @related_questions = args[:related_questions] if args.key?(:related_questions)
          @state = args[:state] if args.key?(:state)
          @steps = args[:steps] if args.key?(:steps)
        end
      end
      
      # Citation info for a segment.
      class GoogleCloudDiscoveryengineV1AnswerCitation
        include Google::Apis::Core::Hashable
      
        # End of the attributed segment, exclusive.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # Citation sources for the attributed segment.
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerCitationSource>]
        attr_accessor :sources
      
        # Index indicates the start of the segment, measured in bytes (UTF-8 unicode).
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @sources = args[:sources] if args.key?(:sources)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Citation source.
      class GoogleCloudDiscoveryengineV1AnswerCitationSource
        include Google::Apis::Core::Hashable
      
        # ID of the citation source.
        # Corresponds to the JSON property `referenceId`
        # @return [String]
        attr_accessor :reference_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_id = args[:reference_id] if args.key?(:reference_id)
        end
      end
      
      # Grounding support for a claim in `answer_text`.
      class GoogleCloudDiscoveryengineV1AnswerGroundingSupport
        include Google::Apis::Core::Hashable
      
        # Required. End of the claim, exclusive.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # Indicates that this claim required grounding check. When the system decided
        # this claim didn't require attribution/grounding check, this field is set to
        # false. In that case, no grounding check was done for the claim and therefore `
        # grounding_score`, `sources` is not returned.
        # Corresponds to the JSON property `groundingCheckRequired`
        # @return [Boolean]
        attr_accessor :grounding_check_required
        alias_method :grounding_check_required?, :grounding_check_required
      
        # A score in the range of [0, 1] describing how grounded is a specific claim by
        # the references. Higher value means that the claim is better supported by the
        # reference chunks.
        # Corresponds to the JSON property `groundingScore`
        # @return [Float]
        attr_accessor :grounding_score
      
        # Optional. Citation sources for the claim.
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerCitationSource>]
        attr_accessor :sources
      
        # Required. Index indicates the start of the claim, measured in bytes (UTF-8
        # unicode).
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @grounding_check_required = args[:grounding_check_required] if args.key?(:grounding_check_required)
          @grounding_score = args[:grounding_score] if args.key?(:grounding_score)
          @sources = args[:sources] if args.key?(:sources)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Request message for ConversationalSearchService.AnswerQuery method.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequest
        include Google::Apis::Core::Hashable
      
        # Answer generation specification.
        # Corresponds to the JSON property `answerGenerationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestAnswerGenerationSpec]
        attr_accessor :answer_generation_spec
      
        # Deprecated: This field is deprecated. Streaming Answer API will be supported.
        # Asynchronous mode control. If enabled, the response will be returned with
        # answer/session resource name without final answer. The API users need to do
        # the polling to get the latest status of answer/session by calling
        # ConversationalSearchService.GetAnswer or ConversationalSearchService.
        # GetSession method.
        # Corresponds to the JSON property `asynchronousMode`
        # @return [Boolean]
        attr_accessor :asynchronous_mode
        alias_method :asynchronous_mode?, :asynchronous_mode
      
        # Grounding specification.
        # Corresponds to the JSON property `groundingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestGroundingSpec]
        attr_accessor :grounding_spec
      
        # Defines a user inputed query.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Query]
        attr_accessor :query
      
        # Query understanding specification.
        # Corresponds to the JSON property `queryUnderstandingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpec]
        attr_accessor :query_understanding_spec
      
        # Related questions specification.
        # Corresponds to the JSON property `relatedQuestionsSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestRelatedQuestionsSpec]
        attr_accessor :related_questions_spec
      
        # Safety specification. There are two use cases: 1. when only safety_spec.enable
        # is set, the BLOCK_LOW_AND_ABOVE threshold will be applied for all categories.
        # 2. when safety_spec.enable is set and some safety_settings are set, only
        # specified safety_settings are applied.
        # Corresponds to the JSON property `safetySpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSafetySpec]
        attr_accessor :safety_spec
      
        # Search specification.
        # Corresponds to the JSON property `searchSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpec]
        attr_accessor :search_spec
      
        # The session resource name. Not required. When session field is not set, the
        # API is in sessionless mode. We support auto session mode: users can use the
        # wildcard symbol `-` as session ID. A new ID will be automatically generated
        # and assigned.
        # Corresponds to the JSON property `session`
        # @return [String]
        attr_accessor :session
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # A unique identifier for tracking visitors. For example, this could be
        # implemented with an HTTP cookie, which should be able to uniquely identify a
        # visitor on a single device. This unique identifier should not change if the
        # visitor logs in or out of the website. This field should NOT have a fixed
        # value such as `unknown_visitor`. The field must be a UTF-8 encoded string with
        # a length limit of 128 characters. Otherwise, an `INVALID_ARGUMENT` error is
        # returned.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer_generation_spec = args[:answer_generation_spec] if args.key?(:answer_generation_spec)
          @asynchronous_mode = args[:asynchronous_mode] if args.key?(:asynchronous_mode)
          @grounding_spec = args[:grounding_spec] if args.key?(:grounding_spec)
          @query = args[:query] if args.key?(:query)
          @query_understanding_spec = args[:query_understanding_spec] if args.key?(:query_understanding_spec)
          @related_questions_spec = args[:related_questions_spec] if args.key?(:related_questions_spec)
          @safety_spec = args[:safety_spec] if args.key?(:safety_spec)
          @search_spec = args[:search_spec] if args.key?(:search_spec)
          @session = args[:session] if args.key?(:session)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Answer generation specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestAnswerGenerationSpec
        include Google::Apis::Core::Hashable
      
        # Language code for Answer. Use language tags defined by [BCP47](https://www.rfc-
        # editor.org/rfc/bcp/bcp47.txt). Note: This is an experimental feature.
        # Corresponds to the JSON property `answerLanguageCode`
        # @return [String]
        attr_accessor :answer_language_code
      
        # Specifies whether to filter out adversarial queries. The default value is `
        # false`. Google employs search-query classification to detect adversarial
        # queries. No answer is returned if the search query is classified as an
        # adversarial query. For example, a user might ask a question regarding negative
        # comments about the company or submit a query designed to generate unsafe,
        # policy-violating output. If this field is set to `true`, we skip generating
        # answers for adversarial queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreAdversarialQuery`
        # @return [Boolean]
        attr_accessor :ignore_adversarial_query
        alias_method :ignore_adversarial_query?, :ignore_adversarial_query
      
        # Optional. Specifies whether to filter out jail-breaking queries. The default
        # value is `false`. Google employs search-query classification to detect jail-
        # breaking queries. No summary is returned if the search query is classified as
        # a jail-breaking query. A user might add instructions to the query to change
        # the tone, style, language, content of the answer, or ask the model to act as a
        # different entity, e.g. "Reply in the tone of a competing company's CEO". If
        # this field is set to `true`, we skip generating summaries for jail-breaking
        # queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreJailBreakingQuery`
        # @return [Boolean]
        attr_accessor :ignore_jail_breaking_query
        alias_method :ignore_jail_breaking_query?, :ignore_jail_breaking_query
      
        # Specifies whether to filter out queries that have low relevance. If this field
        # is set to `false`, all search results are used regardless of relevance to
        # generate answers. If set to `true` or unset, the behavior will be determined
        # automatically by the service.
        # Corresponds to the JSON property `ignoreLowRelevantContent`
        # @return [Boolean]
        attr_accessor :ignore_low_relevant_content
        alias_method :ignore_low_relevant_content?, :ignore_low_relevant_content
      
        # Specifies whether to filter out queries that are not answer-seeking. The
        # default value is `false`. Google employs search-query classification to detect
        # answer-seeking queries. No answer is returned if the search query is
        # classified as a non-answer seeking query. If this field is set to `true`, we
        # skip generating answers for non-answer seeking queries and return fallback
        # messages instead.
        # Corresponds to the JSON property `ignoreNonAnswerSeekingQuery`
        # @return [Boolean]
        attr_accessor :ignore_non_answer_seeking_query
        alias_method :ignore_non_answer_seeking_query?, :ignore_non_answer_seeking_query
      
        # Specifies whether to include citation metadata in the answer. The default
        # value is `false`.
        # Corresponds to the JSON property `includeCitations`
        # @return [Boolean]
        attr_accessor :include_citations
        alias_method :include_citations?, :include_citations
      
        # Answer Generation Model specification.
        # Corresponds to the JSON property `modelSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestAnswerGenerationSpecModelSpec]
        attr_accessor :model_spec
      
        # Answer generation prompt specification.
        # Corresponds to the JSON property `promptSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestAnswerGenerationSpecPromptSpec]
        attr_accessor :prompt_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer_language_code = args[:answer_language_code] if args.key?(:answer_language_code)
          @ignore_adversarial_query = args[:ignore_adversarial_query] if args.key?(:ignore_adversarial_query)
          @ignore_jail_breaking_query = args[:ignore_jail_breaking_query] if args.key?(:ignore_jail_breaking_query)
          @ignore_low_relevant_content = args[:ignore_low_relevant_content] if args.key?(:ignore_low_relevant_content)
          @ignore_non_answer_seeking_query = args[:ignore_non_answer_seeking_query] if args.key?(:ignore_non_answer_seeking_query)
          @include_citations = args[:include_citations] if args.key?(:include_citations)
          @model_spec = args[:model_spec] if args.key?(:model_spec)
          @prompt_spec = args[:prompt_spec] if args.key?(:prompt_spec)
        end
      end
      
      # Answer Generation Model specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestAnswerGenerationSpecModelSpec
        include Google::Apis::Core::Hashable
      
        # Model version. If not set, it will use the default stable model. Allowed
        # values are: stable, preview.
        # Corresponds to the JSON property `modelVersion`
        # @return [String]
        attr_accessor :model_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @model_version = args[:model_version] if args.key?(:model_version)
        end
      end
      
      # Answer generation prompt specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestAnswerGenerationSpecPromptSpec
        include Google::Apis::Core::Hashable
      
        # Customized preamble.
        # Corresponds to the JSON property `preamble`
        # @return [String]
        attr_accessor :preamble
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @preamble = args[:preamble] if args.key?(:preamble)
        end
      end
      
      # Grounding specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestGroundingSpec
        include Google::Apis::Core::Hashable
      
        # Optional. Specifies whether to enable the filtering based on grounding score
        # and at what level.
        # Corresponds to the JSON property `filteringLevel`
        # @return [String]
        attr_accessor :filtering_level
      
        # Optional. Specifies whether to include grounding_supports in the answer. The
        # default value is `false`. When this field is set to `true`, returned answer
        # will have `grounding_score` and will contain GroundingSupports for each claim.
        # Corresponds to the JSON property `includeGroundingSupports`
        # @return [Boolean]
        attr_accessor :include_grounding_supports
        alias_method :include_grounding_supports?, :include_grounding_supports
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filtering_level = args[:filtering_level] if args.key?(:filtering_level)
          @include_grounding_supports = args[:include_grounding_supports] if args.key?(:include_grounding_supports)
        end
      end
      
      # Query understanding specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpec
        include Google::Apis::Core::Hashable
      
        # Query classification specification.
        # Corresponds to the JSON property `queryClassificationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpecQueryClassificationSpec]
        attr_accessor :query_classification_spec
      
        # Query rephraser specification.
        # Corresponds to the JSON property `queryRephraserSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpecQueryRephraserSpec]
        attr_accessor :query_rephraser_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_classification_spec = args[:query_classification_spec] if args.key?(:query_classification_spec)
          @query_rephraser_spec = args[:query_rephraser_spec] if args.key?(:query_rephraser_spec)
        end
      end
      
      # Query classification specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpecQueryClassificationSpec
        include Google::Apis::Core::Hashable
      
        # Enabled query classification types.
        # Corresponds to the JSON property `types`
        # @return [Array<String>]
        attr_accessor :types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @types = args[:types] if args.key?(:types)
        end
      end
      
      # Query rephraser specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpecQueryRephraserSpec
        include Google::Apis::Core::Hashable
      
        # Disable query rephraser.
        # Corresponds to the JSON property `disable`
        # @return [Boolean]
        attr_accessor :disable
        alias_method :disable?, :disable
      
        # Max rephrase steps. The max number is 5 steps. If not set or set to < 1, it
        # will be set to 1 by default.
        # Corresponds to the JSON property `maxRephraseSteps`
        # @return [Fixnum]
        attr_accessor :max_rephrase_steps
      
        # Query Rephraser Model specification.
        # Corresponds to the JSON property `modelSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpecQueryRephraserSpecModelSpec]
        attr_accessor :model_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable = args[:disable] if args.key?(:disable)
          @max_rephrase_steps = args[:max_rephrase_steps] if args.key?(:max_rephrase_steps)
          @model_spec = args[:model_spec] if args.key?(:model_spec)
        end
      end
      
      # Query Rephraser Model specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestQueryUnderstandingSpecQueryRephraserSpecModelSpec
        include Google::Apis::Core::Hashable
      
        # Optional. Enabled query rephraser model type. If not set, it will use LARGE by
        # default.
        # Corresponds to the JSON property `modelType`
        # @return [String]
        attr_accessor :model_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @model_type = args[:model_type] if args.key?(:model_type)
        end
      end
      
      # Related questions specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestRelatedQuestionsSpec
        include Google::Apis::Core::Hashable
      
        # Enable related questions feature if true.
        # Corresponds to the JSON property `enable`
        # @return [Boolean]
        attr_accessor :enable
        alias_method :enable?, :enable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable = args[:enable] if args.key?(:enable)
        end
      end
      
      # Safety specification. There are two use cases: 1. when only safety_spec.enable
      # is set, the BLOCK_LOW_AND_ABOVE threshold will be applied for all categories.
      # 2. when safety_spec.enable is set and some safety_settings are set, only
      # specified safety_settings are applied.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSafetySpec
        include Google::Apis::Core::Hashable
      
        # Enable the safety filtering on the answer response. It is false by default.
        # Corresponds to the JSON property `enable`
        # @return [Boolean]
        attr_accessor :enable
        alias_method :enable?, :enable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable = args[:enable] if args.key?(:enable)
        end
      end
      
      # Search specification.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpec
        include Google::Apis::Core::Hashable
      
        # Search parameters.
        # Corresponds to the JSON property `searchParams`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchParams]
        attr_accessor :search_params
      
        # Search result list.
        # Corresponds to the JSON property `searchResultList`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultList]
        attr_accessor :search_result_list
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_params = args[:search_params] if args.key?(:search_params)
          @search_result_list = args[:search_result_list] if args.key?(:search_result_list)
        end
      end
      
      # Search parameters.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchParams
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # Specs defining dataStores to filter on in a search call and configurations for
        # those dataStores. This is only considered for engines with multiple dataStores
        # use case. For single dataStore within an engine, they should use the specs at
        # the top level.
        # Corresponds to the JSON property `dataStoreSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestDataStoreSpec>]
        attr_accessor :data_store_specs
      
        # The filter syntax consists of an expression language for constructing a
        # predicate from one or more fields of the documents being filtered. Filter
        # expression is case-sensitive. This will be used to filter search results which
        # may affect the Answer response. If this field is unrecognizable, an `
        # INVALID_ARGUMENT` is returned. Filtering in Vertex AI Search is done by
        # mapping the LHS filter key to a key property defined in the Vertex AI Search
        # backend -- this mapping is defined by the customer in their schema. For
        # example a media customers might have a field 'name' in their schema. In this
        # case the filter would look like this: filter --> name:'ANY("king kong")' For
        # more information about filtering including syntax and filter operators, see [
        # Filter](https://cloud.google.com/generative-ai-app-builder/docs/filter-search-
        # metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Number of search results to return. The default value is 10.
        # Corresponds to the JSON property `maxReturnResults`
        # @return [Fixnum]
        attr_accessor :max_return_results
      
        # The order in which documents are returned. Documents can be ordered by a field
        # in an Document object. Leave it unset if ordered by relevance. `order_by`
        # expression is case-sensitive. For more information on ordering, see [Ordering](
        # https://cloud.google.com/retail/docs/filter-and-order#order) If this field is
        # unrecognizable, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Specifies the search result mode. If unspecified, the search result mode
        # defaults to `DOCUMENTS`. See [parse and chunk documents](https://cloud.google.
        # com/generative-ai-app-builder/docs/parse-chunk-documents)
        # Corresponds to the JSON property `searchResultMode`
        # @return [String]
        attr_accessor :search_result_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @data_store_specs = args[:data_store_specs] if args.key?(:data_store_specs)
          @filter = args[:filter] if args.key?(:filter)
          @max_return_results = args[:max_return_results] if args.key?(:max_return_results)
          @order_by = args[:order_by] if args.key?(:order_by)
          @search_result_mode = args[:search_result_mode] if args.key?(:search_result_mode)
        end
      end
      
      # Search result list.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultList
        include Google::Apis::Core::Hashable
      
        # Search results.
        # Corresponds to the JSON property `searchResults`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResult>]
        attr_accessor :search_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_results = args[:search_results] if args.key?(:search_results)
        end
      end
      
      # Search result.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResult
        include Google::Apis::Core::Hashable
      
        # Chunk information.
        # Corresponds to the JSON property `chunkInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultChunkInfo]
        attr_accessor :chunk_info
      
        # Unstructured document information.
        # Corresponds to the JSON property `unstructuredDocumentInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfo]
        attr_accessor :unstructured_document_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_info = args[:chunk_info] if args.key?(:chunk_info)
          @unstructured_document_info = args[:unstructured_document_info] if args.key?(:unstructured_document_info)
        end
      end
      
      # Chunk information.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultChunkInfo
        include Google::Apis::Core::Hashable
      
        # Chunk resource name.
        # Corresponds to the JSON property `chunk`
        # @return [String]
        attr_accessor :chunk
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Document metadata contains the information of the document of the current
        # chunk.
        # Corresponds to the JSON property `documentMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultChunkInfoDocumentMetadata]
        attr_accessor :document_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk = args[:chunk] if args.key?(:chunk)
          @content = args[:content] if args.key?(:content)
          @document_metadata = args[:document_metadata] if args.key?(:document_metadata)
        end
      end
      
      # Document metadata contains the information of the document of the current
      # chunk.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultChunkInfoDocumentMetadata
        include Google::Apis::Core::Hashable
      
        # Title of the document.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Uri of the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Unstructured document information.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfo
        include Google::Apis::Core::Hashable
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # List of document contexts. The content will be used for Answer Generation.
        # This is supposed to be the main content of the document that can be long and
        # comprehensive.
        # Corresponds to the JSON property `documentContexts`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfoDocumentContext>]
        attr_accessor :document_contexts
      
        # Deprecated: This field is deprecated and will have no effect on the Answer
        # generation. Please use document_contexts and extractive_segments fields. List
        # of extractive answers.
        # Corresponds to the JSON property `extractiveAnswers`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfoExtractiveAnswer>]
        attr_accessor :extractive_answers
      
        # List of extractive segments.
        # Corresponds to the JSON property `extractiveSegments`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfoExtractiveSegment>]
        attr_accessor :extractive_segments
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @document_contexts = args[:document_contexts] if args.key?(:document_contexts)
          @extractive_answers = args[:extractive_answers] if args.key?(:extractive_answers)
          @extractive_segments = args[:extractive_segments] if args.key?(:extractive_segments)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Document context.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfoDocumentContext
        include Google::Apis::Core::Hashable
      
        # Document content to be used for answer generation.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
        end
      end
      
      # Extractive answer. [Guide](https://cloud.google.com/generative-ai-app-builder/
      # docs/snippets#get-answers)
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfoExtractiveAnswer
        include Google::Apis::Core::Hashable
      
        # Extractive answer content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
        end
      end
      
      # Extractive segment. [Guide](https://cloud.google.com/generative-ai-app-builder/
      # docs/snippets#extractive-segments) Answer generation will only use it if
      # document_contexts is empty. This is supposed to be shorter snippets.
      class GoogleCloudDiscoveryengineV1AnswerQueryRequestSearchSpecSearchResultListSearchResultUnstructuredDocumentInfoExtractiveSegment
        include Google::Apis::Core::Hashable
      
        # Extractive segment content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
        end
      end
      
      # Response message for ConversationalSearchService.AnswerQuery method.
      class GoogleCloudDiscoveryengineV1AnswerQueryResponse
        include Google::Apis::Core::Hashable
      
        # Defines an answer.
        # Corresponds to the JSON property `answer`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Answer]
        attr_accessor :answer
      
        # A global unique ID used for logging.
        # Corresponds to the JSON property `answerQueryToken`
        # @return [String]
        attr_accessor :answer_query_token
      
        # External session proto definition.
        # Corresponds to the JSON property `session`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Session]
        attr_accessor :session
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer = args[:answer] if args.key?(:answer)
          @answer_query_token = args[:answer_query_token] if args.key?(:answer_query_token)
          @session = args[:session] if args.key?(:session)
        end
      end
      
      # Query understanding information.
      class GoogleCloudDiscoveryengineV1AnswerQueryUnderstandingInfo
        include Google::Apis::Core::Hashable
      
        # Query classification information.
        # Corresponds to the JSON property `queryClassificationInfo`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerQueryUnderstandingInfoQueryClassificationInfo>]
        attr_accessor :query_classification_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_classification_info = args[:query_classification_info] if args.key?(:query_classification_info)
        end
      end
      
      # Query classification information.
      class GoogleCloudDiscoveryengineV1AnswerQueryUnderstandingInfoQueryClassificationInfo
        include Google::Apis::Core::Hashable
      
        # Classification output.
        # Corresponds to the JSON property `positive`
        # @return [Boolean]
        attr_accessor :positive
        alias_method :positive?, :positive
      
        # Query classification type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @positive = args[:positive] if args.key?(:positive)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Reference.
      class GoogleCloudDiscoveryengineV1AnswerReference
        include Google::Apis::Core::Hashable
      
        # Chunk information.
        # Corresponds to the JSON property `chunkInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerReferenceChunkInfo]
        attr_accessor :chunk_info
      
        # Structured search information.
        # Corresponds to the JSON property `structuredDocumentInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerReferenceStructuredDocumentInfo]
        attr_accessor :structured_document_info
      
        # Unstructured document information.
        # Corresponds to the JSON property `unstructuredDocumentInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerReferenceUnstructuredDocumentInfo]
        attr_accessor :unstructured_document_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_info = args[:chunk_info] if args.key?(:chunk_info)
          @structured_document_info = args[:structured_document_info] if args.key?(:structured_document_info)
          @unstructured_document_info = args[:unstructured_document_info] if args.key?(:unstructured_document_info)
        end
      end
      
      # Chunk information.
      class GoogleCloudDiscoveryengineV1AnswerReferenceChunkInfo
        include Google::Apis::Core::Hashable
      
        # Chunk resource name.
        # Corresponds to the JSON property `chunk`
        # @return [String]
        attr_accessor :chunk
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Document metadata.
        # Corresponds to the JSON property `documentMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerReferenceChunkInfoDocumentMetadata]
        attr_accessor :document_metadata
      
        # The relevance of the chunk for a given query. Values range from 0.0 (
        # completely irrelevant) to 1.0 (completely relevant). This value is for
        # informational purpose only. It may change for the same query and chunk at any
        # time due to a model retraining or change in implementation.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk = args[:chunk] if args.key?(:chunk)
          @content = args[:content] if args.key?(:content)
          @document_metadata = args[:document_metadata] if args.key?(:document_metadata)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Document metadata.
      class GoogleCloudDiscoveryengineV1AnswerReferenceChunkInfoDocumentMetadata
        include Google::Apis::Core::Hashable
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        # The structured JSON metadata for the document. It is populated from the struct
        # data from the Chunk in search result.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Structured search information.
      class GoogleCloudDiscoveryengineV1AnswerReferenceStructuredDocumentInfo
        include Google::Apis::Core::Hashable
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # Structured search data.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
        end
      end
      
      # Unstructured document information.
      class GoogleCloudDiscoveryengineV1AnswerReferenceUnstructuredDocumentInfo
        include Google::Apis::Core::Hashable
      
        # List of cited chunk contents derived from document content.
        # Corresponds to the JSON property `chunkContents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerReferenceUnstructuredDocumentInfoChunkContent>]
        attr_accessor :chunk_contents
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # The structured JSON metadata for the document. It is populated from the struct
        # data from the Chunk in search result.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_contents = args[:chunk_contents] if args.key?(:chunk_contents)
          @document = args[:document] if args.key?(:document)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Chunk content.
      class GoogleCloudDiscoveryengineV1AnswerReferenceUnstructuredDocumentInfoChunkContent
        include Google::Apis::Core::Hashable
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        # The relevance of the chunk for a given query. Values range from 0.0 (
        # completely irrelevant) to 1.0 (completely relevant). This value is for
        # informational purpose only. It may change for the same query and chunk at any
        # time due to a model retraining or change in implementation.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Step information.
      class GoogleCloudDiscoveryengineV1AnswerStep
        include Google::Apis::Core::Hashable
      
        # Actions.
        # Corresponds to the JSON property `actions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStepAction>]
        attr_accessor :actions
      
        # The description of the step.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The state of the step.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The thought of the step.
        # Corresponds to the JSON property `thought`
        # @return [String]
        attr_accessor :thought
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @description = args[:description] if args.key?(:description)
          @state = args[:state] if args.key?(:state)
          @thought = args[:thought] if args.key?(:thought)
        end
      end
      
      # Action.
      class GoogleCloudDiscoveryengineV1AnswerStepAction
        include Google::Apis::Core::Hashable
      
        # Observation.
        # Corresponds to the JSON property `observation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStepActionObservation]
        attr_accessor :observation
      
        # Search action.
        # Corresponds to the JSON property `searchAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStepActionSearchAction]
        attr_accessor :search_action
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @observation = args[:observation] if args.key?(:observation)
          @search_action = args[:search_action] if args.key?(:search_action)
        end
      end
      
      # Observation.
      class GoogleCloudDiscoveryengineV1AnswerStepActionObservation
        include Google::Apis::Core::Hashable
      
        # Search results observed by the search action, it can be snippets info or chunk
        # info, depending on the citation type set by the user.
        # Corresponds to the JSON property `searchResults`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStepActionObservationSearchResult>]
        attr_accessor :search_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_results = args[:search_results] if args.key?(:search_results)
        end
      end
      
      # 
      class GoogleCloudDiscoveryengineV1AnswerStepActionObservationSearchResult
        include Google::Apis::Core::Hashable
      
        # If citation_type is CHUNK_LEVEL_CITATION and chunk mode is on, populate chunk
        # info.
        # Corresponds to the JSON property `chunkInfo`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStepActionObservationSearchResultChunkInfo>]
        attr_accessor :chunk_info
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # If citation_type is DOCUMENT_LEVEL_CITATION, populate document level snippets.
        # Corresponds to the JSON property `snippetInfo`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AnswerStepActionObservationSearchResultSnippetInfo>]
        attr_accessor :snippet_info
      
        # Data representation. The structured JSON data for the document. It's populated
        # from the struct data from the Document, or the Chunk in search result.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_info = args[:chunk_info] if args.key?(:chunk_info)
          @document = args[:document] if args.key?(:document)
          @snippet_info = args[:snippet_info] if args.key?(:snippet_info)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Chunk information.
      class GoogleCloudDiscoveryengineV1AnswerStepActionObservationSearchResultChunkInfo
        include Google::Apis::Core::Hashable
      
        # Chunk resource name.
        # Corresponds to the JSON property `chunk`
        # @return [String]
        attr_accessor :chunk
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The relevance of the chunk for a given query. Values range from 0.0 (
        # completely irrelevant) to 1.0 (completely relevant). This value is for
        # informational purpose only. It may change for the same query and chunk at any
        # time due to a model retraining or change in implementation.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk = args[:chunk] if args.key?(:chunk)
          @content = args[:content] if args.key?(:content)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Snippet information.
      class GoogleCloudDiscoveryengineV1AnswerStepActionObservationSearchResultSnippetInfo
        include Google::Apis::Core::Hashable
      
        # Snippet content.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        # Status of the snippet defined by the search team.
        # Corresponds to the JSON property `snippetStatus`
        # @return [String]
        attr_accessor :snippet_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @snippet = args[:snippet] if args.key?(:snippet)
          @snippet_status = args[:snippet_status] if args.key?(:snippet_status)
        end
      end
      
      # Search action.
      class GoogleCloudDiscoveryengineV1AnswerStepActionSearchAction
        include Google::Apis::Core::Hashable
      
        # The query to search.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query = args[:query] if args.key?(:query)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # BatchCreateTargetSites operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1BatchCreateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for SiteSearchEngineService.BatchCreateTargetSites method.
      class GoogleCloudDiscoveryengineV1BatchCreateTargetSitesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The request message specifying the resources to create. A maximum of
        # 20 TargetSites can be created in a batch.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CreateTargetSiteRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # Response message for SiteSearchEngineService.BatchCreateTargetSites method.
      class GoogleCloudDiscoveryengineV1BatchCreateTargetSitesResponse
        include Google::Apis::Core::Hashable
      
        # TargetSites created.
        # Corresponds to the JSON property `targetSites`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TargetSite>]
        attr_accessor :target_sites
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_sites = args[:target_sites] if args.key?(:target_sites)
        end
      end
      
      # Response message for DocumentService.BatchGetDocumentsMetadata method.
      class GoogleCloudDiscoveryengineV1BatchGetDocumentsMetadataResponse
        include Google::Apis::Core::Hashable
      
        # The metadata of the Documents.
        # Corresponds to the JSON property `documentsMetadata`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BatchGetDocumentsMetadataResponseDocumentMetadata>]
        attr_accessor :documents_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents_metadata = args[:documents_metadata] if args.key?(:documents_metadata)
        end
      end
      
      # The metadata of a Document.
      class GoogleCloudDiscoveryengineV1BatchGetDocumentsMetadataResponseDocumentMetadata
        include Google::Apis::Core::Hashable
      
        # The data ingestion source of the Document. Allowed values are: * `batch`: Data
        # ingested via Batch API, e.g., ImportDocuments. * `streaming` Data ingested via
        # Streaming API, e.g., FHIR streaming.
        # Corresponds to the JSON property `dataIngestionSource`
        # @return [String]
        attr_accessor :data_ingestion_source
      
        # The timestamp of the last time the Document was last indexed.
        # Corresponds to the JSON property `lastRefreshedTime`
        # @return [String]
        attr_accessor :last_refreshed_time
      
        # The value of the matcher that was used to match the Document.
        # Corresponds to the JSON property `matcherValue`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BatchGetDocumentsMetadataResponseDocumentMetadataMatcherValue]
        attr_accessor :matcher_value
      
        # The state of the document.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_ingestion_source = args[:data_ingestion_source] if args.key?(:data_ingestion_source)
          @last_refreshed_time = args[:last_refreshed_time] if args.key?(:last_refreshed_time)
          @matcher_value = args[:matcher_value] if args.key?(:matcher_value)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The value of the matcher that was used to match the Document.
      class GoogleCloudDiscoveryengineV1BatchGetDocumentsMetadataResponseDocumentMetadataMatcherValue
        include Google::Apis::Core::Hashable
      
        # Format: projects/`project`/locations/`location`/datasets/`dataset`/fhirStores/`
        # fhir_store`/fhir/`resource_type`/`fhir_resource_id`
        # Corresponds to the JSON property `fhirResource`
        # @return [String]
        attr_accessor :fhir_resource
      
        # If match by URI, the URI of the Document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fhir_resource = args[:fhir_resource] if args.key?(:fhir_resource)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Request message for SiteSearchEngineService.BatchVerifyTargetSites method.
      class GoogleCloudDiscoveryengineV1BatchVerifyTargetSitesRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # BigQuery source import data from.
      class GoogleCloudDiscoveryengineV1BigQuerySource
        include Google::Apis::Core::Hashable
      
        # The schema to use when parsing the data from the source. Supported values for
        # user event imports: * `user_event` (default): One UserEvent per row. Supported
        # values for document imports: * `document` (default): One Document format per
        # row. Each document must have a valid Document.id and one of Document.json_data
        # or Document.struct_data. * `custom`: One custom data per row in arbitrary
        # format that conforms to the defined Schema of the data store. This can only be
        # used by the GENERIC Data Store vertical.
        # Corresponds to the JSON property `dataSchema`
        # @return [String]
        attr_accessor :data_schema
      
        # Required. The BigQuery data set to copy the data from with a length limit of 1,
        # 024 characters.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        # Intermediate Cloud Storage directory used for the import with a length limit
        # of 2,000 characters. Can be specified if one wants to have the BigQuery export
        # to a specific Cloud Storage directory.
        # Corresponds to the JSON property `gcsStagingDir`
        # @return [String]
        attr_accessor :gcs_staging_dir
      
        # Represents a whole or partial calendar date, such as a birthday. The time of
        # day and time zone are either specified elsewhere or are insignificant. The
        # date is relative to the Gregorian Calendar. This can represent one of the
        # following: * A full date, with non-zero year, month, and day values. * A month
        # and day, with a zero year (for example, an anniversary). * A year on its own,
        # with a zero month and a zero day. * A year and month, with a zero day (for
        # example, a credit card expiration date). Related types: * google.type.
        # TimeOfDay * google.type.DateTime * google.protobuf.Timestamp
        # Corresponds to the JSON property `partitionDate`
        # @return [Google::Apis::DiscoveryengineV1::GoogleTypeDate]
        attr_accessor :partition_date
      
        # The project ID or the project number that contains the BigQuery source. Has a
        # length limit of 128 characters. If not specified, inherits the project ID from
        # the parent request.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Required. The BigQuery table to copy the data from with a length limit of 1,
        # 024 characters.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_schema = args[:data_schema] if args.key?(:data_schema)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
          @gcs_staging_dir = args[:gcs_staging_dir] if args.key?(:gcs_staging_dir)
          @partition_date = args[:partition_date] if args.key?(:partition_date)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # The Bigtable Options object that contains information to support the import.
      class GoogleCloudDiscoveryengineV1BigtableOptions
        include Google::Apis::Core::Hashable
      
        # The mapping from family names to an object that contains column families level
        # information for the given column family. If a family is not present in this
        # map it will be ignored.
        # Corresponds to the JSON property `families`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigtableOptionsBigtableColumnFamily>]
        attr_accessor :families
      
        # The field name used for saving row key value in the document. The name has to
        # match the pattern `a-zA-Z0-9*`.
        # Corresponds to the JSON property `keyFieldName`
        # @return [String]
        attr_accessor :key_field_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @families = args[:families] if args.key?(:families)
          @key_field_name = args[:key_field_name] if args.key?(:key_field_name)
        end
      end
      
      # The column of the Bigtable.
      class GoogleCloudDiscoveryengineV1BigtableOptionsBigtableColumn
        include Google::Apis::Core::Hashable
      
        # The encoding mode of the values when the type is not `STRING`. Acceptable
        # encoding values are: * `TEXT`: indicates values are alphanumeric text strings.
        # * `BINARY`: indicates values are encoded using `HBase Bytes.toBytes` family of
        # functions. This can be overridden for a specific column by listing that column
        # in `columns` and specifying an encoding for it.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # The field name to use for this column in the document. The name has to match
        # the pattern `a-zA-Z0-9*`. If not set, it is parsed from the qualifier bytes
        # with best effort. However, due to different naming patterns, field name
        # collisions could happen, where parsing behavior is undefined.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # Required. Qualifier of the column. If it cannot be decoded with utf-8, use a
        # base-64 encoded string instead.
        # Corresponds to the JSON property `qualifier`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :qualifier
      
        # The type of values in this column family. The values are expected to be
        # encoded using `HBase Bytes.toBytes` function when the encoding value is set to
        # `BINARY`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @encoding = args[:encoding] if args.key?(:encoding)
          @field_name = args[:field_name] if args.key?(:field_name)
          @qualifier = args[:qualifier] if args.key?(:qualifier)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The column family of the Bigtable.
      class GoogleCloudDiscoveryengineV1BigtableOptionsBigtableColumnFamily
        include Google::Apis::Core::Hashable
      
        # The list of objects that contains column level information for each column. If
        # a column is not present in this list it will be ignored.
        # Corresponds to the JSON property `columns`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigtableOptionsBigtableColumn>]
        attr_accessor :columns
      
        # The encoding mode of the values when the type is not STRING. Acceptable
        # encoding values are: * `TEXT`: indicates values are alphanumeric text strings.
        # * `BINARY`: indicates values are encoded using `HBase Bytes.toBytes` family of
        # functions. This can be overridden for a specific column by listing that column
        # in `columns` and specifying an encoding for it.
        # Corresponds to the JSON property `encoding`
        # @return [String]
        attr_accessor :encoding
      
        # The field name to use for this column family in the document. The name has to
        # match the pattern `a-zA-Z0-9*`. If not set, it is parsed from the family name
        # with best effort. However, due to different naming patterns, field name
        # collisions could happen, where parsing behavior is undefined.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # The type of values in this column family. The values are expected to be
        # encoded using `HBase Bytes.toBytes` function when the encoding value is set to
        # `BINARY`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @encoding = args[:encoding] if args.key?(:encoding)
          @field_name = args[:field_name] if args.key?(:field_name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The Cloud Bigtable source for importing data.
      class GoogleCloudDiscoveryengineV1BigtableSource
        include Google::Apis::Core::Hashable
      
        # The Bigtable Options object that contains information to support the import.
        # Corresponds to the JSON property `bigtableOptions`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigtableOptions]
        attr_accessor :bigtable_options
      
        # Required. The instance ID of the Cloud Bigtable that needs to be imported.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # The project ID that contains the Bigtable source. Has a length limit of 128
        # characters. If not specified, inherits the project ID from the parent request.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Required. The table ID of the Cloud Bigtable that needs to be imported.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigtable_options = args[:bigtable_options] if args.key?(:bigtable_options)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Request message for GroundedGenerationService.CheckGrounding method.
      class GoogleCloudDiscoveryengineV1CheckGroundingRequest
        include Google::Apis::Core::Hashable
      
        # Answer candidate to check. It can have a maximum length of 4096 tokens.
        # Corresponds to the JSON property `answerCandidate`
        # @return [String]
        attr_accessor :answer_candidate
      
        # List of facts for the grounding check. We support up to 200 facts.
        # Corresponds to the JSON property `facts`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GroundingFact>]
        attr_accessor :facts
      
        # Specification for the grounding check.
        # Corresponds to the JSON property `groundingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CheckGroundingSpec]
        attr_accessor :grounding_spec
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer_candidate = args[:answer_candidate] if args.key?(:answer_candidate)
          @facts = args[:facts] if args.key?(:facts)
          @grounding_spec = args[:grounding_spec] if args.key?(:grounding_spec)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # Response message for the GroundedGenerationService.CheckGrounding method.
      class GoogleCloudDiscoveryengineV1CheckGroundingResponse
        include Google::Apis::Core::Hashable
      
        # List of facts cited across all claims in the answer candidate. These are
        # derived from the facts supplied in the request.
        # Corresponds to the JSON property `citedChunks`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1FactChunk>]
        attr_accessor :cited_chunks
      
        # List of facts cited across all claims in the answer candidate. These are
        # derived from the facts supplied in the request.
        # Corresponds to the JSON property `citedFacts`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CheckGroundingResponseCheckGroundingFactChunk>]
        attr_accessor :cited_facts
      
        # Claim texts and citation info across all claims in the answer candidate.
        # Corresponds to the JSON property `claims`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CheckGroundingResponseClaim>]
        attr_accessor :claims
      
        # The support score for the input answer candidate. Higher the score, higher is
        # the fraction of claims that are supported by the provided facts. This is
        # always set when a response is returned.
        # Corresponds to the JSON property `supportScore`
        # @return [Float]
        attr_accessor :support_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cited_chunks = args[:cited_chunks] if args.key?(:cited_chunks)
          @cited_facts = args[:cited_facts] if args.key?(:cited_facts)
          @claims = args[:claims] if args.key?(:claims)
          @support_score = args[:support_score] if args.key?(:support_score)
        end
      end
      
      # Fact chunk for grounding check.
      class GoogleCloudDiscoveryengineV1CheckGroundingResponseCheckGroundingFactChunk
        include Google::Apis::Core::Hashable
      
        # Text content of the fact chunk. Can be at most 10K characters long.
        # Corresponds to the JSON property `chunkText`
        # @return [String]
        attr_accessor :chunk_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_text = args[:chunk_text] if args.key?(:chunk_text)
        end
      end
      
      # Text and citation info for a claim in the answer candidate.
      class GoogleCloudDiscoveryengineV1CheckGroundingResponseClaim
        include Google::Apis::Core::Hashable
      
        # A list of indices (into 'cited_chunks') specifying the citations associated
        # with the claim. For instance [1,3,4] means that cited_chunks[1], cited_chunks[
        # 3], cited_chunks[4] are the facts cited supporting for the claim. A citation
        # to a fact indicates that the claim is supported by the fact.
        # Corresponds to the JSON property `citationIndices`
        # @return [Array<Fixnum>]
        attr_accessor :citation_indices
      
        # Text for the claim in the answer candidate. Always provided regardless of
        # whether citations or anti-citations are found.
        # Corresponds to the JSON property `claimText`
        # @return [String]
        attr_accessor :claim_text
      
        # Position indicating the end of the claim in the answer candidate, exclusive.
        # Corresponds to the JSON property `endPos`
        # @return [Fixnum]
        attr_accessor :end_pos
      
        # Indicates that this claim required grounding check. When the system decided
        # this claim doesn't require attribution/grounding check, this field will be set
        # to false. In that case, no grounding check was done for the claim and
        # therefore citation_indices should not be returned.
        # Corresponds to the JSON property `groundingCheckRequired`
        # @return [Boolean]
        attr_accessor :grounding_check_required
        alias_method :grounding_check_required?, :grounding_check_required
      
        # Position indicating the start of the claim in the answer candidate, measured
        # in bytes.
        # Corresponds to the JSON property `startPos`
        # @return [Fixnum]
        attr_accessor :start_pos
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @citation_indices = args[:citation_indices] if args.key?(:citation_indices)
          @claim_text = args[:claim_text] if args.key?(:claim_text)
          @end_pos = args[:end_pos] if args.key?(:end_pos)
          @grounding_check_required = args[:grounding_check_required] if args.key?(:grounding_check_required)
          @start_pos = args[:start_pos] if args.key?(:start_pos)
        end
      end
      
      # Specification for the grounding check.
      class GoogleCloudDiscoveryengineV1CheckGroundingSpec
        include Google::Apis::Core::Hashable
      
        # The threshold (in [0,1]) used for determining whether a fact must be cited for
        # a claim in the answer candidate. Choosing a higher threshold will lead to
        # fewer but very strong citations, while choosing a lower threshold may lead to
        # more but somewhat weaker citations. If unset, the threshold will default to 0.
        # 6.
        # Corresponds to the JSON property `citationThreshold`
        # @return [Float]
        attr_accessor :citation_threshold
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @citation_threshold = args[:citation_threshold] if args.key?(:citation_threshold)
        end
      end
      
      # Chunk captures all raw metadata information of items to be recommended or
      # searched in the chunk mode.
      class GoogleCloudDiscoveryengineV1Chunk
        include Google::Apis::Core::Hashable
      
        # Metadata of the current chunk. This field is only populated on SearchService.
        # Search API.
        # Corresponds to the JSON property `chunkMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ChunkChunkMetadata]
        attr_accessor :chunk_metadata
      
        # Content is a string from a document (parsed content).
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Output only. This field is OUTPUT_ONLY. It contains derived data that are not
        # in the original input document.
        # Corresponds to the JSON property `derivedStructData`
        # @return [Hash<String,Object>]
        attr_accessor :derived_struct_data
      
        # Document metadata contains the information of the document of the current
        # chunk.
        # Corresponds to the JSON property `documentMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ChunkDocumentMetadata]
        attr_accessor :document_metadata
      
        # Unique chunk ID of the current chunk.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The full resource name of the chunk. Format: `projects/`project`/locations/`
        # location`/collections/`collection`/dataStores/`data_store`/branches/`branch`/
        # documents/`document_id`/chunks/`chunk_id``. This field must be a UTF-8 encoded
        # string with a length limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Page span of the chunk.
        # Corresponds to the JSON property `pageSpan`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ChunkPageSpan]
        attr_accessor :page_span
      
        # Output only. Represents the relevance score based on similarity. Higher score
        # indicates higher chunk relevance. The score is in range [-1.0, 1.0]. Only
        # populated on SearchResponse.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_metadata = args[:chunk_metadata] if args.key?(:chunk_metadata)
          @content = args[:content] if args.key?(:content)
          @derived_struct_data = args[:derived_struct_data] if args.key?(:derived_struct_data)
          @document_metadata = args[:document_metadata] if args.key?(:document_metadata)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @page_span = args[:page_span] if args.key?(:page_span)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Metadata of the current chunk. This field is only populated on SearchService.
      # Search API.
      class GoogleCloudDiscoveryengineV1ChunkChunkMetadata
        include Google::Apis::Core::Hashable
      
        # The next chunks of the current chunk. The number is controlled by
        # SearchRequest.ContentSearchSpec.ChunkSpec.num_next_chunks. This field is only
        # populated on SearchService.Search API.
        # Corresponds to the JSON property `nextChunks`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Chunk>]
        attr_accessor :next_chunks
      
        # The previous chunks of the current chunk. The number is controlled by
        # SearchRequest.ContentSearchSpec.ChunkSpec.num_previous_chunks. This field is
        # only populated on SearchService.Search API.
        # Corresponds to the JSON property `previousChunks`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Chunk>]
        attr_accessor :previous_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_chunks = args[:next_chunks] if args.key?(:next_chunks)
          @previous_chunks = args[:previous_chunks] if args.key?(:previous_chunks)
        end
      end
      
      # Document metadata contains the information of the document of the current
      # chunk.
      class GoogleCloudDiscoveryengineV1ChunkDocumentMetadata
        include Google::Apis::Core::Hashable
      
        # Data representation. The structured JSON data for the document. It should
        # conform to the registered Schema or an `INVALID_ARGUMENT` error is thrown.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title of the document.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Uri of the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Page span of the chunk.
      class GoogleCloudDiscoveryengineV1ChunkPageSpan
        include Google::Apis::Core::Hashable
      
        # The end page of the chunk.
        # Corresponds to the JSON property `pageEnd`
        # @return [Fixnum]
        attr_accessor :page_end
      
        # The start page of the chunk.
        # Corresponds to the JSON property `pageStart`
        # @return [Fixnum]
        attr_accessor :page_start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_end = args[:page_end] if args.key?(:page_end)
          @page_start = args[:page_start] if args.key?(:page_start)
        end
      end
      
      # Cloud SQL source import data from.
      class GoogleCloudDiscoveryengineV1CloudSqlSource
        include Google::Apis::Core::Hashable
      
        # Required. The Cloud SQL database to copy the data from with a length limit of
        # 256 characters.
        # Corresponds to the JSON property `databaseId`
        # @return [String]
        attr_accessor :database_id
      
        # Intermediate Cloud Storage directory used for the import with a length limit
        # of 2,000 characters. Can be specified if one wants to have the Cloud SQL
        # export to a specific Cloud Storage directory. Ensure that the Cloud SQL
        # service account has the necessary Cloud Storage Admin permissions to access
        # the specified Cloud Storage directory.
        # Corresponds to the JSON property `gcsStagingDir`
        # @return [String]
        attr_accessor :gcs_staging_dir
      
        # Required. The Cloud SQL instance to copy the data from with a length limit of
        # 256 characters.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # Option for serverless export. Enabling this option will incur additional cost.
        # More info can be found [here](https://cloud.google.com/sql/pricing#serverless).
        # Corresponds to the JSON property `offload`
        # @return [Boolean]
        attr_accessor :offload
        alias_method :offload?, :offload
      
        # The project ID that contains the Cloud SQL source. Has a length limit of 128
        # characters. If not specified, inherits the project ID from the parent request.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Required. The Cloud SQL table to copy the data from with a length limit of 256
        # characters.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @database_id = args[:database_id] if args.key?(:database_id)
          @gcs_staging_dir = args[:gcs_staging_dir] if args.key?(:gcs_staging_dir)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @offload = args[:offload] if args.key?(:offload)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Configurations used to enable CMEK data encryption with Cloud KMS keys.
      class GoogleCloudDiscoveryengineV1CmekConfig
        include Google::Apis::Core::Hashable
      
        # Output only. The default CmekConfig for the Customer.
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # Kms key resource name which will be used to encrypt resources `projects/`
        # project`/locations/`location`/keyRings/`keyRing`/cryptoKeys/`keyId``.
        # Corresponds to the JSON property `kmsKey`
        # @return [String]
        attr_accessor :kms_key
      
        # Kms key version resource name which will be used to encrypt resources `/
        # cryptoKeyVersions/`keyVersion``.
        # Corresponds to the JSON property `kmsKeyVersion`
        # @return [String]
        attr_accessor :kms_key_version
      
        # Output only. The timestamp of the last key rotation.
        # Corresponds to the JSON property `lastRotationTimestampMicros`
        # @return [Fixnum]
        attr_accessor :last_rotation_timestamp_micros
      
        # Required. Name of the CmekConfig, of the form `projects/`project`/locations/`
        # location`/cmekConfig` or `projects/`project`/locations/`location`/cmekConfigs/`
        # cmekConfig``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Single-regional CMEKs that are required for some VAIS features.
        # Corresponds to the JSON property `singleRegionKeys`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SingleRegionKey>]
        attr_accessor :single_region_keys
      
        # Output only. State of the CmekConfig.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_default = args[:is_default] if args.key?(:is_default)
          @kms_key = args[:kms_key] if args.key?(:kms_key)
          @kms_key_version = args[:kms_key_version] if args.key?(:kms_key_version)
          @last_rotation_timestamp_micros = args[:last_rotation_timestamp_micros] if args.key?(:last_rotation_timestamp_micros)
          @name = args[:name] if args.key?(:name)
          @single_region_keys = args[:single_region_keys] if args.key?(:single_region_keys)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Response message for CompletionService.CompleteQuery method.
      class GoogleCloudDiscoveryengineV1CompleteQueryResponse
        include Google::Apis::Core::Hashable
      
        # Results of the matched query suggestions. The result list is ordered and the
        # first result is a top suggestion.
        # Corresponds to the JSON property `querySuggestions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CompleteQueryResponseQuerySuggestion>]
        attr_accessor :query_suggestions
      
        # True if the returned suggestions are all tail suggestions. For tail matching
        # to be triggered, include_tail_suggestions in the request must be true and
        # there must be no suggestions that match the full query.
        # Corresponds to the JSON property `tailMatchTriggered`
        # @return [Boolean]
        attr_accessor :tail_match_triggered
        alias_method :tail_match_triggered?, :tail_match_triggered
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_suggestions = args[:query_suggestions] if args.key?(:query_suggestions)
          @tail_match_triggered = args[:tail_match_triggered] if args.key?(:tail_match_triggered)
        end
      end
      
      # Suggestions as search queries.
      class GoogleCloudDiscoveryengineV1CompleteQueryResponseQuerySuggestion
        include Google::Apis::Core::Hashable
      
        # The unique document field paths that serve as the source of this suggestion if
        # it was generated from completable fields. This field is only populated for the
        # document-completable model.
        # Corresponds to the JSON property `completableFieldPaths`
        # @return [Array<String>]
        attr_accessor :completable_field_paths
      
        # The suggestion for the query.
        # Corresponds to the JSON property `suggestion`
        # @return [String]
        attr_accessor :suggestion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @completable_field_paths = args[:completable_field_paths] if args.key?(:completable_field_paths)
          @suggestion = args[:suggestion] if args.key?(:suggestion)
        end
      end
      
      # Detailed completion information including completion attribution token and
      # clicked completion info.
      class GoogleCloudDiscoveryengineV1CompletionInfo
        include Google::Apis::Core::Hashable
      
        # End user selected CompleteQueryResponse.QuerySuggestion.suggestion position,
        # starting from 0.
        # Corresponds to the JSON property `selectedPosition`
        # @return [Fixnum]
        attr_accessor :selected_position
      
        # End user selected CompleteQueryResponse.QuerySuggestion.suggestion.
        # Corresponds to the JSON property `selectedSuggestion`
        # @return [String]
        attr_accessor :selected_suggestion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selected_position = args[:selected_position] if args.key?(:selected_position)
          @selected_suggestion = args[:selected_suggestion] if args.key?(:selected_suggestion)
        end
      end
      
      # Autocomplete suggestions that are imported from Customer.
      class GoogleCloudDiscoveryengineV1CompletionSuggestion
        include Google::Apis::Core::Hashable
      
        # Alternative matching phrases for this suggestion.
        # Corresponds to the JSON property `alternativePhrases`
        # @return [Array<String>]
        attr_accessor :alternative_phrases
      
        # Frequency of this suggestion. Will be used to rank suggestions when score is
        # not available.
        # Corresponds to the JSON property `frequency`
        # @return [Fixnum]
        attr_accessor :frequency
      
        # Global score of this suggestion. Control how this suggestion would be scored /
        # ranked.
        # Corresponds to the JSON property `globalScore`
        # @return [Float]
        attr_accessor :global_score
      
        # If two suggestions have the same groupId, they will not be returned together.
        # Instead the one ranked higher will be returned. This can be used to
        # deduplicate semantically identical suggestions.
        # Corresponds to the JSON property `groupId`
        # @return [String]
        attr_accessor :group_id
      
        # The score of this suggestion within its group.
        # Corresponds to the JSON property `groupScore`
        # @return [Float]
        attr_accessor :group_score
      
        # BCP-47 language code of this suggestion.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Required. The suggestion text.
        # Corresponds to the JSON property `suggestion`
        # @return [String]
        attr_accessor :suggestion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_phrases = args[:alternative_phrases] if args.key?(:alternative_phrases)
          @frequency = args[:frequency] if args.key?(:frequency)
          @global_score = args[:global_score] if args.key?(:global_score)
          @group_id = args[:group_id] if args.key?(:group_id)
          @group_score = args[:group_score] if args.key?(:group_score)
          @language_code = args[:language_code] if args.key?(:language_code)
          @suggestion = args[:suggestion] if args.key?(:suggestion)
        end
      end
      
      # Defines circumstances to be checked before allowing a behavior
      class GoogleCloudDiscoveryengineV1Condition
        include Google::Apis::Core::Hashable
      
        # Range of time(s) specifying when condition is active. Maximum of 10 time
        # ranges.
        # Corresponds to the JSON property `activeTimeRange`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ConditionTimeRange>]
        attr_accessor :active_time_range
      
        # Optional. Query regex to match the whole search query. Cannot be set when
        # Condition.query_terms is set. This is currently supporting promotion use case.
        # Corresponds to the JSON property `queryRegex`
        # @return [String]
        attr_accessor :query_regex
      
        # Search only A list of terms to match the query on. Cannot be set when
        # Condition.query_regex is set. Maximum of 10 query terms.
        # Corresponds to the JSON property `queryTerms`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ConditionQueryTerm>]
        attr_accessor :query_terms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_time_range = args[:active_time_range] if args.key?(:active_time_range)
          @query_regex = args[:query_regex] if args.key?(:query_regex)
          @query_terms = args[:query_terms] if args.key?(:query_terms)
        end
      end
      
      # Matcher for search request query
      class GoogleCloudDiscoveryengineV1ConditionQueryTerm
        include Google::Apis::Core::Hashable
      
        # Whether the search query needs to exactly match the query term.
        # Corresponds to the JSON property `fullMatch`
        # @return [Boolean]
        attr_accessor :full_match
        alias_method :full_match?, :full_match
      
        # The specific query value to match against Must be lowercase, must be UTF-8.
        # Can have at most 3 space separated terms if full_match is true. Cannot be an
        # empty string. Maximum length of 5000 characters.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_match = args[:full_match] if args.key?(:full_match)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Used for time-dependent conditions.
      class GoogleCloudDiscoveryengineV1ConditionTimeRange
        include Google::Apis::Core::Hashable
      
        # End of time range. Range is inclusive. Must be in the future.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Start of time range. Range is inclusive.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Defines a conditioned behavior to employ during serving. Must be attached to a
      # ServingConfig to be considered at serving time. Permitted actions dependent on
      # `SolutionType`.
      class GoogleCloudDiscoveryengineV1Control
        include Google::Apis::Core::Hashable
      
        # Output only. List of all ServingConfig IDs this control is attached to. May
        # take up to 10 minutes to update after changes.
        # Corresponds to the JSON property `associatedServingConfigIds`
        # @return [Array<String>]
        attr_accessor :associated_serving_config_ids
      
        # Adjusts order of products in returned list.
        # Corresponds to the JSON property `boostAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ControlBoostAction]
        attr_accessor :boost_action
      
        # Determines when the associated action will trigger. Omit to always apply the
        # action. Currently only a single condition may be specified. Otherwise an
        # INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Condition>]
        attr_accessor :conditions
      
        # Required. Human readable name. The identifier used in UI views. Must be UTF-8
        # encoded string. Length limit is 128 characters. Otherwise an INVALID ARGUMENT
        # error is thrown.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Specified which products may be included in results. Uses same filter as boost.
        # Corresponds to the JSON property `filterAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ControlFilterAction]
        attr_accessor :filter_action
      
        # Immutable. Fully qualified name `projects/*/locations/global/dataStore/*/
        # controls/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Promote certain links based on some trigger queries. Example: Promote shoe
        # store link when searching for `shoe` keyword. The link can be outside of
        # associated data store.
        # Corresponds to the JSON property `promoteAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ControlPromoteAction]
        attr_accessor :promote_action
      
        # Redirects a shopper to the provided URI.
        # Corresponds to the JSON property `redirectAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ControlRedirectAction]
        attr_accessor :redirect_action
      
        # Required. Immutable. What solution the control belongs to. Must be compatible
        # with vertical of resource. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Creates a set of terms that will act as synonyms of one another. Example: "
        # happy" will also be considered as "glad", "glad" will also be considered as "
        # happy".
        # Corresponds to the JSON property `synonymsAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ControlSynonymsAction]
        attr_accessor :synonyms_action
      
        # Specifies the use case for the control. Affects what condition fields can be
        # set. Only applies to SOLUTION_TYPE_SEARCH. Currently only allow one use case
        # per control. Must be set when solution_type is SolutionType.
        # SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `useCases`
        # @return [Array<String>]
        attr_accessor :use_cases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @associated_serving_config_ids = args[:associated_serving_config_ids] if args.key?(:associated_serving_config_ids)
          @boost_action = args[:boost_action] if args.key?(:boost_action)
          @conditions = args[:conditions] if args.key?(:conditions)
          @display_name = args[:display_name] if args.key?(:display_name)
          @filter_action = args[:filter_action] if args.key?(:filter_action)
          @name = args[:name] if args.key?(:name)
          @promote_action = args[:promote_action] if args.key?(:promote_action)
          @redirect_action = args[:redirect_action] if args.key?(:redirect_action)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @synonyms_action = args[:synonyms_action] if args.key?(:synonyms_action)
          @use_cases = args[:use_cases] if args.key?(:use_cases)
        end
      end
      
      # Adjusts order of products in returned list.
      class GoogleCloudDiscoveryengineV1ControlBoostAction
        include Google::Apis::Core::Hashable
      
        # Required. Strength of the boost, which should be in [-1, 1]. Negative boost
        # means demotion. Default is 0.0 (No-op).
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Required. Specifies which data store's documents can be boosted by this
        # control. Full data store name e.g. projects/123/locations/global/collections/
        # default_collection/dataStores/default_data_store
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Required. Specifies which products to apply the boost to. If no filter is
        # provided all products will be boosted (No-op). Syntax documentation: https://
        # cloud.google.com/retail/docs/filter-and-order Maximum length is 5000
        # characters. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Specified which products may be included in results. Uses same filter as boost.
      class GoogleCloudDiscoveryengineV1ControlFilterAction
        include Google::Apis::Core::Hashable
      
        # Required. Specifies which data store's documents can be filtered by this
        # control. Full data store name e.g. projects/123/locations/global/collections/
        # default_collection/dataStores/default_data_store
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Required. A filter to apply on the matching condition results. Required Syntax
        # documentation: https://cloud.google.com/retail/docs/filter-and-order Maximum
        # length is 5000 characters. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Promote certain links based on some trigger queries. Example: Promote shoe
      # store link when searching for `shoe` keyword. The link can be outside of
      # associated data store.
      class GoogleCloudDiscoveryengineV1ControlPromoteAction
        include Google::Apis::Core::Hashable
      
        # Required. Data store with which this promotion is attached to.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Promotion proto includes uri and other helping information to display the
        # promotion.
        # Corresponds to the JSON property `searchLinkPromotion`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchLinkPromotion]
        attr_accessor :search_link_promotion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @search_link_promotion = args[:search_link_promotion] if args.key?(:search_link_promotion)
        end
      end
      
      # Redirects a shopper to the provided URI.
      class GoogleCloudDiscoveryengineV1ControlRedirectAction
        include Google::Apis::Core::Hashable
      
        # Required. The URI to which the shopper will be redirected. Required. URI must
        # have length equal or less than 2000 characters. Otherwise an INVALID ARGUMENT
        # error is thrown.
        # Corresponds to the JSON property `redirectUri`
        # @return [String]
        attr_accessor :redirect_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @redirect_uri = args[:redirect_uri] if args.key?(:redirect_uri)
        end
      end
      
      # Creates a set of terms that will act as synonyms of one another. Example: "
      # happy" will also be considered as "glad", "glad" will also be considered as "
      # happy".
      class GoogleCloudDiscoveryengineV1ControlSynonymsAction
        include Google::Apis::Core::Hashable
      
        # Defines a set of synonyms. Can specify up to 100 synonyms. Must specify at
        # least 2 synonyms. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
        end
      end
      
      # External conversation proto definition.
      class GoogleCloudDiscoveryengineV1Conversation
        include Google::Apis::Core::Hashable
      
        # Output only. The time the conversation finished.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Conversation messages.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ConversationMessage>]
        attr_accessor :messages
      
        # Immutable. Fully qualified name `projects/`project`/locations/global/
        # collections/`collection`/dataStore/*/conversations/*` or `projects/`project`/
        # locations/global/collections/`collection`/engines/*/conversations/*`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time the conversation started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The state of the Conversation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # A unique identifier for tracking users.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @messages = args[:messages] if args.key?(:messages)
          @name = args[:name] if args.key?(:name)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Defines context of the conversation
      class GoogleCloudDiscoveryengineV1ConversationContext
        include Google::Apis::Core::Hashable
      
        # The current active document the user opened. It contains the document resource
        # reference.
        # Corresponds to the JSON property `activeDocument`
        # @return [String]
        attr_accessor :active_document
      
        # The current list of documents the user is seeing. It contains the document
        # resource references.
        # Corresponds to the JSON property `contextDocuments`
        # @return [Array<String>]
        attr_accessor :context_documents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_document = args[:active_document] if args.key?(:active_document)
          @context_documents = args[:context_documents] if args.key?(:context_documents)
        end
      end
      
      # Defines a conversation message.
      class GoogleCloudDiscoveryengineV1ConversationMessage
        include Google::Apis::Core::Hashable
      
        # Output only. Message creation timestamp.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Defines a reply message to user.
        # Corresponds to the JSON property `reply`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Reply]
        attr_accessor :reply
      
        # Defines text input.
        # Corresponds to the JSON property `userInput`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TextInput]
        attr_accessor :user_input
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @reply = args[:reply] if args.key?(:reply)
          @user_input = args[:user_input] if args.key?(:user_input)
        end
      end
      
      # Request message for ConversationalSearchService.ConverseConversation method.
      class GoogleCloudDiscoveryengineV1ConverseConversationRequest
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # External conversation proto definition.
        # Corresponds to the JSON property `conversation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Conversation]
        attr_accessor :conversation
      
        # The filter syntax consists of an expression language for constructing a
        # predicate from one or more fields of the documents being filtered. Filter
        # expression is case-sensitive. This will be used to filter search results which
        # may affect the summary response. If this field is unrecognizable, an `
        # INVALID_ARGUMENT` is returned. Filtering in Vertex AI Search is done by
        # mapping the LHS filter key to a key property defined in the Vertex AI Search
        # backend -- this mapping is defined by the customer in their schema. For
        # example a media customer might have a field 'name' in their schema. In this
        # case the filter would look like this: filter --> name:'ANY("king kong")' For
        # more information about filtering including syntax and filter operators, see [
        # Filter](https://cloud.google.com/generative-ai-app-builder/docs/filter-search-
        # metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Defines text input.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TextInput]
        attr_accessor :query
      
        # Whether to turn on safe search.
        # Corresponds to the JSON property `safeSearch`
        # @return [Boolean]
        attr_accessor :safe_search
        alias_method :safe_search?, :safe_search
      
        # The resource name of the Serving Config to use. Format: `projects/`project`/
        # locations/`location`/collections/`collection`/dataStores/`data_store_id`/
        # servingConfigs/`serving_config_id`` If this is not set, the default serving
        # config will be used.
        # Corresponds to the JSON property `servingConfig`
        # @return [String]
        attr_accessor :serving_config
      
        # A specification for configuring a summary returned in a search response.
        # Corresponds to the JSON property `summarySpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpec]
        attr_accessor :summary_spec
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @conversation = args[:conversation] if args.key?(:conversation)
          @filter = args[:filter] if args.key?(:filter)
          @query = args[:query] if args.key?(:query)
          @safe_search = args[:safe_search] if args.key?(:safe_search)
          @serving_config = args[:serving_config] if args.key?(:serving_config)
          @summary_spec = args[:summary_spec] if args.key?(:summary_spec)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # Response message for ConversationalSearchService.ConverseConversation method.
      class GoogleCloudDiscoveryengineV1ConverseConversationResponse
        include Google::Apis::Core::Hashable
      
        # External conversation proto definition.
        # Corresponds to the JSON property `conversation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Conversation]
        attr_accessor :conversation
      
        # Defines a reply message to user.
        # Corresponds to the JSON property `reply`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Reply]
        attr_accessor :reply
      
        # Search Results.
        # Corresponds to the JSON property `searchResults`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSearchResult>]
        attr_accessor :search_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversation = args[:conversation] if args.key?(:conversation)
          @reply = args[:reply] if args.key?(:reply)
          @search_results = args[:search_results] if args.key?(:search_results)
        end
      end
      
      # Metadata related to the progress of the DataStoreService.CreateDataStore
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1CreateDataStoreMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the EngineService.CreateEngine operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1CreateEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for Create Schema LRO.
      class GoogleCloudDiscoveryengineV1CreateSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # CreateTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1CreateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for SiteSearchEngineService.CreateTargetSite method.
      class GoogleCloudDiscoveryengineV1CreateTargetSiteRequest
        include Google::Apis::Core::Hashable
      
        # Required. Parent resource name of TargetSite, such as `projects/`project`/
        # locations/`location`/collections/`collection`/dataStores/`data_store`/
        # siteSearchEngine`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # A target site for the SiteSearchEngine.
        # Corresponds to the JSON property `targetSite`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TargetSite]
        attr_accessor :target_site
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
          @target_site = args[:target_site] if args.key?(:target_site)
        end
      end
      
      # A custom attribute that is not explicitly modeled in a resource, e.g.
      # UserEvent.
      class GoogleCloudDiscoveryengineV1CustomAttribute
        include Google::Apis::Core::Hashable
      
        # The numerical values of this custom attribute. For example, `[2.3, 15.4]` when
        # the key is "lengths_cm". Exactly one of CustomAttribute.text or
        # CustomAttribute.numbers should be set. Otherwise, an `INVALID_ARGUMENT` error
        # is returned.
        # Corresponds to the JSON property `numbers`
        # @return [Array<Float>]
        attr_accessor :numbers
      
        # The textual values of this custom attribute. For example, `["yellow", "green"]`
        # when the key is "color". Empty string is not allowed. Otherwise, an `
        # INVALID_ARGUMENT` error is returned. Exactly one of CustomAttribute.text or
        # CustomAttribute.numbers should be set. Otherwise, an `INVALID_ARGUMENT` error
        # is returned.
        # Corresponds to the JSON property `text`
        # @return [Array<String>]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @numbers = args[:numbers] if args.key?(:numbers)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Metadata that describes a custom tuned model.
      class GoogleCloudDiscoveryengineV1CustomTuningModel
        include Google::Apis::Core::Hashable
      
        # Deprecated: Timestamp the Model was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The display name of the model.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Currently this is only populated if the model state is `
        # INPUT_VALIDATION_FAILED`.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # The metrics of the trained model.
        # Corresponds to the JSON property `metrics`
        # @return [Hash<String,Float>]
        attr_accessor :metrics
      
        # The state that the model is in (e.g.`TRAINING` or `TRAINING_FAILED`).
        # Corresponds to the JSON property `modelState`
        # @return [String]
        attr_accessor :model_state
      
        # The version of the model.
        # Corresponds to the JSON property `modelVersion`
        # @return [Fixnum]
        attr_accessor :model_version
      
        # Required. The fully qualified resource name of the model. Format: `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # customTuningModels/`custom_tuning_model``. Model must be an alpha-numerical
        # string with limit of 40 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Timestamp the model training was initiated.
        # Corresponds to the JSON property `trainingStartTime`
        # @return [String]
        attr_accessor :training_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @display_name = args[:display_name] if args.key?(:display_name)
          @error_message = args[:error_message] if args.key?(:error_message)
          @metrics = args[:metrics] if args.key?(:metrics)
          @model_state = args[:model_state] if args.key?(:model_state)
          @model_version = args[:model_version] if args.key?(:model_version)
          @name = args[:name] if args.key?(:name)
          @training_start_time = args[:training_start_time] if args.key?(:training_start_time)
        end
      end
      
      # DataStore captures global settings and configs at the DataStore level.
      class GoogleCloudDiscoveryengineV1DataStore
        include Google::Apis::Core::Hashable
      
        # Configuration data for advance site search.
        # Corresponds to the JSON property `advancedSiteSearchConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AdvancedSiteSearchConfig]
        attr_accessor :advanced_site_search_config
      
        # Estimation of data size per data store.
        # Corresponds to the JSON property `billingEstimation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DataStoreBillingEstimation]
        attr_accessor :billing_estimation
      
        # Configurations used to enable CMEK data encryption with Cloud KMS keys.
        # Corresponds to the JSON property `cmekConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CmekConfig]
        attr_accessor :cmek_config
      
        # Immutable. The content config of the data store. If this field is unset, the
        # server behavior defaults to ContentConfig.NO_CONTENT.
        # Corresponds to the JSON property `contentConfig`
        # @return [String]
        attr_accessor :content_config
      
        # Output only. Timestamp the DataStore was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The id of the default Schema asscociated to this data store.
        # Corresponds to the JSON property `defaultSchemaId`
        # @return [String]
        attr_accessor :default_schema_id
      
        # Required. The data store display name. This field must be a UTF-8 encoded
        # string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT
        # error is returned.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A singleton resource of DataStore. If it's empty when DataStore is created and
        # DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED, the default
        # parser will default to digital parser.
        # Corresponds to the JSON property `documentProcessingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfig]
        attr_accessor :document_processing_config
      
        # Immutable. The industry vertical that the data store registers.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Optional. If set, this DataStore is an Infobot FAQ DataStore.
        # Corresponds to the JSON property `isInfobotFaqDataStore`
        # @return [Boolean]
        attr_accessor :is_infobot_faq_data_store
        alias_method :is_infobot_faq_data_store?, :is_infobot_faq_data_store
      
        # Input only. The KMS key to be used to protect this DataStore at creation time.
        # Must be set for requests that need to comply with CMEK Org Policy protections.
        # If this field is set and processed successfully, the DataStore will be
        # protected by the KMS key, as indicated in the cmek_config field.
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        # Immutable. The full resource name of the data store. Format: `projects/`
        # project`/locations/`location`/collections/`collection_id`/dataStores/`
        # data_store_id``. This field must be a UTF-8 encoded string with a length limit
        # of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Stores information regarding the serving configurations at DataStore level.
        # Corresponds to the JSON property `servingConfigDataStore`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DataStoreServingConfigDataStore]
        attr_accessor :serving_config_data_store
      
        # The solutions that the data store enrolls. Available solutions for each
        # industry_vertical: * `MEDIA`: `SOLUTION_TYPE_RECOMMENDATION` and `
        # SOLUTION_TYPE_SEARCH`. * `SITE_SEARCH`: `SOLUTION_TYPE_SEARCH` is
        # automatically enrolled. Other solutions cannot be enrolled.
        # Corresponds to the JSON property `solutionTypes`
        # @return [Array<String>]
        attr_accessor :solution_types
      
        # Defines the structure and layout of a type of document data.
        # Corresponds to the JSON property `startingSchema`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Schema]
        attr_accessor :starting_schema
      
        # Config to store data store type configuration for workspace data
        # Corresponds to the JSON property `workspaceConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1WorkspaceConfig]
        attr_accessor :workspace_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advanced_site_search_config = args[:advanced_site_search_config] if args.key?(:advanced_site_search_config)
          @billing_estimation = args[:billing_estimation] if args.key?(:billing_estimation)
          @cmek_config = args[:cmek_config] if args.key?(:cmek_config)
          @content_config = args[:content_config] if args.key?(:content_config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @default_schema_id = args[:default_schema_id] if args.key?(:default_schema_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @document_processing_config = args[:document_processing_config] if args.key?(:document_processing_config)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @is_infobot_faq_data_store = args[:is_infobot_faq_data_store] if args.key?(:is_infobot_faq_data_store)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
          @name = args[:name] if args.key?(:name)
          @serving_config_data_store = args[:serving_config_data_store] if args.key?(:serving_config_data_store)
          @solution_types = args[:solution_types] if args.key?(:solution_types)
          @starting_schema = args[:starting_schema] if args.key?(:starting_schema)
          @workspace_config = args[:workspace_config] if args.key?(:workspace_config)
        end
      end
      
      # Estimation of data size per data store.
      class GoogleCloudDiscoveryengineV1DataStoreBillingEstimation
        include Google::Apis::Core::Hashable
      
        # Data size for structured data in terms of bytes.
        # Corresponds to the JSON property `structuredDataSize`
        # @return [Fixnum]
        attr_accessor :structured_data_size
      
        # Last updated timestamp for structured data.
        # Corresponds to the JSON property `structuredDataUpdateTime`
        # @return [String]
        attr_accessor :structured_data_update_time
      
        # Data size for unstructured data in terms of bytes.
        # Corresponds to the JSON property `unstructuredDataSize`
        # @return [Fixnum]
        attr_accessor :unstructured_data_size
      
        # Last updated timestamp for unstructured data.
        # Corresponds to the JSON property `unstructuredDataUpdateTime`
        # @return [String]
        attr_accessor :unstructured_data_update_time
      
        # Data size for websites in terms of bytes.
        # Corresponds to the JSON property `websiteDataSize`
        # @return [Fixnum]
        attr_accessor :website_data_size
      
        # Last updated timestamp for websites.
        # Corresponds to the JSON property `websiteDataUpdateTime`
        # @return [String]
        attr_accessor :website_data_update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @structured_data_size = args[:structured_data_size] if args.key?(:structured_data_size)
          @structured_data_update_time = args[:structured_data_update_time] if args.key?(:structured_data_update_time)
          @unstructured_data_size = args[:unstructured_data_size] if args.key?(:unstructured_data_size)
          @unstructured_data_update_time = args[:unstructured_data_update_time] if args.key?(:unstructured_data_update_time)
          @website_data_size = args[:website_data_size] if args.key?(:website_data_size)
          @website_data_update_time = args[:website_data_update_time] if args.key?(:website_data_update_time)
        end
      end
      
      # Stores information regarding the serving configurations at DataStore level.
      class GoogleCloudDiscoveryengineV1DataStoreServingConfigDataStore
        include Google::Apis::Core::Hashable
      
        # If set true, the DataStore will not be available for serving search requests.
        # Corresponds to the JSON property `disabledForServing`
        # @return [Boolean]
        attr_accessor :disabled_for_serving
        alias_method :disabled_for_serving?, :disabled_for_serving
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled_for_serving = args[:disabled_for_serving] if args.key?(:disabled_for_serving)
        end
      end
      
      # Metadata related to the progress of the DataStoreService.DeleteDataStore
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1DeleteDataStoreMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the EngineService.DeleteEngine operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1DeleteEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for DeleteSchema LRO.
      class GoogleCloudDiscoveryengineV1DeleteSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # DeleteTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1DeleteTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # DisableAdvancedSiteSearch operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1DisableAdvancedSiteSearchMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for SiteSearchEngineService.DisableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1DisableAdvancedSiteSearchRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response message for SiteSearchEngineService.DisableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1DisableAdvancedSiteSearchResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Document captures all raw metadata information of items to be recommended or
      # searched.
      class GoogleCloudDiscoveryengineV1Document
        include Google::Apis::Core::Hashable
      
        # Unstructured data linked to this document.
        # Corresponds to the JSON property `content`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentContent]
        attr_accessor :content
      
        # Output only. This field is OUTPUT_ONLY. It contains derived data that are not
        # in the original input document.
        # Corresponds to the JSON property `derivedStructData`
        # @return [Hash<String,Object>]
        attr_accessor :derived_struct_data
      
        # Immutable. The identifier of the document. Id should conform to [RFC-1034](
        # https://tools.ietf.org/html/rfc1034) standard with a length limit of 63
        # characters.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Index status of the document.
        # Corresponds to the JSON property `indexStatus`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentIndexStatus]
        attr_accessor :index_status
      
        # Output only. The last time the document was indexed. If this field is set, the
        # document could be returned in search results. This field is OUTPUT_ONLY. If
        # this field is not populated, it means the document has never been indexed.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # The JSON string representation of the document. It should conform to the
        # registered Schema or an `INVALID_ARGUMENT` error is thrown.
        # Corresponds to the JSON property `jsonData`
        # @return [String]
        attr_accessor :json_data
      
        # Immutable. The full resource name of the document. Format: `projects/`project`/
        # locations/`location`/collections/`collection`/dataStores/`data_store`/branches/
        # `branch`/documents/`document_id``. This field must be a UTF-8 encoded string
        # with a length limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The identifier of the parent document. Currently supports at most two level
        # document hierarchy. Id should conform to [RFC-1034](https://tools.ietf.org/
        # html/rfc1034) standard with a length limit of 63 characters.
        # Corresponds to the JSON property `parentDocumentId`
        # @return [String]
        attr_accessor :parent_document_id
      
        # The identifier of the schema located in the same data store.
        # Corresponds to the JSON property `schemaId`
        # @return [String]
        attr_accessor :schema_id
      
        # The structured JSON data for the document. It should conform to the registered
        # Schema or an `INVALID_ARGUMENT` error is thrown.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @derived_struct_data = args[:derived_struct_data] if args.key?(:derived_struct_data)
          @id = args[:id] if args.key?(:id)
          @index_status = args[:index_status] if args.key?(:index_status)
          @index_time = args[:index_time] if args.key?(:index_time)
          @json_data = args[:json_data] if args.key?(:json_data)
          @name = args[:name] if args.key?(:name)
          @parent_document_id = args[:parent_document_id] if args.key?(:parent_document_id)
          @schema_id = args[:schema_id] if args.key?(:schema_id)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
        end
      end
      
      # Unstructured data linked to this document.
      class GoogleCloudDiscoveryengineV1DocumentContent
        include Google::Apis::Core::Hashable
      
        # The MIME type of the content. Supported types: * `application/pdf` (PDF, only
        # native PDFs are supported for now) * `text/html` (HTML) * `application/vnd.
        # openxmlformats-officedocument.wordprocessingml.document` (DOCX) * `application/
        # vnd.openxmlformats-officedocument.presentationml.presentation` (PPTX) * `text/
        # plain` (TXT) See https://www.iana.org/assignments/media-types/media-types.
        # xhtml.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The content represented as a stream of bytes. The maximum length is 1,000,000
        # bytes (1 MB / ~0.95 MiB). Note: As with all `bytes` fields, this field is
        # represented as pure binary in Protocol Buffers and base64-encoded string in
        # JSON. For example, `abc123!?$*&()'-=@~` should be represented as `
        # YWJjMTIzIT8kKiYoKSctPUB+` in JSON. See https://developers.google.com/protocol-
        # buffers/docs/proto3#json.
        # Corresponds to the JSON property `rawBytes`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :raw_bytes
      
        # The URI of the content. Only Cloud Storage URIs (e.g. `gs://bucket-name/path/
        # to/file`) are supported. The maximum file size is 2.5 MB for text-based
        # formats, 200 MB for other formats.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @raw_bytes = args[:raw_bytes] if args.key?(:raw_bytes)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Index status of the document.
      class GoogleCloudDiscoveryengineV1DocumentIndexStatus
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while indexing the document. If this field is
        # populated, the document is not indexed due to errors.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # The time when the document was indexed. If this field is populated, it means
        # the document has been indexed.
        # Corresponds to the JSON property `indexTime`
        # @return [String]
        attr_accessor :index_time
      
        # Immutable. The message indicates the document index is in progress. If this
        # field is populated, the document index is pending.
        # Corresponds to the JSON property `pendingMessage`
        # @return [String]
        attr_accessor :pending_message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @index_time = args[:index_time] if args.key?(:index_time)
          @pending_message = args[:pending_message] if args.key?(:pending_message)
        end
      end
      
      # Detailed document information associated with a user event.
      class GoogleCloudDiscoveryengineV1DocumentInfo
        include Google::Apis::Core::Hashable
      
        # Optional. The conversion value associated with this Document. Must be set if
        # UserEvent.event_type is "conversion". For example, a value of 1000 signifies
        # that 1000 seconds were spent viewing a Document for the `watch` conversion
        # type.
        # Corresponds to the JSON property `conversionValue`
        # @return [Float]
        attr_accessor :conversion_value
      
        # The Document resource ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Output only. Whether the referenced Document can be found in the data store.
        # Corresponds to the JSON property `joined`
        # @return [Boolean]
        attr_accessor :joined
        alias_method :joined?, :joined
      
        # The Document resource full name, of the form: `projects/`project`/locations/`
        # location`/collections/`collection_id`/dataStores/`data_store_id`/branches/`
        # branch_id`/documents/`document_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The promotion IDs associated with this Document. Currently, this field is
        # restricted to at most one ID.
        # Corresponds to the JSON property `promotionIds`
        # @return [Array<String>]
        attr_accessor :promotion_ids
      
        # Quantity of the Document associated with the user event. Defaults to 1. For
        # example, this field is 2 if two quantities of the same Document are involved
        # in a `add-to-cart` event. Required for events of the following event types: * `
        # add-to-cart` * `purchase`
        # Corresponds to the JSON property `quantity`
        # @return [Fixnum]
        attr_accessor :quantity
      
        # The Document URI - only allowed for website data stores.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversion_value = args[:conversion_value] if args.key?(:conversion_value)
          @id = args[:id] if args.key?(:id)
          @joined = args[:joined] if args.key?(:joined)
          @name = args[:name] if args.key?(:name)
          @promotion_ids = args[:promotion_ids] if args.key?(:promotion_ids)
          @quantity = args[:quantity] if args.key?(:quantity)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # A singleton resource of DataStore. If it's empty when DataStore is created and
      # DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED, the default
      # parser will default to digital parser.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for chunking config.
        # Corresponds to the JSON property `chunkingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigChunkingConfig]
        attr_accessor :chunking_config
      
        # Related configurations applied to a specific type of document parser.
        # Corresponds to the JSON property `defaultParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfig]
        attr_accessor :default_parsing_config
      
        # The full resource name of the Document Processing Config. Format: `projects/*/
        # locations/*/collections/*/dataStores/*/documentProcessingConfig`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Map from file type to override the default parsing configuration based on the
        # file type. Supported keys: * `pdf`: Override parsing config for PDF files,
        # either digital parsing, ocr parsing or layout parsing is supported. * `html`:
        # Override parsing config for HTML files, only digital parsing and layout
        # parsing are supported. * `docx`: Override parsing config for DOCX files, only
        # digital parsing and layout parsing are supported. * `pptx`: Override parsing
        # config for PPTX files, only digital parsing and layout parsing are supported. *
        # `xlsm`: Override parsing config for XLSM files, only digital parsing and
        # layout parsing are supported. * `xlsx`: Override parsing config for XLSX files,
        # only digital parsing and layout parsing are supported.
        # Corresponds to the JSON property `parsingConfigOverrides`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfig>]
        attr_accessor :parsing_config_overrides
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunking_config = args[:chunking_config] if args.key?(:chunking_config)
          @default_parsing_config = args[:default_parsing_config] if args.key?(:default_parsing_config)
          @name = args[:name] if args.key?(:name)
          @parsing_config_overrides = args[:parsing_config_overrides] if args.key?(:parsing_config_overrides)
        end
      end
      
      # Configuration for chunking config.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfigChunkingConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for the layout based chunking.
        # Corresponds to the JSON property `layoutBasedChunkingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigChunkingConfigLayoutBasedChunkingConfig]
        attr_accessor :layout_based_chunking_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @layout_based_chunking_config = args[:layout_based_chunking_config] if args.key?(:layout_based_chunking_config)
        end
      end
      
      # Configuration for the layout based chunking.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfigChunkingConfigLayoutBasedChunkingConfig
        include Google::Apis::Core::Hashable
      
        # The token size limit for each chunk. Supported values: 100-500 (inclusive).
        # Default value: 500.
        # Corresponds to the JSON property `chunkSize`
        # @return [Fixnum]
        attr_accessor :chunk_size
      
        # Whether to include appending different levels of headings to chunks from the
        # middle of the document to prevent context loss. Default value: False.
        # Corresponds to the JSON property `includeAncestorHeadings`
        # @return [Boolean]
        attr_accessor :include_ancestor_headings
        alias_method :include_ancestor_headings?, :include_ancestor_headings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_size = args[:chunk_size] if args.key?(:chunk_size)
          @include_ancestor_headings = args[:include_ancestor_headings] if args.key?(:include_ancestor_headings)
        end
      end
      
      # Related configurations applied to a specific type of document parser.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfig
        include Google::Apis::Core::Hashable
      
        # The digital parsing configurations for documents.
        # Corresponds to the JSON property `digitalParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfigDigitalParsingConfig]
        attr_accessor :digital_parsing_config
      
        # The layout parsing configurations for documents.
        # Corresponds to the JSON property `layoutParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfigLayoutParsingConfig]
        attr_accessor :layout_parsing_config
      
        # The OCR parsing configurations for documents.
        # Corresponds to the JSON property `ocrParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfigOcrParsingConfig]
        attr_accessor :ocr_parsing_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digital_parsing_config = args[:digital_parsing_config] if args.key?(:digital_parsing_config)
          @layout_parsing_config = args[:layout_parsing_config] if args.key?(:layout_parsing_config)
          @ocr_parsing_config = args[:ocr_parsing_config] if args.key?(:ocr_parsing_config)
        end
      end
      
      # The digital parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfigDigitalParsingConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The layout parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfigLayoutParsingConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The OCR parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1DocumentProcessingConfigParsingConfigOcrParsingConfig
        include Google::Apis::Core::Hashable
      
        # [DEPRECATED] This field is deprecated. To use the additional enhanced document
        # elements processing, please switch to `layout_parsing_config`.
        # Corresponds to the JSON property `enhancedDocumentElements`
        # @return [Array<String>]
        attr_accessor :enhanced_document_elements
      
        # If true, will use native text instead of OCR text on pages containing native
        # text.
        # Corresponds to the JSON property `useNativeText`
        # @return [Boolean]
        attr_accessor :use_native_text
        alias_method :use_native_text?, :use_native_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enhanced_document_elements = args[:enhanced_document_elements] if args.key?(:enhanced_document_elements)
          @use_native_text = args[:use_native_text] if args.key?(:use_native_text)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # EnableAdvancedSiteSearch operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1EnableAdvancedSiteSearchMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for SiteSearchEngineService.EnableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1EnableAdvancedSiteSearchRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response message for SiteSearchEngineService.EnableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1EnableAdvancedSiteSearchResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata that describes the training and serving parameters of an Engine.
      class GoogleCloudDiscoveryengineV1Engine
        include Google::Apis::Core::Hashable
      
        # Configurations for a Chat Engine.
        # Corresponds to the JSON property `chatEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1EngineChatEngineConfig]
        attr_accessor :chat_engine_config
      
        # Additional information of a Chat Engine. Fields in this message are output
        # only.
        # Corresponds to the JSON property `chatEngineMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1EngineChatEngineMetadata]
        attr_accessor :chat_engine_metadata
      
        # Common configurations for an Engine.
        # Corresponds to the JSON property `commonConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1EngineCommonConfig]
        attr_accessor :common_config
      
        # Output only. Timestamp the Recommendation Engine was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The data stores associated with this engine. For SOLUTION_TYPE_SEARCH and
        # SOLUTION_TYPE_RECOMMENDATION type of engines, they can only associate with at
        # most one data store. If solution_type is SOLUTION_TYPE_CHAT, multiple
        # DataStores in the same Collection can be associated here. Note that when used
        # in CreateEngineRequest, one DataStore id must be provided as the system will
        # use it for necessary initializations.
        # Corresponds to the JSON property `dataStoreIds`
        # @return [Array<String>]
        attr_accessor :data_store_ids
      
        # Optional. Whether to disable analytics for searches performed on this engine.
        # Corresponds to the JSON property `disableAnalytics`
        # @return [Boolean]
        attr_accessor :disable_analytics
        alias_method :disable_analytics?, :disable_analytics
      
        # Required. The display name of the engine. Should be human readable. UTF-8
        # encoded string with limit of 1024 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The industry vertical that the engine registers. The restriction of the Engine
        # industry vertical is based on DataStore: Vertical on Engine has to match
        # vertical of the DataStore linked to the engine.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Immutable. The fully qualified resource name of the engine. This field must be
        # a UTF-8 encoded string with a length limit of 1024 characters. Format: `
        # projects/`project`/locations/`location`/collections/`collection`/engines/`
        # engine`` engine should be 1-63 characters, and valid characters are /a-z0-9*/.
        # Otherwise, an INVALID_ARGUMENT error is returned.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configurations for a Search Engine.
        # Corresponds to the JSON property `searchEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1EngineSearchEngineConfig]
        attr_accessor :search_engine_config
      
        # Required. The solutions of the engine.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Output only. Timestamp the Recommendation Engine was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chat_engine_config = args[:chat_engine_config] if args.key?(:chat_engine_config)
          @chat_engine_metadata = args[:chat_engine_metadata] if args.key?(:chat_engine_metadata)
          @common_config = args[:common_config] if args.key?(:common_config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data_store_ids = args[:data_store_ids] if args.key?(:data_store_ids)
          @disable_analytics = args[:disable_analytics] if args.key?(:disable_analytics)
          @display_name = args[:display_name] if args.key?(:display_name)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @name = args[:name] if args.key?(:name)
          @search_engine_config = args[:search_engine_config] if args.key?(:search_engine_config)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Configurations for a Chat Engine.
      class GoogleCloudDiscoveryengineV1EngineChatEngineConfig
        include Google::Apis::Core::Hashable
      
        # Configurations for generating a Dialogflow agent. Note that these
        # configurations are one-time consumed by and passed to Dialogflow service. It
        # means they cannot be retrieved using EngineService.GetEngine or EngineService.
        # ListEngines API after engine creation.
        # Corresponds to the JSON property `agentCreationConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1EngineChatEngineConfigAgentCreationConfig]
        attr_accessor :agent_creation_config
      
        # The resource name of an exist Dialogflow agent to link to this Chat Engine.
        # Customers can either provide `agent_creation_config` to create agent or
        # provide an agent name that links the agent with the Chat engine. Format: `
        # projects//locations//agents/`. Note that the `dialogflow_agent_to_link` are
        # one-time consumed by and passed to Dialogflow service. It means they cannot be
        # retrieved using EngineService.GetEngine or EngineService.ListEngines API after
        # engine creation. Use ChatEngineMetadata.dialogflow_agent for actual agent
        # association after Engine is created.
        # Corresponds to the JSON property `dialogflowAgentToLink`
        # @return [String]
        attr_accessor :dialogflow_agent_to_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_creation_config = args[:agent_creation_config] if args.key?(:agent_creation_config)
          @dialogflow_agent_to_link = args[:dialogflow_agent_to_link] if args.key?(:dialogflow_agent_to_link)
        end
      end
      
      # Configurations for generating a Dialogflow agent. Note that these
      # configurations are one-time consumed by and passed to Dialogflow service. It
      # means they cannot be retrieved using EngineService.GetEngine or EngineService.
      # ListEngines API after engine creation.
      class GoogleCloudDiscoveryengineV1EngineChatEngineConfigAgentCreationConfig
        include Google::Apis::Core::Hashable
      
        # Name of the company, organization or other entity that the agent represents.
        # Used for knowledge connector LLM prompt and for knowledge search.
        # Corresponds to the JSON property `business`
        # @return [String]
        attr_accessor :business
      
        # Required. The default language of the agent as a language tag. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language) for a
        # list of the currently supported language codes.
        # Corresponds to the JSON property `defaultLanguageCode`
        # @return [String]
        attr_accessor :default_language_code
      
        # Agent location for Agent creation, supported values: global/us/eu. If not
        # provided, us Engine will create Agent using us-central-1 by default; eu Engine
        # will create Agent using eu-west-1 by default.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Required. The time zone of the agent from the [time zone database](https://www.
        # iana.org/time-zones), e.g., America/New_York, Europe/Paris.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @business = args[:business] if args.key?(:business)
          @default_language_code = args[:default_language_code] if args.key?(:default_language_code)
          @location = args[:location] if args.key?(:location)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # Additional information of a Chat Engine. Fields in this message are output
      # only.
      class GoogleCloudDiscoveryengineV1EngineChatEngineMetadata
        include Google::Apis::Core::Hashable
      
        # The resource name of a Dialogflow agent, that this Chat Engine refers to.
        # Format: `projects//locations//agents/`.
        # Corresponds to the JSON property `dialogflowAgent`
        # @return [String]
        attr_accessor :dialogflow_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dialogflow_agent = args[:dialogflow_agent] if args.key?(:dialogflow_agent)
        end
      end
      
      # Common configurations for an Engine.
      class GoogleCloudDiscoveryengineV1EngineCommonConfig
        include Google::Apis::Core::Hashable
      
        # The name of the company, business or entity that is associated with the engine.
        # Setting this may help improve LLM related features.
        # Corresponds to the JSON property `companyName`
        # @return [String]
        attr_accessor :company_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @company_name = args[:company_name] if args.key?(:company_name)
        end
      end
      
      # Configurations for a Search Engine.
      class GoogleCloudDiscoveryengineV1EngineSearchEngineConfig
        include Google::Apis::Core::Hashable
      
        # The add-on that this search engine enables.
        # Corresponds to the JSON property `searchAddOns`
        # @return [Array<String>]
        attr_accessor :search_add_ons
      
        # The search feature tier of this engine. Different tiers might have different
        # pricing. To learn more, check the pricing documentation. Defaults to
        # SearchTier.SEARCH_TIER_STANDARD if not specified.
        # Corresponds to the JSON property `searchTier`
        # @return [String]
        attr_accessor :search_tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_add_ons = args[:search_add_ons] if args.key?(:search_add_ons)
          @search_tier = args[:search_tier] if args.key?(:search_tier)
        end
      end
      
      # Fact Chunk.
      class GoogleCloudDiscoveryengineV1FactChunk
        include Google::Apis::Core::Hashable
      
        # Text content of the fact chunk. Can be at most 10K characters long.
        # Corresponds to the JSON property `chunkText`
        # @return [String]
        attr_accessor :chunk_text
      
        # The index of this chunk. Currently, only used for the streaming mode.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Source from which this fact chunk was retrieved. If it was retrieved from the
        # GroundingFacts provided in the request then this field will contain the index
        # of the specific fact from which this chunk was retrieved.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # More fine-grained information for the source reference.
        # Corresponds to the JSON property `sourceMetadata`
        # @return [Hash<String,String>]
        attr_accessor :source_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_text = args[:chunk_text] if args.key?(:chunk_text)
          @index = args[:index] if args.key?(:index)
          @source = args[:source] if args.key?(:source)
          @source_metadata = args[:source_metadata] if args.key?(:source_metadata)
        end
      end
      
      # Response message for SiteSearchEngineService.FetchDomainVerificationStatus
      # method.
      class GoogleCloudDiscoveryengineV1FetchDomainVerificationStatusResponse
        include Google::Apis::Core::Hashable
      
        # A token that can be sent as `page_token` to retrieve the next page. If this
        # field is omitted, there are no subsequent pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of TargetSites containing the site verification status.
        # Corresponds to the JSON property `targetSites`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TargetSite>]
        attr_accessor :target_sites
      
        # The total number of items matching the request. This will always be populated
        # in the response.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @target_sites = args[:target_sites] if args.key?(:target_sites)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Cloud FhirStore source import data from.
      class GoogleCloudDiscoveryengineV1FhirStoreSource
        include Google::Apis::Core::Hashable
      
        # Required. The full resource name of the FHIR store to import data from, in the
        # format of `projects/`project`/locations/`location`/datasets/`dataset`/
        # fhirStores/`fhir_store``.
        # Corresponds to the JSON property `fhirStore`
        # @return [String]
        attr_accessor :fhir_store
      
        # Intermediate Cloud Storage directory used for the import with a length limit
        # of 2,000 characters. Can be specified if one wants to have the FhirStore
        # export to a specific Cloud Storage directory.
        # Corresponds to the JSON property `gcsStagingDir`
        # @return [String]
        attr_accessor :gcs_staging_dir
      
        # The FHIR resource types to import. The resource types should be a subset of
        # all [supported FHIR resource types](https://cloud.google.com/generative-ai-app-
        # builder/docs/fhir-schema-reference#resource-level-specification). Default to
        # all supported FHIR resource types if empty.
        # Corresponds to the JSON property `resourceTypes`
        # @return [Array<String>]
        attr_accessor :resource_types
      
        # Optional. Whether to update the DataStore schema to the latest predefined
        # schema. If true, the DataStore schema will be updated to include any FHIR
        # fields or resource types that have been added since the last import and
        # corresponding FHIR resources will be imported from the FHIR store. Note this
        # field cannot be used in conjunction with `resource_types`. It should be used
        # after initial import.
        # Corresponds to the JSON property `updateFromLatestPredefinedSchema`
        # @return [Boolean]
        attr_accessor :update_from_latest_predefined_schema
        alias_method :update_from_latest_predefined_schema?, :update_from_latest_predefined_schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fhir_store = args[:fhir_store] if args.key?(:fhir_store)
          @gcs_staging_dir = args[:gcs_staging_dir] if args.key?(:gcs_staging_dir)
          @resource_types = args[:resource_types] if args.key?(:resource_types)
          @update_from_latest_predefined_schema = args[:update_from_latest_predefined_schema] if args.key?(:update_from_latest_predefined_schema)
        end
      end
      
      # Firestore source import data from.
      class GoogleCloudDiscoveryengineV1FirestoreSource
        include Google::Apis::Core::Hashable
      
        # Required. The Firestore collection (or entity) to copy the data from with a
        # length limit of 1,500 characters.
        # Corresponds to the JSON property `collectionId`
        # @return [String]
        attr_accessor :collection_id
      
        # Required. The Firestore database to copy the data from with a length limit of
        # 256 characters.
        # Corresponds to the JSON property `databaseId`
        # @return [String]
        attr_accessor :database_id
      
        # Intermediate Cloud Storage directory used for the import with a length limit
        # of 2,000 characters. Can be specified if one wants to have the Firestore
        # export to a specific Cloud Storage directory. Ensure that the Firestore
        # service account has the necessary Cloud Storage Admin permissions to access
        # the specified Cloud Storage directory.
        # Corresponds to the JSON property `gcsStagingDir`
        # @return [String]
        attr_accessor :gcs_staging_dir
      
        # The project ID that the Cloud SQL source is in with a length limit of 128
        # characters. If not specified, inherits the project ID from the parent request.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collection_id = args[:collection_id] if args.key?(:collection_id)
          @database_id = args[:database_id] if args.key?(:database_id)
          @gcs_staging_dir = args[:gcs_staging_dir] if args.key?(:gcs_staging_dir)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Cloud Storage location for input content.
      class GoogleCloudDiscoveryengineV1GcsSource
        include Google::Apis::Core::Hashable
      
        # The schema to use when parsing the data from the source. Supported values for
        # document imports: * `document` (default): One JSON Document per line. Each
        # document must have a valid Document.id. * `content`: Unstructured data (e.g.
        # PDF, HTML). Each file matched by `input_uris` becomes a document, with the ID
        # set to the first 128 bits of SHA256(URI) encoded as a hex string. * `custom`:
        # One custom data JSON per row in arbitrary format that conforms to the defined
        # Schema of the data store. This can only be used by the GENERIC Data Store
        # vertical. * `csv`: A CSV file with header conforming to the defined Schema of
        # the data store. Each entry after the header is imported as a Document. This
        # can only be used by the GENERIC Data Store vertical. Supported values for user
        # event imports: * `user_event` (default): One JSON UserEvent per line.
        # Corresponds to the JSON property `dataSchema`
        # @return [String]
        attr_accessor :data_schema
      
        # Required. Cloud Storage URIs to input files. Each URI can be up to 2000
        # characters long. URIs can match the full object path (for example, `gs://
        # bucket/directory/object.json`) or a pattern matching one or more files, such
        # as `gs://bucket/directory/*.json`. A request can contain at most 100 files (or
        # 100,000 files if `data_schema` is `content`). Each file can be up to 2 GB (or
        # 100 MB if `data_schema` is `content`).
        # Corresponds to the JSON property `inputUris`
        # @return [Array<String>]
        attr_accessor :input_uris
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_schema = args[:data_schema] if args.key?(:data_schema)
          @input_uris = args[:input_uris] if args.key?(:input_uris)
        end
      end
      
      # Top-level message sent by the client for the `GenerateGroundedContent` method.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequest
        include Google::Apis::Core::Hashable
      
        # Content of the current conversation with the model. For single-turn queries,
        # this is a single instance. For multi-turn queries, this is a repeated field
        # that contains conversation history + latest request.
        # Corresponds to the JSON property `contents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GroundedGenerationContent>]
        attr_accessor :contents
      
        # Content generation specification.
        # Corresponds to the JSON property `generationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGenerationSpec]
        attr_accessor :generation_spec
      
        # Grounding specification.
        # Corresponds to the JSON property `groundingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSpec]
        attr_accessor :grounding_spec
      
        # Base structured datatype containing multi-part content of a message.
        # Corresponds to the JSON property `systemInstruction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GroundedGenerationContent]
        attr_accessor :system_instruction
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contents = args[:contents] if args.key?(:contents)
          @generation_spec = args[:generation_spec] if args.key?(:generation_spec)
          @grounding_spec = args[:grounding_spec] if args.key?(:grounding_spec)
          @system_instruction = args[:system_instruction] if args.key?(:system_instruction)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # Describes the options to customize dynamic retrieval.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestDynamicRetrievalConfiguration
        include Google::Apis::Core::Hashable
      
        # Describes the predictor settings for dynamic retrieval.
        # Corresponds to the JSON property `predictor`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestDynamicRetrievalConfigurationDynamicRetrievalPredictor]
        attr_accessor :predictor
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @predictor = args[:predictor] if args.key?(:predictor)
        end
      end
      
      # Describes the predictor settings for dynamic retrieval.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestDynamicRetrievalConfigurationDynamicRetrievalPredictor
        include Google::Apis::Core::Hashable
      
        # The value of the threshold. If the predictor will predict a value smaller than
        # this, it would suppress grounding in the source.
        # Corresponds to the JSON property `threshold`
        # @return [Float]
        attr_accessor :threshold
      
        # The version of the predictor to be used in dynamic retrieval.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @threshold = args[:threshold] if args.key?(:threshold)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Content generation specification.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGenerationSpec
        include Google::Apis::Core::Hashable
      
        # If specified, custom value for frequency penalty will be used.
        # Corresponds to the JSON property `frequencyPenalty`
        # @return [Float]
        attr_accessor :frequency_penalty
      
        # Language code for content. Use language tags defined by [BCP47](https://www.
        # rfc-editor.org/rfc/bcp/bcp47.txt).
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # If specified, custom value for max output tokens will be used.
        # Corresponds to the JSON property `maxOutputTokens`
        # @return [Fixnum]
        attr_accessor :max_output_tokens
      
        # Specifies which Vertex model id to use for generation.
        # Corresponds to the JSON property `modelId`
        # @return [String]
        attr_accessor :model_id
      
        # If specified, custom value for presence penalty will be used.
        # Corresponds to the JSON property `presencePenalty`
        # @return [Float]
        attr_accessor :presence_penalty
      
        # If specified, custom value for the seed will be used.
        # Corresponds to the JSON property `seed`
        # @return [Fixnum]
        attr_accessor :seed
      
        # If specified, custom value for the temperature will be used.
        # Corresponds to the JSON property `temperature`
        # @return [Float]
        attr_accessor :temperature
      
        # If specified, custom value for top-k sampling will be used.
        # Corresponds to the JSON property `topK`
        # @return [Fixnum]
        attr_accessor :top_k
      
        # If specified, custom value for nucleus sampling will be used.
        # Corresponds to the JSON property `topP`
        # @return [Float]
        attr_accessor :top_p
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frequency_penalty = args[:frequency_penalty] if args.key?(:frequency_penalty)
          @language_code = args[:language_code] if args.key?(:language_code)
          @max_output_tokens = args[:max_output_tokens] if args.key?(:max_output_tokens)
          @model_id = args[:model_id] if args.key?(:model_id)
          @presence_penalty = args[:presence_penalty] if args.key?(:presence_penalty)
          @seed = args[:seed] if args.key?(:seed)
          @temperature = args[:temperature] if args.key?(:temperature)
          @top_k = args[:top_k] if args.key?(:top_k)
          @top_p = args[:top_p] if args.key?(:top_p)
        end
      end
      
      # Grounding source.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSource
        include Google::Apis::Core::Hashable
      
        # Google Search config parameters.
        # Corresponds to the JSON property `googleSearchSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSourceGoogleSearchSource]
        attr_accessor :google_search_source
      
        # Message to be used for grounding based on inline content.
        # Corresponds to the JSON property `inlineSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSourceInlineSource]
        attr_accessor :inline_source
      
        # Message to be used for grounding with Vertex AI Search.
        # Corresponds to the JSON property `searchSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSourceSearchSource]
        attr_accessor :search_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @google_search_source = args[:google_search_source] if args.key?(:google_search_source)
          @inline_source = args[:inline_source] if args.key?(:inline_source)
          @search_source = args[:search_source] if args.key?(:search_source)
        end
      end
      
      # Google Search config parameters.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSourceGoogleSearchSource
        include Google::Apis::Core::Hashable
      
        # Describes the options to customize dynamic retrieval.
        # Corresponds to the JSON property `dynamicRetrievalConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestDynamicRetrievalConfiguration]
        attr_accessor :dynamic_retrieval_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dynamic_retrieval_config = args[:dynamic_retrieval_config] if args.key?(:dynamic_retrieval_config)
        end
      end
      
      # Message to be used for grounding based on inline content.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSourceInlineSource
        include Google::Apis::Core::Hashable
      
        # Attributes associated with the content. Common attributes include `source` (
        # indicating where the content was sourced from) and `author` (indicating the
        # author of the content).
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,String>]
        attr_accessor :attributes
      
        # List of facts to be used for grounding.
        # Corresponds to the JSON property `groundingFacts`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GroundingFact>]
        attr_accessor :grounding_facts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @grounding_facts = args[:grounding_facts] if args.key?(:grounding_facts)
        end
      end
      
      # Message to be used for grounding with Vertex AI Search.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSourceSearchSource
        include Google::Apis::Core::Hashable
      
        # Filter expression to be applied to the search. The syntax is the same as
        # SearchRequest.filter.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Number of search results to return. The default value is 10. The maximumm
        # allowed value is 10.
        # Corresponds to the JSON property `maxResultCount`
        # @return [Fixnum]
        attr_accessor :max_result_count
      
        # If set, safe search is enabled in Vertex AI Search requests.
        # Corresponds to the JSON property `safeSearch`
        # @return [Boolean]
        attr_accessor :safe_search
        alias_method :safe_search?, :safe_search
      
        # The resource name of the Engine to use. Format: `projects/`project`/locations/`
        # location`/collections/`collection_id`/engines/`engine_id`/servingConfigs/`
        # serving_config_id``
        # Corresponds to the JSON property `servingConfig`
        # @return [String]
        attr_accessor :serving_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @max_result_count = args[:max_result_count] if args.key?(:max_result_count)
          @safe_search = args[:safe_search] if args.key?(:safe_search)
          @serving_config = args[:serving_config] if args.key?(:serving_config)
        end
      end
      
      # Grounding specification.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSpec
        include Google::Apis::Core::Hashable
      
        # Grounding sources.
        # Corresponds to the JSON property `groundingSources`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentRequestGroundingSource>]
        attr_accessor :grounding_sources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @grounding_sources = args[:grounding_sources] if args.key?(:grounding_sources)
        end
      end
      
      # Response for the `GenerateGroundedContent` method.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponse
        include Google::Apis::Core::Hashable
      
        # Generated candidates.
        # Corresponds to the JSON property `candidates`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidate>]
        attr_accessor :candidates
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @candidates = args[:candidates] if args.key?(:candidates)
        end
      end
      
      # A response candidate generated from the model.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidate
        include Google::Apis::Core::Hashable
      
        # Base structured datatype containing multi-part content of a message.
        # Corresponds to the JSON property `content`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GroundedGenerationContent]
        attr_accessor :content
      
        # Citation for the generated content.
        # Corresponds to the JSON property `groundingMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadata]
        attr_accessor :grounding_metadata
      
        # The overall grounding score for the candidate, in the range of [0, 1].
        # Corresponds to the JSON property `groundingScore`
        # @return [Float]
        attr_accessor :grounding_score
      
        # Index of the candidate.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @grounding_metadata = args[:grounding_metadata] if args.key?(:grounding_metadata)
          @grounding_score = args[:grounding_score] if args.key?(:grounding_score)
          @index = args[:index] if args.key?(:index)
        end
      end
      
      # Citation for the generated content.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadata
        include Google::Apis::Core::Hashable
      
        # GroundingSupport across all claims in the answer candidate. An support to a
        # fact indicates that the claim is supported by the fact.
        # Corresponds to the JSON property `groundingSupport`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataGroundingSupport>]
        attr_accessor :grounding_support
      
        # Retrieval metadata to provide an understanding in the retrieval steps
        # performed by the model. There can be multiple such messages which can
        # correspond to different parts of the retrieval. This is a mechanism used to
        # ensure transparency to our users.
        # Corresponds to the JSON property `retrievalMetadata`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataRetrievalMetadata>]
        attr_accessor :retrieval_metadata
      
        # Google search entry point.
        # Corresponds to the JSON property `searchEntryPoint`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataSearchEntryPoint]
        attr_accessor :search_entry_point
      
        # List of chunks to be attributed across all claims in the candidate. These are
        # derived from the grounding sources supplied in the request.
        # Corresponds to the JSON property `supportChunks`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1FactChunk>]
        attr_accessor :support_chunks
      
        # Web search queries for the following-up web search.
        # Corresponds to the JSON property `webSearchQueries`
        # @return [Array<String>]
        attr_accessor :web_search_queries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @grounding_support = args[:grounding_support] if args.key?(:grounding_support)
          @retrieval_metadata = args[:retrieval_metadata] if args.key?(:retrieval_metadata)
          @search_entry_point = args[:search_entry_point] if args.key?(:search_entry_point)
          @support_chunks = args[:support_chunks] if args.key?(:support_chunks)
          @web_search_queries = args[:web_search_queries] if args.key?(:web_search_queries)
        end
      end
      
      # Describes the metadata about dynamic retrieval.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataDynamicRetrievalMetadata
        include Google::Apis::Core::Hashable
      
        # Describes the metadata about the dynamic retrieval predictor.
        # Corresponds to the JSON property `predictorMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataDynamicRetrievalPredictorMetadata]
        attr_accessor :predictor_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @predictor_metadata = args[:predictor_metadata] if args.key?(:predictor_metadata)
        end
      end
      
      # Describes the metadata about the dynamic retrieval predictor.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataDynamicRetrievalPredictorMetadata
        include Google::Apis::Core::Hashable
      
        # The value of the predictor. This should be between [0, 1] where a value of 0
        # means that the query would not benefit from grounding, while a value of 1.0
        # means that the query would benefit the most. In between values allow to
        # differentiate between different usefulness scores for grounding.
        # Corresponds to the JSON property `prediction`
        # @return [Float]
        attr_accessor :prediction
      
        # The version of the predictor which was used in dynamic retrieval.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @prediction = args[:prediction] if args.key?(:prediction)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Grounding info for a claim in the candidate and its support.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataGroundingSupport
        include Google::Apis::Core::Hashable
      
        # Text for the claim in the candidate. Always provided when a support is found.
        # Corresponds to the JSON property `claimText`
        # @return [String]
        attr_accessor :claim_text
      
        # A list of indices (into 'support_chunks') specifying the citations associated
        # with the claim. For instance [1,3,4] means that support_chunks[1],
        # support_chunks[3], support_chunks[4] are the chunks attributed to the claim.
        # Corresponds to the JSON property `supportChunkIndices`
        # @return [Array<Fixnum>]
        attr_accessor :support_chunk_indices
      
        # A score in the range of [0, 1] describing how grounded is a specific claim in
        # the support chunks indicated. Higher value means that the claim is better
        # supported by the chunks.
        # Corresponds to the JSON property `supportScore`
        # @return [Float]
        attr_accessor :support_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claim_text = args[:claim_text] if args.key?(:claim_text)
          @support_chunk_indices = args[:support_chunk_indices] if args.key?(:support_chunk_indices)
          @support_score = args[:support_score] if args.key?(:support_score)
        end
      end
      
      # Describes the metadata associated with a retrieval step.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataRetrievalMetadata
        include Google::Apis::Core::Hashable
      
        # Describes the metadata about dynamic retrieval.
        # Corresponds to the JSON property `dynamicRetrievalMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataDynamicRetrievalMetadata]
        attr_accessor :dynamic_retrieval_metadata
      
        # Describes the source to which the metadata is referring to.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dynamic_retrieval_metadata = args[:dynamic_retrieval_metadata] if args.key?(:dynamic_retrieval_metadata)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Google search entry point.
      class GoogleCloudDiscoveryengineV1GenerateGroundedContentResponseCandidateGroundingMetadataSearchEntryPoint
        include Google::Apis::Core::Hashable
      
        # Web content snippet that can be embedded in a web page or an app webview.
        # Corresponds to the JSON property `renderedContent`
        # @return [String]
        attr_accessor :rendered_content
      
        # Base64 encoded JSON representing array of tuple.
        # Corresponds to the JSON property `sdkBlob`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :sdk_blob
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rendered_content = args[:rendered_content] if args.key?(:rendered_content)
          @sdk_blob = args[:sdk_blob] if args.key?(:sdk_blob)
        end
      end
      
      # Base structured datatype containing multi-part content of a message.
      class GoogleCloudDiscoveryengineV1GroundedGenerationContent
        include Google::Apis::Core::Hashable
      
        # Ordered `Parts` that constitute a single message.
        # Corresponds to the JSON property `parts`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GroundedGenerationContentPart>]
        attr_accessor :parts
      
        # Producer of the content. Must be either `user` or `model`. Intended to be used
        # for multi-turn conversations. Otherwise, it can be left unset.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parts = args[:parts] if args.key?(:parts)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # Single part of content.
      class GoogleCloudDiscoveryengineV1GroundedGenerationContentPart
        include Google::Apis::Core::Hashable
      
        # Inline text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Grounding Fact.
      class GoogleCloudDiscoveryengineV1GroundingFact
        include Google::Apis::Core::Hashable
      
        # Attributes associated with the fact. Common attributes include `source` (
        # indicating where the fact was sourced from), `author` (indicating the author
        # of the fact), and so on.
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,String>]
        attr_accessor :attributes
      
        # Text content of the fact. Can be at most 10K characters long.
        # Corresponds to the JSON property `factText`
        # @return [String]
        attr_accessor :fact_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @fact_text = args[:fact_text] if args.key?(:fact_text)
        end
      end
      
      # Metadata related to the progress of the ImportCompletionSuggestions operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1ImportCompletionSuggestionsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of CompletionSuggestions that failed to be imported.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of CompletionSuggestions successfully imported.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for CompletionService.ImportCompletionSuggestions method.
      class GoogleCloudDiscoveryengineV1ImportCompletionSuggestionsRequest
        include Google::Apis::Core::Hashable
      
        # BigQuery source import data from.
        # Corresponds to the JSON property `bigquerySource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigQuerySource]
        attr_accessor :bigquery_source
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # Cloud Storage location for input content.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GcsSource]
        attr_accessor :gcs_source
      
        # The inline source for CompletionSuggestions.
        # Corresponds to the JSON property `inlineSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportCompletionSuggestionsRequestInlineSource]
        attr_accessor :inline_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_source = args[:bigquery_source] if args.key?(:bigquery_source)
          @error_config = args[:error_config] if args.key?(:error_config)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @inline_source = args[:inline_source] if args.key?(:inline_source)
        end
      end
      
      # The inline source for CompletionSuggestions.
      class GoogleCloudDiscoveryengineV1ImportCompletionSuggestionsRequestInlineSource
        include Google::Apis::Core::Hashable
      
        # Required. A list of all denylist entries to import. Max of 1000 items.
        # Corresponds to the JSON property `suggestions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CompletionSuggestion>]
        attr_accessor :suggestions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggestions = args[:suggestions] if args.key?(:suggestions)
        end
      end
      
      # Response of the CompletionService.ImportCompletionSuggestions method. If the
      # long running operation is done, this message is returned by the google.
      # longrunning.Operations.response field if the operation is successful.
      class GoogleCloudDiscoveryengineV1ImportCompletionSuggestionsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Metadata related to the progress of the ImportDocuments operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1ImportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were processed successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Total count of entries that were processed.
        # Corresponds to the JSON property `totalCount`
        # @return [Fixnum]
        attr_accessor :total_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @total_count = args[:total_count] if args.key?(:total_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for Import methods.
      class GoogleCloudDiscoveryengineV1ImportDocumentsRequest
        include Google::Apis::Core::Hashable
      
        # AlloyDB source import data from.
        # Corresponds to the JSON property `alloyDbSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1AlloyDbSource]
        attr_accessor :alloy_db_source
      
        # Whether to automatically generate IDs for the documents if absent. If set to `
        # true`, Document.ids are automatically generated based on the hash of the
        # payload, where IDs may not be consistent during multiple imports. In which
        # case ReconciliationMode.FULL is highly recommended to avoid duplicate contents.
        # If unset or set to `false`, Document.ids have to be specified using id_field,
        # otherwise, documents without IDs fail to be imported. Supported data sources: *
        # GcsSource. GcsSource.data_schema must be `custom` or `csv`. Otherwise, an
        # INVALID_ARGUMENT error is thrown. * BigQuerySource. BigQuerySource.data_schema
        # must be `custom` or `csv`. Otherwise, an INVALID_ARGUMENT error is thrown. *
        # SpannerSource. * CloudSqlSource. * FirestoreSource. * BigtableSource.
        # Corresponds to the JSON property `autoGenerateIds`
        # @return [Boolean]
        attr_accessor :auto_generate_ids
        alias_method :auto_generate_ids?, :auto_generate_ids
      
        # BigQuery source import data from.
        # Corresponds to the JSON property `bigquerySource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigQuerySource]
        attr_accessor :bigquery_source
      
        # The Cloud Bigtable source for importing data.
        # Corresponds to the JSON property `bigtableSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigtableSource]
        attr_accessor :bigtable_source
      
        # Cloud SQL source import data from.
        # Corresponds to the JSON property `cloudSqlSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CloudSqlSource]
        attr_accessor :cloud_sql_source
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # Cloud FhirStore source import data from.
        # Corresponds to the JSON property `fhirStoreSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1FhirStoreSource]
        attr_accessor :fhir_store_source
      
        # Firestore source import data from.
        # Corresponds to the JSON property `firestoreSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1FirestoreSource]
        attr_accessor :firestore_source
      
        # Cloud Storage location for input content.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GcsSource]
        attr_accessor :gcs_source
      
        # The field indicates the ID field or column to be used as unique IDs of the
        # documents. For GcsSource it is the key of the JSON field. For instance, `my_id`
        # for JSON ``"my_id": "some_uuid"``. For others, it may be the column name of
        # the table where the unique ids are stored. The values of the JSON field or the
        # table column are used as the Document.ids. The JSON field or the table column
        # must be of string type, and the values must be set as valid strings conform to
        # [RFC-1034](https://tools.ietf.org/html/rfc1034) with 1-63 characters.
        # Otherwise, documents without valid IDs fail to be imported. Only set this
        # field when auto_generate_ids is unset or set as `false`. Otherwise, an
        # INVALID_ARGUMENT error is thrown. If it is unset, a default value `_id` is
        # used when importing from the allowed data sources. Supported data sources: *
        # GcsSource. GcsSource.data_schema must be `custom` or `csv`. Otherwise, an
        # INVALID_ARGUMENT error is thrown. * BigQuerySource. BigQuerySource.data_schema
        # must be `custom` or `csv`. Otherwise, an INVALID_ARGUMENT error is thrown. *
        # SpannerSource. * CloudSqlSource. * FirestoreSource. * BigtableSource.
        # Corresponds to the JSON property `idField`
        # @return [String]
        attr_accessor :id_field
      
        # The inline source for the input config for ImportDocuments method.
        # Corresponds to the JSON property `inlineSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportDocumentsRequestInlineSource]
        attr_accessor :inline_source
      
        # The mode of reconciliation between existing documents and the documents to be
        # imported. Defaults to ReconciliationMode.INCREMENTAL.
        # Corresponds to the JSON property `reconciliationMode`
        # @return [String]
        attr_accessor :reconciliation_mode
      
        # The Spanner source for importing data
        # Corresponds to the JSON property `spannerSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SpannerSource]
        attr_accessor :spanner_source
      
        # Indicates which fields in the provided imported documents to update. If not
        # set, the default is to update all fields.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alloy_db_source = args[:alloy_db_source] if args.key?(:alloy_db_source)
          @auto_generate_ids = args[:auto_generate_ids] if args.key?(:auto_generate_ids)
          @bigquery_source = args[:bigquery_source] if args.key?(:bigquery_source)
          @bigtable_source = args[:bigtable_source] if args.key?(:bigtable_source)
          @cloud_sql_source = args[:cloud_sql_source] if args.key?(:cloud_sql_source)
          @error_config = args[:error_config] if args.key?(:error_config)
          @fhir_store_source = args[:fhir_store_source] if args.key?(:fhir_store_source)
          @firestore_source = args[:firestore_source] if args.key?(:firestore_source)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @id_field = args[:id_field] if args.key?(:id_field)
          @inline_source = args[:inline_source] if args.key?(:inline_source)
          @reconciliation_mode = args[:reconciliation_mode] if args.key?(:reconciliation_mode)
          @spanner_source = args[:spanner_source] if args.key?(:spanner_source)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # The inline source for the input config for ImportDocuments method.
      class GoogleCloudDiscoveryengineV1ImportDocumentsRequestInlineSource
        include Google::Apis::Core::Hashable
      
        # Required. A list of documents to update/create. Each document must have a
        # valid Document.id. Recommended max of 100 items.
        # Corresponds to the JSON property `documents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Document>]
        attr_accessor :documents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
        end
      end
      
      # Response of the ImportDocumentsRequest. If the long running operation is done,
      # then this message is returned by the google.longrunning.Operations.response
      # field if the operation was successful.
      class GoogleCloudDiscoveryengineV1ImportDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Configuration of destination for Import related errors.
      class GoogleCloudDiscoveryengineV1ImportErrorConfig
        include Google::Apis::Core::Hashable
      
        # Cloud Storage prefix for import errors. This must be an empty, existing Cloud
        # Storage directory. Import errors are written to sharded files in this
        # directory, one per line, as a JSON-encoded `google.rpc.Status` message.
        # Corresponds to the JSON property `gcsPrefix`
        # @return [String]
        attr_accessor :gcs_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_prefix = args[:gcs_prefix] if args.key?(:gcs_prefix)
        end
      end
      
      # Metadata related to the progress of the ImportSuggestionDenyListEntries
      # operation. This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1ImportSuggestionDenyListEntriesMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for CompletionService.ImportSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1ImportSuggestionDenyListEntriesRequest
        include Google::Apis::Core::Hashable
      
        # Cloud Storage location for input content.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GcsSource]
        attr_accessor :gcs_source
      
        # The inline source for SuggestionDenyListEntry.
        # Corresponds to the JSON property `inlineSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportSuggestionDenyListEntriesRequestInlineSource]
        attr_accessor :inline_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @inline_source = args[:inline_source] if args.key?(:inline_source)
        end
      end
      
      # The inline source for SuggestionDenyListEntry.
      class GoogleCloudDiscoveryengineV1ImportSuggestionDenyListEntriesRequestInlineSource
        include Google::Apis::Core::Hashable
      
        # Required. A list of all denylist entries to import. Max of 1000 items.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SuggestionDenyListEntry>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # Response message for CompletionService.ImportSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1ImportSuggestionDenyListEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Count of deny list entries that failed to be imported.
        # Corresponds to the JSON property `failedEntriesCount`
        # @return [Fixnum]
        attr_accessor :failed_entries_count
      
        # Count of deny list entries successfully imported.
        # Corresponds to the JSON property `importedEntriesCount`
        # @return [Fixnum]
        attr_accessor :imported_entries_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @failed_entries_count = args[:failed_entries_count] if args.key?(:failed_entries_count)
          @imported_entries_count = args[:imported_entries_count] if args.key?(:imported_entries_count)
        end
      end
      
      # Metadata related to the progress of the Import operation. This is returned by
      # the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1ImportUserEventsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were processed successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for the ImportUserEvents request.
      class GoogleCloudDiscoveryengineV1ImportUserEventsRequest
        include Google::Apis::Core::Hashable
      
        # BigQuery source import data from.
        # Corresponds to the JSON property `bigquerySource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1BigQuerySource]
        attr_accessor :bigquery_source
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # Cloud Storage location for input content.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GcsSource]
        attr_accessor :gcs_source
      
        # The inline source for the input config for ImportUserEvents method.
        # Corresponds to the JSON property `inlineSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportUserEventsRequestInlineSource]
        attr_accessor :inline_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_source = args[:bigquery_source] if args.key?(:bigquery_source)
          @error_config = args[:error_config] if args.key?(:error_config)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @inline_source = args[:inline_source] if args.key?(:inline_source)
        end
      end
      
      # The inline source for the input config for ImportUserEvents method.
      class GoogleCloudDiscoveryengineV1ImportUserEventsRequestInlineSource
        include Google::Apis::Core::Hashable
      
        # Required. A list of user events to import. Recommended max of 10k items.
        # Corresponds to the JSON property `userEvents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1UserEvent>]
        attr_accessor :user_events
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @user_events = args[:user_events] if args.key?(:user_events)
        end
      end
      
      # Response of the ImportUserEventsRequest. If the long running operation was
      # successful, then this message is returned by the google.longrunning.Operations.
      # response field if the operation was successful.
      class GoogleCloudDiscoveryengineV1ImportUserEventsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Count of user events imported with complete existing Documents.
        # Corresponds to the JSON property `joinedEventsCount`
        # @return [Fixnum]
        attr_accessor :joined_events_count
      
        # Count of user events imported, but with Document information not found in the
        # existing Branch.
        # Corresponds to the JSON property `unjoinedEventsCount`
        # @return [Fixnum]
        attr_accessor :unjoined_events_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @joined_events_count = args[:joined_events_count] if args.key?(:joined_events_count)
          @unjoined_events_count = args[:unjoined_events_count] if args.key?(:unjoined_events_count)
        end
      end
      
      # A floating point interval.
      class GoogleCloudDiscoveryengineV1Interval
        include Google::Apis::Core::Hashable
      
        # Exclusive upper bound.
        # Corresponds to the JSON property `exclusiveMaximum`
        # @return [Float]
        attr_accessor :exclusive_maximum
      
        # Exclusive lower bound.
        # Corresponds to the JSON property `exclusiveMinimum`
        # @return [Float]
        attr_accessor :exclusive_minimum
      
        # Inclusive upper bound.
        # Corresponds to the JSON property `maximum`
        # @return [Float]
        attr_accessor :maximum
      
        # Inclusive lower bound.
        # Corresponds to the JSON property `minimum`
        # @return [Float]
        attr_accessor :minimum
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusive_maximum = args[:exclusive_maximum] if args.key?(:exclusive_maximum)
          @exclusive_minimum = args[:exclusive_minimum] if args.key?(:exclusive_minimum)
          @maximum = args[:maximum] if args.key?(:maximum)
          @minimum = args[:minimum] if args.key?(:minimum)
        end
      end
      
      # Response for ListControls method.
      class GoogleCloudDiscoveryengineV1ListControlsResponse
        include Google::Apis::Core::Hashable
      
        # All the Controls for a given data store.
        # Corresponds to the JSON property `controls`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Control>]
        attr_accessor :controls
      
        # Pagination token, if not returned indicates the last page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @controls = args[:controls] if args.key?(:controls)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response for ListConversations method.
      class GoogleCloudDiscoveryengineV1ListConversationsResponse
        include Google::Apis::Core::Hashable
      
        # All the Conversations for a given data store.
        # Corresponds to the JSON property `conversations`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Conversation>]
        attr_accessor :conversations
      
        # Pagination token, if not returned indicates the last page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversations = args[:conversations] if args.key?(:conversations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for SearchTuningService.ListCustomModels method.
      class GoogleCloudDiscoveryengineV1ListCustomModelsResponse
        include Google::Apis::Core::Hashable
      
        # List of custom tuning models.
        # Corresponds to the JSON property `models`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CustomTuningModel>]
        attr_accessor :models
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @models = args[:models] if args.key?(:models)
        end
      end
      
      # Response message for DataStoreService.ListDataStores method.
      class GoogleCloudDiscoveryengineV1ListDataStoresResponse
        include Google::Apis::Core::Hashable
      
        # All the customer's DataStores.
        # Corresponds to the JSON property `dataStores`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DataStore>]
        attr_accessor :data_stores
      
        # A token that can be sent as ListDataStoresRequest.page_token to retrieve the
        # next page. If this field is omitted, there are no subsequent pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_stores = args[:data_stores] if args.key?(:data_stores)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for DocumentService.ListDocuments method.
      class GoogleCloudDiscoveryengineV1ListDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # The Documents.
        # Corresponds to the JSON property `documents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Document>]
        attr_accessor :documents
      
        # A token that can be sent as ListDocumentsRequest.page_token to retrieve the
        # next page. If this field is omitted, there are no subsequent pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for EngineService.ListEngines method.
      class GoogleCloudDiscoveryengineV1ListEnginesResponse
        include Google::Apis::Core::Hashable
      
        # All the customer's Engines.
        # Corresponds to the JSON property `engines`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Engine>]
        attr_accessor :engines
      
        # Not supported.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @engines = args[:engines] if args.key?(:engines)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for SchemaService.ListSchemas method.
      class GoogleCloudDiscoveryengineV1ListSchemasResponse
        include Google::Apis::Core::Hashable
      
        # A token that can be sent as ListSchemasRequest.page_token to retrieve the next
        # page. If this field is omitted, there are no subsequent pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The Schemas.
        # Corresponds to the JSON property `schemas`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Schema>]
        attr_accessor :schemas
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @schemas = args[:schemas] if args.key?(:schemas)
        end
      end
      
      # Response for ListSessions method.
      class GoogleCloudDiscoveryengineV1ListSessionsResponse
        include Google::Apis::Core::Hashable
      
        # Pagination token, if not returned indicates the last page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All the Sessions for a given data store.
        # Corresponds to the JSON property `sessions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Session>]
        attr_accessor :sessions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sessions = args[:sessions] if args.key?(:sessions)
        end
      end
      
      # Response message for SiteSearchEngineService.ListTargetSites method.
      class GoogleCloudDiscoveryengineV1ListTargetSitesResponse
        include Google::Apis::Core::Hashable
      
        # A token that can be sent as `page_token` to retrieve the next page. If this
        # field is omitted, there are no subsequent pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of TargetSites.
        # Corresponds to the JSON property `targetSites`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TargetSite>]
        attr_accessor :target_sites
      
        # The total number of items matching the request. This will always be populated
        # in the response.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @target_sites = args[:target_sites] if args.key?(:target_sites)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Media-specific user event information.
      class GoogleCloudDiscoveryengineV1MediaInfo
        include Google::Apis::Core::Hashable
      
        # The media progress time in seconds, if applicable. For example, if the end
        # user has finished 90 seconds of a playback video, then MediaInfo.
        # media_progress_duration.seconds should be set to 90.
        # Corresponds to the JSON property `mediaProgressDuration`
        # @return [String]
        attr_accessor :media_progress_duration
      
        # Media progress should be computed using only the media_progress_duration
        # relative to the media total length. This value must be between `[0, 1.0]`
        # inclusive. If this is not a playback or the progress cannot be computed (e.g.
        # ongoing livestream), this field should be unset.
        # Corresponds to the JSON property `mediaProgressPercentage`
        # @return [Float]
        attr_accessor :media_progress_percentage
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_progress_duration = args[:media_progress_duration] if args.key?(:media_progress_duration)
          @media_progress_percentage = args[:media_progress_percentage] if args.key?(:media_progress_percentage)
        end
      end
      
      # Detailed page information.
      class GoogleCloudDiscoveryengineV1PageInfo
        include Google::Apis::Core::Hashable
      
        # The most specific category associated with a category page. To represent full
        # path of category, use '>' sign to separate different hierarchies. If '>' is
        # part of the category name, replace it with other character(s). Category pages
        # include special pages such as sales or promotions. For instance, a special
        # sale page may have the category hierarchy: `"pageCategory" : "Sales > 2017
        # Black Friday Deals"`. Required for `view-category-page` events. Other event
        # types should not set this field. Otherwise, an `INVALID_ARGUMENT` error is
        # returned.
        # Corresponds to the JSON property `pageCategory`
        # @return [String]
        attr_accessor :page_category
      
        # A unique ID of a web page view. This should be kept the same for all user
        # events triggered from the same pageview. For example, an item detail page view
        # could trigger multiple events as the user is browsing the page. The `
        # pageview_id` property should be kept the same for all these events so that
        # they can be grouped together properly. When using the client side event
        # reporting with JavaScript pixel and Google Tag Manager, this value is filled
        # in automatically.
        # Corresponds to the JSON property `pageviewId`
        # @return [String]
        attr_accessor :pageview_id
      
        # The referrer URL of the current page. When using the client side event
        # reporting with JavaScript pixel and Google Tag Manager, this value is filled
        # in automatically. However, some browser privacy restrictions may cause this
        # field to be empty.
        # Corresponds to the JSON property `referrerUri`
        # @return [String]
        attr_accessor :referrer_uri
      
        # Complete URL (window.location.href) of the user's current page. When using the
        # client side event reporting with JavaScript pixel and Google Tag Manager, this
        # value is filled in automatically. Maximum length 5,000 characters.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_category = args[:page_category] if args.key?(:page_category)
          @pageview_id = args[:pageview_id] if args.key?(:pageview_id)
          @referrer_uri = args[:referrer_uri] if args.key?(:referrer_uri)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Detailed panel information associated with a user event.
      class GoogleCloudDiscoveryengineV1PanelInfo
        include Google::Apis::Core::Hashable
      
        # The display name of the panel.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. The document IDs associated with this panel.
        # Corresponds to the JSON property `documents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentInfo>]
        attr_accessor :documents
      
        # Required. The panel ID.
        # Corresponds to the JSON property `panelId`
        # @return [String]
        attr_accessor :panel_id
      
        # The ordered position of the panel, if shown to the user with other panels. If
        # set, then total_panels must also be set.
        # Corresponds to the JSON property `panelPosition`
        # @return [Fixnum]
        attr_accessor :panel_position
      
        # The total number of panels, including this one, shown to the user. Must be set
        # if panel_position is set.
        # Corresponds to the JSON property `totalPanels`
        # @return [Fixnum]
        attr_accessor :total_panels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @documents = args[:documents] if args.key?(:documents)
          @panel_id = args[:panel_id] if args.key?(:panel_id)
          @panel_position = args[:panel_position] if args.key?(:panel_position)
          @total_panels = args[:total_panels] if args.key?(:total_panels)
        end
      end
      
      # Metadata and configurations for a Google Cloud project in the service.
      class GoogleCloudDiscoveryengineV1Project
        include Google::Apis::Core::Hashable
      
        # Output only. The timestamp when this project is created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Full resource name of the project, for example `projects/`project`
        # `. Note that when making requests, project number and project id are both
        # acceptable, but the server will always respond in project number.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The timestamp when this project is successfully provisioned.
        # Empty value means this project is still provisioning and is not ready for use.
        # Corresponds to the JSON property `provisionCompletionTime`
        # @return [String]
        attr_accessor :provision_completion_time
      
        # Output only. A map of terms of services. The key is the `id` of ServiceTerms.
        # Corresponds to the JSON property `serviceTermsMap`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ProjectServiceTerms>]
        attr_accessor :service_terms_map
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @provision_completion_time = args[:provision_completion_time] if args.key?(:provision_completion_time)
          @service_terms_map = args[:service_terms_map] if args.key?(:service_terms_map)
        end
      end
      
      # Metadata about the terms of service.
      class GoogleCloudDiscoveryengineV1ProjectServiceTerms
        include Google::Apis::Core::Hashable
      
        # The last time when the project agreed to the terms of service.
        # Corresponds to the JSON property `acceptTime`
        # @return [String]
        attr_accessor :accept_time
      
        # The last time when the project declined or revoked the agreement to terms of
        # service.
        # Corresponds to the JSON property `declineTime`
        # @return [String]
        attr_accessor :decline_time
      
        # The unique identifier of this terms of service. Available terms: * `
        # GA_DATA_USE_TERMS`: [Terms for data use](https://cloud.google.com/retail/data-
        # use-terms). When using this as `id`, the acceptable version to provide is `
        # 2022-11-23`.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether the project has accepted/rejected the service terms or it is still
        # pending.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The version string of the terms of service. For acceptable values, see the
        # comments for id above.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accept_time = args[:accept_time] if args.key?(:accept_time)
          @decline_time = args[:decline_time] if args.key?(:decline_time)
          @id = args[:id] if args.key?(:id)
          @state = args[:state] if args.key?(:state)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Metadata associated with a project provision operation.
      class GoogleCloudDiscoveryengineV1ProvisionProjectMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request for ProjectService.ProvisionProject method.
      class GoogleCloudDiscoveryengineV1ProvisionProjectRequest
        include Google::Apis::Core::Hashable
      
        # Required. Set to `true` to specify that caller has read and would like to give
        # consent to the [Terms for data use](https://cloud.google.com/retail/data-use-
        # terms).
        # Corresponds to the JSON property `acceptDataUseTerms`
        # @return [Boolean]
        attr_accessor :accept_data_use_terms
        alias_method :accept_data_use_terms?, :accept_data_use_terms
      
        # Required. The version of the [Terms for data use](https://cloud.google.com/
        # retail/data-use-terms) that caller has read and would like to give consent to.
        # Acceptable version is `2022-11-23`, and this may change over time.
        # Corresponds to the JSON property `dataUseTermsVersion`
        # @return [String]
        attr_accessor :data_use_terms_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accept_data_use_terms = args[:accept_data_use_terms] if args.key?(:accept_data_use_terms)
          @data_use_terms_version = args[:data_use_terms_version] if args.key?(:data_use_terms_version)
        end
      end
      
      # Metadata related to the progress of the PurgeCompletionSuggestions operation.
      # This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1PurgeCompletionSuggestionsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for CompletionService.PurgeCompletionSuggestions method.
      class GoogleCloudDiscoveryengineV1PurgeCompletionSuggestionsRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response message for CompletionService.PurgeCompletionSuggestions method.
      class GoogleCloudDiscoveryengineV1PurgeCompletionSuggestionsResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Whether the completion suggestions were successfully purged.
        # Corresponds to the JSON property `purgeSucceeded`
        # @return [Boolean]
        attr_accessor :purge_succeeded
        alias_method :purge_succeeded?, :purge_succeeded
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @purge_succeeded = args[:purge_succeeded] if args.key?(:purge_succeeded)
        end
      end
      
      # Metadata related to the progress of the PurgeDocuments operation. This will be
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1PurgeDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were ignored as entries were not found.
        # Corresponds to the JSON property `ignoredCount`
        # @return [Fixnum]
        attr_accessor :ignored_count
      
        # Count of entries that were deleted successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @ignored_count = args[:ignored_count] if args.key?(:ignored_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for DocumentService.PurgeDocuments method.
      class GoogleCloudDiscoveryengineV1PurgeDocumentsRequest
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Purge related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1PurgeErrorConfig]
        attr_accessor :error_config
      
        # Required. Filter matching documents to purge. Only currently supported value
        # is `*` (all items).
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Actually performs the purge. If `force` is set to false, return the expected
        # purge count without deleting any documents.
        # Corresponds to the JSON property `force`
        # @return [Boolean]
        attr_accessor :force
        alias_method :force?, :force
      
        # Cloud Storage location for input content.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1GcsSource]
        attr_accessor :gcs_source
      
        # The inline source for the input config for DocumentService.PurgeDocuments
        # method.
        # Corresponds to the JSON property `inlineSource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1PurgeDocumentsRequestInlineSource]
        attr_accessor :inline_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @filter = args[:filter] if args.key?(:filter)
          @force = args[:force] if args.key?(:force)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @inline_source = args[:inline_source] if args.key?(:inline_source)
        end
      end
      
      # The inline source for the input config for DocumentService.PurgeDocuments
      # method.
      class GoogleCloudDiscoveryengineV1PurgeDocumentsRequestInlineSource
        include Google::Apis::Core::Hashable
      
        # Required. A list of full resource name of documents to purge. In the format `
        # projects/*/locations/*/collections/*/dataStores/*/branches/*/documents/*`.
        # Recommended max of 100 items.
        # Corresponds to the JSON property `documents`
        # @return [Array<String>]
        attr_accessor :documents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documents = args[:documents] if args.key?(:documents)
        end
      end
      
      # Response message for DocumentService.PurgeDocuments method. If the long
      # running operation is successfully done, then this message is returned by the
      # google.longrunning.Operations.response field.
      class GoogleCloudDiscoveryengineV1PurgeDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # The total count of documents purged as a result of the operation.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        # A sample of document names that will be deleted. Only populated if `force` is
        # set to false. A max of 100 names will be returned and the names are chosen at
        # random.
        # Corresponds to the JSON property `purgeSample`
        # @return [Array<String>]
        attr_accessor :purge_sample
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
          @purge_sample = args[:purge_sample] if args.key?(:purge_sample)
        end
      end
      
      # Configuration of destination for Purge related errors.
      class GoogleCloudDiscoveryengineV1PurgeErrorConfig
        include Google::Apis::Core::Hashable
      
        # Cloud Storage prefix for purge errors. This must be an empty, existing Cloud
        # Storage directory. Purge errors are written to sharded files in this directory,
        # one per line, as a JSON-encoded `google.rpc.Status` message.
        # Corresponds to the JSON property `gcsPrefix`
        # @return [String]
        attr_accessor :gcs_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_prefix = args[:gcs_prefix] if args.key?(:gcs_prefix)
        end
      end
      
      # Metadata related to the progress of the PurgeSuggestionDenyListEntries
      # operation. This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1PurgeSuggestionDenyListEntriesMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for CompletionService.PurgeSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1PurgeSuggestionDenyListEntriesRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response message for CompletionService.PurgeSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1PurgeSuggestionDenyListEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Number of suggestion deny list entries purged.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
        end
      end
      
      # Request message for PurgeUserEvents method.
      class GoogleCloudDiscoveryengineV1PurgeUserEventsRequest
        include Google::Apis::Core::Hashable
      
        # Required. The filter string to specify the events to be deleted with a length
        # limit of 5,000 characters. The eligible fields for filtering are: * `eventType`
        # : Double quoted UserEvent.event_type string. * `eventTime`: in ISO 8601 "zulu"
        # format. * `userPseudoId`: Double quoted string. Specifying this will delete
        # all events associated with a visitor. * `userId`: Double quoted string.
        # Specifying this will delete all events associated with a user. Note: This API
        # only supports purging a max range of 30 days. Examples: * Deleting all events
        # in a time range: `eventTime > "2012-04-23T18:25:43.511Z" eventTime < "2012-04-
        # 23T18:30:43.511Z"` * Deleting specific eventType in a time range: `eventTime >
        # "2012-04-23T18:25:43.511Z" eventTime < "2012-04-23T18:30:43.511Z" eventType = "
        # search"` * Deleting all events for a specific visitor in a time range: `
        # eventTime > "2012-04-23T18:25:43.511Z" eventTime < "2012-04-23T18:30:43.511Z"
        # userPseudoId = "visitor1024"` * Deleting the past 30 days of events inside a
        # DataStore: `*` The filtering fields are assumed to have an implicit AND.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # The `force` field is currently not supported. Purge user event requests will
        # permanently delete all purgeable events. Once the development is complete: If `
        # force` is set to false, the method will return the expected purge count
        # without deleting any user events. This field will default to false if not
        # included in the request.
        # Corresponds to the JSON property `force`
        # @return [Boolean]
        attr_accessor :force
        alias_method :force?, :force
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @force = args[:force] if args.key?(:force)
        end
      end
      
      # Defines a user inputed query.
      class GoogleCloudDiscoveryengineV1Query
        include Google::Apis::Core::Hashable
      
        # Unique Id for the query.
        # Corresponds to the JSON property `queryId`
        # @return [String]
        attr_accessor :query_id
      
        # Plain text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_id = args[:query_id] if args.key?(:query_id)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Request message for RankService.Rank method.
      class GoogleCloudDiscoveryengineV1RankRequest
        include Google::Apis::Core::Hashable
      
        # If true, the response will contain only record ID and score. By default, it is
        # false, the response will contain record details.
        # Corresponds to the JSON property `ignoreRecordDetailsInResponse`
        # @return [Boolean]
        attr_accessor :ignore_record_details_in_response
        alias_method :ignore_record_details_in_response?, :ignore_record_details_in_response
      
        # The identifier of the model to use. It is one of: * `semantic-ranker-512@
        # latest`: Semantic ranking model with maxiumn input token size 512. It is set
        # to `semantic-ranker-512@latest` by default if unspecified.
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # The query to use.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Required. A list of records to rank. At most 200 records to rank.
        # Corresponds to the JSON property `records`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1RankingRecord>]
        attr_accessor :records
      
        # The number of results to return. If this is unset or no bigger than zero,
        # returns all results.
        # Corresponds to the JSON property `topN`
        # @return [Fixnum]
        attr_accessor :top_n
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_record_details_in_response = args[:ignore_record_details_in_response] if args.key?(:ignore_record_details_in_response)
          @model = args[:model] if args.key?(:model)
          @query = args[:query] if args.key?(:query)
          @records = args[:records] if args.key?(:records)
          @top_n = args[:top_n] if args.key?(:top_n)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # Response message for RankService.Rank method.
      class GoogleCloudDiscoveryengineV1RankResponse
        include Google::Apis::Core::Hashable
      
        # A list of records sorted by descending score.
        # Corresponds to the JSON property `records`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1RankingRecord>]
        attr_accessor :records
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @records = args[:records] if args.key?(:records)
        end
      end
      
      # Record message for RankService.Rank method.
      class GoogleCloudDiscoveryengineV1RankingRecord
        include Google::Apis::Core::Hashable
      
        # The content of the record. Empty by default. At least one of title or content
        # should be set otherwise an INVALID_ARGUMENT error is thrown.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The unique ID to represent the record.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The score of this record based on the given query and selected model. The
        # score will be rounded to 2 decimal places. If the score is close to 0, it will
        # be rounded to 0.0001 to avoid returning unset.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The title of the record. Empty by default. At least one of title or content
        # should be set otherwise an INVALID_ARGUMENT error is thrown.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @id = args[:id] if args.key?(:id)
          @score = args[:score] if args.key?(:score)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Request message for Recommend method.
      class GoogleCloudDiscoveryengineV1RecommendRequest
        include Google::Apis::Core::Hashable
      
        # Filter for restricting recommendation results with a length limit of 5,000
        # characters. Currently, only filter expressions on the `filter_tags` attribute
        # is supported. Examples: * `(filter_tags: ANY("Red", "Blue") OR filter_tags:
        # ANY("Hot", "Cold"))` * `(filter_tags: ANY("Red", "Blue")) AND NOT (filter_tags:
        # ANY("Green"))` If `attributeFilteringSyntax` is set to true under the `params`
        # field, then attribute-based expressions are expected instead of the above
        # described tag-based syntax. Examples: * (language: ANY("en", "es")) AND NOT (
        # categories: ANY("Movie")) * (available: true) AND (language: ANY("en", "es"))
        # OR (categories: ANY("Movie")) If your filter blocks all results, the API
        # returns generic (unfiltered) popular Documents. If you only want results
        # strictly matching the filters, set `strictFiltering` to `true` in
        # RecommendRequest.params to receive empty results instead. Note that the API
        # never returns Documents with `storageStatus` as `EXPIRED` or `DELETED`
        # regardless of filter choices.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Maximum number of results to return. Set this property to the number of
        # recommendation results needed. If zero, the service chooses a reasonable
        # default. The maximum allowed value is 100. Values above 100 are set to 100.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Additional domain specific parameters for the recommendations. Allowed values:
        # * `returnDocument`: Boolean. If set to `true`, the associated Document object
        # is returned in RecommendResponse.RecommendationResult.document. * `returnScore`
        # : Boolean. If set to true, the recommendation score corresponding to each
        # returned Document is set in RecommendResponse.RecommendationResult.metadata.
        # The given score indicates the probability of a Document conversion given the
        # user's context and history. * `strictFiltering`: Boolean. True by default. If
        # set to `false`, the service returns generic (unfiltered) popular Documents
        # instead of empty if your filter blocks all recommendation results. * `
        # diversityLevel`: String. Default empty. If set to be non-empty, then it needs
        # to be one of: * `no-diversity` * `low-diversity` * `medium-diversity` * `high-
        # diversity` * `auto-diversity` This gives request-level control and adjusts
        # recommendation results based on Document category. * `attributeFilteringSyntax`
        # : Boolean. False by default. If set to true, the `filter` field is interpreted
        # according to the new, attribute-based syntax.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # UserEvent captures all metadata information Discovery Engine API needs to know
        # about how end users interact with your website.
        # Corresponds to the JSON property `userEvent`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1UserEvent]
        attr_accessor :user_event
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Requirements for labels](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # Use validate only mode for this recommendation query. If set to `true`, a fake
        # model is used that returns arbitrary Document IDs. Note that the validate only
        # mode should only be used for testing the API, or if the model is not ready.
        # Corresponds to the JSON property `validateOnly`
        # @return [Boolean]
        attr_accessor :validate_only
        alias_method :validate_only?, :validate_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @page_size = args[:page_size] if args.key?(:page_size)
          @params = args[:params] if args.key?(:params)
          @user_event = args[:user_event] if args.key?(:user_event)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @validate_only = args[:validate_only] if args.key?(:validate_only)
        end
      end
      
      # Response message for Recommend method.
      class GoogleCloudDiscoveryengineV1RecommendResponse
        include Google::Apis::Core::Hashable
      
        # A unique attribution token. This should be included in the UserEvent logs
        # resulting from this recommendation, which enables accurate attribution of
        # recommendation model performance.
        # Corresponds to the JSON property `attributionToken`
        # @return [String]
        attr_accessor :attribution_token
      
        # IDs of documents in the request that were missing from the default Branch
        # associated with the requested ServingConfig.
        # Corresponds to the JSON property `missingIds`
        # @return [Array<String>]
        attr_accessor :missing_ids
      
        # A list of recommended Documents. The order represents the ranking (from the
        # most relevant Document to the least).
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1RecommendResponseRecommendationResult>]
        attr_accessor :results
      
        # True if RecommendRequest.validate_only was set.
        # Corresponds to the JSON property `validateOnly`
        # @return [Boolean]
        attr_accessor :validate_only
        alias_method :validate_only?, :validate_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribution_token = args[:attribution_token] if args.key?(:attribution_token)
          @missing_ids = args[:missing_ids] if args.key?(:missing_ids)
          @results = args[:results] if args.key?(:results)
          @validate_only = args[:validate_only] if args.key?(:validate_only)
        end
      end
      
      # RecommendationResult represents a generic recommendation result with
      # associated metadata.
      class GoogleCloudDiscoveryengineV1RecommendResponseRecommendationResult
        include Google::Apis::Core::Hashable
      
        # Document captures all raw metadata information of items to be recommended or
        # searched.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Document]
        attr_accessor :document
      
        # Resource ID of the recommended Document.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Additional Document metadata or annotations. Possible values: * `score`:
        # Recommendation score in double value. Is set if `returnScore` is set to true
        # in RecommendRequest.params.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @id = args[:id] if args.key?(:id)
          @metadata = args[:metadata] if args.key?(:metadata)
        end
      end
      
      # Request message for SiteSearchEngineService.RecrawlUris method.
      class GoogleCloudDiscoveryengineV1RecrawlUrisRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Full resource name of the SiteCredential, such as `projects/*/
        # locations/*/collections/*/dataStores/*/siteSearchEngine/siteCredentials/*`.
        # Only set to crawl private URIs.
        # Corresponds to the JSON property `siteCredential`
        # @return [String]
        attr_accessor :site_credential
      
        # Required. List of URIs to crawl. At most 10K URIs are supported, otherwise an
        # INVALID_ARGUMENT error is thrown. Each URI should match at least one
        # TargetSite in `site_search_engine`.
        # Corresponds to the JSON property `uris`
        # @return [Array<String>]
        attr_accessor :uris
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @site_credential = args[:site_credential] if args.key?(:site_credential)
          @uris = args[:uris] if args.key?(:uris)
        end
      end
      
      # Defines a reply message to user.
      class GoogleCloudDiscoveryengineV1Reply
        include Google::Apis::Core::Hashable
      
        # Summary of the top N search results specified by the summary spec.
        # Corresponds to the JSON property `summary`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummary]
        attr_accessor :summary
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @summary = args[:summary] if args.key?(:summary)
        end
      end
      
      # Defines the structure and layout of a type of document data.
      class GoogleCloudDiscoveryengineV1Schema
        include Google::Apis::Core::Hashable
      
        # The JSON representation of the schema.
        # Corresponds to the JSON property `jsonSchema`
        # @return [String]
        attr_accessor :json_schema
      
        # Immutable. The full resource name of the schema, in the format of `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # schemas/`schema``. This field must be a UTF-8 encoded string with a length
        # limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The structured representation of the schema.
        # Corresponds to the JSON property `structSchema`
        # @return [Hash<String,Object>]
        attr_accessor :struct_schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @json_schema = args[:json_schema] if args.key?(:json_schema)
          @name = args[:name] if args.key?(:name)
          @struct_schema = args[:struct_schema] if args.key?(:struct_schema)
        end
      end
      
      # Detailed search information.
      class GoogleCloudDiscoveryengineV1SearchInfo
        include Google::Apis::Core::Hashable
      
        # An integer that specifies the current offset for pagination (the 0-indexed
        # starting location, amongst the products deemed by the API as relevant). See
        # SearchRequest.offset for definition. If this field is negative, an `
        # INVALID_ARGUMENT` is returned. This can only be set for `search` events. Other
        # event types should not set this field. Otherwise, an `INVALID_ARGUMENT` error
        # is returned.
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # The order in which products are returned, if applicable. See SearchRequest.
        # order_by for definition and syntax. The value must be a UTF-8 encoded string
        # with a length limit of 1,000 characters. Otherwise, an `INVALID_ARGUMENT`
        # error is returned. This can only be set for `search` events. Other event types
        # should not set this field. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # The user's search query. See SearchRequest.query for definition. The value
        # must be a UTF-8 encoded string with a length limit of 5,000 characters.
        # Otherwise, an `INVALID_ARGUMENT` error is returned. At least one of
        # search_query or PageInfo.page_category is required for `search` events. Other
        # event types should not set this field. Otherwise, an `INVALID_ARGUMENT` error
        # is returned.
        # Corresponds to the JSON property `searchQuery`
        # @return [String]
        attr_accessor :search_query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @offset = args[:offset] if args.key?(:offset)
          @order_by = args[:order_by] if args.key?(:order_by)
          @search_query = args[:search_query] if args.key?(:search_query)
        end
      end
      
      # Promotion proto includes uri and other helping information to display the
      # promotion.
      class GoogleCloudDiscoveryengineV1SearchLinkPromotion
        include Google::Apis::Core::Hashable
      
        # Optional. The Promotion description. Maximum length: 200 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. The enabled promotion will be returned for any serving configs
        # associated with the parent of the control this promotion is attached to. This
        # flag is used for basic site search only.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Optional. The promotion thumbnail image url.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Required. The title of the promotion. Maximum length: 160 characters.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Required. The URL for the page the user wants to promote.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @enabled = args[:enabled] if args.key?(:enabled)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Request message for SearchService.Search method.
      class GoogleCloudDiscoveryengineV1SearchRequest
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # The branch resource name, such as `projects/*/locations/global/collections/
        # default_collection/dataStores/default_data_store/branches/0`. Use `
        # default_branch` as the branch ID or leave this field empty, to search
        # documents under the default branch.
        # Corresponds to the JSON property `branch`
        # @return [String]
        attr_accessor :branch
      
        # The default filter that is applied when a user performs a search without
        # checking any filters on the search page. The filter applied to every search
        # request when quality improvement such as query expansion is needed. In the
        # case a query does not have a sufficient amount of results this filter will be
        # used to determine whether or not to enable the query expansion flow. The
        # original filter will still be used for the query expanded search. This field
        # is strongly recommended to achieve high search quality. For more information
        # about filter syntax, see SearchRequest.filter.
        # Corresponds to the JSON property `canonicalFilter`
        # @return [String]
        attr_accessor :canonical_filter
      
        # A specification for configuring the behavior of content search.
        # Corresponds to the JSON property `contentSearchSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpec]
        attr_accessor :content_search_spec
      
        # Specs defining DataStores to filter on in a search call and configurations for
        # those data stores. This is only considered for Engines with multiple data
        # stores. For engines with a single data store, the specs directly under
        # SearchRequest should be used.
        # Corresponds to the JSON property `dataStoreSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestDataStoreSpec>]
        attr_accessor :data_store_specs
      
        # Facet specifications for faceted search. If empty, no facets are returned. A
        # maximum of 100 values are allowed. Otherwise, an `INVALID_ARGUMENT` error is
        # returned.
        # Corresponds to the JSON property `facetSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestFacetSpec>]
        attr_accessor :facet_specs
      
        # The filter syntax consists of an expression language for constructing a
        # predicate from one or more fields of the documents being filtered. Filter
        # expression is case-sensitive. If this field is unrecognizable, an `
        # INVALID_ARGUMENT` is returned. Filtering in Vertex AI Search is done by
        # mapping the LHS filter key to a key property defined in the Vertex AI Search
        # backend -- this mapping is defined by the customer in their schema. For
        # example a media customer might have a field 'name' in their schema. In this
        # case the filter would look like this: filter --> name:'ANY("king kong")' For
        # more information about filtering including syntax and filter operators, see [
        # Filter](https://cloud.google.com/generative-ai-app-builder/docs/filter-search-
        # metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Specifies the image query input.
        # Corresponds to the JSON property `imageQuery`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestImageQuery]
        attr_accessor :image_query
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information,
        # see [Standard fields](https://cloud.google.com/apis/design/standard_fields).
        # This field helps to better interpret the query. If a value isn't specified,
        # the query language code is automatically detected, which may not be accurate.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # A 0-indexed integer that specifies the current offset (that is, starting
        # result location, amongst the Documents deemed by the API as relevant) in
        # search results. This field is only considered if page_token is unset. If this
        # field is negative, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # The maximum number of results to return for OneBox. This applies to each
        # OneBox type individually. Default number is 10.
        # Corresponds to the JSON property `oneBoxPageSize`
        # @return [Fixnum]
        attr_accessor :one_box_page_size
      
        # The order in which documents are returned. Documents can be ordered by a field
        # in an Document object. Leave it unset if ordered by relevance. `order_by`
        # expression is case-sensitive. For more information on ordering the website
        # search results, see [Order web search results](https://cloud.google.com/
        # generative-ai-app-builder/docs/order-web-search-results). For more information
        # on ordering the healthcare search results, see [Order healthcare search
        # results](https://cloud.google.com/generative-ai-app-builder/docs/order-hc-
        # results). If this field is unrecognizable, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Maximum number of Documents to return. The maximum allowed value depends on
        # the data type. Values above the maximum value are coerced to the maximum value.
        # * Websites with basic indexing: Default `10`, Maximum `25`. * Websites with
        # advanced indexing: Default `25`, Maximum `50`. * Other: Default `50`, Maximum `
        # 100`. If this field is negative, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A page token received from a previous SearchService.Search call. Provide this
        # to retrieve the subsequent page. When paginating, all other parameters
        # provided to SearchService.Search must match the call that provided the page
        # token. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Additional search parameters. For public website search only, supported values
        # are: * `user_country_code`: string. Default empty. If set to non-empty,
        # results are restricted or boosted based on the location provided. For example,
        # `user_country_code: "au"` For available codes see [Country Codes](https://
        # developers.google.com/custom-search/docs/json_api_reference#countryCodes) * `
        # search_type`: double. Default empty. Enables non-webpage searching depending
        # on the value. The only valid non-default value is 1, which enables image
        # searching. For example, `search_type: 1`
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # Raw search query.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Specification to determine under which conditions query expansion should occur.
        # Corresponds to the JSON property `queryExpansionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestQueryExpansionSpec]
        attr_accessor :query_expansion_spec
      
        # Whether to turn on safe search. This is only supported for website search.
        # Corresponds to the JSON property `safeSearch`
        # @return [Boolean]
        attr_accessor :safe_search
        alias_method :safe_search?, :safe_search
      
        # Specification for search as you type in search requests.
        # Corresponds to the JSON property `searchAsYouTypeSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestSearchAsYouTypeSpec]
        attr_accessor :search_as_you_type_spec
      
        # The session resource name. Optional. Session allows users to do multi-turn /
        # search API calls or coordination between /search API calls and /answer API
        # calls. Example #1 (multi-turn /search API calls): 1. Call /search API with the
        # auto-session mode (see below). 2. Call /search API with the session ID
        # generated in the first call. Here, the previous search query gets considered
        # in query standing. I.e., if the first query is "How did Alphabet do in 2022?"
        # and the current query is "How about 2023?", the current query will be
        # interpreted as "How did Alphabet do in 2023?". Example #2 (coordination
        # between /search API calls and /answer API calls): 1. Call /search API with the
        # auto-session mode (see below). 2. Call /answer API with the session ID
        # generated in the first call. Here, the answer generation happens in the
        # context of the search results from the first search call. Auto-session mode:
        # when `projects/.../sessions/-` is used, a new session gets automatically
        # created. Otherwise, users can use the create-session API to create a session
        # manually. Multi-turn Search feature is currently at private GA stage. Please
        # use v1alpha or v1beta version instead before we launch this feature to public
        # GA. Or ask for allowlisting through Google Support team.
        # Corresponds to the JSON property `session`
        # @return [String]
        attr_accessor :session
      
        # Session specification. Multi-turn Search feature is currently at private GA
        # stage. Please use v1alpha or v1beta version instead before we launch this
        # feature to public GA. Or ask for allowlisting through Google Support team.
        # Corresponds to the JSON property `sessionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestSessionSpec]
        attr_accessor :session_spec
      
        # The specification for query spell correction.
        # Corresponds to the JSON property `spellCorrectionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestSpellCorrectionSpec]
        attr_accessor :spell_correction_spec
      
        # Information of an end user.
        # Corresponds to the JSON property `userInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1UserInfo]
        attr_accessor :user_info
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # A unique identifier for tracking visitors. For example, this could be
        # implemented with an HTTP cookie, which should be able to uniquely identify a
        # visitor on a single device. This unique identifier should not change if the
        # visitor logs in or out of the website. This field should NOT have a fixed
        # value such as `unknown_visitor`. This should be the same identifier as
        # UserEvent.user_pseudo_id and CompleteQueryRequest.user_pseudo_id The field
        # must be a UTF-8 encoded string with a length limit of 128 characters.
        # Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @branch = args[:branch] if args.key?(:branch)
          @canonical_filter = args[:canonical_filter] if args.key?(:canonical_filter)
          @content_search_spec = args[:content_search_spec] if args.key?(:content_search_spec)
          @data_store_specs = args[:data_store_specs] if args.key?(:data_store_specs)
          @facet_specs = args[:facet_specs] if args.key?(:facet_specs)
          @filter = args[:filter] if args.key?(:filter)
          @image_query = args[:image_query] if args.key?(:image_query)
          @language_code = args[:language_code] if args.key?(:language_code)
          @offset = args[:offset] if args.key?(:offset)
          @one_box_page_size = args[:one_box_page_size] if args.key?(:one_box_page_size)
          @order_by = args[:order_by] if args.key?(:order_by)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @params = args[:params] if args.key?(:params)
          @query = args[:query] if args.key?(:query)
          @query_expansion_spec = args[:query_expansion_spec] if args.key?(:query_expansion_spec)
          @safe_search = args[:safe_search] if args.key?(:safe_search)
          @search_as_you_type_spec = args[:search_as_you_type_spec] if args.key?(:search_as_you_type_spec)
          @session = args[:session] if args.key?(:session)
          @session_spec = args[:session_spec] if args.key?(:session_spec)
          @spell_correction_spec = args[:spell_correction_spec] if args.key?(:spell_correction_spec)
          @user_info = args[:user_info] if args.key?(:user_info)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Boost specification to boost certain documents.
      class GoogleCloudDiscoveryengineV1SearchRequestBoostSpec
        include Google::Apis::Core::Hashable
      
        # Condition boost specifications. If a document matches multiple conditions in
        # the specifictions, boost scores from these specifications are all applied and
        # combined in a non-linear way. Maximum number of specifications is 20.
        # Corresponds to the JSON property `conditionBoostSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpecConditionBoostSpec>]
        attr_accessor :condition_boost_specs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition_boost_specs = args[:condition_boost_specs] if args.key?(:condition_boost_specs)
        end
      end
      
      # Boost applies to documents which match a condition.
      class GoogleCloudDiscoveryengineV1SearchRequestBoostSpecConditionBoostSpec
        include Google::Apis::Core::Hashable
      
        # Strength of the condition boost, which should be in [-1, 1]. Negative boost
        # means demotion. Default is 0.0. Setting to 1.0 gives the document a big
        # promotion. However, it does not necessarily mean that the boosted document
        # will be the top result at all times, nor that other documents will be excluded.
        # Results could still be shown even when none of them matches the condition.
        # And results that are significantly more relevant to the search query can still
        # trump your heavily favored but irrelevant documents. Setting to -1.0 gives the
        # document a big demotion. However, results that are deeply relevant might still
        # be shown. The document will have an upstream battle to get a fairly high
        # ranking, but it is not blocked out completely. Setting to 0.0 means no boost
        # applied. The boosting condition is ignored. Only one of the (condition, boost)
        # combination or the boost_control_spec below are set. If both are set then the
        # global boost is ignored and the more fine-grained boost_control_spec is
        # applied.
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Specification for custom ranking based on customer specified attribute value.
        # It provides more controls for customized ranking than the simple (condition,
        # boost) combination above.
        # Corresponds to the JSON property `boostControlSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpecConditionBoostSpecBoostControlSpec]
        attr_accessor :boost_control_spec
      
        # An expression which specifies a boost condition. The syntax and supported
        # fields are the same as a filter expression. See SearchRequest.filter for
        # detail syntax and limitations. Examples: * To boost documents with document ID
        # "doc_1" or "doc_2", and color "Red" or "Blue": `(document_id: ANY("doc_1", "
        # doc_2")) AND (color: ANY("Red", "Blue"))`
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @boost_control_spec = args[:boost_control_spec] if args.key?(:boost_control_spec)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # Specification for custom ranking based on customer specified attribute value.
      # It provides more controls for customized ranking than the simple (condition,
      # boost) combination above.
      class GoogleCloudDiscoveryengineV1SearchRequestBoostSpecConditionBoostSpecBoostControlSpec
        include Google::Apis::Core::Hashable
      
        # The attribute type to be used to determine the boost amount. The attribute
        # value can be derived from the field value of the specified field_name. In the
        # case of numerical it is straightforward i.e. attribute_value =
        # numerical_field_value. In the case of freshness however, attribute_value = (
        # time.now() - datetime_field_value).
        # Corresponds to the JSON property `attributeType`
        # @return [String]
        attr_accessor :attribute_type
      
        # The control points used to define the curve. The monotonic function (defined
        # through the interpolation_type above) passes through the control points listed
        # here.
        # Corresponds to the JSON property `controlPoints`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpecConditionBoostSpecBoostControlSpecControlPoint>]
        attr_accessor :control_points
      
        # The name of the field whose value will be used to determine the boost amount.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # The interpolation type to be applied to connect the control points listed
        # below.
        # Corresponds to the JSON property `interpolationType`
        # @return [String]
        attr_accessor :interpolation_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_type = args[:attribute_type] if args.key?(:attribute_type)
          @control_points = args[:control_points] if args.key?(:control_points)
          @field_name = args[:field_name] if args.key?(:field_name)
          @interpolation_type = args[:interpolation_type] if args.key?(:interpolation_type)
        end
      end
      
      # The control points used to define the curve. The curve defined through these
      # control points can only be monotonically increasing or decreasing(constant
      # values are acceptable).
      class GoogleCloudDiscoveryengineV1SearchRequestBoostSpecConditionBoostSpecBoostControlSpecControlPoint
        include Google::Apis::Core::Hashable
      
        # Can be one of: 1. The numerical field value. 2. The duration spec for
        # freshness: The value must be formatted as an XSD `dayTimeDuration` value (a
        # restricted subset of an ISO 8601 duration value). The pattern for this is: `
        # nDnM]`.
        # Corresponds to the JSON property `attributeValue`
        # @return [String]
        attr_accessor :attribute_value
      
        # The value between -1 to 1 by which to boost the score if the attribute_value
        # evaluates to the value specified above.
        # Corresponds to the JSON property `boostAmount`
        # @return [Float]
        attr_accessor :boost_amount
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_value = args[:attribute_value] if args.key?(:attribute_value)
          @boost_amount = args[:boost_amount] if args.key?(:boost_amount)
        end
      end
      
      # A specification for configuring the behavior of content search.
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpec
        include Google::Apis::Core::Hashable
      
        # Specifies the chunk spec to be returned from the search response. Only
        # available if the SearchRequest.ContentSearchSpec.search_result_mode is set to
        # CHUNKS
        # Corresponds to the JSON property `chunkSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecChunkSpec]
        attr_accessor :chunk_spec
      
        # A specification for configuring the extractive content in a search response.
        # Corresponds to the JSON property `extractiveContentSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecExtractiveContentSpec]
        attr_accessor :extractive_content_spec
      
        # Specifies the search result mode. If unspecified, the search result mode
        # defaults to `DOCUMENTS`.
        # Corresponds to the JSON property `searchResultMode`
        # @return [String]
        attr_accessor :search_result_mode
      
        # A specification for configuring snippets in a search response.
        # Corresponds to the JSON property `snippetSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSnippetSpec]
        attr_accessor :snippet_spec
      
        # A specification for configuring a summary returned in a search response.
        # Corresponds to the JSON property `summarySpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpec]
        attr_accessor :summary_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_spec = args[:chunk_spec] if args.key?(:chunk_spec)
          @extractive_content_spec = args[:extractive_content_spec] if args.key?(:extractive_content_spec)
          @search_result_mode = args[:search_result_mode] if args.key?(:search_result_mode)
          @snippet_spec = args[:snippet_spec] if args.key?(:snippet_spec)
          @summary_spec = args[:summary_spec] if args.key?(:summary_spec)
        end
      end
      
      # Specifies the chunk spec to be returned from the search response. Only
      # available if the SearchRequest.ContentSearchSpec.search_result_mode is set to
      # CHUNKS
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecChunkSpec
        include Google::Apis::Core::Hashable
      
        # The number of next chunks to be returned of the current chunk. The maximum
        # allowed value is 3. If not specified, no next chunks will be returned.
        # Corresponds to the JSON property `numNextChunks`
        # @return [Fixnum]
        attr_accessor :num_next_chunks
      
        # The number of previous chunks to be returned of the current chunk. The maximum
        # allowed value is 3. If not specified, no previous chunks will be returned.
        # Corresponds to the JSON property `numPreviousChunks`
        # @return [Fixnum]
        attr_accessor :num_previous_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_next_chunks = args[:num_next_chunks] if args.key?(:num_next_chunks)
          @num_previous_chunks = args[:num_previous_chunks] if args.key?(:num_previous_chunks)
        end
      end
      
      # A specification for configuring the extractive content in a search response.
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecExtractiveContentSpec
        include Google::Apis::Core::Hashable
      
        # The maximum number of extractive answers returned in each search result. An
        # extractive answer is a verbatim answer extracted from the original document,
        # which provides a precise and contextually relevant answer to the search query.
        # If the number of matching answers is less than the `
        # max_extractive_answer_count`, return all of the answers. Otherwise, return the
        # `max_extractive_answer_count`. At most five answers are returned for each
        # SearchResult.
        # Corresponds to the JSON property `maxExtractiveAnswerCount`
        # @return [Fixnum]
        attr_accessor :max_extractive_answer_count
      
        # The max number of extractive segments returned in each search result. Only
        # applied if the DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED or
        # DataStore.solution_types is SOLUTION_TYPE_CHAT. An extractive segment is a
        # text segment extracted from the original document that is relevant to the
        # search query, and, in general, more verbose than an extractive answer. The
        # segment could then be used as input for LLMs to generate summaries and answers.
        # If the number of matching segments is less than `max_extractive_segment_count`
        # , return all of the segments. Otherwise, return the `
        # max_extractive_segment_count`.
        # Corresponds to the JSON property `maxExtractiveSegmentCount`
        # @return [Fixnum]
        attr_accessor :max_extractive_segment_count
      
        # Return at most `num_next_segments` segments after each selected segments.
        # Corresponds to the JSON property `numNextSegments`
        # @return [Fixnum]
        attr_accessor :num_next_segments
      
        # Specifies whether to also include the adjacent from each selected segments.
        # Return at most `num_previous_segments` segments before each selected segments.
        # Corresponds to the JSON property `numPreviousSegments`
        # @return [Fixnum]
        attr_accessor :num_previous_segments
      
        # Specifies whether to return the confidence score from the extractive segments
        # in each search result. This feature is available only for new or allowlisted
        # data stores. To allowlist your data store, contact your Customer Engineer. The
        # default value is `false`.
        # Corresponds to the JSON property `returnExtractiveSegmentScore`
        # @return [Boolean]
        attr_accessor :return_extractive_segment_score
        alias_method :return_extractive_segment_score?, :return_extractive_segment_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_extractive_answer_count = args[:max_extractive_answer_count] if args.key?(:max_extractive_answer_count)
          @max_extractive_segment_count = args[:max_extractive_segment_count] if args.key?(:max_extractive_segment_count)
          @num_next_segments = args[:num_next_segments] if args.key?(:num_next_segments)
          @num_previous_segments = args[:num_previous_segments] if args.key?(:num_previous_segments)
          @return_extractive_segment_score = args[:return_extractive_segment_score] if args.key?(:return_extractive_segment_score)
        end
      end
      
      # A specification for configuring snippets in a search response.
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSnippetSpec
        include Google::Apis::Core::Hashable
      
        # [DEPRECATED] This field is deprecated. To control snippet return, use `
        # return_snippet` field. For backwards compatibility, we will return snippet if
        # max_snippet_count > 0.
        # Corresponds to the JSON property `maxSnippetCount`
        # @return [Fixnum]
        attr_accessor :max_snippet_count
      
        # [DEPRECATED] This field is deprecated and will have no affect on the snippet.
        # Corresponds to the JSON property `referenceOnly`
        # @return [Boolean]
        attr_accessor :reference_only
        alias_method :reference_only?, :reference_only
      
        # If `true`, then return snippet. If no snippet can be generated, we return "No
        # snippet is available for this page." A `snippet_status` with `SUCCESS` or `
        # NO_SNIPPET_AVAILABLE` will also be returned.
        # Corresponds to the JSON property `returnSnippet`
        # @return [Boolean]
        attr_accessor :return_snippet
        alias_method :return_snippet?, :return_snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_snippet_count = args[:max_snippet_count] if args.key?(:max_snippet_count)
          @reference_only = args[:reference_only] if args.key?(:reference_only)
          @return_snippet = args[:return_snippet] if args.key?(:return_snippet)
        end
      end
      
      # A specification for configuring a summary returned in a search response.
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpec
        include Google::Apis::Core::Hashable
      
        # Specifies whether to filter out adversarial queries. The default value is `
        # false`. Google employs search-query classification to detect adversarial
        # queries. No summary is returned if the search query is classified as an
        # adversarial query. For example, a user might ask a question regarding negative
        # comments about the company or submit a query designed to generate unsafe,
        # policy-violating output. If this field is set to `true`, we skip generating
        # summaries for adversarial queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreAdversarialQuery`
        # @return [Boolean]
        attr_accessor :ignore_adversarial_query
        alias_method :ignore_adversarial_query?, :ignore_adversarial_query
      
        # Optional. Specifies whether to filter out jail-breaking queries. The default
        # value is `false`. Google employs search-query classification to detect jail-
        # breaking queries. No summary is returned if the search query is classified as
        # a jail-breaking query. A user might add instructions to the query to change
        # the tone, style, language, content of the answer, or ask the model to act as a
        # different entity, e.g. "Reply in the tone of a competing company's CEO". If
        # this field is set to `true`, we skip generating summaries for jail-breaking
        # queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreJailBreakingQuery`
        # @return [Boolean]
        attr_accessor :ignore_jail_breaking_query
        alias_method :ignore_jail_breaking_query?, :ignore_jail_breaking_query
      
        # Specifies whether to filter out queries that have low relevance. The default
        # value is `false`. If this field is set to `false`, all search results are used
        # regardless of relevance to generate answers. If set to `true`, only queries
        # with high relevance search results will generate answers.
        # Corresponds to the JSON property `ignoreLowRelevantContent`
        # @return [Boolean]
        attr_accessor :ignore_low_relevant_content
        alias_method :ignore_low_relevant_content?, :ignore_low_relevant_content
      
        # Specifies whether to filter out queries that are not summary-seeking. The
        # default value is `false`. Google employs search-query classification to detect
        # summary-seeking queries. No summary is returned if the search query is
        # classified as a non-summary seeking query. For example, `why is the sky blue`
        # and `Who is the best soccer player in the world?` are summary-seeking queries,
        # but `SFO airport` and `world cup 2026` are not. They are most likely
        # navigational queries. If this field is set to `true`, we skip generating
        # summaries for non-summary seeking queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreNonSummarySeekingQuery`
        # @return [Boolean]
        attr_accessor :ignore_non_summary_seeking_query
        alias_method :ignore_non_summary_seeking_query?, :ignore_non_summary_seeking_query
      
        # Specifies whether to include citations in the summary. The default value is `
        # false`. When this field is set to `true`, summaries include in-line citation
        # numbers. Example summary including citations: BigQuery is Google Cloud's fully
        # managed and completely serverless enterprise data warehouse [1]. BigQuery
        # supports all data types, works across clouds, and has built-in machine
        # learning and business intelligence, all within a unified platform [2, 3]. The
        # citation numbers refer to the returned search results and are 1-indexed. For
        # example, [1] means that the sentence is attributed to the first search result.
        # [2, 3] means that the sentence is attributed to both the second and third
        # search results.
        # Corresponds to the JSON property `includeCitations`
        # @return [Boolean]
        attr_accessor :include_citations
        alias_method :include_citations?, :include_citations
      
        # Language code for Summary. Use language tags defined by [BCP47](https://www.
        # rfc-editor.org/rfc/bcp/bcp47.txt). Note: This is an experimental feature.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Specification of the prompt to use with the model.
        # Corresponds to the JSON property `modelPromptSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpecModelPromptSpec]
        attr_accessor :model_prompt_spec
      
        # Specification of the model.
        # Corresponds to the JSON property `modelSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpecModelSpec]
        attr_accessor :model_spec
      
        # The number of top results to generate the summary from. If the number of
        # results returned is less than `summaryResultCount`, the summary is generated
        # from all of the results. At most 10 results for documents mode, or 50 for
        # chunks mode, can be used to generate a summary. The chunks mode is used when
        # SearchRequest.ContentSearchSpec.search_result_mode is set to CHUNKS.
        # Corresponds to the JSON property `summaryResultCount`
        # @return [Fixnum]
        attr_accessor :summary_result_count
      
        # If true, answer will be generated from most relevant chunks from top search
        # results. This feature will improve summary quality. Note that with this
        # feature enabled, not all top search results will be referenced and included in
        # the reference list, so the citation source index only points to the search
        # results listed in the reference list.
        # Corresponds to the JSON property `useSemanticChunks`
        # @return [Boolean]
        attr_accessor :use_semantic_chunks
        alias_method :use_semantic_chunks?, :use_semantic_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_adversarial_query = args[:ignore_adversarial_query] if args.key?(:ignore_adversarial_query)
          @ignore_jail_breaking_query = args[:ignore_jail_breaking_query] if args.key?(:ignore_jail_breaking_query)
          @ignore_low_relevant_content = args[:ignore_low_relevant_content] if args.key?(:ignore_low_relevant_content)
          @ignore_non_summary_seeking_query = args[:ignore_non_summary_seeking_query] if args.key?(:ignore_non_summary_seeking_query)
          @include_citations = args[:include_citations] if args.key?(:include_citations)
          @language_code = args[:language_code] if args.key?(:language_code)
          @model_prompt_spec = args[:model_prompt_spec] if args.key?(:model_prompt_spec)
          @model_spec = args[:model_spec] if args.key?(:model_spec)
          @summary_result_count = args[:summary_result_count] if args.key?(:summary_result_count)
          @use_semantic_chunks = args[:use_semantic_chunks] if args.key?(:use_semantic_chunks)
        end
      end
      
      # Specification of the prompt to use with the model.
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpecModelPromptSpec
        include Google::Apis::Core::Hashable
      
        # Text at the beginning of the prompt that instructs the assistant. Examples are
        # available in the user guide.
        # Corresponds to the JSON property `preamble`
        # @return [String]
        attr_accessor :preamble
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @preamble = args[:preamble] if args.key?(:preamble)
        end
      end
      
      # Specification of the model.
      class GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpecSummarySpecModelSpec
        include Google::Apis::Core::Hashable
      
        # The model version used to generate the summary. Supported values are: * `
        # stable`: string. Default value when no value is specified. Uses a generally
        # available, fine-tuned model. For more information, see [Answer generation
        # model versions and lifecycle](https://cloud.google.com/generative-ai-app-
        # builder/docs/answer-generation-models). * `preview`: string. (Public preview)
        # Uses a preview model. For more information, see [Answer generation model
        # versions and lifecycle](https://cloud.google.com/generative-ai-app-builder/
        # docs/answer-generation-models).
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A struct to define data stores to filter on in a search call and
      # configurations for those data stores. Otherwise, an `INVALID_ARGUMENT` error
      # is returned.
      class GoogleCloudDiscoveryengineV1SearchRequestDataStoreSpec
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # Required. Full resource name of DataStore, such as `projects/`project`/
        # locations/`location`/collections/`collection_id`/dataStores/`data_store_id``.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Optional. Filter specification to filter documents in the data store specified
        # by data_store field. For more information on filtering, see [Filtering](https:/
        # /cloud.google.com/generative-ai-app-builder/docs/filter-search-metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # A facet specification to perform faceted search.
      class GoogleCloudDiscoveryengineV1SearchRequestFacetSpec
        include Google::Apis::Core::Hashable
      
        # Enables dynamic position for this facet. If set to true, the position of this
        # facet among all facets in the response is determined automatically. If dynamic
        # facets are enabled, it is ordered together. If set to false, the position of
        # this facet in the response is the same as in the request, and it is ranked
        # before the facets with dynamic position enable and all dynamic facets. For
        # example, you may always want to have rating facet returned in the response,
        # but it's not necessarily to always display the rating facet at the top. In
        # that case, you can set enable_dynamic_position to true so that the position of
        # rating facet in response is determined automatically. Another example,
        # assuming you have the following facets in the request: * "rating",
        # enable_dynamic_position = true * "price", enable_dynamic_position = false * "
        # brands", enable_dynamic_position = false And also you have a dynamic facets
        # enabled, which generates a facet `gender`. Then the final order of the facets
        # in the response can be ("price", "brands", "rating", "gender") or ("price", "
        # brands", "gender", "rating") depends on how API orders "gender" and "rating"
        # facets. However, notice that "price" and "brands" are always ranked at first
        # and second position because their enable_dynamic_position is false.
        # Corresponds to the JSON property `enableDynamicPosition`
        # @return [Boolean]
        attr_accessor :enable_dynamic_position
        alias_method :enable_dynamic_position?, :enable_dynamic_position
      
        # List of keys to exclude when faceting. By default, FacetKey.key is not
        # excluded from the filter unless it is listed in this field. Listing a facet
        # key in this field allows its values to appear as facet results, even when they
        # are filtered out of search results. Using this field does not affect what
        # search results are returned. For example, suppose there are 100 documents with
        # the color facet "Red" and 200 documents with the color facet "Blue". A query
        # containing the filter "color:ANY("Red")" and having "color" as FacetKey.key
        # would by default return only "Red" documents in the search results, and also
        # return "Red" with count 100 as the only color facet. Although there are also
        # blue documents available, "Blue" would not be shown as an available facet
        # value. If "color" is listed in "excludedFilterKeys", then the query returns
        # the facet values "Red" with count 100 and "Blue" with count 200, because the "
        # color" key is now excluded from the filter. Because this field doesn't affect
        # search results, the search results are still correctly filtered to return only
        # "Red" documents. A maximum of 100 values are allowed. Otherwise, an `
        # INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `excludedFilterKeys`
        # @return [Array<String>]
        attr_accessor :excluded_filter_keys
      
        # Specifies how a facet is computed.
        # Corresponds to the JSON property `facetKey`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestFacetSpecFacetKey]
        attr_accessor :facet_key
      
        # Maximum facet values that are returned for this facet. If unspecified,
        # defaults to 20. The maximum allowed value is 300. Values above 300 are coerced
        # to 300. For aggregation in healthcare search, when the [FacetKey.key] is "
        # healthcare_aggregation_key", the limit will be overridden to 10,000 internally,
        # regardless of the value set here. If this field is negative, an `
        # INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_dynamic_position = args[:enable_dynamic_position] if args.key?(:enable_dynamic_position)
          @excluded_filter_keys = args[:excluded_filter_keys] if args.key?(:excluded_filter_keys)
          @facet_key = args[:facet_key] if args.key?(:facet_key)
          @limit = args[:limit] if args.key?(:limit)
        end
      end
      
      # Specifies how a facet is computed.
      class GoogleCloudDiscoveryengineV1SearchRequestFacetSpecFacetKey
        include Google::Apis::Core::Hashable
      
        # True to make facet keys case insensitive when getting faceting values with
        # prefixes or contains; false otherwise.
        # Corresponds to the JSON property `caseInsensitive`
        # @return [Boolean]
        attr_accessor :case_insensitive
        alias_method :case_insensitive?, :case_insensitive
      
        # Only get facet values that contain the given strings. For example, suppose "
        # category" has three values "Action > 2022", "Action > 2021" and "Sci-Fi > 2022"
        # . If set "contains" to "2022", the "category" facet only contains "Action >
        # 2022" and "Sci-Fi > 2022". Only supported on textual fields. Maximum is 10.
        # Corresponds to the JSON property `contains`
        # @return [Array<String>]
        attr_accessor :contains
      
        # Set only if values should be bucketed into intervals. Must be set for facets
        # with numerical values. Must not be set for facet with text values. Maximum
        # number of intervals is 30.
        # Corresponds to the JSON property `intervals`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Interval>]
        attr_accessor :intervals
      
        # Required. Supported textual and numerical facet keys in Document object, over
        # which the facet values are computed. Facet key is case-sensitive.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The order in which documents are returned. Allowed values are: * "count desc",
        # which means order by SearchResponse.Facet.values.count descending. * "value
        # desc", which means order by SearchResponse.Facet.values.value descending. Only
        # applies to textual facets. If not set, textual values are sorted in [natural
        # order](https://en.wikipedia.org/wiki/Natural_sort_order); numerical intervals
        # are sorted in the order given by FacetSpec.FacetKey.intervals.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Only get facet values that start with the given string prefix. For example,
        # suppose "category" has three values "Action > 2022", "Action > 2021" and "Sci-
        # Fi > 2022". If set "prefixes" to "Action", the "category" facet only contains "
        # Action > 2022" and "Action > 2021". Only supported on textual fields. Maximum
        # is 10.
        # Corresponds to the JSON property `prefixes`
        # @return [Array<String>]
        attr_accessor :prefixes
      
        # Only get facet for the given restricted values. Only supported on textual
        # fields. For example, suppose "category" has three values "Action > 2022", "
        # Action > 2021" and "Sci-Fi > 2022". If set "restricted_values" to "Action >
        # 2022", the "category" facet only contains "Action > 2022". Only supported on
        # textual fields. Maximum is 10.
        # Corresponds to the JSON property `restrictedValues`
        # @return [Array<String>]
        attr_accessor :restricted_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_insensitive = args[:case_insensitive] if args.key?(:case_insensitive)
          @contains = args[:contains] if args.key?(:contains)
          @intervals = args[:intervals] if args.key?(:intervals)
          @key = args[:key] if args.key?(:key)
          @order_by = args[:order_by] if args.key?(:order_by)
          @prefixes = args[:prefixes] if args.key?(:prefixes)
          @restricted_values = args[:restricted_values] if args.key?(:restricted_values)
        end
      end
      
      # Specifies the image query input.
      class GoogleCloudDiscoveryengineV1SearchRequestImageQuery
        include Google::Apis::Core::Hashable
      
        # Base64 encoded image bytes. Supported image formats: JPEG, PNG, and BMP.
        # Corresponds to the JSON property `imageBytes`
        # @return [String]
        attr_accessor :image_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_bytes = args[:image_bytes] if args.key?(:image_bytes)
        end
      end
      
      # Specification to determine under which conditions query expansion should occur.
      class GoogleCloudDiscoveryengineV1SearchRequestQueryExpansionSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which query expansion should occur. Default to Condition.
        # DISABLED.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        # Whether to pin unexpanded results. If this field is set to true, unexpanded
        # products are always at the top of the search results, followed by the expanded
        # results.
        # Corresponds to the JSON property `pinUnexpandedResults`
        # @return [Boolean]
        attr_accessor :pin_unexpanded_results
        alias_method :pin_unexpanded_results?, :pin_unexpanded_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @pin_unexpanded_results = args[:pin_unexpanded_results] if args.key?(:pin_unexpanded_results)
        end
      end
      
      # Specification for search as you type in search requests.
      class GoogleCloudDiscoveryengineV1SearchRequestSearchAsYouTypeSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which search as you type should occur. Default to
        # Condition.DISABLED.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # Session specification. Multi-turn Search feature is currently at private GA
      # stage. Please use v1alpha or v1beta version instead before we launch this
      # feature to public GA. Or ask for allowlisting through Google Support team.
      class GoogleCloudDiscoveryengineV1SearchRequestSessionSpec
        include Google::Apis::Core::Hashable
      
        # If set, the search result gets stored to the "turn" specified by this query ID.
        # Example: Let's say the session looks like this: session ` name: ".../sessions/
        # xxx" turns ` query ` text: "What is foo?" query_id: ".../questions/yyy" `
        # answer: "Foo is ..." ` turns ` query ` text: "How about bar then?" query_id: ".
        # ../questions/zzz" ` ` ` The user can call /search API with a request like this:
        # session: ".../sessions/xxx" session_spec ` query_id: ".../questions/zzz" `
        # Then, the API stores the search result, associated with the last turn. The
        # stored search result can be used by a subsequent /answer API call (with the
        # session ID and the query ID specified). Also, it is possible to call /search
        # and /answer in parallel with the same session ID & query ID.
        # Corresponds to the JSON property `queryId`
        # @return [String]
        attr_accessor :query_id
      
        # The number of top search results to persist. The persisted search results can
        # be used for the subsequent /answer api call. This field is simliar to the `
        # summary_result_count` field in SearchRequest.ContentSearchSpec.SummarySpec.
        # summary_result_count. At most 10 results for documents mode, or 50 for chunks
        # mode.
        # Corresponds to the JSON property `searchResultPersistenceCount`
        # @return [Fixnum]
        attr_accessor :search_result_persistence_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_id = args[:query_id] if args.key?(:query_id)
          @search_result_persistence_count = args[:search_result_persistence_count] if args.key?(:search_result_persistence_count)
        end
      end
      
      # The specification for query spell correction.
      class GoogleCloudDiscoveryengineV1SearchRequestSpellCorrectionSpec
        include Google::Apis::Core::Hashable
      
        # The mode under which spell correction replaces the original search query.
        # Defaults to Mode.AUTO.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Response message for SearchService.Search method.
      class GoogleCloudDiscoveryengineV1SearchResponse
        include Google::Apis::Core::Hashable
      
        # A unique search token. This should be included in the UserEvent logs resulting
        # from this search, which enables accurate attribution of search model
        # performance. This also helps to identify a request during the customer support
        # scenarios.
        # Corresponds to the JSON property `attributionToken`
        # @return [String]
        attr_accessor :attribution_token
      
        # Contains the spell corrected query, if found. If the spell correction type is
        # AUTOMATIC, then the search results are based on corrected_query. Otherwise the
        # original query is used for search.
        # Corresponds to the JSON property `correctedQuery`
        # @return [String]
        attr_accessor :corrected_query
      
        # Results of facets requested by user.
        # Corresponds to the JSON property `facets`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseFacet>]
        attr_accessor :facets
      
        # A token that can be sent as SearchRequest.page_token to retrieve the next page.
        # If this field is omitted, there are no subsequent pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Information describing query expansion including whether expansion has
        # occurred.
        # Corresponds to the JSON property `queryExpansionInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseQueryExpansionInfo]
        attr_accessor :query_expansion_info
      
        # The URI of a customer-defined redirect page. If redirect action is triggered,
        # no search is performed, and only redirect_uri and attribution_token are set in
        # the response.
        # Corresponds to the JSON property `redirectUri`
        # @return [String]
        attr_accessor :redirect_uri
      
        # A list of matched documents. The order represents the ranking.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSearchResult>]
        attr_accessor :results
      
        # Promotions for site search.
        # Corresponds to the JSON property `searchLinkPromotions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchLinkPromotion>]
        attr_accessor :search_link_promotions
      
        # Information about the session.
        # Corresponds to the JSON property `sessionInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSessionInfo]
        attr_accessor :session_info
      
        # Summary of the top N search results specified by the summary spec.
        # Corresponds to the JSON property `summary`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummary]
        attr_accessor :summary
      
        # The estimated total count of matched items irrespective of pagination. The
        # count of results returned by pagination may be less than the total_size that
        # matches.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribution_token = args[:attribution_token] if args.key?(:attribution_token)
          @corrected_query = args[:corrected_query] if args.key?(:corrected_query)
          @facets = args[:facets] if args.key?(:facets)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @query_expansion_info = args[:query_expansion_info] if args.key?(:query_expansion_info)
          @redirect_uri = args[:redirect_uri] if args.key?(:redirect_uri)
          @results = args[:results] if args.key?(:results)
          @search_link_promotions = args[:search_link_promotions] if args.key?(:search_link_promotions)
          @session_info = args[:session_info] if args.key?(:session_info)
          @summary = args[:summary] if args.key?(:summary)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # A facet result.
      class GoogleCloudDiscoveryengineV1SearchResponseFacet
        include Google::Apis::Core::Hashable
      
        # Whether the facet is dynamically generated.
        # Corresponds to the JSON property `dynamicFacet`
        # @return [Boolean]
        attr_accessor :dynamic_facet
        alias_method :dynamic_facet?, :dynamic_facet
      
        # The key for this facet. For example, `"colors"` or `"price"`. It matches
        # SearchRequest.FacetSpec.FacetKey.key.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The facet values for this field.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseFacetFacetValue>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dynamic_facet = args[:dynamic_facet] if args.key?(:dynamic_facet)
          @key = args[:key] if args.key?(:key)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # A facet value which contains value names and their count.
      class GoogleCloudDiscoveryengineV1SearchResponseFacetFacetValue
        include Google::Apis::Core::Hashable
      
        # Number of items that have this facet value.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # A floating point interval.
        # Corresponds to the JSON property `interval`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Interval]
        attr_accessor :interval
      
        # Text value of a facet, such as "Black" for facet "colors".
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @interval = args[:interval] if args.key?(:interval)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Information describing query expansion including whether expansion has
      # occurred.
      class GoogleCloudDiscoveryengineV1SearchResponseQueryExpansionInfo
        include Google::Apis::Core::Hashable
      
        # Bool describing whether query expansion has occurred.
        # Corresponds to the JSON property `expandedQuery`
        # @return [Boolean]
        attr_accessor :expanded_query
        alias_method :expanded_query?, :expanded_query
      
        # Number of pinned results. This field will only be set when expansion happens
        # and SearchRequest.QueryExpansionSpec.pin_unexpanded_results is set to true.
        # Corresponds to the JSON property `pinnedResultCount`
        # @return [Fixnum]
        attr_accessor :pinned_result_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expanded_query = args[:expanded_query] if args.key?(:expanded_query)
          @pinned_result_count = args[:pinned_result_count] if args.key?(:pinned_result_count)
        end
      end
      
      # Represents the search results.
      class GoogleCloudDiscoveryengineV1SearchResponseSearchResult
        include Google::Apis::Core::Hashable
      
        # Chunk captures all raw metadata information of items to be recommended or
        # searched in the chunk mode.
        # Corresponds to the JSON property `chunk`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Chunk]
        attr_accessor :chunk
      
        # Document captures all raw metadata information of items to be recommended or
        # searched.
        # Corresponds to the JSON property `document`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Document]
        attr_accessor :document
      
        # Document.id of the searched Document.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk = args[:chunk] if args.key?(:chunk)
          @document = args[:document] if args.key?(:document)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # Information about the session.
      class GoogleCloudDiscoveryengineV1SearchResponseSessionInfo
        include Google::Apis::Core::Hashable
      
        # Name of the session. If the auto-session mode is used (when SearchRequest.
        # session ends with "-"), this field holds the newly generated session name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Query ID that corresponds to this search API call. One session can have
        # multiple turns, each with a unique query ID. By specifying the session name
        # and this query ID in the Answer API call, the answer generation happens in the
        # context of the search results from this search call.
        # Corresponds to the JSON property `queryId`
        # @return [String]
        attr_accessor :query_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @query_id = args[:query_id] if args.key?(:query_id)
        end
      end
      
      # Summary of the top N search results specified by the summary spec.
      class GoogleCloudDiscoveryengineV1SearchResponseSummary
        include Google::Apis::Core::Hashable
      
        # Safety Attribute categories and their associated confidence scores.
        # Corresponds to the JSON property `safetyAttributes`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummarySafetyAttributes]
        attr_accessor :safety_attributes
      
        # Additional summary-skipped reasons. This provides the reason for ignored cases.
        # If nothing is skipped, this field is not set.
        # Corresponds to the JSON property `summarySkippedReasons`
        # @return [Array<String>]
        attr_accessor :summary_skipped_reasons
      
        # The summary content.
        # Corresponds to the JSON property `summaryText`
        # @return [String]
        attr_accessor :summary_text
      
        # Summary with metadata information.
        # Corresponds to the JSON property `summaryWithMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummarySummaryWithMetadata]
        attr_accessor :summary_with_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @safety_attributes = args[:safety_attributes] if args.key?(:safety_attributes)
          @summary_skipped_reasons = args[:summary_skipped_reasons] if args.key?(:summary_skipped_reasons)
          @summary_text = args[:summary_text] if args.key?(:summary_text)
          @summary_with_metadata = args[:summary_with_metadata] if args.key?(:summary_with_metadata)
        end
      end
      
      # Citation info for a segment.
      class GoogleCloudDiscoveryengineV1SearchResponseSummaryCitation
        include Google::Apis::Core::Hashable
      
        # End of the attributed segment, exclusive.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # Citation sources for the attributed segment.
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummaryCitationSource>]
        attr_accessor :sources
      
        # Index indicates the start of the segment, measured in bytes/unicode.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @sources = args[:sources] if args.key?(:sources)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Citation metadata.
      class GoogleCloudDiscoveryengineV1SearchResponseSummaryCitationMetadata
        include Google::Apis::Core::Hashable
      
        # Citations for segments.
        # Corresponds to the JSON property `citations`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummaryCitation>]
        attr_accessor :citations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @citations = args[:citations] if args.key?(:citations)
        end
      end
      
      # Citation source.
      class GoogleCloudDiscoveryengineV1SearchResponseSummaryCitationSource
        include Google::Apis::Core::Hashable
      
        # Document reference index from SummaryWithMetadata.references. It is 0-indexed
        # and the value will be zero if the reference_index is not set explicitly.
        # Corresponds to the JSON property `referenceIndex`
        # @return [Fixnum]
        attr_accessor :reference_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_index = args[:reference_index] if args.key?(:reference_index)
        end
      end
      
      # Document reference.
      class GoogleCloudDiscoveryengineV1SearchResponseSummaryReference
        include Google::Apis::Core::Hashable
      
        # List of cited chunk contents derived from document content.
        # Corresponds to the JSON property `chunkContents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummaryReferenceChunkContent>]
        attr_accessor :chunk_contents
      
        # Required. Document.name of the document. Full resource name of the referenced
        # document, in the format `projects/*/locations/*/collections/*/dataStores/*/
        # branches/*/documents/*`.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # Title of the document.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Cloud Storage or HTTP uri for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_contents = args[:chunk_contents] if args.key?(:chunk_contents)
          @document = args[:document] if args.key?(:document)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Chunk content.
      class GoogleCloudDiscoveryengineV1SearchResponseSummaryReferenceChunkContent
        include Google::Apis::Core::Hashable
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
        end
      end
      
      # Safety Attribute categories and their associated confidence scores.
      class GoogleCloudDiscoveryengineV1SearchResponseSummarySafetyAttributes
        include Google::Apis::Core::Hashable
      
        # The display names of Safety Attribute categories associated with the generated
        # content. Order matches the Scores.
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # The confidence scores of the each category, higher value means higher
        # confidence. Order matches the Categories.
        # Corresponds to the JSON property `scores`
        # @return [Array<Float>]
        attr_accessor :scores
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
          @scores = args[:scores] if args.key?(:scores)
        end
      end
      
      # Summary with metadata information.
      class GoogleCloudDiscoveryengineV1SearchResponseSummarySummaryWithMetadata
        include Google::Apis::Core::Hashable
      
        # Citation metadata.
        # Corresponds to the JSON property `citationMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummaryCitationMetadata]
        attr_accessor :citation_metadata
      
        # Document References.
        # Corresponds to the JSON property `references`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchResponseSummaryReference>]
        attr_accessor :references
      
        # Summary text with no citation information.
        # Corresponds to the JSON property `summary`
        # @return [String]
        attr_accessor :summary
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @citation_metadata = args[:citation_metadata] if args.key?(:citation_metadata)
          @references = args[:references] if args.key?(:references)
          @summary = args[:summary] if args.key?(:summary)
        end
      end
      
      # Configures metadata that is used to generate serving time results (e.g. search
      # results or recommendation predictions). The ServingConfig is passed in the
      # search and predict request and generates results.
      class GoogleCloudDiscoveryengineV1ServingConfig
        include Google::Apis::Core::Hashable
      
        # Boost controls to use in serving path. All triggered boost controls will be
        # applied. Boost controls must be in the same data store as the serving config.
        # Maximum of 20 boost controls.
        # Corresponds to the JSON property `boostControlIds`
        # @return [Array<String>]
        attr_accessor :boost_control_ids
      
        # Output only. ServingConfig created timestamp.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Required. The human readable serving config display name. Used in Discovery UI.
        # This field must be a UTF-8 encoded string with a length limit of 128
        # characters. Otherwise, an INVALID_ARGUMENT error is returned.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Condition do not associate specifications. If multiple do not associate
        # conditions match, all matching do not associate controls in the list will
        # execute. Order does not matter. Maximum number of specifications is 100. Can
        # only be set if SolutionType is SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `dissociateControlIds`
        # @return [Array<String>]
        attr_accessor :dissociate_control_ids
      
        # How much diversity to use in recommendation model results e.g. `medium-
        # diversity` or `high-diversity`. Currently supported values: * `no-diversity` *
        # `low-diversity` * `medium-diversity` * `high-diversity` * `auto-diversity` If
        # not specified, we choose default based on recommendation model type. Default
        # value: `no-diversity`. Can only be set if SolutionType is
        # SOLUTION_TYPE_RECOMMENDATION.
        # Corresponds to the JSON property `diversityLevel`
        # @return [String]
        attr_accessor :diversity_level
      
        # Filter controls to use in serving path. All triggered filter controls will be
        # applied. Filter controls must be in the same data store as the serving config.
        # Maximum of 20 filter controls.
        # Corresponds to the JSON property `filterControlIds`
        # @return [Array<String>]
        attr_accessor :filter_control_ids
      
        # Specifies the configurations needed for Generic Discovery.Currently we support:
        # * `content_search_spec`: configuration for generic content search.
        # Corresponds to the JSON property `genericConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ServingConfigGenericConfig]
        attr_accessor :generic_config
      
        # Condition ignore specifications. If multiple ignore conditions match, all
        # matching ignore controls in the list will execute. Order does not matter.
        # Maximum number of specifications is 100.
        # Corresponds to the JSON property `ignoreControlIds`
        # @return [Array<String>]
        attr_accessor :ignore_control_ids
      
        # Specifies the configurations needed for Media Discovery. Currently we support:
        # * `demote_content_watched`: Threshold for watched content demotion. Customers
        # can specify if using watched content demotion or use viewed detail page. Using
        # the content watched demotion, customers need to specify the watched minutes or
        # percentage exceeds the threshold, the content will be demoted in the
        # recommendation result. * `promote_fresh_content`: cutoff days for fresh
        # content promotion. Customers can specify if using content freshness promotion.
        # If the content was published within the cutoff days, the content will be
        # promoted in the recommendation result. Can only be set if SolutionType is
        # SOLUTION_TYPE_RECOMMENDATION.
        # Corresponds to the JSON property `mediaConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ServingConfigMediaConfig]
        attr_accessor :media_config
      
        # The id of the model to use at serving time. Currently only
        # RecommendationModels are supported. Can be changed but only to a compatible
        # model (e.g. others-you-may-like CTR to others-you-may-like CVR). Required when
        # SolutionType is SOLUTION_TYPE_RECOMMENDATION.
        # Corresponds to the JSON property `modelId`
        # @return [String]
        attr_accessor :model_id
      
        # Immutable. Fully qualified name `projects/`project`/locations/`location`/
        # collections/`collection_id`/engines/`engine_id`/servingConfigs/`
        # serving_config_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Condition oneway synonyms specifications. If multiple oneway synonyms
        # conditions match, all matching oneway synonyms controls in the list will
        # execute. Maximum number of specifications is 100. Can only be set if
        # SolutionType is SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `onewaySynonymsControlIds`
        # @return [Array<String>]
        attr_accessor :oneway_synonyms_control_ids
      
        # Condition promote specifications. Maximum number of specifications is 100.
        # Corresponds to the JSON property `promoteControlIds`
        # @return [Array<String>]
        attr_accessor :promote_control_ids
      
        # The ranking expression controls the customized ranking on retrieval documents.
        # To leverage this, document embedding is required. The ranking expression
        # setting in ServingConfig applies to all search requests served by the serving
        # config. However, if SearchRequest.ranking_expression is specified, it
        # overrides the ServingConfig ranking expression. The ranking expression is a
        # single function or multiple functions that are joined by "+". *
        # ranking_expression = function, ` " + ", function `; Supported functions: *
        # double * relevance_score * double * dotProduct(embedding_field_path) Function
        # variables: * `relevance_score`: pre-defined keywords, used for measure
        # relevance between query and document. * `embedding_field_path`: the document
        # embedding field used with query embedding vector. * `dotProduct`: embedding
        # function between embedding_field_path and query embedding vector. Example
        # ranking expression: If document has an embedding field doc_embedding, the
        # ranking expression could be `0.5 * relevance_score + 0.3 * dotProduct(
        # doc_embedding)`.
        # Corresponds to the JSON property `rankingExpression`
        # @return [String]
        attr_accessor :ranking_expression
      
        # IDs of the redirect controls. Only the first triggered redirect action is
        # applied, even if multiple apply. Maximum number of specifications is 100. Can
        # only be set if SolutionType is SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `redirectControlIds`
        # @return [Array<String>]
        attr_accessor :redirect_control_ids
      
        # Condition replacement specifications. Applied according to the order in the
        # list. A previously replaced term can not be re-replaced. Maximum number of
        # specifications is 100. Can only be set if SolutionType is SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `replacementControlIds`
        # @return [Array<String>]
        attr_accessor :replacement_control_ids
      
        # Required. Immutable. Specifies the solution type that a serving config can be
        # associated with.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Condition synonyms specifications. If multiple synonyms conditions match, all
        # matching synonyms controls in the list will execute. Maximum number of
        # specifications is 100. Can only be set if SolutionType is SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `synonymsControlIds`
        # @return [Array<String>]
        attr_accessor :synonyms_control_ids
      
        # Output only. ServingConfig updated timestamp.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_control_ids = args[:boost_control_ids] if args.key?(:boost_control_ids)
          @create_time = args[:create_time] if args.key?(:create_time)
          @display_name = args[:display_name] if args.key?(:display_name)
          @dissociate_control_ids = args[:dissociate_control_ids] if args.key?(:dissociate_control_ids)
          @diversity_level = args[:diversity_level] if args.key?(:diversity_level)
          @filter_control_ids = args[:filter_control_ids] if args.key?(:filter_control_ids)
          @generic_config = args[:generic_config] if args.key?(:generic_config)
          @ignore_control_ids = args[:ignore_control_ids] if args.key?(:ignore_control_ids)
          @media_config = args[:media_config] if args.key?(:media_config)
          @model_id = args[:model_id] if args.key?(:model_id)
          @name = args[:name] if args.key?(:name)
          @oneway_synonyms_control_ids = args[:oneway_synonyms_control_ids] if args.key?(:oneway_synonyms_control_ids)
          @promote_control_ids = args[:promote_control_ids] if args.key?(:promote_control_ids)
          @ranking_expression = args[:ranking_expression] if args.key?(:ranking_expression)
          @redirect_control_ids = args[:redirect_control_ids] if args.key?(:redirect_control_ids)
          @replacement_control_ids = args[:replacement_control_ids] if args.key?(:replacement_control_ids)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @synonyms_control_ids = args[:synonyms_control_ids] if args.key?(:synonyms_control_ids)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Specifies the configurations needed for Generic Discovery.Currently we support:
      # * `content_search_spec`: configuration for generic content search.
      class GoogleCloudDiscoveryengineV1ServingConfigGenericConfig
        include Google::Apis::Core::Hashable
      
        # A specification for configuring the behavior of content search.
        # Corresponds to the JSON property `contentSearchSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchRequestContentSearchSpec]
        attr_accessor :content_search_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_search_spec = args[:content_search_spec] if args.key?(:content_search_spec)
        end
      end
      
      # Specifies the configurations needed for Media Discovery. Currently we support:
      # * `demote_content_watched`: Threshold for watched content demotion. Customers
      # can specify if using watched content demotion or use viewed detail page. Using
      # the content watched demotion, customers need to specify the watched minutes or
      # percentage exceeds the threshold, the content will be demoted in the
      # recommendation result. * `promote_fresh_content`: cutoff days for fresh
      # content promotion. Customers can specify if using content freshness promotion.
      # If the content was published within the cutoff days, the content will be
      # promoted in the recommendation result. Can only be set if SolutionType is
      # SOLUTION_TYPE_RECOMMENDATION.
      class GoogleCloudDiscoveryengineV1ServingConfigMediaConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the content freshness used for recommendation result. Contents will
        # be demoted if contents were published for more than content freshness cutoff
        # days.
        # Corresponds to the JSON property `contentFreshnessCutoffDays`
        # @return [Fixnum]
        attr_accessor :content_freshness_cutoff_days
      
        # Specifies the content watched percentage threshold for demotion. Threshold
        # value must be between [0, 1.0] inclusive.
        # Corresponds to the JSON property `contentWatchedPercentageThreshold`
        # @return [Float]
        attr_accessor :content_watched_percentage_threshold
      
        # Specifies the content watched minutes threshold for demotion.
        # Corresponds to the JSON property `contentWatchedSecondsThreshold`
        # @return [Float]
        attr_accessor :content_watched_seconds_threshold
      
        # Optional. Specifies the number of days to look back for demoting watched
        # content. If set to zero or unset, defaults to the maximum of 365 days.
        # Corresponds to the JSON property `demoteContentWatchedPastDays`
        # @return [Fixnum]
        attr_accessor :demote_content_watched_past_days
      
        # Specifies the event type used for demoting recommendation result. Currently
        # supported values: * `view-item`: Item viewed. * `media-play`: Start/resume
        # watching a video, playing a song, etc. * `media-complete`: Finished or stopped
        # midway through a video, song, etc. If unset, watch history demotion will not
        # be applied. Content freshness demotion will still be applied.
        # Corresponds to the JSON property `demotionEventType`
        # @return [String]
        attr_accessor :demotion_event_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_freshness_cutoff_days = args[:content_freshness_cutoff_days] if args.key?(:content_freshness_cutoff_days)
          @content_watched_percentage_threshold = args[:content_watched_percentage_threshold] if args.key?(:content_watched_percentage_threshold)
          @content_watched_seconds_threshold = args[:content_watched_seconds_threshold] if args.key?(:content_watched_seconds_threshold)
          @demote_content_watched_past_days = args[:demote_content_watched_past_days] if args.key?(:demote_content_watched_past_days)
          @demotion_event_type = args[:demotion_event_type] if args.key?(:demotion_event_type)
        end
      end
      
      # External session proto definition.
      class GoogleCloudDiscoveryengineV1Session
        include Google::Apis::Core::Hashable
      
        # Optional. The display name of the session. This field is used to identify the
        # session in the UI. By default, the display name is the first turn query text
        # in the session.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. The time the session finished.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional. Whether the session is pinned, pinned session will be displayed on
        # the top of the session list.
        # Corresponds to the JSON property `isPinned`
        # @return [Boolean]
        attr_accessor :is_pinned
        alias_method :is_pinned?, :is_pinned
      
        # Immutable. Fully qualified name `projects/`project`/locations/global/
        # collections/`collection`/engines/`engine`/sessions/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time the session started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The state of the session.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Turns.
        # Corresponds to the JSON property `turns`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SessionTurn>]
        attr_accessor :turns
      
        # A unique identifier for tracking users.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @end_time = args[:end_time] if args.key?(:end_time)
          @is_pinned = args[:is_pinned] if args.key?(:is_pinned)
          @name = args[:name] if args.key?(:name)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @turns = args[:turns] if args.key?(:turns)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Represents a turn, including a query from the user and a answer from service.
      class GoogleCloudDiscoveryengineV1SessionTurn
        include Google::Apis::Core::Hashable
      
        # The resource name of the answer to the user query. Only set if the answer
        # generation (/answer API call) happened in this turn.
        # Corresponds to the JSON property `answer`
        # @return [String]
        attr_accessor :answer
      
        # Defines an answer.
        # Corresponds to the JSON property `detailedAnswer`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Answer]
        attr_accessor :detailed_answer
      
        # Defines a user inputed query.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1Query]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer = args[:answer] if args.key?(:answer)
          @detailed_answer = args[:detailed_answer] if args.key?(:detailed_answer)
          @query = args[:query] if args.key?(:query)
        end
      end
      
      # Metadata for single-regional CMEKs.
      class GoogleCloudDiscoveryengineV1SingleRegionKey
        include Google::Apis::Core::Hashable
      
        # Required. Single-regional kms key resource name which will be used to encrypt
        # resources `projects/`project`/locations/`location`/keyRings/`keyRing`/
        # cryptoKeys/`keyId``.
        # Corresponds to the JSON property `kmsKey`
        # @return [String]
        attr_accessor :kms_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kms_key = args[:kms_key] if args.key?(:kms_key)
        end
      end
      
      # SiteSearchEngine captures DataStore level site search persisting
      # configurations. It is a singleton value per data store.
      class GoogleCloudDiscoveryengineV1SiteSearchEngine
        include Google::Apis::Core::Hashable
      
        # The fully qualified resource name of the site search engine. Format: `projects/
        # */locations/*/dataStores/*/siteSearchEngine`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Verification information for target sites in advanced site search.
      class GoogleCloudDiscoveryengineV1SiteVerificationInfo
        include Google::Apis::Core::Hashable
      
        # Site verification state indicating the ownership and validity.
        # Corresponds to the JSON property `siteVerificationState`
        # @return [String]
        attr_accessor :site_verification_state
      
        # Latest site verification time.
        # Corresponds to the JSON property `verifyTime`
        # @return [String]
        attr_accessor :verify_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @site_verification_state = args[:site_verification_state] if args.key?(:site_verification_state)
          @verify_time = args[:verify_time] if args.key?(:verify_time)
        end
      end
      
      # The Spanner source for importing data
      class GoogleCloudDiscoveryengineV1SpannerSource
        include Google::Apis::Core::Hashable
      
        # Required. The database ID of the source Spanner table.
        # Corresponds to the JSON property `databaseId`
        # @return [String]
        attr_accessor :database_id
      
        # Whether to apply data boost on Spanner export. Enabling this option will incur
        # additional cost. More info can be found [here](https://cloud.google.com/
        # spanner/docs/databoost/databoost-overview#billing_and_quotas).
        # Corresponds to the JSON property `enableDataBoost`
        # @return [Boolean]
        attr_accessor :enable_data_boost
        alias_method :enable_data_boost?, :enable_data_boost
      
        # Required. The instance ID of the source Spanner table.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # The project ID that contains the Spanner source. Has a length limit of 128
        # characters. If not specified, inherits the project ID from the parent request.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Required. The table name of the Spanner database that needs to be imported.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @database_id = args[:database_id] if args.key?(:database_id)
          @enable_data_boost = args[:enable_data_boost] if args.key?(:enable_data_boost)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Suggestion deny list entry identifying the phrase to block from suggestions
      # and the applied operation for the phrase.
      class GoogleCloudDiscoveryengineV1SuggestionDenyListEntry
        include Google::Apis::Core::Hashable
      
        # Required. Phrase to block from suggestions served. Can be maximum 125
        # characters.
        # Corresponds to the JSON property `blockPhrase`
        # @return [String]
        attr_accessor :block_phrase
      
        # Required. The match operator to apply for this phrase. Whether to block the
        # exact phrase, or block any suggestions containing this phrase.
        # Corresponds to the JSON property `matchOperator`
        # @return [String]
        attr_accessor :match_operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_phrase = args[:block_phrase] if args.key?(:block_phrase)
          @match_operator = args[:match_operator] if args.key?(:match_operator)
        end
      end
      
      # A target site for the SiteSearchEngine.
      class GoogleCloudDiscoveryengineV1TargetSite
        include Google::Apis::Core::Hashable
      
        # Input only. If set to false, a uri_pattern is generated to include all pages
        # whose address contains the provided_uri_pattern. If set to true, an
        # uri_pattern is generated to try to be an exact match of the
        # provided_uri_pattern or just the specific page if the provided_uri_pattern is
        # a specific one. provided_uri_pattern is always normalized to generate the URI
        # pattern to be used by the search engine.
        # Corresponds to the JSON property `exactMatch`
        # @return [Boolean]
        attr_accessor :exact_match
        alias_method :exact_match?, :exact_match
      
        # Site search indexing failure reasons.
        # Corresponds to the JSON property `failureReason`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TargetSiteFailureReason]
        attr_accessor :failure_reason
      
        # Output only. This is system-generated based on the provided_uri_pattern.
        # Corresponds to the JSON property `generatedUriPattern`
        # @return [String]
        attr_accessor :generated_uri_pattern
      
        # Output only. Indexing status.
        # Corresponds to the JSON property `indexingStatus`
        # @return [String]
        attr_accessor :indexing_status
      
        # Output only. The fully qualified resource name of the target site. `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # siteSearchEngine/targetSites/`target_site`` The `target_site_id` is system-
        # generated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. Input only. The user provided URI pattern from which the `
        # generated_uri_pattern` is generated.
        # Corresponds to the JSON property `providedUriPattern`
        # @return [String]
        attr_accessor :provided_uri_pattern
      
        # Output only. Root domain of the provided_uri_pattern.
        # Corresponds to the JSON property `rootDomainUri`
        # @return [String]
        attr_accessor :root_domain_uri
      
        # Verification information for target sites in advanced site search.
        # Corresponds to the JSON property `siteVerificationInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SiteVerificationInfo]
        attr_accessor :site_verification_info
      
        # The type of the target site, e.g., whether the site is to be included or
        # excluded.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Output only. The target site's last updated time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exact_match = args[:exact_match] if args.key?(:exact_match)
          @failure_reason = args[:failure_reason] if args.key?(:failure_reason)
          @generated_uri_pattern = args[:generated_uri_pattern] if args.key?(:generated_uri_pattern)
          @indexing_status = args[:indexing_status] if args.key?(:indexing_status)
          @name = args[:name] if args.key?(:name)
          @provided_uri_pattern = args[:provided_uri_pattern] if args.key?(:provided_uri_pattern)
          @root_domain_uri = args[:root_domain_uri] if args.key?(:root_domain_uri)
          @site_verification_info = args[:site_verification_info] if args.key?(:site_verification_info)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Site search indexing failure reasons.
      class GoogleCloudDiscoveryengineV1TargetSiteFailureReason
        include Google::Apis::Core::Hashable
      
        # Failed due to insufficient quota.
        # Corresponds to the JSON property `quotaFailure`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TargetSiteFailureReasonQuotaFailure]
        attr_accessor :quota_failure
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quota_failure = args[:quota_failure] if args.key?(:quota_failure)
        end
      end
      
      # Failed due to insufficient quota.
      class GoogleCloudDiscoveryengineV1TargetSiteFailureReasonQuotaFailure
        include Google::Apis::Core::Hashable
      
        # This number is an estimation on how much total quota this project needs to
        # successfully complete indexing.
        # Corresponds to the JSON property `totalRequiredQuota`
        # @return [Fixnum]
        attr_accessor :total_required_quota
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @total_required_quota = args[:total_required_quota] if args.key?(:total_required_quota)
        end
      end
      
      # Defines text input.
      class GoogleCloudDiscoveryengineV1TextInput
        include Google::Apis::Core::Hashable
      
        # Defines context of the conversation
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ConversationContext]
        attr_accessor :context
      
        # Text input.
        # Corresponds to the JSON property `input`
        # @return [String]
        attr_accessor :input
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @input = args[:input] if args.key?(:input)
        end
      end
      
      # Metadata related to the progress of the TrainCustomModel operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1TrainCustomModelMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for SearchTuningService.TrainCustomModel method.
      class GoogleCloudDiscoveryengineV1TrainCustomModelRequest
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # Cloud Storage training data input.
        # Corresponds to the JSON property `gcsTrainingInput`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TrainCustomModelRequestGcsTrainingInput]
        attr_accessor :gcs_training_input
      
        # If not provided, a UUID will be generated.
        # Corresponds to the JSON property `modelId`
        # @return [String]
        attr_accessor :model_id
      
        # Model to be trained. Supported values are: * **search-tuning**: Fine tuning
        # the search system based on data provided.
        # Corresponds to the JSON property `modelType`
        # @return [String]
        attr_accessor :model_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @gcs_training_input = args[:gcs_training_input] if args.key?(:gcs_training_input)
          @model_id = args[:model_id] if args.key?(:model_id)
          @model_type = args[:model_type] if args.key?(:model_type)
        end
      end
      
      # Cloud Storage training data input.
      class GoogleCloudDiscoveryengineV1TrainCustomModelRequestGcsTrainingInput
        include Google::Apis::Core::Hashable
      
        # The Cloud Storage corpus data which could be associated in train data. The
        # data path format is `gs:///`. A newline delimited jsonl/ndjson file. For
        # search-tuning model, each line should have the _id, title and text. Example: ``
        # "_id": "doc1", title: "relevant doc", "text": "relevant text"``
        # Corresponds to the JSON property `corpusDataPath`
        # @return [String]
        attr_accessor :corpus_data_path
      
        # The gcs query data which could be associated in train data. The data path
        # format is `gs:///`. A newline delimited jsonl/ndjson file. For search-tuning
        # model, each line should have the _id and text. Example: `"_id": "query1", "
        # text": "example query"`
        # Corresponds to the JSON property `queryDataPath`
        # @return [String]
        attr_accessor :query_data_path
      
        # Cloud Storage test data. Same format as train_data_path. If not provided, a
        # random 80/20 train/test split will be performed on train_data_path.
        # Corresponds to the JSON property `testDataPath`
        # @return [String]
        attr_accessor :test_data_path
      
        # Cloud Storage training data path whose format should be `gs:///`. The file
        # should be in tsv format. Each line should have the doc_id and query_id and
        # score (number). For search-tuning model, it should have the query-id corpus-id
        # score as tsv file header. The score should be a number in `[0, inf+)`. The
        # larger the number is, the more relevant the pair is. Example: * `query-id\
        # tcorpus-id\tscore` * `query1\tdoc1\t1`
        # Corresponds to the JSON property `trainDataPath`
        # @return [String]
        attr_accessor :train_data_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @corpus_data_path = args[:corpus_data_path] if args.key?(:corpus_data_path)
          @query_data_path = args[:query_data_path] if args.key?(:query_data_path)
          @test_data_path = args[:test_data_path] if args.key?(:test_data_path)
          @train_data_path = args[:train_data_path] if args.key?(:train_data_path)
        end
      end
      
      # Response of the TrainCustomModelRequest. This message is returned by the
      # google.longrunning.Operations.response field.
      class GoogleCloudDiscoveryengineV1TrainCustomModelResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1ImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the data.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # The metrics of the trained model.
        # Corresponds to the JSON property `metrics`
        # @return [Hash<String,Float>]
        attr_accessor :metrics
      
        # Fully qualified name of the CustomTuningModel.
        # Corresponds to the JSON property `modelName`
        # @return [String]
        attr_accessor :model_name
      
        # The trained model status. Possible values are: * **bad-data**: The training
        # data quality is bad. * **no-improvement**: Tuning didn't improve performance.
        # Won't deploy. * **in-progress**: Model training job creation is in progress. *
        # **training**: Model is actively training. * **evaluating**: The model is
        # evaluating trained metrics. * **indexing**: The model trained metrics are
        # indexing. * **ready**: The model is ready for serving.
        # Corresponds to the JSON property `modelStatus`
        # @return [String]
        attr_accessor :model_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @metrics = args[:metrics] if args.key?(:metrics)
          @model_name = args[:model_name] if args.key?(:model_name)
          @model_status = args[:model_status] if args.key?(:model_status)
        end
      end
      
      # A transaction represents the entire purchase transaction.
      class GoogleCloudDiscoveryengineV1TransactionInfo
        include Google::Apis::Core::Hashable
      
        # All the costs associated with the products. These can be manufacturing costs,
        # shipping expenses not borne by the end user, or any other costs, such that: *
        # Profit = value - tax - cost
        # Corresponds to the JSON property `cost`
        # @return [Float]
        attr_accessor :cost
      
        # Required. Currency code. Use three-character ISO-4217 code.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # The total discount(s) value applied to this transaction. This figure should be
        # excluded from TransactionInfo.value For example, if a user paid
        # TransactionInfo.value amount, then nominal (pre-discount) value of the
        # transaction is the sum of TransactionInfo.value and TransactionInfo.
        # discount_value This means that profit is calculated the same way, regardless
        # of the discount value, and that TransactionInfo.discount_value can be larger
        # than TransactionInfo.value: * Profit = value - tax - cost
        # Corresponds to the JSON property `discountValue`
        # @return [Float]
        attr_accessor :discount_value
      
        # All the taxes associated with the transaction.
        # Corresponds to the JSON property `tax`
        # @return [Float]
        attr_accessor :tax
      
        # The transaction ID with a length limit of 128 characters.
        # Corresponds to the JSON property `transactionId`
        # @return [String]
        attr_accessor :transaction_id
      
        # Required. Total non-zero value associated with the transaction. This value may
        # include shipping, tax, or other adjustments to the total value that you want
        # to include.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cost = args[:cost] if args.key?(:cost)
          @currency = args[:currency] if args.key?(:currency)
          @discount_value = args[:discount_value] if args.key?(:discount_value)
          @tax = args[:tax] if args.key?(:tax)
          @transaction_id = args[:transaction_id] if args.key?(:transaction_id)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Metadata related to the progress of the CmekConfigService.UpdateCmekConfig
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1UpdateCmekConfigMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for UpdateSchema LRO.
      class GoogleCloudDiscoveryengineV1UpdateSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # UpdateTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1UpdateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # UserEvent captures all metadata information Discovery Engine API needs to know
      # about how end users interact with your website.
      class GoogleCloudDiscoveryengineV1UserEvent
        include Google::Apis::Core::Hashable
      
        # Extra user event features to include in the recommendation model. These
        # attributes must NOT contain data that needs to be parsed or processed further,
        # e.g. JSON or other encodings. If you provide custom attributes for ingested
        # user events, also include them in the user events that you associate with
        # prediction requests. Custom attribute formatting must be consistent between
        # imported events and events provided with prediction requests. This lets the
        # Discovery Engine API use those custom attributes when training models and
        # serving predictions, which helps improve recommendation quality. This field
        # needs to pass all below criteria, otherwise an `INVALID_ARGUMENT` error is
        # returned: * The key must be a UTF-8 encoded string with a length limit of 5,
        # 000 characters. * For text attributes, at most 400 values are allowed. Empty
        # values are not allowed. Each value must be a UTF-8 encoded string with a
        # length limit of 256 characters. * For number attributes, at most 400 values
        # are allowed. For product recommendations, an example of extra user information
        # is `traffic_channel`, which is how a user arrives at the site. Users can
        # arrive at the site by coming to the site directly, coming through Google
        # search, or in other ways.
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CustomAttribute>]
        attr_accessor :attributes
      
        # Token to attribute an API response to user action(s) to trigger the event.
        # Highly recommended for user events that are the result of
        # RecommendationService.Recommend. This field enables accurate attribution of
        # recommendation model performance. The value must be one of: *
        # RecommendResponse.attribution_token for events that are the result of
        # RecommendationService.Recommend. * SearchResponse.attribution_token for events
        # that are the result of SearchService.Search. This token enables us to
        # accurately attribute page view or conversion completion back to the event and
        # the particular predict response containing this clicked/purchased product. If
        # user clicks on product K in the recommendation results, pass RecommendResponse.
        # attribution_token as a URL parameter to product K's page. When recording
        # events on product K's page, log the RecommendResponse.attribution_token to
        # this field.
        # Corresponds to the JSON property `attributionToken`
        # @return [String]
        attr_accessor :attribution_token
      
        # Detailed completion information including completion attribution token and
        # clicked completion info.
        # Corresponds to the JSON property `completionInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1CompletionInfo]
        attr_accessor :completion_info
      
        # Optional. Conversion type. Required if UserEvent.event_type is `conversion`.
        # This is a customer-defined conversion name in lowercase letters or numbers
        # separated by "-", such as "watch", "good-visit" etc. Do not set the field if
        # UserEvent.event_type is not `conversion`. This mixes the custom conversion
        # event with predefined events like `search`, `view-item` etc.
        # Corresponds to the JSON property `conversionType`
        # @return [String]
        attr_accessor :conversion_type
      
        # The DataStore resource full name, of the form `projects/`project`/locations/`
        # location`/collections/`collection_id`/dataStores/`data_store_id``. Optional.
        # Only required for user events whose data store can't by determined by
        # UserEvent.engine or UserEvent.documents. If data store is set in the parent of
        # write/import/collect user event requests, this field can be omitted.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Should set to true if the request is made directly from the end user, in which
        # case the UserEvent.user_info.user_agent can be populated from the HTTP request.
        # This flag should be set only if the API request is made directly from the end
        # user such as a mobile app (and not if a gateway or a server is processing and
        # pushing the user events). This should not be set when using the JavaScript tag
        # in UserEventService.CollectUserEvent.
        # Corresponds to the JSON property `directUserRequest`
        # @return [Boolean]
        attr_accessor :direct_user_request
        alias_method :direct_user_request?, :direct_user_request
      
        # List of Documents associated with this user event. This field is optional
        # except for the following event types: * `view-item` * `add-to-cart` * `
        # purchase` * `media-play` * `media-complete` In a `search` event, this field
        # represents the documents returned to the end user on the current page (the end
        # user may have not finished browsing the whole page yet). When a new page is
        # returned to the end user, after pagination/filtering/ordering even for the
        # same query, a new `search` event with different UserEvent.documents is desired.
        # Corresponds to the JSON property `documents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1DocumentInfo>]
        attr_accessor :documents
      
        # The Engine resource name, in the form of `projects/`project`/locations/`
        # location`/collections/`collection_id`/engines/`engine_id``. Optional. Only
        # required for Engine produced user events. For example, user events from
        # blended search.
        # Corresponds to the JSON property `engine`
        # @return [String]
        attr_accessor :engine
      
        # Only required for UserEventService.ImportUserEvents method. Timestamp of when
        # the user event happened.
        # Corresponds to the JSON property `eventTime`
        # @return [String]
        attr_accessor :event_time
      
        # Required. User event type. Allowed values are: Generic values: * `search`:
        # Search for Documents. * `view-item`: Detailed page view of a Document. * `view-
        # item-list`: View of a panel or ordered list of Documents. * `view-home-page`:
        # View of the home page. * `view-category-page`: View of a category page, e.g.
        # Home > Men > Jeans * `add-feedback`: Add a user feedback. Retail-related
        # values: * `add-to-cart`: Add an item(s) to cart, e.g. in Retail online
        # shopping * `purchase`: Purchase an item(s) Media-related values: * `media-play`
        # : Start/resume watching a video, playing a song, etc. * `media-complete`:
        # Finished or stopped midway through a video, song, etc. Custom conversion value:
        # * `conversion`: Customer defined conversion event.
        # Corresponds to the JSON property `eventType`
        # @return [String]
        attr_accessor :event_type
      
        # The filter syntax consists of an expression language for constructing a
        # predicate from one or more fields of the documents being filtered. One example
        # is for `search` events, the associated SearchRequest may contain a filter
        # expression in SearchRequest.filter conforming to https://google.aip.dev/160#
        # filtering. Similarly, for `view-item-list` events that are generated from a
        # RecommendRequest, this field may be populated directly from RecommendRequest.
        # filter conforming to https://google.aip.dev/160#filtering. The value must be a
        # UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an `
        # INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Media-specific user event information.
        # Corresponds to the JSON property `mediaInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1MediaInfo]
        attr_accessor :media_info
      
        # Detailed page information.
        # Corresponds to the JSON property `pageInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1PageInfo]
        attr_accessor :page_info
      
        # Detailed panel information associated with a user event.
        # Corresponds to the JSON property `panel`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1PanelInfo]
        attr_accessor :panel
      
        # Optional. List of panels associated with this event. Used for page-level
        # impression data.
        # Corresponds to the JSON property `panels`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1PanelInfo>]
        attr_accessor :panels
      
        # The promotion IDs if this is an event associated with promotions. Currently,
        # this field is restricted to at most one ID.
        # Corresponds to the JSON property `promotionIds`
        # @return [Array<String>]
        attr_accessor :promotion_ids
      
        # Detailed search information.
        # Corresponds to the JSON property `searchInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1SearchInfo]
        attr_accessor :search_info
      
        # A unique identifier for tracking a visitor session with a length limit of 128
        # bytes. A session is an aggregation of an end user behavior in a time span. A
        # general guideline to populate the session_id: 1. If user has no activity for
        # 30 min, a new session_id should be assigned. 2. The session_id should be
        # unique across users, suggest use uuid or add UserEvent.user_pseudo_id as
        # prefix.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        # A list of identifiers for the independent experiment groups this user event
        # belongs to. This is used to distinguish between user events associated with
        # different experiment setups.
        # Corresponds to the JSON property `tagIds`
        # @return [Array<String>]
        attr_accessor :tag_ids
      
        # A transaction represents the entire purchase transaction.
        # Corresponds to the JSON property `transactionInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1TransactionInfo]
        attr_accessor :transaction_info
      
        # Information of an end user.
        # Corresponds to the JSON property `userInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1UserInfo]
        attr_accessor :user_info
      
        # Required. A unique identifier for tracking visitors. For example, this could
        # be implemented with an HTTP cookie, which should be able to uniquely identify
        # a visitor on a single device. This unique identifier should not change if the
        # visitor log in/out of the website. Do not set the field to the same fixed ID
        # for different users. This mixes the event history of those users together,
        # which results in degraded model quality. The field must be a UTF-8 encoded
        # string with a length limit of 128 characters. Otherwise, an `INVALID_ARGUMENT`
        # error is returned. The field should not contain PII or user-data. We recommend
        # to use Google Analytics [Client ID](https://developers.google.com/analytics/
        # devguides/collection/analyticsjs/field-reference#clientId) for this field.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @attribution_token = args[:attribution_token] if args.key?(:attribution_token)
          @completion_info = args[:completion_info] if args.key?(:completion_info)
          @conversion_type = args[:conversion_type] if args.key?(:conversion_type)
          @data_store = args[:data_store] if args.key?(:data_store)
          @direct_user_request = args[:direct_user_request] if args.key?(:direct_user_request)
          @documents = args[:documents] if args.key?(:documents)
          @engine = args[:engine] if args.key?(:engine)
          @event_time = args[:event_time] if args.key?(:event_time)
          @event_type = args[:event_type] if args.key?(:event_type)
          @filter = args[:filter] if args.key?(:filter)
          @media_info = args[:media_info] if args.key?(:media_info)
          @page_info = args[:page_info] if args.key?(:page_info)
          @panel = args[:panel] if args.key?(:panel)
          @panels = args[:panels] if args.key?(:panels)
          @promotion_ids = args[:promotion_ids] if args.key?(:promotion_ids)
          @search_info = args[:search_info] if args.key?(:search_info)
          @session_id = args[:session_id] if args.key?(:session_id)
          @tag_ids = args[:tag_ids] if args.key?(:tag_ids)
          @transaction_info = args[:transaction_info] if args.key?(:transaction_info)
          @user_info = args[:user_info] if args.key?(:user_info)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Information of an end user.
      class GoogleCloudDiscoveryengineV1UserInfo
        include Google::Apis::Core::Hashable
      
        # User agent as included in the HTTP header. The field must be a UTF-8 encoded
        # string with a length limit of 1,000 characters. Otherwise, an `
        # INVALID_ARGUMENT` error is returned. This should not be set when using the
        # client side event reporting with GTM or JavaScript tag in UserEventService.
        # CollectUserEvent or if UserEvent.direct_user_request is set.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        # Highly recommended for logged-in users. Unique identifier for logged-in user,
        # such as a user name. Don't set for anonymous users. Always use a hashed value
        # for this ID. Don't set the field to the same fixed ID for different users.
        # This mixes the event history of those users together, which results in
        # degraded model quality. The field must be a UTF-8 encoded string with a length
        # limit of 128 characters. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # Config to store data store type configuration for workspace data
      class GoogleCloudDiscoveryengineV1WorkspaceConfig
        include Google::Apis::Core::Hashable
      
        # Obfuscated Dasher customer ID.
        # Corresponds to the JSON property `dasherCustomerId`
        # @return [String]
        attr_accessor :dasher_customer_id
      
        # Optional. The super admin email address for the workspace that will be used
        # for access token generation. For now we only use it for Native Google Drive
        # connector data ingestion.
        # Corresponds to the JSON property `superAdminEmailAddress`
        # @return [String]
        attr_accessor :super_admin_email_address
      
        # Optional. The super admin service account for the workspace that will be used
        # for access token generation. For now we only use it for Native Google Drive
        # connector data ingestion.
        # Corresponds to the JSON property `superAdminServiceAccount`
        # @return [String]
        attr_accessor :super_admin_service_account
      
        # The Google Workspace data source.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dasher_customer_id = args[:dasher_customer_id] if args.key?(:dasher_customer_id)
          @super_admin_email_address = args[:super_admin_email_address] if args.key?(:super_admin_email_address)
          @super_admin_service_account = args[:super_admin_service_account] if args.key?(:super_admin_service_account)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Access Control Configuration.
      class GoogleCloudDiscoveryengineV1alphaAclConfig
        include Google::Apis::Core::Hashable
      
        # Identity Provider Config.
        # Corresponds to the JSON property `idpConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaIdpConfig]
        attr_accessor :idp_config
      
        # Immutable. The full resource name of the acl configuration. Format: `projects/`
        # project`/locations/`location`/aclConfig`. This field must be a UTF-8 encoded
        # string with a length limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @idp_config = args[:idp_config] if args.key?(:idp_config)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Informations to support actions on the connector.
      class GoogleCloudDiscoveryengineV1alphaActionConfig
        include Google::Apis::Core::Hashable
      
        # Required. Params needed to support actions in the format of (Key, Value) pairs.
        # Required parameters for sources that support OAUTH, i.e. `gmail`, `
        # google_calendar`, `jira`, `workday`, `salesforce`, `confluence`: * Key: `
        # client_id` * Value: type STRING. The client id for the service provider to
        # identify your application. * Key: `client_secret` * Value:type STRING. The
        # client secret generated by the application's authorization server.
        # Corresponds to the JSON property `actionParams`
        # @return [Hash<String,Object>]
        attr_accessor :action_params
      
        # Output only. The connector contains the necessary parameters and is configured
        # to support actions.
        # Corresponds to the JSON property `isActionConfigured`
        # @return [Boolean]
        attr_accessor :is_action_configured
        alias_method :is_action_configured?, :is_action_configured
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_params = args[:action_params] if args.key?(:action_params)
          @is_action_configured = args[:is_action_configured] if args.key?(:is_action_configured)
        end
      end
      
      # Configuration data for advance site search.
      class GoogleCloudDiscoveryengineV1alphaAdvancedSiteSearchConfig
        include Google::Apis::Core::Hashable
      
        # If set true, automatic refresh is disabled for the DataStore.
        # Corresponds to the JSON property `disableAutomaticRefresh`
        # @return [Boolean]
        attr_accessor :disable_automatic_refresh
        alias_method :disable_automatic_refresh?, :disable_automatic_refresh
      
        # If set true, initial indexing is disabled for the DataStore.
        # Corresponds to the JSON property `disableInitialIndex`
        # @return [Boolean]
        attr_accessor :disable_initial_index
        alias_method :disable_initial_index?, :disable_initial_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_automatic_refresh = args[:disable_automatic_refresh] if args.key?(:disable_automatic_refresh)
          @disable_initial_index = args[:disable_initial_index] if args.key?(:disable_initial_index)
        end
      end
      
      # Defines an answer.
      class GoogleCloudDiscoveryengineV1alphaAnswer
        include Google::Apis::Core::Hashable
      
        # Additional answer-skipped reasons. This provides the reason for ignored cases.
        # If nothing is skipped, this field is not set.
        # Corresponds to the JSON property `answerSkippedReasons`
        # @return [Array<String>]
        attr_accessor :answer_skipped_reasons
      
        # The textual answer.
        # Corresponds to the JSON property `answerText`
        # @return [String]
        attr_accessor :answer_text
      
        # Citations.
        # Corresponds to the JSON property `citations`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerCitation>]
        attr_accessor :citations
      
        # Output only. Answer completed timestamp.
        # Corresponds to the JSON property `completeTime`
        # @return [String]
        attr_accessor :complete_time
      
        # Output only. Answer creation timestamp.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # A score in the range of [0, 1] describing how grounded the answer is by the
        # reference chunks.
        # Corresponds to the JSON property `groundingScore`
        # @return [Float]
        attr_accessor :grounding_score
      
        # Optional. Grounding supports.
        # Corresponds to the JSON property `groundingSupports`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerGroundingSupport>]
        attr_accessor :grounding_supports
      
        # Immutable. Fully qualified name `projects/`project`/locations/global/
        # collections/`collection`/engines/`engine`/sessions/*/answers/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Query understanding information.
        # Corresponds to the JSON property `queryUnderstandingInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerQueryUnderstandingInfo]
        attr_accessor :query_understanding_info
      
        # References.
        # Corresponds to the JSON property `references`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerReference>]
        attr_accessor :references
      
        # Suggested related questions.
        # Corresponds to the JSON property `relatedQuestions`
        # @return [Array<String>]
        attr_accessor :related_questions
      
        # The state of the answer generation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Answer generation steps.
        # Corresponds to the JSON property `steps`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStep>]
        attr_accessor :steps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer_skipped_reasons = args[:answer_skipped_reasons] if args.key?(:answer_skipped_reasons)
          @answer_text = args[:answer_text] if args.key?(:answer_text)
          @citations = args[:citations] if args.key?(:citations)
          @complete_time = args[:complete_time] if args.key?(:complete_time)
          @create_time = args[:create_time] if args.key?(:create_time)
          @grounding_score = args[:grounding_score] if args.key?(:grounding_score)
          @grounding_supports = args[:grounding_supports] if args.key?(:grounding_supports)
          @name = args[:name] if args.key?(:name)
          @query_understanding_info = args[:query_understanding_info] if args.key?(:query_understanding_info)
          @references = args[:references] if args.key?(:references)
          @related_questions = args[:related_questions] if args.key?(:related_questions)
          @state = args[:state] if args.key?(:state)
          @steps = args[:steps] if args.key?(:steps)
        end
      end
      
      # Citation info for a segment.
      class GoogleCloudDiscoveryengineV1alphaAnswerCitation
        include Google::Apis::Core::Hashable
      
        # End of the attributed segment, exclusive.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # Citation sources for the attributed segment.
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerCitationSource>]
        attr_accessor :sources
      
        # Index indicates the start of the segment, measured in bytes (UTF-8 unicode).
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @sources = args[:sources] if args.key?(:sources)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Citation source.
      class GoogleCloudDiscoveryengineV1alphaAnswerCitationSource
        include Google::Apis::Core::Hashable
      
        # ID of the citation source.
        # Corresponds to the JSON property `referenceId`
        # @return [String]
        attr_accessor :reference_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference_id = args[:reference_id] if args.key?(:reference_id)
        end
      end
      
      # Grounding support for a claim in `answer_text`.
      class GoogleCloudDiscoveryengineV1alphaAnswerGroundingSupport
        include Google::Apis::Core::Hashable
      
        # Required. End of the claim, exclusive.
        # Corresponds to the JSON property `endIndex`
        # @return [Fixnum]
        attr_accessor :end_index
      
        # Indicates that this claim required grounding check. When the system decided
        # this claim didn't require attribution/grounding check, this field is set to
        # false. In that case, no grounding check was done for the claim and therefore `
        # grounding_score`, `sources` is not returned.
        # Corresponds to the JSON property `groundingCheckRequired`
        # @return [Boolean]
        attr_accessor :grounding_check_required
        alias_method :grounding_check_required?, :grounding_check_required
      
        # A score in the range of [0, 1] describing how grounded is a specific claim by
        # the references. Higher value means that the claim is better supported by the
        # reference chunks.
        # Corresponds to the JSON property `groundingScore`
        # @return [Float]
        attr_accessor :grounding_score
      
        # Optional. Citation sources for the claim.
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerCitationSource>]
        attr_accessor :sources
      
        # Required. Index indicates the start of the claim, measured in bytes (UTF-8
        # unicode).
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_index = args[:end_index] if args.key?(:end_index)
          @grounding_check_required = args[:grounding_check_required] if args.key?(:grounding_check_required)
          @grounding_score = args[:grounding_score] if args.key?(:grounding_score)
          @sources = args[:sources] if args.key?(:sources)
          @start_index = args[:start_index] if args.key?(:start_index)
        end
      end
      
      # Query understanding information.
      class GoogleCloudDiscoveryengineV1alphaAnswerQueryUnderstandingInfo
        include Google::Apis::Core::Hashable
      
        # Query classification information.
        # Corresponds to the JSON property `queryClassificationInfo`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerQueryUnderstandingInfoQueryClassificationInfo>]
        attr_accessor :query_classification_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_classification_info = args[:query_classification_info] if args.key?(:query_classification_info)
        end
      end
      
      # Query classification information.
      class GoogleCloudDiscoveryengineV1alphaAnswerQueryUnderstandingInfoQueryClassificationInfo
        include Google::Apis::Core::Hashable
      
        # Classification output.
        # Corresponds to the JSON property `positive`
        # @return [Boolean]
        attr_accessor :positive
        alias_method :positive?, :positive
      
        # Query classification type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @positive = args[:positive] if args.key?(:positive)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Reference.
      class GoogleCloudDiscoveryengineV1alphaAnswerReference
        include Google::Apis::Core::Hashable
      
        # Chunk information.
        # Corresponds to the JSON property `chunkInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerReferenceChunkInfo]
        attr_accessor :chunk_info
      
        # Structured search information.
        # Corresponds to the JSON property `structuredDocumentInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerReferenceStructuredDocumentInfo]
        attr_accessor :structured_document_info
      
        # Unstructured document information.
        # Corresponds to the JSON property `unstructuredDocumentInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerReferenceUnstructuredDocumentInfo]
        attr_accessor :unstructured_document_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_info = args[:chunk_info] if args.key?(:chunk_info)
          @structured_document_info = args[:structured_document_info] if args.key?(:structured_document_info)
          @unstructured_document_info = args[:unstructured_document_info] if args.key?(:unstructured_document_info)
        end
      end
      
      # Chunk information.
      class GoogleCloudDiscoveryengineV1alphaAnswerReferenceChunkInfo
        include Google::Apis::Core::Hashable
      
        # Chunk resource name.
        # Corresponds to the JSON property `chunk`
        # @return [String]
        attr_accessor :chunk
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Document metadata.
        # Corresponds to the JSON property `documentMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerReferenceChunkInfoDocumentMetadata]
        attr_accessor :document_metadata
      
        # The relevance of the chunk for a given query. Values range from 0.0 (
        # completely irrelevant) to 1.0 (completely relevant). This value is for
        # informational purpose only. It may change for the same query and chunk at any
        # time due to a model retraining or change in implementation.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk = args[:chunk] if args.key?(:chunk)
          @content = args[:content] if args.key?(:content)
          @document_metadata = args[:document_metadata] if args.key?(:document_metadata)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Document metadata.
      class GoogleCloudDiscoveryengineV1alphaAnswerReferenceChunkInfoDocumentMetadata
        include Google::Apis::Core::Hashable
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        # The structured JSON metadata for the document. It is populated from the struct
        # data from the Chunk in search result.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Structured search information.
      class GoogleCloudDiscoveryengineV1alphaAnswerReferenceStructuredDocumentInfo
        include Google::Apis::Core::Hashable
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # Structured search data.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document = args[:document] if args.key?(:document)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
        end
      end
      
      # Unstructured document information.
      class GoogleCloudDiscoveryengineV1alphaAnswerReferenceUnstructuredDocumentInfo
        include Google::Apis::Core::Hashable
      
        # List of cited chunk contents derived from document content.
        # Corresponds to the JSON property `chunkContents`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerReferenceUnstructuredDocumentInfoChunkContent>]
        attr_accessor :chunk_contents
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # The structured JSON metadata for the document. It is populated from the struct
        # data from the Chunk in search result.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_contents = args[:chunk_contents] if args.key?(:chunk_contents)
          @document = args[:document] if args.key?(:document)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Chunk content.
      class GoogleCloudDiscoveryengineV1alphaAnswerReferenceUnstructuredDocumentInfoChunkContent
        include Google::Apis::Core::Hashable
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Page identifier.
        # Corresponds to the JSON property `pageIdentifier`
        # @return [String]
        attr_accessor :page_identifier
      
        # The relevance of the chunk for a given query. Values range from 0.0 (
        # completely irrelevant) to 1.0 (completely relevant). This value is for
        # informational purpose only. It may change for the same query and chunk at any
        # time due to a model retraining or change in implementation.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @page_identifier = args[:page_identifier] if args.key?(:page_identifier)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Step information.
      class GoogleCloudDiscoveryengineV1alphaAnswerStep
        include Google::Apis::Core::Hashable
      
        # Actions.
        # Corresponds to the JSON property `actions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStepAction>]
        attr_accessor :actions
      
        # The description of the step.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The state of the step.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The thought of the step.
        # Corresponds to the JSON property `thought`
        # @return [String]
        attr_accessor :thought
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @description = args[:description] if args.key?(:description)
          @state = args[:state] if args.key?(:state)
          @thought = args[:thought] if args.key?(:thought)
        end
      end
      
      # Action.
      class GoogleCloudDiscoveryengineV1alphaAnswerStepAction
        include Google::Apis::Core::Hashable
      
        # Observation.
        # Corresponds to the JSON property `observation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservation]
        attr_accessor :observation
      
        # Search action.
        # Corresponds to the JSON property `searchAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStepActionSearchAction]
        attr_accessor :search_action
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @observation = args[:observation] if args.key?(:observation)
          @search_action = args[:search_action] if args.key?(:search_action)
        end
      end
      
      # Observation.
      class GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservation
        include Google::Apis::Core::Hashable
      
        # Search results observed by the search action, it can be snippets info or chunk
        # info, depending on the citation type set by the user.
        # Corresponds to the JSON property `searchResults`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservationSearchResult>]
        attr_accessor :search_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_results = args[:search_results] if args.key?(:search_results)
        end
      end
      
      # 
      class GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservationSearchResult
        include Google::Apis::Core::Hashable
      
        # If citation_type is CHUNK_LEVEL_CITATION and chunk mode is on, populate chunk
        # info.
        # Corresponds to the JSON property `chunkInfo`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservationSearchResultChunkInfo>]
        attr_accessor :chunk_info
      
        # Document resource name.
        # Corresponds to the JSON property `document`
        # @return [String]
        attr_accessor :document
      
        # If citation_type is DOCUMENT_LEVEL_CITATION, populate document level snippets.
        # Corresponds to the JSON property `snippetInfo`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservationSearchResultSnippetInfo>]
        attr_accessor :snippet_info
      
        # Data representation. The structured JSON data for the document. It's populated
        # from the struct data from the Document, or the Chunk in search result.
        # Corresponds to the JSON property `structData`
        # @return [Hash<String,Object>]
        attr_accessor :struct_data
      
        # Title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # URI for the document.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_info = args[:chunk_info] if args.key?(:chunk_info)
          @document = args[:document] if args.key?(:document)
          @snippet_info = args[:snippet_info] if args.key?(:snippet_info)
          @struct_data = args[:struct_data] if args.key?(:struct_data)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Chunk information.
      class GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservationSearchResultChunkInfo
        include Google::Apis::Core::Hashable
      
        # Chunk resource name.
        # Corresponds to the JSON property `chunk`
        # @return [String]
        attr_accessor :chunk
      
        # Chunk textual content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The relevance of the chunk for a given query. Values range from 0.0 (
        # completely irrelevant) to 1.0 (completely relevant). This value is for
        # informational purpose only. It may change for the same query and chunk at any
        # time due to a model retraining or change in implementation.
        # Corresponds to the JSON property `relevanceScore`
        # @return [Float]
        attr_accessor :relevance_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk = args[:chunk] if args.key?(:chunk)
          @content = args[:content] if args.key?(:content)
          @relevance_score = args[:relevance_score] if args.key?(:relevance_score)
        end
      end
      
      # Snippet information.
      class GoogleCloudDiscoveryengineV1alphaAnswerStepActionObservationSearchResultSnippetInfo
        include Google::Apis::Core::Hashable
      
        # Snippet content.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        # Status of the snippet defined by the search team.
        # Corresponds to the JSON property `snippetStatus`
        # @return [String]
        attr_accessor :snippet_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @snippet = args[:snippet] if args.key?(:snippet)
          @snippet_status = args[:snippet_status] if args.key?(:snippet_status)
        end
      end
      
      # Search action.
      class GoogleCloudDiscoveryengineV1alphaAnswerStepActionSearchAction
        include Google::Apis::Core::Hashable
      
        # The query to search.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query = args[:query] if args.key?(:query)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # BatchCreateTargetSites operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaBatchCreateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.BatchCreateTargetSites method.
      class GoogleCloudDiscoveryengineV1alphaBatchCreateTargetSitesResponse
        include Google::Apis::Core::Hashable
      
        # TargetSites created.
        # Corresponds to the JSON property `targetSites`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaTargetSite>]
        attr_accessor :target_sites
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_sites = args[:target_sites] if args.key?(:target_sites)
        end
      end
      
      # Configurations used to enable CMEK data encryption with Cloud KMS keys.
      class GoogleCloudDiscoveryengineV1alphaCmekConfig
        include Google::Apis::Core::Hashable
      
        # Output only. The default CmekConfig for the Customer.
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # Kms key resource name which will be used to encrypt resources `projects/`
        # project`/locations/`location`/keyRings/`keyRing`/cryptoKeys/`keyId``.
        # Corresponds to the JSON property `kmsKey`
        # @return [String]
        attr_accessor :kms_key
      
        # Kms key version resource name which will be used to encrypt resources `/
        # cryptoKeyVersions/`keyVersion``.
        # Corresponds to the JSON property `kmsKeyVersion`
        # @return [String]
        attr_accessor :kms_key_version
      
        # Output only. The timestamp of the last key rotation.
        # Corresponds to the JSON property `lastRotationTimestampMicros`
        # @return [Fixnum]
        attr_accessor :last_rotation_timestamp_micros
      
        # Required. Name of the CmekConfig, of the form `projects/`project`/locations/`
        # location`/cmekConfig` or `projects/`project`/locations/`location`/cmekConfigs/`
        # cmekConfig``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Single-regional CMEKs that are required for some VAIS features.
        # Corresponds to the JSON property `singleRegionKeys`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSingleRegionKey>]
        attr_accessor :single_region_keys
      
        # Output only. State of the CmekConfig.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_default = args[:is_default] if args.key?(:is_default)
          @kms_key = args[:kms_key] if args.key?(:kms_key)
          @kms_key_version = args[:kms_key_version] if args.key?(:kms_key_version)
          @last_rotation_timestamp_micros = args[:last_rotation_timestamp_micros] if args.key?(:last_rotation_timestamp_micros)
          @name = args[:name] if args.key?(:name)
          @single_region_keys = args[:single_region_keys] if args.key?(:single_region_keys)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Collection is a container for configuring resources and access to a set of
      # DataStores.
      class GoogleCloudDiscoveryengineV1alphaCollection
        include Google::Apis::Core::Hashable
      
        # Output only. Timestamp the Collection was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Manages the connection to external data sources for all data stores grouped
        # under a Collection. It's a singleton resource of Collection. The
        # initialization is only supported through SetUpDataConnector method, which will
        # create a new Collection and initialize its DataConnector. //
        # Corresponds to the JSON property `dataConnector`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDataConnector]
        attr_accessor :data_connector
      
        # Required. The Collection display name. This field must be a UTF-8 encoded
        # string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT
        # error is returned.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Immutable. The full resource name of the Collection. Format: `projects/`
        # project`/locations/`location`/collections/`collection_id``. This field must be
        # a UTF-8 encoded string with a length limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data_connector = args[:data_connector] if args.key?(:data_connector)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Defines circumstances to be checked before allowing a behavior
      class GoogleCloudDiscoveryengineV1alphaCondition
        include Google::Apis::Core::Hashable
      
        # Range of time(s) specifying when condition is active. Maximum of 10 time
        # ranges.
        # Corresponds to the JSON property `activeTimeRange`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaConditionTimeRange>]
        attr_accessor :active_time_range
      
        # Optional. Query regex to match the whole search query. Cannot be set when
        # Condition.query_terms is set. This is currently supporting promotion use case.
        # Corresponds to the JSON property `queryRegex`
        # @return [String]
        attr_accessor :query_regex
      
        # Search only A list of terms to match the query on. Cannot be set when
        # Condition.query_regex is set. Maximum of 10 query terms.
        # Corresponds to the JSON property `queryTerms`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaConditionQueryTerm>]
        attr_accessor :query_terms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_time_range = args[:active_time_range] if args.key?(:active_time_range)
          @query_regex = args[:query_regex] if args.key?(:query_regex)
          @query_terms = args[:query_terms] if args.key?(:query_terms)
        end
      end
      
      # Matcher for search request query
      class GoogleCloudDiscoveryengineV1alphaConditionQueryTerm
        include Google::Apis::Core::Hashable
      
        # Whether the search query needs to exactly match the query term.
        # Corresponds to the JSON property `fullMatch`
        # @return [Boolean]
        attr_accessor :full_match
        alias_method :full_match?, :full_match
      
        # The specific query value to match against Must be lowercase, must be UTF-8.
        # Can have at most 3 space separated terms if full_match is true. Cannot be an
        # empty string. Maximum length of 5000 characters.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_match = args[:full_match] if args.key?(:full_match)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Used for time-dependent conditions.
      class GoogleCloudDiscoveryengineV1alphaConditionTimeRange
        include Google::Apis::Core::Hashable
      
        # End of time range. Range is inclusive. Must be in the future.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Start of time range. Range is inclusive.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A data sync run of DataConnector. After DataConnector is successfully
      # initialized, data syncs are scheduled at DataConnector.refresh_interval. A
      # ConnectorRun represents a data sync either in the past or onging that the
      # moment. //
      class GoogleCloudDiscoveryengineV1alphaConnectorRun
        include Google::Apis::Core::Hashable
      
        # Output only. The time when the connector run ended.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. The details of the entities synced at the ConnectorRun. Each
        # ConnectorRun consists of syncing one or more entities.
        # Corresponds to the JSON property `entityRuns`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaConnectorRunEntityRun>]
        attr_accessor :entity_runs
      
        # Contains info about errors incurred during the sync. Only exist if running
        # into an error state. Contains error code and error message. Use with the `
        # state` field.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :errors
      
        # Output only. The time when the connector run was most recently paused.
        # Corresponds to the JSON property `latestPauseTime`
        # @return [String]
        attr_accessor :latest_pause_time
      
        # Output only. The full resource name of the Connector Run. Format: `projects/*/
        # locations/*/collections/*/dataConnector/connectorRuns/*`. The `
        # connector_run_id` is system-generated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time when the connector run started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Output only. The state of the sync run.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Timestamp at which the connector run sync state was last updated.
        # Corresponds to the JSON property `stateUpdateTime`
        # @return [String]
        attr_accessor :state_update_time
      
        # Output only. The trigger for this ConnectorRun.
        # Corresponds to the JSON property `trigger`
        # @return [String]
        attr_accessor :trigger
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @entity_runs = args[:entity_runs] if args.key?(:entity_runs)
          @errors = args[:errors] if args.key?(:errors)
          @latest_pause_time = args[:latest_pause_time] if args.key?(:latest_pause_time)
          @name = args[:name] if args.key?(:name)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @state_update_time = args[:state_update_time] if args.key?(:state_update_time)
          @trigger = args[:trigger] if args.key?(:trigger)
        end
      end
      
      # Represents an entity that was synced in this ConnectorRun.
      class GoogleCloudDiscoveryengineV1alphaConnectorRunEntityRun
        include Google::Apis::Core::Hashable
      
        # The name of the source entity.
        # Corresponds to the JSON property `entityName`
        # @return [String]
        attr_accessor :entity_name
      
        # The total number of documents failed at sync at any stage (extraction,
        # indexing, etc).
        # Corresponds to the JSON property `errorRecordCount`
        # @return [Fixnum]
        attr_accessor :error_record_count
      
        # The errors from the entity's sync run. Only exist if running into an error
        # state. Contains error code and error message.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :errors
      
        # The number of documents extracted from connector source, ready to be ingested
        # to UCS.
        # Corresponds to the JSON property `extractedRecordCount`
        # @return [Fixnum]
        attr_accessor :extracted_record_count
      
        # The number of documents indexed.
        # Corresponds to the JSON property `indexedRecordCount`
        # @return [Fixnum]
        attr_accessor :indexed_record_count
      
        # The number of requests sent to 3p API.
        # Corresponds to the JSON property `sourceApiRequestCount`
        # @return [Fixnum]
        attr_accessor :source_api_request_count
      
        # The state of the entity's sync run.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Timestamp at which the entity sync state was last updated.
        # Corresponds to the JSON property `stateUpdateTime`
        # @return [String]
        attr_accessor :state_update_time
      
        # The timestamp for either extracted_documents_count, indexed_documents_count
        # and error_documents_count was last updated.
        # Corresponds to the JSON property `statsUpdateTime`
        # @return [String]
        attr_accessor :stats_update_time
      
        # Sync type of this run.
        # Corresponds to the JSON property `syncType`
        # @return [String]
        attr_accessor :sync_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_name = args[:entity_name] if args.key?(:entity_name)
          @error_record_count = args[:error_record_count] if args.key?(:error_record_count)
          @errors = args[:errors] if args.key?(:errors)
          @extracted_record_count = args[:extracted_record_count] if args.key?(:extracted_record_count)
          @indexed_record_count = args[:indexed_record_count] if args.key?(:indexed_record_count)
          @source_api_request_count = args[:source_api_request_count] if args.key?(:source_api_request_count)
          @state = args[:state] if args.key?(:state)
          @state_update_time = args[:state_update_time] if args.key?(:state_update_time)
          @stats_update_time = args[:stats_update_time] if args.key?(:stats_update_time)
          @sync_type = args[:sync_type] if args.key?(:sync_type)
        end
      end
      
      # Defines a conditioned behavior to employ during serving. Must be attached to a
      # ServingConfig to be considered at serving time. Permitted actions dependent on
      # `SolutionType`.
      class GoogleCloudDiscoveryengineV1alphaControl
        include Google::Apis::Core::Hashable
      
        # Output only. List of all ServingConfig IDs this control is attached to. May
        # take up to 10 minutes to update after changes.
        # Corresponds to the JSON property `associatedServingConfigIds`
        # @return [Array<String>]
        attr_accessor :associated_serving_config_ids
      
        # Adjusts order of products in returned list.
        # Corresponds to the JSON property `boostAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaControlBoostAction]
        attr_accessor :boost_action
      
        # Determines when the associated action will trigger. Omit to always apply the
        # action. Currently only a single condition may be specified. Otherwise an
        # INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCondition>]
        attr_accessor :conditions
      
        # Required. Human readable name. The identifier used in UI views. Must be UTF-8
        # encoded string. Length limit is 128 characters. Otherwise an INVALID ARGUMENT
        # error is thrown.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Specified which products may be included in results. Uses same filter as boost.
        # Corresponds to the JSON property `filterAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaControlFilterAction]
        attr_accessor :filter_action
      
        # Immutable. Fully qualified name `projects/*/locations/global/dataStore/*/
        # controls/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Promote certain links based on some trigger queries. Example: Promote shoe
        # store link when searching for `shoe` keyword. The link can be outside of
        # associated data store.
        # Corresponds to the JSON property `promoteAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaControlPromoteAction]
        attr_accessor :promote_action
      
        # Redirects a shopper to the provided URI.
        # Corresponds to the JSON property `redirectAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaControlRedirectAction]
        attr_accessor :redirect_action
      
        # Required. Immutable. What solution the control belongs to. Must be compatible
        # with vertical of resource. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Creates a set of terms that will act as synonyms of one another. Example: "
        # happy" will also be considered as "glad", "glad" will also be considered as "
        # happy".
        # Corresponds to the JSON property `synonymsAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaControlSynonymsAction]
        attr_accessor :synonyms_action
      
        # Specifies the use case for the control. Affects what condition fields can be
        # set. Only applies to SOLUTION_TYPE_SEARCH. Currently only allow one use case
        # per control. Must be set when solution_type is SolutionType.
        # SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `useCases`
        # @return [Array<String>]
        attr_accessor :use_cases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @associated_serving_config_ids = args[:associated_serving_config_ids] if args.key?(:associated_serving_config_ids)
          @boost_action = args[:boost_action] if args.key?(:boost_action)
          @conditions = args[:conditions] if args.key?(:conditions)
          @display_name = args[:display_name] if args.key?(:display_name)
          @filter_action = args[:filter_action] if args.key?(:filter_action)
          @name = args[:name] if args.key?(:name)
          @promote_action = args[:promote_action] if args.key?(:promote_action)
          @redirect_action = args[:redirect_action] if args.key?(:redirect_action)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @synonyms_action = args[:synonyms_action] if args.key?(:synonyms_action)
          @use_cases = args[:use_cases] if args.key?(:use_cases)
        end
      end
      
      # Adjusts order of products in returned list.
      class GoogleCloudDiscoveryengineV1alphaControlBoostAction
        include Google::Apis::Core::Hashable
      
        # Required. Strength of the boost, which should be in [-1, 1]. Negative boost
        # means demotion. Default is 0.0 (No-op).
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Required. Specifies which data store's documents can be boosted by this
        # control. Full data store name e.g. projects/123/locations/global/collections/
        # default_collection/dataStores/default_data_store
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Required. Specifies which products to apply the boost to. If no filter is
        # provided all products will be boosted (No-op). Syntax documentation: https://
        # cloud.google.com/retail/docs/filter-and-order Maximum length is 5000
        # characters. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Specified which products may be included in results. Uses same filter as boost.
      class GoogleCloudDiscoveryengineV1alphaControlFilterAction
        include Google::Apis::Core::Hashable
      
        # Required. Specifies which data store's documents can be filtered by this
        # control. Full data store name e.g. projects/123/locations/global/collections/
        # default_collection/dataStores/default_data_store
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Required. A filter to apply on the matching condition results. Required Syntax
        # documentation: https://cloud.google.com/retail/docs/filter-and-order Maximum
        # length is 5000 characters. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Promote certain links based on some trigger queries. Example: Promote shoe
      # store link when searching for `shoe` keyword. The link can be outside of
      # associated data store.
      class GoogleCloudDiscoveryengineV1alphaControlPromoteAction
        include Google::Apis::Core::Hashable
      
        # Required. Data store with which this promotion is attached to.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Promotion proto includes uri and other helping information to display the
        # promotion.
        # Corresponds to the JSON property `searchLinkPromotion`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchLinkPromotion]
        attr_accessor :search_link_promotion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @search_link_promotion = args[:search_link_promotion] if args.key?(:search_link_promotion)
        end
      end
      
      # Redirects a shopper to the provided URI.
      class GoogleCloudDiscoveryengineV1alphaControlRedirectAction
        include Google::Apis::Core::Hashable
      
        # Required. The URI to which the shopper will be redirected. Required. URI must
        # have length equal or less than 2000 characters. Otherwise an INVALID ARGUMENT
        # error is thrown.
        # Corresponds to the JSON property `redirectUri`
        # @return [String]
        attr_accessor :redirect_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @redirect_uri = args[:redirect_uri] if args.key?(:redirect_uri)
        end
      end
      
      # Creates a set of terms that will act as synonyms of one another. Example: "
      # happy" will also be considered as "glad", "glad" will also be considered as "
      # happy".
      class GoogleCloudDiscoveryengineV1alphaControlSynonymsAction
        include Google::Apis::Core::Hashable
      
        # Defines a set of synonyms. Can specify up to 100 synonyms. Must specify at
        # least 2 synonyms. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
        end
      end
      
      # The historical crawl rate timeseries data, used for monitoring.
      class GoogleCloudDiscoveryengineV1alphaCrawlRateTimeSeries
        include Google::Apis::Core::Hashable
      
        # A collection of data points that describes the time-varying values of a metric.
        # A time series is identified by a combination of a fully-specified monitored
        # resource and a fully-specified metric. This type is used for both listing and
        # creating time series.
        # Corresponds to the JSON property `qpsTimeSeries`
        # @return [Google::Apis::DiscoveryengineV1::GoogleMonitoringV3TimeSeries]
        attr_accessor :qps_time_series
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @qps_time_series = args[:qps_time_series] if args.key?(:qps_time_series)
        end
      end
      
      # Metadata related to the progress of the DataStoreService.CreateDataStore
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaCreateDataStoreMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the EngineService.CreateEngine operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaCreateEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for EvaluationService.CreateEvaluation method.
      class GoogleCloudDiscoveryengineV1alphaCreateEvaluationMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata for Create Schema LRO.
      class GoogleCloudDiscoveryengineV1alphaCreateSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.CreateSitemap
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaCreateSitemapMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # CreateTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaCreateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Defines custom fine tuning spec.
      class GoogleCloudDiscoveryengineV1alphaCustomFineTuningSpec
        include Google::Apis::Core::Hashable
      
        # Whether or not to enable and include custom fine tuned search adaptor model.
        # Corresponds to the JSON property `enableSearchAdaptor`
        # @return [Boolean]
        attr_accessor :enable_search_adaptor
        alias_method :enable_search_adaptor?, :enable_search_adaptor
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_search_adaptor = args[:enable_search_adaptor] if args.key?(:enable_search_adaptor)
        end
      end
      
      # Manages the connection to external data sources for all data stores grouped
      # under a Collection. It's a singleton resource of Collection. The
      # initialization is only supported through SetUpDataConnector method, which will
      # create a new Collection and initialize its DataConnector. //
      class GoogleCloudDiscoveryengineV1alphaDataConnector
        include Google::Apis::Core::Hashable
      
        # Informations to support actions on the connector.
        # Corresponds to the JSON property `actionConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaActionConfig]
        attr_accessor :action_config
      
        # Indicates whether the connector is disabled for auto run. It can be used to
        # pause periodical and real time sync.
        # Corresponds to the JSON property `autoRunDisabled`
        # @return [Boolean]
        attr_accessor :auto_run_disabled
        alias_method :auto_run_disabled?, :auto_run_disabled
      
        # Output only. User actions that must be completed before the connector can
        # start syncing data.
        # Corresponds to the JSON property `blockingReasons`
        # @return [Array<String>]
        attr_accessor :blocking_reasons
      
        # Output only. Timestamp the DataConnector was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Required. The name of the data source. Supported values: `salesforce`, `jira`,
        # `confluence`, `bigquery`.
        # Corresponds to the JSON property `dataSource`
        # @return [String]
        attr_accessor :data_source
      
        # Optional. Any target destinations used to connect to third-party services.
        # Corresponds to the JSON property `destinationConfigs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDestinationConfig>]
        attr_accessor :destination_configs
      
        # List of entities from the connected data source to ingest.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDataConnectorSourceEntity>]
        attr_accessor :entities
      
        # Output only. The errors from initialization or from the latest connector run.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :errors
      
        # The refresh interval to sync the Access Control List information for the
        # documents ingested by this connector. If not set, the access control list will
        # be refreshed at the default interval of 30 minutes. The identity refresh
        # interval can be at least 30 minutes and at most 7 days.
        # Corresponds to the JSON property `identityRefreshInterval`
        # @return [String]
        attr_accessor :identity_refresh_interval
      
        # The configuration for the identity data synchronization runs.
        # Corresponds to the JSON property `identityScheduleConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaIdentityScheduleConfig]
        attr_accessor :identity_schedule_config
      
        # Input only. The KMS key to be used to protect the DataStores managed by this
        # connector. Must be set for requests that need to comply with CMEK Org Policy
        # protections. If this field is set and processed successfully, the DataStores
        # created by this connector will be protected by the KMS key.
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        # Output only. For periodic connectors only, the last time a data sync was
        # completed.
        # Corresponds to the JSON property `lastSyncTime`
        # @return [String]
        attr_accessor :last_sync_time
      
        # Output only. The most recent timestamp when this DataConnector was paused,
        # affecting all functionalities such as data synchronization. Pausing a
        # connector has the following effects: - All functionalities, including data
        # synchronization, are halted. - Any ongoing data synchronization job will be
        # canceled. - No future data synchronization runs will be scheduled nor can be
        # triggered.
        # Corresponds to the JSON property `latestPauseTime`
        # @return [String]
        attr_accessor :latest_pause_time
      
        # Output only. The full resource name of the Data Connector. Format: `projects/*/
        # locations/*/collections/*/dataConnector`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Represents civil time (or occasionally physical time). This type can represent
        # a civil time in one of a few possible ways: * When utc_offset is set and
        # time_zone is unset: a civil time on a calendar day with a particular offset
        # from UTC. * When time_zone is set and utc_offset is unset: a civil time on a
        # calendar day in a particular time zone. * When neither time_zone nor
        # utc_offset is set: a civil time on a calendar day in local time. The date is
        # relative to the Proleptic Gregorian Calendar. If year, month, or day are 0,
        # the DateTime is considered not to have a specific year, month, or day
        # respectively. This type may also be used to represent a physical time if all
        # the date and time fields are set and either case of the `time_offset` oneof is
        # set. Consider using `Timestamp` message for physical time instead. If your use
        # case also would like to store the user's timezone, that can be done in another
        # field. This type is more flexible than some applications may want. Make sure
        # to document and validate your application's limitations.
        # Corresponds to the JSON property `nextSyncTime`
        # @return [Google::Apis::DiscoveryengineV1::GoogleTypeDateTime]
        attr_accessor :next_sync_time
      
        # Required. Params needed to access the source in the format of (Key, Value)
        # pairs. Required parameters for all data sources: * Key: `instance_uri` * Value:
        # type STRING. The uri to access the data source. Required parameters for
        # sources that support OAUTH, i.e. `salesforce`: * Key: `client_id` * Value:
        # type STRING. The client id for the third party service provider to identify
        # your application. * Key: `client_secret` * Value:type STRING. The client
        # secret generated by the third party authorization server. * Key: `access_token`
        # * Value: type STRING. OAuth token for UCS to access to the protected resource.
        # * Key: `refresh_token` * Value: type STRING. OAuth refresh token for UCS to
        # obtain a new access token without user interaction. Required parameters for
        # sources that support basic API token auth, i.e. `jira`, `confluence`: * Key: `
        # user_account` * Value: type STRING. The username or email with the source. *
        # Key: `api_token` * Value: type STRING. The API token generated for the source
        # account, that is used for authenticating anywhere where you would have used a
        # password. Example: ```json ` "instance_uri": "https://xxx.atlassian.net", "
        # user_account": "xxxx.xxx@xxx.com", "api_token": "test-token" ` ``` Optional
        # parameter to specify the authorization type to use for multiple authorization
        # types support: * Key: `auth_type` * Value: type STRING. The authorization type
        # for the data source. Supported values: `BASIC_AUTH`, `OAUTH`, `
        # OAUTH_ACCESS_TOKEN`, `OAUTH_TWO_LEGGED`, `OAUTH_JWT_BEARER`, `
        # OAUTH_PASSWORD_GRANT`, `JWT`, `API_TOKEN`, `FEDERATED_CREDENTIAL`.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # Output only. The tenant project ID associated with private connectivity
        # connectors. This project must be allowlisted by in order for the connector to
        # function.
        # Corresponds to the JSON property `privateConnectivityProjectId`
        # @return [String]
        attr_accessor :private_connectivity_project_id
      
        # Required. The refresh interval for data sync. If duration is set to 0, the
        # data will be synced in real time. The streaming feature is not supported yet.
        # The minimum is 30 minutes and maximum is 7 days.
        # Corresponds to the JSON property `refreshInterval`
        # @return [String]
        attr_accessor :refresh_interval
      
        # Output only. State of the connector.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The static IP addresses used by this connector.
        # Corresponds to the JSON property `staticIpAddresses`
        # @return [Array<String>]
        attr_accessor :static_ip_addresses
      
        # Optional. Whether customer has enabled static IP addresses for this connector.
        # Corresponds to the JSON property `staticIpEnabled`
        # @return [Boolean]
        attr_accessor :static_ip_enabled
        alias_method :static_ip_enabled?, :static_ip_enabled
      
        # The data synchronization mode supported by the data connector.
        # Corresponds to the JSON property `syncMode`
        # @return [String]
        attr_accessor :sync_mode
      
        # Output only. Timestamp the DataConnector was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_config = args[:action_config] if args.key?(:action_config)
          @auto_run_disabled = args[:auto_run_disabled] if args.key?(:auto_run_disabled)
          @blocking_reasons = args[:blocking_reasons] if args.key?(:blocking_reasons)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data_source = args[:data_source] if args.key?(:data_source)
          @destination_configs = args[:destination_configs] if args.key?(:destination_configs)
          @entities = args[:entities] if args.key?(:entities)
          @errors = args[:errors] if args.key?(:errors)
          @identity_refresh_interval = args[:identity_refresh_interval] if args.key?(:identity_refresh_interval)
          @identity_schedule_config = args[:identity_schedule_config] if args.key?(:identity_schedule_config)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
          @last_sync_time = args[:last_sync_time] if args.key?(:last_sync_time)
          @latest_pause_time = args[:latest_pause_time] if args.key?(:latest_pause_time)
          @name = args[:name] if args.key?(:name)
          @next_sync_time = args[:next_sync_time] if args.key?(:next_sync_time)
          @params = args[:params] if args.key?(:params)
          @private_connectivity_project_id = args[:private_connectivity_project_id] if args.key?(:private_connectivity_project_id)
          @refresh_interval = args[:refresh_interval] if args.key?(:refresh_interval)
          @state = args[:state] if args.key?(:state)
          @static_ip_addresses = args[:static_ip_addresses] if args.key?(:static_ip_addresses)
          @static_ip_enabled = args[:static_ip_enabled] if args.key?(:static_ip_enabled)
          @sync_mode = args[:sync_mode] if args.key?(:sync_mode)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Represents an entity in the data source. For example, the `Account` object in
      # Salesforce.
      class GoogleCloudDiscoveryengineV1alphaDataConnectorSourceEntity
        include Google::Apis::Core::Hashable
      
        # Output only. The full resource name of the associated data store for the
        # source entity. Format: `projects/*/locations/*/collections/*/dataStores/*`.
        # When the connector is initialized by the DataConnectorService.
        # SetUpDataConnector method, a DataStore is automatically created for each
        # source entity.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # The name of the entity. Supported values by data source: * Salesforce: `Lead`,
        # `Opportunity`, `Contact`, `Account`, `Case`, `Contract`, `Campaign` * Jira: `
        # Issue` * Confluence: `Content`, `Space`
        # Corresponds to the JSON property `entityName`
        # @return [String]
        attr_accessor :entity_name
      
        # Attributes for indexing. Key: Field name. Value: The key property to map a
        # field to, such as `title`, and `description`. Supported key properties: * `
        # title`: The title for data record. This would be displayed on search results. *
        # `description`: The description for data record. This would be displayed on
        # search results.
        # Corresponds to the JSON property `keyPropertyMappings`
        # @return [Hash<String,String>]
        attr_accessor :key_property_mappings
      
        # The parameters for the entity to facilitate data ingestion. E.g. for BQ
        # connectors: * Key: `document_id_column` * Value: type STRING. The value of the
        # column id.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @entity_name = args[:entity_name] if args.key?(:entity_name)
          @key_property_mappings = args[:key_property_mappings] if args.key?(:key_property_mappings)
          @params = args[:params] if args.key?(:params)
        end
      end
      
      # DataStore captures global settings and configs at the DataStore level.
      class GoogleCloudDiscoveryengineV1alphaDataStore
        include Google::Apis::Core::Hashable
      
        # Immutable. Whether data in the DataStore has ACL information. If set to `true`,
        # the source data must have ACL. ACL will be ingested when data is ingested by
        # DocumentService.ImportDocuments methods. When ACL is enabled for the DataStore,
        # Document can't be accessed by calling DocumentService.GetDocument or
        # DocumentService.ListDocuments. Currently ACL is only supported in `GENERIC`
        # industry vertical with non-`PUBLIC_WEBSITE` content config.
        # Corresponds to the JSON property `aclEnabled`
        # @return [Boolean]
        attr_accessor :acl_enabled
        alias_method :acl_enabled?, :acl_enabled
      
        # Configuration data for advance site search.
        # Corresponds to the JSON property `advancedSiteSearchConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAdvancedSiteSearchConfig]
        attr_accessor :advanced_site_search_config
      
        # Estimation of data size per data store.
        # Corresponds to the JSON property `billingEstimation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDataStoreBillingEstimation]
        attr_accessor :billing_estimation
      
        # Configurations used to enable CMEK data encryption with Cloud KMS keys.
        # Corresponds to the JSON property `cmekConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCmekConfig]
        attr_accessor :cmek_config
      
        # Immutable. The content config of the data store. If this field is unset, the
        # server behavior defaults to ContentConfig.NO_CONTENT.
        # Corresponds to the JSON property `contentConfig`
        # @return [String]
        attr_accessor :content_config
      
        # Output only. Timestamp the DataStore was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The id of the default Schema asscociated to this data store.
        # Corresponds to the JSON property `defaultSchemaId`
        # @return [String]
        attr_accessor :default_schema_id
      
        # Required. The data store display name. This field must be a UTF-8 encoded
        # string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT
        # error is returned.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A singleton resource of DataStore. If it's empty when DataStore is created and
        # DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED, the default
        # parser will default to digital parser.
        # Corresponds to the JSON property `documentProcessingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfig]
        attr_accessor :document_processing_config
      
        # Identity Provider Config.
        # Corresponds to the JSON property `idpConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaIdpConfig]
        attr_accessor :idp_config
      
        # Immutable. The industry vertical that the data store registers.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Optional. If set, this DataStore is an Infobot FAQ DataStore.
        # Corresponds to the JSON property `isInfobotFaqDataStore`
        # @return [Boolean]
        attr_accessor :is_infobot_faq_data_store
        alias_method :is_infobot_faq_data_store?, :is_infobot_faq_data_store
      
        # Input only. The KMS key to be used to protect this DataStore at creation time.
        # Must be set for requests that need to comply with CMEK Org Policy protections.
        # If this field is set and processed successfully, the DataStore will be
        # protected by the KMS key, as indicated in the cmek_config field.
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        # Language info for DataStore.
        # Corresponds to the JSON property `languageInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaLanguageInfo]
        attr_accessor :language_info
      
        # Immutable. The full resource name of the data store. Format: `projects/`
        # project`/locations/`location`/collections/`collection_id`/dataStores/`
        # data_store_id``. This field must be a UTF-8 encoded string with a length limit
        # of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration for Natural Language Query Understanding.
        # Corresponds to the JSON property `naturalLanguageQueryUnderstandingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaNaturalLanguageQueryUnderstandingConfig]
        attr_accessor :natural_language_query_understanding_config
      
        # Stores information regarding the serving configurations at DataStore level.
        # Corresponds to the JSON property `servingConfigDataStore`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDataStoreServingConfigDataStore]
        attr_accessor :serving_config_data_store
      
        # The solutions that the data store enrolls. Available solutions for each
        # industry_vertical: * `MEDIA`: `SOLUTION_TYPE_RECOMMENDATION` and `
        # SOLUTION_TYPE_SEARCH`. * `SITE_SEARCH`: `SOLUTION_TYPE_SEARCH` is
        # automatically enrolled. Other solutions cannot be enrolled.
        # Corresponds to the JSON property `solutionTypes`
        # @return [Array<String>]
        attr_accessor :solution_types
      
        # Defines the structure and layout of a type of document data.
        # Corresponds to the JSON property `startingSchema`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSchema]
        attr_accessor :starting_schema
      
        # Config to store data store type configuration for workspace data
        # Corresponds to the JSON property `workspaceConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaWorkspaceConfig]
        attr_accessor :workspace_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl_enabled = args[:acl_enabled] if args.key?(:acl_enabled)
          @advanced_site_search_config = args[:advanced_site_search_config] if args.key?(:advanced_site_search_config)
          @billing_estimation = args[:billing_estimation] if args.key?(:billing_estimation)
          @cmek_config = args[:cmek_config] if args.key?(:cmek_config)
          @content_config = args[:content_config] if args.key?(:content_config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @default_schema_id = args[:default_schema_id] if args.key?(:default_schema_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @document_processing_config = args[:document_processing_config] if args.key?(:document_processing_config)
          @idp_config = args[:idp_config] if args.key?(:idp_config)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @is_infobot_faq_data_store = args[:is_infobot_faq_data_store] if args.key?(:is_infobot_faq_data_store)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
          @language_info = args[:language_info] if args.key?(:language_info)
          @name = args[:name] if args.key?(:name)
          @natural_language_query_understanding_config = args[:natural_language_query_understanding_config] if args.key?(:natural_language_query_understanding_config)
          @serving_config_data_store = args[:serving_config_data_store] if args.key?(:serving_config_data_store)
          @solution_types = args[:solution_types] if args.key?(:solution_types)
          @starting_schema = args[:starting_schema] if args.key?(:starting_schema)
          @workspace_config = args[:workspace_config] if args.key?(:workspace_config)
        end
      end
      
      # Estimation of data size per data store.
      class GoogleCloudDiscoveryengineV1alphaDataStoreBillingEstimation
        include Google::Apis::Core::Hashable
      
        # Data size for structured data in terms of bytes.
        # Corresponds to the JSON property `structuredDataSize`
        # @return [Fixnum]
        attr_accessor :structured_data_size
      
        # Last updated timestamp for structured data.
        # Corresponds to the JSON property `structuredDataUpdateTime`
        # @return [String]
        attr_accessor :structured_data_update_time
      
        # Data size for unstructured data in terms of bytes.
        # Corresponds to the JSON property `unstructuredDataSize`
        # @return [Fixnum]
        attr_accessor :unstructured_data_size
      
        # Last updated timestamp for unstructured data.
        # Corresponds to the JSON property `unstructuredDataUpdateTime`
        # @return [String]
        attr_accessor :unstructured_data_update_time
      
        # Data size for websites in terms of bytes.
        # Corresponds to the JSON property `websiteDataSize`
        # @return [Fixnum]
        attr_accessor :website_data_size
      
        # Last updated timestamp for websites.
        # Corresponds to the JSON property `websiteDataUpdateTime`
        # @return [String]
        attr_accessor :website_data_update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @structured_data_size = args[:structured_data_size] if args.key?(:structured_data_size)
          @structured_data_update_time = args[:structured_data_update_time] if args.key?(:structured_data_update_time)
          @unstructured_data_size = args[:unstructured_data_size] if args.key?(:unstructured_data_size)
          @unstructured_data_update_time = args[:unstructured_data_update_time] if args.key?(:unstructured_data_update_time)
          @website_data_size = args[:website_data_size] if args.key?(:website_data_size)
          @website_data_update_time = args[:website_data_update_time] if args.key?(:website_data_update_time)
        end
      end
      
      # Stores information regarding the serving configurations at DataStore level.
      class GoogleCloudDiscoveryengineV1alphaDataStoreServingConfigDataStore
        include Google::Apis::Core::Hashable
      
        # If set true, the DataStore will not be available for serving search requests.
        # Corresponds to the JSON property `disabledForServing`
        # @return [Boolean]
        attr_accessor :disabled_for_serving
        alias_method :disabled_for_serving?, :disabled_for_serving
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled_for_serving = args[:disabled_for_serving] if args.key?(:disabled_for_serving)
        end
      end
      
      # The historical dedicated crawl rate timeseries data, used for monitoring.
      # Dedicated crawl is used by Vertex AI to crawl the user's website when dedicate
      # crawl is set.
      class GoogleCloudDiscoveryengineV1alphaDedicatedCrawlRateTimeSeries
        include Google::Apis::Core::Hashable
      
        # The historical crawl rate timeseries data, used for monitoring.
        # Corresponds to the JSON property `autoRefreshCrawlRate`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCrawlRateTimeSeries]
        attr_accessor :auto_refresh_crawl_rate
      
        # The historical crawl rate timeseries data, used for monitoring.
        # Corresponds to the JSON property `userTriggeredCrawlRate`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCrawlRateTimeSeries]
        attr_accessor :user_triggered_crawl_rate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_refresh_crawl_rate = args[:auto_refresh_crawl_rate] if args.key?(:auto_refresh_crawl_rate)
          @user_triggered_crawl_rate = args[:user_triggered_crawl_rate] if args.key?(:user_triggered_crawl_rate)
        end
      end
      
      # Metadata related to the progress of the CollectionService.UpdateCollection
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaDeleteCollectionMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the DataStoreService.DeleteDataStore
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaDeleteDataStoreMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the EngineService.DeleteEngine operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaDeleteEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for DeleteSchema LRO.
      class GoogleCloudDiscoveryengineV1alphaDeleteSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request for DeleteSession method.
      class GoogleCloudDiscoveryengineV1alphaDeleteSessionRequest
        include Google::Apis::Core::Hashable
      
        # Required. The resource name of the Session to delete. Format: `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`
        # data_store_id`/sessions/`session_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.DeleteSitemap
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaDeleteSitemapMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # DeleteTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaDeleteTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Defines target endpoints used to connect to third-party sources.
      class GoogleCloudDiscoveryengineV1alphaDestinationConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The destinations for the corresponding key.
        # Corresponds to the JSON property `destinations`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDestinationConfigDestination>]
        attr_accessor :destinations
      
        # Optional. Unique destination identifier that is supported by the connector.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Optional. Additional parameters for this destination config.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destinations = args[:destinations] if args.key?(:destinations)
          @key = args[:key] if args.key?(:key)
          @params = args[:params] if args.key?(:params)
        end
      end
      
      # Defines a target endpoint
      class GoogleCloudDiscoveryengineV1alphaDestinationConfigDestination
        include Google::Apis::Core::Hashable
      
        # Publicly routable host.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # Optional. Target port number accepted by the destination.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host = args[:host] if args.key?(:host)
          @port = args[:port] if args.key?(:port)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # DisableAdvancedSiteSearch operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaDisableAdvancedSiteSearchMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.DisableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1alphaDisableAdvancedSiteSearchResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A singleton resource of DataStore. If it's empty when DataStore is created and
      # DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED, the default
      # parser will default to digital parser.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for chunking config.
        # Corresponds to the JSON property `chunkingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigChunkingConfig]
        attr_accessor :chunking_config
      
        # Related configurations applied to a specific type of document parser.
        # Corresponds to the JSON property `defaultParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfig]
        attr_accessor :default_parsing_config
      
        # The full resource name of the Document Processing Config. Format: `projects/*/
        # locations/*/collections/*/dataStores/*/documentProcessingConfig`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Map from file type to override the default parsing configuration based on the
        # file type. Supported keys: * `pdf`: Override parsing config for PDF files,
        # either digital parsing, ocr parsing or layout parsing is supported. * `html`:
        # Override parsing config for HTML files, only digital parsing and layout
        # parsing are supported. * `docx`: Override parsing config for DOCX files, only
        # digital parsing and layout parsing are supported. * `pptx`: Override parsing
        # config for PPTX files, only digital parsing and layout parsing are supported. *
        # `xlsm`: Override parsing config for XLSM files, only digital parsing and
        # layout parsing are supported. * `xlsx`: Override parsing config for XLSX files,
        # only digital parsing and layout parsing are supported.
        # Corresponds to the JSON property `parsingConfigOverrides`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfig>]
        attr_accessor :parsing_config_overrides
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunking_config = args[:chunking_config] if args.key?(:chunking_config)
          @default_parsing_config = args[:default_parsing_config] if args.key?(:default_parsing_config)
          @name = args[:name] if args.key?(:name)
          @parsing_config_overrides = args[:parsing_config_overrides] if args.key?(:parsing_config_overrides)
        end
      end
      
      # Configuration for chunking config.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigChunkingConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for the layout based chunking.
        # Corresponds to the JSON property `layoutBasedChunkingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigChunkingConfigLayoutBasedChunkingConfig]
        attr_accessor :layout_based_chunking_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @layout_based_chunking_config = args[:layout_based_chunking_config] if args.key?(:layout_based_chunking_config)
        end
      end
      
      # Configuration for the layout based chunking.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigChunkingConfigLayoutBasedChunkingConfig
        include Google::Apis::Core::Hashable
      
        # The token size limit for each chunk. Supported values: 100-500 (inclusive).
        # Default value: 500.
        # Corresponds to the JSON property `chunkSize`
        # @return [Fixnum]
        attr_accessor :chunk_size
      
        # Whether to include appending different levels of headings to chunks from the
        # middle of the document to prevent context loss. Default value: False.
        # Corresponds to the JSON property `includeAncestorHeadings`
        # @return [Boolean]
        attr_accessor :include_ancestor_headings
        alias_method :include_ancestor_headings?, :include_ancestor_headings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_size = args[:chunk_size] if args.key?(:chunk_size)
          @include_ancestor_headings = args[:include_ancestor_headings] if args.key?(:include_ancestor_headings)
        end
      end
      
      # Related configurations applied to a specific type of document parser.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfig
        include Google::Apis::Core::Hashable
      
        # The digital parsing configurations for documents.
        # Corresponds to the JSON property `digitalParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfigDigitalParsingConfig]
        attr_accessor :digital_parsing_config
      
        # The layout parsing configurations for documents.
        # Corresponds to the JSON property `layoutParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfigLayoutParsingConfig]
        attr_accessor :layout_parsing_config
      
        # The OCR parsing configurations for documents.
        # Corresponds to the JSON property `ocrParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfigOcrParsingConfig]
        attr_accessor :ocr_parsing_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digital_parsing_config = args[:digital_parsing_config] if args.key?(:digital_parsing_config)
          @layout_parsing_config = args[:layout_parsing_config] if args.key?(:layout_parsing_config)
          @ocr_parsing_config = args[:ocr_parsing_config] if args.key?(:ocr_parsing_config)
        end
      end
      
      # The digital parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfigDigitalParsingConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The layout parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfigLayoutParsingConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The OCR parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1alphaDocumentProcessingConfigParsingConfigOcrParsingConfig
        include Google::Apis::Core::Hashable
      
        # [DEPRECATED] This field is deprecated. To use the additional enhanced document
        # elements processing, please switch to `layout_parsing_config`.
        # Corresponds to the JSON property `enhancedDocumentElements`
        # @return [Array<String>]
        attr_accessor :enhanced_document_elements
      
        # If true, will use native text instead of OCR text on pages containing native
        # text.
        # Corresponds to the JSON property `useNativeText`
        # @return [Boolean]
        attr_accessor :use_native_text
        alias_method :use_native_text?, :use_native_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enhanced_document_elements = args[:enhanced_document_elements] if args.key?(:enhanced_document_elements)
          @use_native_text = args[:use_native_text] if args.key?(:use_native_text)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # EnableAdvancedSiteSearch operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaEnableAdvancedSiteSearchMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.EnableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1alphaEnableAdvancedSiteSearchResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata that describes the training and serving parameters of an Engine.
      class GoogleCloudDiscoveryengineV1alphaEngine
        include Google::Apis::Core::Hashable
      
        # Configurations for a Chat Engine.
        # Corresponds to the JSON property `chatEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineChatEngineConfig]
        attr_accessor :chat_engine_config
      
        # Additional information of a Chat Engine. Fields in this message are output
        # only.
        # Corresponds to the JSON property `chatEngineMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineChatEngineMetadata]
        attr_accessor :chat_engine_metadata
      
        # Common configurations for an Engine.
        # Corresponds to the JSON property `commonConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineCommonConfig]
        attr_accessor :common_config
      
        # Output only. Timestamp the Recommendation Engine was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The data stores associated with this engine. For SOLUTION_TYPE_SEARCH and
        # SOLUTION_TYPE_RECOMMENDATION type of engines, they can only associate with at
        # most one data store. If solution_type is SOLUTION_TYPE_CHAT, multiple
        # DataStores in the same Collection can be associated here. Note that when used
        # in CreateEngineRequest, one DataStore id must be provided as the system will
        # use it for necessary initializations.
        # Corresponds to the JSON property `dataStoreIds`
        # @return [Array<String>]
        attr_accessor :data_store_ids
      
        # Optional. Whether to disable analytics for searches performed on this engine.
        # Corresponds to the JSON property `disableAnalytics`
        # @return [Boolean]
        attr_accessor :disable_analytics
        alias_method :disable_analytics?, :disable_analytics
      
        # Required. The display name of the engine. Should be human readable. UTF-8
        # encoded string with limit of 1024 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The industry vertical that the engine registers. The restriction of the Engine
        # industry vertical is based on DataStore: Vertical on Engine has to match
        # vertical of the DataStore linked to the engine.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Additional config specs for a Media Recommendation engine.
        # Corresponds to the JSON property `mediaRecommendationEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineMediaRecommendationEngineConfig]
        attr_accessor :media_recommendation_engine_config
      
        # Immutable. The fully qualified resource name of the engine. This field must be
        # a UTF-8 encoded string with a length limit of 1024 characters. Format: `
        # projects/`project`/locations/`location`/collections/`collection`/engines/`
        # engine`` engine should be 1-63 characters, and valid characters are /a-z0-9*/.
        # Otherwise, an INVALID_ARGUMENT error is returned.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Additional information of a recommendation engine.
        # Corresponds to the JSON property `recommendationMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineRecommendationMetadata]
        attr_accessor :recommendation_metadata
      
        # Configurations for a Search Engine.
        # Corresponds to the JSON property `searchEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineSearchEngineConfig]
        attr_accessor :search_engine_config
      
        # Additional config specs for a `similar-items` engine.
        # Corresponds to the JSON property `similarDocumentsConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineSimilarDocumentsEngineConfig]
        attr_accessor :similar_documents_config
      
        # Required. The solutions of the engine.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Output only. Timestamp the Recommendation Engine was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chat_engine_config = args[:chat_engine_config] if args.key?(:chat_engine_config)
          @chat_engine_metadata = args[:chat_engine_metadata] if args.key?(:chat_engine_metadata)
          @common_config = args[:common_config] if args.key?(:common_config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data_store_ids = args[:data_store_ids] if args.key?(:data_store_ids)
          @disable_analytics = args[:disable_analytics] if args.key?(:disable_analytics)
          @display_name = args[:display_name] if args.key?(:display_name)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @media_recommendation_engine_config = args[:media_recommendation_engine_config] if args.key?(:media_recommendation_engine_config)
          @name = args[:name] if args.key?(:name)
          @recommendation_metadata = args[:recommendation_metadata] if args.key?(:recommendation_metadata)
          @search_engine_config = args[:search_engine_config] if args.key?(:search_engine_config)
          @similar_documents_config = args[:similar_documents_config] if args.key?(:similar_documents_config)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Configurations for a Chat Engine.
      class GoogleCloudDiscoveryengineV1alphaEngineChatEngineConfig
        include Google::Apis::Core::Hashable
      
        # Configurations for generating a Dialogflow agent. Note that these
        # configurations are one-time consumed by and passed to Dialogflow service. It
        # means they cannot be retrieved using EngineService.GetEngine or EngineService.
        # ListEngines API after engine creation.
        # Corresponds to the JSON property `agentCreationConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineChatEngineConfigAgentCreationConfig]
        attr_accessor :agent_creation_config
      
        # The resource name of an exist Dialogflow agent to link to this Chat Engine.
        # Customers can either provide `agent_creation_config` to create agent or
        # provide an agent name that links the agent with the Chat engine. Format: `
        # projects//locations//agents/`. Note that the `dialogflow_agent_to_link` are
        # one-time consumed by and passed to Dialogflow service. It means they cannot be
        # retrieved using EngineService.GetEngine or EngineService.ListEngines API after
        # engine creation. Use ChatEngineMetadata.dialogflow_agent for actual agent
        # association after Engine is created.
        # Corresponds to the JSON property `dialogflowAgentToLink`
        # @return [String]
        attr_accessor :dialogflow_agent_to_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_creation_config = args[:agent_creation_config] if args.key?(:agent_creation_config)
          @dialogflow_agent_to_link = args[:dialogflow_agent_to_link] if args.key?(:dialogflow_agent_to_link)
        end
      end
      
      # Configurations for generating a Dialogflow agent. Note that these
      # configurations are one-time consumed by and passed to Dialogflow service. It
      # means they cannot be retrieved using EngineService.GetEngine or EngineService.
      # ListEngines API after engine creation.
      class GoogleCloudDiscoveryengineV1alphaEngineChatEngineConfigAgentCreationConfig
        include Google::Apis::Core::Hashable
      
        # Name of the company, organization or other entity that the agent represents.
        # Used for knowledge connector LLM prompt and for knowledge search.
        # Corresponds to the JSON property `business`
        # @return [String]
        attr_accessor :business
      
        # Required. The default language of the agent as a language tag. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language) for a
        # list of the currently supported language codes.
        # Corresponds to the JSON property `defaultLanguageCode`
        # @return [String]
        attr_accessor :default_language_code
      
        # Agent location for Agent creation, supported values: global/us/eu. If not
        # provided, us Engine will create Agent using us-central-1 by default; eu Engine
        # will create Agent using eu-west-1 by default.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Required. The time zone of the agent from the [time zone database](https://www.
        # iana.org/time-zones), e.g., America/New_York, Europe/Paris.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @business = args[:business] if args.key?(:business)
          @default_language_code = args[:default_language_code] if args.key?(:default_language_code)
          @location = args[:location] if args.key?(:location)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # Additional information of a Chat Engine. Fields in this message are output
      # only.
      class GoogleCloudDiscoveryengineV1alphaEngineChatEngineMetadata
        include Google::Apis::Core::Hashable
      
        # The resource name of a Dialogflow agent, that this Chat Engine refers to.
        # Format: `projects//locations//agents/`.
        # Corresponds to the JSON property `dialogflowAgent`
        # @return [String]
        attr_accessor :dialogflow_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dialogflow_agent = args[:dialogflow_agent] if args.key?(:dialogflow_agent)
        end
      end
      
      # Common configurations for an Engine.
      class GoogleCloudDiscoveryengineV1alphaEngineCommonConfig
        include Google::Apis::Core::Hashable
      
        # The name of the company, business or entity that is associated with the engine.
        # Setting this may help improve LLM related features.
        # Corresponds to the JSON property `companyName`
        # @return [String]
        attr_accessor :company_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @company_name = args[:company_name] if args.key?(:company_name)
        end
      end
      
      # Additional config specs for a Media Recommendation engine.
      class GoogleCloudDiscoveryengineV1alphaEngineMediaRecommendationEngineConfig
        include Google::Apis::Core::Hashable
      
        # The optimization objective. e.g., `cvr`. This field together with
        # optimization_objective describe engine metadata to use to control engine
        # training and serving. Currently supported values: `ctr`, `cvr`. If not
        # specified, we choose default based on engine type. Default depends on type of
        # recommendation: `recommended-for-you` => `ctr` `others-you-may-like` => `ctr`
        # Corresponds to the JSON property `optimizationObjective`
        # @return [String]
        attr_accessor :optimization_objective
      
        # Custom threshold for `cvr` optimization_objective.
        # Corresponds to the JSON property `optimizationObjectiveConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEngineMediaRecommendationEngineConfigOptimizationObjectiveConfig]
        attr_accessor :optimization_objective_config
      
        # The training state that the engine is in (e.g. `TRAINING` or `PAUSED`). Since
        # part of the cost of running the service is frequency of training - this can be
        # used to determine when to train engine in order to control cost. If not
        # specified: the default value for `CreateEngine` method is `TRAINING`. The
        # default value for `UpdateEngine` method is to keep the state the same as
        # before.
        # Corresponds to the JSON property `trainingState`
        # @return [String]
        attr_accessor :training_state
      
        # Required. The type of engine. e.g., `recommended-for-you`. This field together
        # with optimization_objective describe engine metadata to use to control engine
        # training and serving. Currently supported values: `recommended-for-you`, `
        # others-you-may-like`, `more-like-this`, `most-popular-items`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @optimization_objective = args[:optimization_objective] if args.key?(:optimization_objective)
          @optimization_objective_config = args[:optimization_objective_config] if args.key?(:optimization_objective_config)
          @training_state = args[:training_state] if args.key?(:training_state)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Custom threshold for `cvr` optimization_objective.
      class GoogleCloudDiscoveryengineV1alphaEngineMediaRecommendationEngineConfigOptimizationObjectiveConfig
        include Google::Apis::Core::Hashable
      
        # Required. The name of the field to target. Currently supported values: `watch-
        # percentage`, `watch-time`.
        # Corresponds to the JSON property `targetField`
        # @return [String]
        attr_accessor :target_field
      
        # Required. The threshold to be applied to the target (e.g., 0.5).
        # Corresponds to the JSON property `targetFieldValueFloat`
        # @return [Float]
        attr_accessor :target_field_value_float
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_field = args[:target_field] if args.key?(:target_field)
          @target_field_value_float = args[:target_field_value_float] if args.key?(:target_field_value_float)
        end
      end
      
      # Additional information of a recommendation engine.
      class GoogleCloudDiscoveryengineV1alphaEngineRecommendationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The state of data requirements for this engine: `DATA_OK` and `
        # DATA_ERROR`. Engine cannot be trained if the data is in `DATA_ERROR` state.
        # Engine can have `DATA_ERROR` state even if serving state is `ACTIVE`: engines
        # were trained successfully before, but cannot be refreshed because the
        # underlying engine no longer has sufficient data for training.
        # Corresponds to the JSON property `dataState`
        # @return [String]
        attr_accessor :data_state
      
        # Output only. The timestamp when the latest successful tune finished. Only
        # applicable on Media Recommendation engines.
        # Corresponds to the JSON property `lastTuneTime`
        # @return [String]
        attr_accessor :last_tune_time
      
        # Output only. The serving state of the engine: `ACTIVE`, `NOT_ACTIVE`.
        # Corresponds to the JSON property `servingState`
        # @return [String]
        attr_accessor :serving_state
      
        # Output only. The latest tune operation id associated with the engine. Only
        # applicable on Media Recommendation engines. If present, this operation id can
        # be used to determine if there is an ongoing tune for this engine. To check the
        # operation status, send the GetOperation request with this operation id in the
        # engine resource format. If no tuning has happened for this engine, the string
        # is empty.
        # Corresponds to the JSON property `tuningOperation`
        # @return [String]
        attr_accessor :tuning_operation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_state = args[:data_state] if args.key?(:data_state)
          @last_tune_time = args[:last_tune_time] if args.key?(:last_tune_time)
          @serving_state = args[:serving_state] if args.key?(:serving_state)
          @tuning_operation = args[:tuning_operation] if args.key?(:tuning_operation)
        end
      end
      
      # Configurations for a Search Engine.
      class GoogleCloudDiscoveryengineV1alphaEngineSearchEngineConfig
        include Google::Apis::Core::Hashable
      
        # The add-on that this search engine enables.
        # Corresponds to the JSON property `searchAddOns`
        # @return [Array<String>]
        attr_accessor :search_add_ons
      
        # The search feature tier of this engine. Different tiers might have different
        # pricing. To learn more, check the pricing documentation. Defaults to
        # SearchTier.SEARCH_TIER_STANDARD if not specified.
        # Corresponds to the JSON property `searchTier`
        # @return [String]
        attr_accessor :search_tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_add_ons = args[:search_add_ons] if args.key?(:search_add_ons)
          @search_tier = args[:search_tier] if args.key?(:search_tier)
        end
      end
      
      # Additional config specs for a `similar-items` engine.
      class GoogleCloudDiscoveryengineV1alphaEngineSimilarDocumentsEngineConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata related to the progress of the EstimateDataSize operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaEstimateDataSizeMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
        end
      end
      
      # Response of the EstimateDataSize request. If the long running operation was
      # successful, then this message is returned by the google.longrunning.Operations.
      # response field if the operation was successful.
      class GoogleCloudDiscoveryengineV1alphaEstimateDataSizeResponse
        include Google::Apis::Core::Hashable
      
        # Data size in terms of bytes.
        # Corresponds to the JSON property `dataSizeBytes`
        # @return [Fixnum]
        attr_accessor :data_size_bytes
      
        # Total number of documents.
        # Corresponds to the JSON property `documentCount`
        # @return [Fixnum]
        attr_accessor :document_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_size_bytes = args[:data_size_bytes] if args.key?(:data_size_bytes)
          @document_count = args[:document_count] if args.key?(:document_count)
        end
      end
      
      # An evaluation is a single execution (or run) of an evaluation process. It
      # encapsulates the state of the evaluation and the resulting data.
      class GoogleCloudDiscoveryengineV1alphaEvaluation
        include Google::Apis::Core::Hashable
      
        # Output only. Timestamp the Evaluation was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Timestamp the Evaluation was completed at.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more
        # about this error model and how to work with it in the [API Design Guide](https:
        # //cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DiscoveryengineV1::GoogleRpcStatus]
        attr_accessor :error
      
        # Output only. A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Describes the specification of the evaluation.
        # Corresponds to the JSON property `evaluationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEvaluationEvaluationSpec]
        attr_accessor :evaluation_spec
      
        # Identifier. The full resource name of the Evaluation, in the format of `
        # projects/`project`/locations/`location`/evaluations/`evaluation``. This field
        # must be a UTF-8 encoded string with a length limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Describes the metrics produced by the evaluation.
        # Corresponds to the JSON property `qualityMetrics`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQualityMetrics]
        attr_accessor :quality_metrics
      
        # Output only. The state of the evaluation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error = args[:error] if args.key?(:error)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @evaluation_spec = args[:evaluation_spec] if args.key?(:evaluation_spec)
          @name = args[:name] if args.key?(:name)
          @quality_metrics = args[:quality_metrics] if args.key?(:quality_metrics)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Describes the specification of the evaluation.
      class GoogleCloudDiscoveryengineV1alphaEvaluationEvaluationSpec
        include Google::Apis::Core::Hashable
      
        # Describes the specification of the query set.
        # Corresponds to the JSON property `querySetSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaEvaluationEvaluationSpecQuerySetSpec]
        attr_accessor :query_set_spec
      
        # Request message for SearchService.Search method.
        # Corresponds to the JSON property `searchRequest`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequest]
        attr_accessor :search_request
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_set_spec = args[:query_set_spec] if args.key?(:query_set_spec)
          @search_request = args[:search_request] if args.key?(:search_request)
        end
      end
      
      # Describes the specification of the query set.
      class GoogleCloudDiscoveryengineV1alphaEvaluationEvaluationSpecQuerySetSpec
        include Google::Apis::Core::Hashable
      
        # Required. The full resource name of the SampleQuerySet used for the evaluation,
        # in the format of `projects/`project`/locations/`location`/sampleQuerySets/`
        # sampleQuerySet``.
        # Corresponds to the JSON property `sampleQuerySet`
        # @return [String]
        attr_accessor :sample_query_set
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sample_query_set = args[:sample_query_set] if args.key?(:sample_query_set)
        end
      end
      
      # Response message for SiteSearchEngineService.FetchSitemaps method.
      class GoogleCloudDiscoveryengineV1alphaFetchSitemapsResponse
        include Google::Apis::Core::Hashable
      
        # List of Sitemaps fetched.
        # Corresponds to the JSON property `sitemapsMetadata`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaFetchSitemapsResponseSitemapMetadata>]
        attr_accessor :sitemaps_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sitemaps_metadata = args[:sitemaps_metadata] if args.key?(:sitemaps_metadata)
        end
      end
      
      # Contains a Sitemap and its metadata.
      class GoogleCloudDiscoveryengineV1alphaFetchSitemapsResponseSitemapMetadata
        include Google::Apis::Core::Hashable
      
        # A sitemap for the SiteSearchEngine.
        # Corresponds to the JSON property `sitemap`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSitemap]
        attr_accessor :sitemap
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sitemap = args[:sitemap] if args.key?(:sitemap)
        end
      end
      
      # Configurations for fields of a schema. For example, configuring a field is
      # indexable, or searchable.
      class GoogleCloudDiscoveryengineV1alphaFieldConfig
        include Google::Apis::Core::Hashable
      
        # If this field is set, only the corresponding source will be indexed for this
        # field. Otherwise, the values from different sources are merged. Assuming a
        # page with `` in meta tag, and `` in page map: if this enum is set to METATAGS,
        # we will only index ``; if this enum is not set, we will merge them and index ``
        # .
        # Corresponds to the JSON property `advancedSiteSearchDataSources`
        # @return [Array<String>]
        attr_accessor :advanced_site_search_data_sources
      
        # If completable_option is COMPLETABLE_ENABLED, field values are directly used
        # and returned as suggestions for Autocomplete in CompletionService.
        # CompleteQuery. If completable_option is unset, the server behavior defaults to
        # COMPLETABLE_DISABLED for fields that support setting completable options,
        # which are just `string` fields. For those fields that do not support setting
        # completable options, the server will skip completable option setting, and
        # setting completable_option for those fields will throw `INVALID_ARGUMENT`
        # error.
        # Corresponds to the JSON property `completableOption`
        # @return [String]
        attr_accessor :completable_option
      
        # If dynamic_facetable_option is DYNAMIC_FACETABLE_ENABLED, field values are
        # available for dynamic facet. Could only be DYNAMIC_FACETABLE_DISABLED if
        # FieldConfig.indexable_option is INDEXABLE_DISABLED. Otherwise, an `
        # INVALID_ARGUMENT` error will be returned. If dynamic_facetable_option is unset,
        # the server behavior defaults to DYNAMIC_FACETABLE_DISABLED for fields that
        # support setting dynamic facetable options. For those fields that do not
        # support setting dynamic facetable options, such as `object` and `boolean`, the
        # server will skip dynamic facetable option setting, and setting
        # dynamic_facetable_option for those fields will throw `INVALID_ARGUMENT` error.
        # Corresponds to the JSON property `dynamicFacetableOption`
        # @return [String]
        attr_accessor :dynamic_facetable_option
      
        # Required. Field path of the schema field. For example: `title`, `description`,
        # `release_info.release_year`.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # Output only. Raw type of the field.
        # Corresponds to the JSON property `fieldType`
        # @return [String]
        attr_accessor :field_type
      
        # If indexable_option is INDEXABLE_ENABLED, field values are indexed so that it
        # can be filtered or faceted in SearchService.Search. If indexable_option is
        # unset, the server behavior defaults to INDEXABLE_DISABLED for fields that
        # support setting indexable options. For those fields that do not support
        # setting indexable options, such as `object` and `boolean` and key properties,
        # the server will skip indexable_option setting, and setting indexable_option
        # for those fields will throw `INVALID_ARGUMENT` error.
        # Corresponds to the JSON property `indexableOption`
        # @return [String]
        attr_accessor :indexable_option
      
        # Output only. Type of the key property that this field is mapped to. Empty
        # string if this is not annotated as mapped to a key property. Example types are
        # `title`, `description`. Full list is defined by `keyPropertyMapping` in the
        # schema field annotation. If the schema field has a `KeyPropertyMapping`
        # annotation, `indexable_option` and `searchable_option` of this field cannot be
        # modified.
        # Corresponds to the JSON property `keyPropertyType`
        # @return [String]
        attr_accessor :key_property_type
      
        # Optional. The metatag name found in the HTML page. If user defines this field,
        # the value of this metatag name will be used to extract metatag. If the user
        # does not define this field, the FieldConfig.field_path will be used to extract
        # metatag.
        # Corresponds to the JSON property `metatagName`
        # @return [String]
        attr_accessor :metatag_name
      
        # If recs_filterable_option is FILTERABLE_ENABLED, field values are filterable
        # by filter expression in RecommendationService.Recommend. If FILTERABLE_ENABLED
        # but the field type is numerical, field values are not filterable by text
        # queries in RecommendationService.Recommend. Only textual fields are supported.
        # If recs_filterable_option is unset, the default setting is FILTERABLE_DISABLED
        # for fields that support setting filterable options. When a field set to [
        # FILTERABLE_DISABLED] is filtered, a warning is generated and an empty result
        # is returned.
        # Corresponds to the JSON property `recsFilterableOption`
        # @return [String]
        attr_accessor :recs_filterable_option
      
        # If retrievable_option is RETRIEVABLE_ENABLED, field values are included in the
        # search results. If retrievable_option is unset, the server behavior defaults
        # to RETRIEVABLE_DISABLED for fields that support setting retrievable options.
        # For those fields that do not support setting retrievable options, such as `
        # object` and `boolean`, the server will skip retrievable option setting, and
        # setting retrievable_option for those fields will throw `INVALID_ARGUMENT`
        # error.
        # Corresponds to the JSON property `retrievableOption`
        # @return [String]
        attr_accessor :retrievable_option
      
        # Field paths for indexing custom attribute from schema.org data. More details
        # of schema.org and its defined types can be found at [schema.org](https://
        # schema.org). It is only used on advanced site search schema. Currently only
        # support full path from root. The full path to a field is constructed by
        # concatenating field names, starting from `_root`, with a period `.` as the
        # delimiter. Examples: * Publish date of the root: _root.datePublished * Publish
        # date of the reviews: _root.review.datePublished
        # Corresponds to the JSON property `schemaOrgPaths`
        # @return [Array<String>]
        attr_accessor :schema_org_paths
      
        # If searchable_option is SEARCHABLE_ENABLED, field values are searchable by
        # text queries in SearchService.Search. If SEARCHABLE_ENABLED but field type is
        # numerical, field values will not be searchable by text queries in
        # SearchService.Search, as there are no text values associated to numerical
        # fields. If searchable_option is unset, the server behavior defaults to
        # SEARCHABLE_DISABLED for fields that support setting searchable options. Only `
        # string` fields that have no key property mapping support setting
        # searchable_option. For those fields that do not support setting searchable
        # options, the server will skip searchable option setting, and setting
        # searchable_option for those fields will throw `INVALID_ARGUMENT` error.
        # Corresponds to the JSON property `searchableOption`
        # @return [String]
        attr_accessor :searchable_option
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advanced_site_search_data_sources = args[:advanced_site_search_data_sources] if args.key?(:advanced_site_search_data_sources)
          @completable_option = args[:completable_option] if args.key?(:completable_option)
          @dynamic_facetable_option = args[:dynamic_facetable_option] if args.key?(:dynamic_facetable_option)
          @field_path = args[:field_path] if args.key?(:field_path)
          @field_type = args[:field_type] if args.key?(:field_type)
          @indexable_option = args[:indexable_option] if args.key?(:indexable_option)
          @key_property_type = args[:key_property_type] if args.key?(:key_property_type)
          @metatag_name = args[:metatag_name] if args.key?(:metatag_name)
          @recs_filterable_option = args[:recs_filterable_option] if args.key?(:recs_filterable_option)
          @retrievable_option = args[:retrievable_option] if args.key?(:retrievable_option)
          @schema_org_paths = args[:schema_org_paths] if args.key?(:schema_org_paths)
          @searchable_option = args[:searchable_option] if args.key?(:searchable_option)
        end
      end
      
      # Request for GetSession method.
      class GoogleCloudDiscoveryengineV1alphaGetSessionRequest
        include Google::Apis::Core::Hashable
      
        # Optional. If set to true, the full session including all answer details will
        # be returned.
        # Corresponds to the JSON property `includeAnswerDetails`
        # @return [Boolean]
        attr_accessor :include_answer_details
        alias_method :include_answer_details?, :include_answer_details
      
        # Required. The resource name of the Session to get. Format: `projects/`project`/
        # locations/`location`/collections/`collection`/dataStores/`data_store_id`/
        # sessions/`session_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @include_answer_details = args[:include_answer_details] if args.key?(:include_answer_details)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Response message for SiteSearchEngineService.GetUriPatternDocumentData method.
      class GoogleCloudDiscoveryengineV1alphaGetUriPatternDocumentDataResponse
        include Google::Apis::Core::Hashable
      
        # Document data keyed by URI pattern. For example: document_data_map = ` "www.
        # url1.com/*": ` "Categories": ["category1", "category2"] `, "www.url2.com/*": `
        # "Categories": ["category3"] ` `
        # Corresponds to the JSON property `documentDataMap`
        # @return [Hash<String,Hash<String,Object>>]
        attr_accessor :document_data_map
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @document_data_map = args[:document_data_map] if args.key?(:document_data_map)
        end
      end
      
      # The configuration for the identity data synchronization runs.
      class GoogleCloudDiscoveryengineV1alphaIdentityScheduleConfig
        include Google::Apis::Core::Hashable
      
        # Optional. The refresh interval to sync the Access Control List information for
        # the documents ingested by this connector. If not set, the access control list
        # will be refreshed at the default interval of 30 minutes. The identity refresh
        # interval can be at least 30 minutes and at most 7 days.
        # Corresponds to the JSON property `refreshInterval`
        # @return [String]
        attr_accessor :refresh_interval
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @refresh_interval = args[:refresh_interval] if args.key?(:refresh_interval)
        end
      end
      
      # Identity Provider Config.
      class GoogleCloudDiscoveryengineV1alphaIdpConfig
        include Google::Apis::Core::Hashable
      
        # Third party IDP Config.
        # Corresponds to the JSON property `externalIdpConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaIdpConfigExternalIdpConfig]
        attr_accessor :external_idp_config
      
        # Identity provider type configured.
        # Corresponds to the JSON property `idpType`
        # @return [String]
        attr_accessor :idp_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @external_idp_config = args[:external_idp_config] if args.key?(:external_idp_config)
          @idp_type = args[:idp_type] if args.key?(:idp_type)
        end
      end
      
      # Third party IDP Config.
      class GoogleCloudDiscoveryengineV1alphaIdpConfigExternalIdpConfig
        include Google::Apis::Core::Hashable
      
        # Workforce pool name. Example: "locations/global/workforcePools/pool_id"
        # Corresponds to the JSON property `workforcePoolName`
        # @return [String]
        attr_accessor :workforce_pool_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @workforce_pool_name = args[:workforce_pool_name] if args.key?(:workforce_pool_name)
        end
      end
      
      # Metadata related to the progress of the ImportCompletionSuggestions operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaImportCompletionSuggestionsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of CompletionSuggestions that failed to be imported.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of CompletionSuggestions successfully imported.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the CompletionService.ImportCompletionSuggestions method. If the
      # long running operation is done, this message is returned by the google.
      # longrunning.Operations.response field if the operation is successful.
      class GoogleCloudDiscoveryengineV1alphaImportCompletionSuggestionsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Metadata related to the progress of the ImportDocuments operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaImportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were processed successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Total count of entries that were processed.
        # Corresponds to the JSON property `totalCount`
        # @return [Fixnum]
        attr_accessor :total_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @total_count = args[:total_count] if args.key?(:total_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the ImportDocumentsRequest. If the long running operation is done,
      # then this message is returned by the google.longrunning.Operations.response
      # field if the operation was successful.
      class GoogleCloudDiscoveryengineV1alphaImportDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Configuration of destination for Import related errors.
      class GoogleCloudDiscoveryengineV1alphaImportErrorConfig
        include Google::Apis::Core::Hashable
      
        # Cloud Storage prefix for import errors. This must be an empty, existing Cloud
        # Storage directory. Import errors are written to sharded files in this
        # directory, one per line, as a JSON-encoded `google.rpc.Status` message.
        # Corresponds to the JSON property `gcsPrefix`
        # @return [String]
        attr_accessor :gcs_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_prefix = args[:gcs_prefix] if args.key?(:gcs_prefix)
        end
      end
      
      # Metadata related to the progress of the ImportSampleQueries operation. This
      # will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaImportSampleQueriesMetadata
        include Google::Apis::Core::Hashable
      
        # ImportSampleQueries operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of SampleQuerys that failed to be imported.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of SampleQuerys successfully imported.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Total count of SampleQuerys that were processed.
        # Corresponds to the JSON property `totalCount`
        # @return [Fixnum]
        attr_accessor :total_count
      
        # ImportSampleQueries operation last update time. If the operation is done, this
        # is also the finish time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @total_count = args[:total_count] if args.key?(:total_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the SampleQueryService.ImportSampleQueries method. If the long
      # running operation is done, this message is returned by the google.longrunning.
      # Operations.response field if the operation is successful.
      class GoogleCloudDiscoveryengineV1alphaImportSampleQueriesResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Metadata related to the progress of the ImportSuggestionDenyListEntries
      # operation. This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaImportSuggestionDenyListEntriesMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for CompletionService.ImportSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1alphaImportSuggestionDenyListEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Count of deny list entries that failed to be imported.
        # Corresponds to the JSON property `failedEntriesCount`
        # @return [Fixnum]
        attr_accessor :failed_entries_count
      
        # Count of deny list entries successfully imported.
        # Corresponds to the JSON property `importedEntriesCount`
        # @return [Fixnum]
        attr_accessor :imported_entries_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @failed_entries_count = args[:failed_entries_count] if args.key?(:failed_entries_count)
          @imported_entries_count = args[:imported_entries_count] if args.key?(:imported_entries_count)
        end
      end
      
      # Metadata related to the progress of the Import operation. This is returned by
      # the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaImportUserEventsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were processed successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the ImportUserEventsRequest. If the long running operation was
      # successful, then this message is returned by the google.longrunning.Operations.
      # response field if the operation was successful.
      class GoogleCloudDiscoveryengineV1alphaImportUserEventsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Count of user events imported with complete existing Documents.
        # Corresponds to the JSON property `joinedEventsCount`
        # @return [Fixnum]
        attr_accessor :joined_events_count
      
        # Count of user events imported, but with Document information not found in the
        # existing Branch.
        # Corresponds to the JSON property `unjoinedEventsCount`
        # @return [Fixnum]
        attr_accessor :unjoined_events_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @joined_events_count = args[:joined_events_count] if args.key?(:joined_events_count)
          @unjoined_events_count = args[:unjoined_events_count] if args.key?(:unjoined_events_count)
        end
      end
      
      # A floating point interval.
      class GoogleCloudDiscoveryengineV1alphaInterval
        include Google::Apis::Core::Hashable
      
        # Exclusive upper bound.
        # Corresponds to the JSON property `exclusiveMaximum`
        # @return [Float]
        attr_accessor :exclusive_maximum
      
        # Exclusive lower bound.
        # Corresponds to the JSON property `exclusiveMinimum`
        # @return [Float]
        attr_accessor :exclusive_minimum
      
        # Inclusive upper bound.
        # Corresponds to the JSON property `maximum`
        # @return [Float]
        attr_accessor :maximum
      
        # Inclusive lower bound.
        # Corresponds to the JSON property `minimum`
        # @return [Float]
        attr_accessor :minimum
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusive_maximum = args[:exclusive_maximum] if args.key?(:exclusive_maximum)
          @exclusive_minimum = args[:exclusive_minimum] if args.key?(:exclusive_minimum)
          @maximum = args[:maximum] if args.key?(:maximum)
          @minimum = args[:minimum] if args.key?(:minimum)
        end
      end
      
      # Language info for DataStore.
      class GoogleCloudDiscoveryengineV1alphaLanguageInfo
        include Google::Apis::Core::Hashable
      
        # Output only. Language part of normalized_language_code. E.g.: `en-US` -> `en`,
        # `zh-Hans-HK` -> `zh`, `en` -> `en`.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # The language code for the DataStore.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Output only. This is the normalized form of language_code. E.g.: language_code
        # of `en-GB`, `en_GB`, `en-UK` or `en-gb` will have normalized_language_code of `
        # en-GB`.
        # Corresponds to the JSON property `normalizedLanguageCode`
        # @return [String]
        attr_accessor :normalized_language_code
      
        # Output only. Region part of normalized_language_code, if present. E.g.: `en-US`
        # -> `US`, `zh-Hans-HK` -> `HK`, `en` -> ``.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language = args[:language] if args.key?(:language)
          @language_code = args[:language_code] if args.key?(:language_code)
          @normalized_language_code = args[:normalized_language_code] if args.key?(:normalized_language_code)
          @region = args[:region] if args.key?(:region)
        end
      end
      
      # Request for ListSessions method.
      class GoogleCloudDiscoveryengineV1alphaListSessionsRequest
        include Google::Apis::Core::Hashable
      
        # A filter to apply on the list results. The supported features are:
        # user_pseudo_id, state. Example: "user_pseudo_id = some_id"
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # A comma-separated list of fields to order by, sorted in ascending order. Use "
        # desc" after a field name for descending. Supported fields: * `update_time` * `
        # create_time` * `session_name` * `is_pinned` Example: * "update_time desc" * "
        # create_time" * "is_pinned desc,update_time desc": list sessions by is_pinned
        # first, then by update_time.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Maximum number of results to return. If unspecified, defaults to 50. Max
        # allowed value is 1000.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A page token, received from a previous `ListSessions` call. Provide this to
        # retrieve the subsequent page.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Required. The data store resource name. Format: `projects/`project`/locations/`
        # location`/collections/`collection`/dataStores/`data_store_id``
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @order_by = args[:order_by] if args.key?(:order_by)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # Response for ListSessions method.
      class GoogleCloudDiscoveryengineV1alphaListSessionsResponse
        include Google::Apis::Core::Hashable
      
        # Pagination token, if not returned indicates the last page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All the Sessions for a given data store.
        # Corresponds to the JSON property `sessions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSession>]
        attr_accessor :sessions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sessions = args[:sessions] if args.key?(:sessions)
        end
      end
      
      # Configuration for Natural Language Query Understanding.
      class GoogleCloudDiscoveryengineV1alphaNaturalLanguageQueryUnderstandingConfig
        include Google::Apis::Core::Hashable
      
        # Mode of Natural Language Query Understanding. If this field is unset, the
        # behavior defaults to NaturalLanguageQueryUnderstandingConfig.Mode.DISABLED.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Response message for CrawlRateManagementService.ObtainCrawlRate method. The
      # response contains organcic or dedicated crawl rate time series data for
      # monitoring, depending on whether dedicated crawl rate is set.
      class GoogleCloudDiscoveryengineV1alphaObtainCrawlRateResponse
        include Google::Apis::Core::Hashable
      
        # The historical dedicated crawl rate timeseries data, used for monitoring.
        # Dedicated crawl is used by Vertex AI to crawl the user's website when dedicate
        # crawl is set.
        # Corresponds to the JSON property `dedicatedCrawlRateTimeSeries`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaDedicatedCrawlRateTimeSeries]
        attr_accessor :dedicated_crawl_rate_time_series
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more
        # about this error model and how to work with it in the [API Design Guide](https:
        # //cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DiscoveryengineV1::GoogleRpcStatus]
        attr_accessor :error
      
        # The historical organic crawl rate timeseries data, used for monitoring.
        # Organic crawl is auto-determined by Google to crawl the user's website when
        # dedicate crawl is not set. Crawl rate is the QPS of crawl request Google sends
        # to the user's website.
        # Corresponds to the JSON property `organicCrawlRateTimeSeries`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaOrganicCrawlRateTimeSeries]
        attr_accessor :organic_crawl_rate_time_series
      
        # Output only. The state of the response.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dedicated_crawl_rate_time_series = args[:dedicated_crawl_rate_time_series] if args.key?(:dedicated_crawl_rate_time_series)
          @error = args[:error] if args.key?(:error)
          @organic_crawl_rate_time_series = args[:organic_crawl_rate_time_series] if args.key?(:organic_crawl_rate_time_series)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The historical organic crawl rate timeseries data, used for monitoring.
      # Organic crawl is auto-determined by Google to crawl the user's website when
      # dedicate crawl is not set. Crawl rate is the QPS of crawl request Google sends
      # to the user's website.
      class GoogleCloudDiscoveryengineV1alphaOrganicCrawlRateTimeSeries
        include Google::Apis::Core::Hashable
      
        # The historical crawl rate timeseries data, used for monitoring.
        # Corresponds to the JSON property `googleOrganicCrawlRate`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCrawlRateTimeSeries]
        attr_accessor :google_organic_crawl_rate
      
        # The historical crawl rate timeseries data, used for monitoring.
        # Corresponds to the JSON property `vertexAiOrganicCrawlRate`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCrawlRateTimeSeries]
        attr_accessor :vertex_ai_organic_crawl_rate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @google_organic_crawl_rate = args[:google_organic_crawl_rate] if args.key?(:google_organic_crawl_rate)
          @vertex_ai_organic_crawl_rate = args[:vertex_ai_organic_crawl_rate] if args.key?(:vertex_ai_organic_crawl_rate)
        end
      end
      
      # Metadata and configurations for a Google Cloud project in the service.
      class GoogleCloudDiscoveryengineV1alphaProject
        include Google::Apis::Core::Hashable
      
        # Output only. The timestamp when this project is created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Full resource name of the project, for example `projects/`project`
        # `. Note that when making requests, project number and project id are both
        # acceptable, but the server will always respond in project number.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The timestamp when this project is successfully provisioned.
        # Empty value means this project is still provisioning and is not ready for use.
        # Corresponds to the JSON property `provisionCompletionTime`
        # @return [String]
        attr_accessor :provision_completion_time
      
        # Output only. A map of terms of services. The key is the `id` of ServiceTerms.
        # Corresponds to the JSON property `serviceTermsMap`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaProjectServiceTerms>]
        attr_accessor :service_terms_map
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @provision_completion_time = args[:provision_completion_time] if args.key?(:provision_completion_time)
          @service_terms_map = args[:service_terms_map] if args.key?(:service_terms_map)
        end
      end
      
      # Metadata about the terms of service.
      class GoogleCloudDiscoveryengineV1alphaProjectServiceTerms
        include Google::Apis::Core::Hashable
      
        # The last time when the project agreed to the terms of service.
        # Corresponds to the JSON property `acceptTime`
        # @return [String]
        attr_accessor :accept_time
      
        # The last time when the project declined or revoked the agreement to terms of
        # service.
        # Corresponds to the JSON property `declineTime`
        # @return [String]
        attr_accessor :decline_time
      
        # The unique identifier of this terms of service. Available terms: * `
        # GA_DATA_USE_TERMS`: [Terms for data use](https://cloud.google.com/retail/data-
        # use-terms). When using this as `id`, the acceptable version to provide is `
        # 2022-11-23`.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether the project has accepted/rejected the service terms or it is still
        # pending.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The version string of the terms of service. For acceptable values, see the
        # comments for id above.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accept_time = args[:accept_time] if args.key?(:accept_time)
          @decline_time = args[:decline_time] if args.key?(:decline_time)
          @id = args[:id] if args.key?(:id)
          @state = args[:state] if args.key?(:state)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Metadata associated with a project provision operation.
      class GoogleCloudDiscoveryengineV1alphaProvisionProjectMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata related to the progress of the PurgeCompletionSuggestions operation.
      # This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaPurgeCompletionSuggestionsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for CompletionService.PurgeCompletionSuggestions method.
      class GoogleCloudDiscoveryengineV1alphaPurgeCompletionSuggestionsResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Whether the completion suggestions were successfully purged.
        # Corresponds to the JSON property `purgeSucceeded`
        # @return [Boolean]
        attr_accessor :purge_succeeded
        alias_method :purge_succeeded?, :purge_succeeded
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @purge_succeeded = args[:purge_succeeded] if args.key?(:purge_succeeded)
        end
      end
      
      # Metadata related to the progress of the PurgeDocuments operation. This will be
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaPurgeDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were ignored as entries were not found.
        # Corresponds to the JSON property `ignoredCount`
        # @return [Fixnum]
        attr_accessor :ignored_count
      
        # Count of entries that were deleted successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @ignored_count = args[:ignored_count] if args.key?(:ignored_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for DocumentService.PurgeDocuments method. If the long
      # running operation is successfully done, then this message is returned by the
      # google.longrunning.Operations.response field.
      class GoogleCloudDiscoveryengineV1alphaPurgeDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # The total count of documents purged as a result of the operation.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        # A sample of document names that will be deleted. Only populated if `force` is
        # set to false. A max of 100 names will be returned and the names are chosen at
        # random.
        # Corresponds to the JSON property `purgeSample`
        # @return [Array<String>]
        attr_accessor :purge_sample
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
          @purge_sample = args[:purge_sample] if args.key?(:purge_sample)
        end
      end
      
      # Metadata related to the progress of the PurgeSuggestionDenyListEntries
      # operation. This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaPurgeSuggestionDenyListEntriesMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for CompletionService.PurgeSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1alphaPurgeSuggestionDenyListEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Number of suggestion deny list entries purged.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
        end
      end
      
      # Metadata related to the progress of the PurgeUserEvents operation. This will
      # be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaPurgeUserEventsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were deleted successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the PurgeUserEventsRequest. If the long running operation is
      # successfully done, then this message is returned by the google.longrunning.
      # Operations.response field.
      class GoogleCloudDiscoveryengineV1alphaPurgeUserEventsResponse
        include Google::Apis::Core::Hashable
      
        # The total count of events purged as a result of the operation.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
        end
      end
      
      # Describes the metrics produced by the evaluation.
      class GoogleCloudDiscoveryengineV1alphaQualityMetrics
        include Google::Apis::Core::Hashable
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `docNdcg`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQualityMetricsTopkMetrics]
        attr_accessor :doc_ndcg
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `docPrecision`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQualityMetricsTopkMetrics]
        attr_accessor :doc_precision
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `docRecall`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQualityMetricsTopkMetrics]
        attr_accessor :doc_recall
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `pageNdcg`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQualityMetricsTopkMetrics]
        attr_accessor :page_ndcg
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `pageRecall`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQualityMetricsTopkMetrics]
        attr_accessor :page_recall
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @doc_ndcg = args[:doc_ndcg] if args.key?(:doc_ndcg)
          @doc_precision = args[:doc_precision] if args.key?(:doc_precision)
          @doc_recall = args[:doc_recall] if args.key?(:doc_recall)
          @page_ndcg = args[:page_ndcg] if args.key?(:page_ndcg)
          @page_recall = args[:page_recall] if args.key?(:page_recall)
        end
      end
      
      # Stores the metric values at specific top-k levels.
      class GoogleCloudDiscoveryengineV1alphaQualityMetricsTopkMetrics
        include Google::Apis::Core::Hashable
      
        # The top-1 value.
        # Corresponds to the JSON property `top1`
        # @return [Float]
        attr_accessor :top1
      
        # The top-10 value.
        # Corresponds to the JSON property `top10`
        # @return [Float]
        attr_accessor :top10
      
        # The top-3 value.
        # Corresponds to the JSON property `top3`
        # @return [Float]
        attr_accessor :top3
      
        # The top-5 value.
        # Corresponds to the JSON property `top5`
        # @return [Float]
        attr_accessor :top5
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @top1 = args[:top1] if args.key?(:top1)
          @top10 = args[:top10] if args.key?(:top10)
          @top3 = args[:top3] if args.key?(:top3)
          @top5 = args[:top5] if args.key?(:top5)
        end
      end
      
      # Defines a user inputed query.
      class GoogleCloudDiscoveryengineV1alphaQuery
        include Google::Apis::Core::Hashable
      
        # Unique Id for the query.
        # Corresponds to the JSON property `queryId`
        # @return [String]
        attr_accessor :query_id
      
        # Plain text.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_id = args[:query_id] if args.key?(:query_id)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.RecrawlUris
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaRecrawlUrisMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Unique URIs in the request that have invalid format. Sample limited to 1000.
        # Corresponds to the JSON property `invalidUris`
        # @return [Array<String>]
        attr_accessor :invalid_uris
      
        # Total number of unique URIs in the request that have invalid format.
        # Corresponds to the JSON property `invalidUrisCount`
        # @return [Fixnum]
        attr_accessor :invalid_uris_count
      
        # Total number of URIs that have yet to be crawled.
        # Corresponds to the JSON property `pendingCount`
        # @return [Fixnum]
        attr_accessor :pending_count
      
        # Total number of URIs that were rejected due to insufficient indexing resources.
        # Corresponds to the JSON property `quotaExceededCount`
        # @return [Fixnum]
        attr_accessor :quota_exceeded_count
      
        # Total number of URIs that have been crawled so far.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Unique URIs in the request that don't match any TargetSite in the DataStore,
        # only match TargetSites that haven't been fully indexed, or match a TargetSite
        # with type EXCLUDE. Sample limited to 1000.
        # Corresponds to the JSON property `urisNotMatchingTargetSites`
        # @return [Array<String>]
        attr_accessor :uris_not_matching_target_sites
      
        # Total number of URIs that don't match any TargetSites.
        # Corresponds to the JSON property `urisNotMatchingTargetSitesCount`
        # @return [Fixnum]
        attr_accessor :uris_not_matching_target_sites_count
      
        # Total number of unique URIs in the request that are not in invalid_uris.
        # Corresponds to the JSON property `validUrisCount`
        # @return [Fixnum]
        attr_accessor :valid_uris_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @invalid_uris = args[:invalid_uris] if args.key?(:invalid_uris)
          @invalid_uris_count = args[:invalid_uris_count] if args.key?(:invalid_uris_count)
          @pending_count = args[:pending_count] if args.key?(:pending_count)
          @quota_exceeded_count = args[:quota_exceeded_count] if args.key?(:quota_exceeded_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
          @uris_not_matching_target_sites = args[:uris_not_matching_target_sites] if args.key?(:uris_not_matching_target_sites)
          @uris_not_matching_target_sites_count = args[:uris_not_matching_target_sites_count] if args.key?(:uris_not_matching_target_sites_count)
          @valid_uris_count = args[:valid_uris_count] if args.key?(:valid_uris_count)
        end
      end
      
      # Response message for SiteSearchEngineService.RecrawlUris method.
      class GoogleCloudDiscoveryengineV1alphaRecrawlUrisResponse
        include Google::Apis::Core::Hashable
      
        # URIs that were not crawled before the LRO terminated.
        # Corresponds to the JSON property `failedUris`
        # @return [Array<String>]
        attr_accessor :failed_uris
      
        # Details for a sample of up to 10 `failed_uris`.
        # Corresponds to the JSON property `failureSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaRecrawlUrisResponseFailureInfo>]
        attr_accessor :failure_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failed_uris = args[:failed_uris] if args.key?(:failed_uris)
          @failure_samples = args[:failure_samples] if args.key?(:failure_samples)
        end
      end
      
      # Details about why a particular URI failed to be crawled. Each FailureInfo
      # contains one FailureReason per CorpusType.
      class GoogleCloudDiscoveryengineV1alphaRecrawlUrisResponseFailureInfo
        include Google::Apis::Core::Hashable
      
        # List of failure reasons by corpus type (e.g. desktop, mobile).
        # Corresponds to the JSON property `failureReasons`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaRecrawlUrisResponseFailureInfoFailureReason>]
        attr_accessor :failure_reasons
      
        # URI that failed to be crawled.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failure_reasons = args[:failure_reasons] if args.key?(:failure_reasons)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Details about why crawling failed for a particular CorpusType, e.g., DESKTOP
      # and MOBILE crawling may fail for different reasons.
      class GoogleCloudDiscoveryengineV1alphaRecrawlUrisResponseFailureInfoFailureReason
        include Google::Apis::Core::Hashable
      
        # DESKTOP, MOBILE, or CORPUS_TYPE_UNSPECIFIED.
        # Corresponds to the JSON property `corpusType`
        # @return [String]
        attr_accessor :corpus_type
      
        # Reason why the URI was not crawled.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @corpus_type = args[:corpus_type] if args.key?(:corpus_type)
          @error_message = args[:error_message] if args.key?(:error_message)
        end
      end
      
      # Defines the structure and layout of a type of document data.
      class GoogleCloudDiscoveryengineV1alphaSchema
        include Google::Apis::Core::Hashable
      
        # Output only. Configurations for fields of the schema.
        # Corresponds to the JSON property `fieldConfigs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaFieldConfig>]
        attr_accessor :field_configs
      
        # The JSON representation of the schema.
        # Corresponds to the JSON property `jsonSchema`
        # @return [String]
        attr_accessor :json_schema
      
        # Immutable. The full resource name of the schema, in the format of `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # schemas/`schema``. This field must be a UTF-8 encoded string with a length
        # limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The structured representation of the schema.
        # Corresponds to the JSON property `structSchema`
        # @return [Hash<String,Object>]
        attr_accessor :struct_schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_configs = args[:field_configs] if args.key?(:field_configs)
          @json_schema = args[:json_schema] if args.key?(:json_schema)
          @name = args[:name] if args.key?(:name)
          @struct_schema = args[:struct_schema] if args.key?(:struct_schema)
        end
      end
      
      # Promotion proto includes uri and other helping information to display the
      # promotion.
      class GoogleCloudDiscoveryengineV1alphaSearchLinkPromotion
        include Google::Apis::Core::Hashable
      
        # Optional. The Promotion description. Maximum length: 200 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. The enabled promotion will be returned for any serving configs
        # associated with the parent of the control this promotion is attached to. This
        # flag is used for basic site search only.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Optional. The promotion thumbnail image url.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Required. The title of the promotion. Maximum length: 160 characters.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Required. The URL for the page the user wants to promote.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @enabled = args[:enabled] if args.key?(:enabled)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Request message for SearchService.Search method.
      class GoogleCloudDiscoveryengineV1alphaSearchRequest
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # The branch resource name, such as `projects/*/locations/global/collections/
        # default_collection/dataStores/default_data_store/branches/0`. Use `
        # default_branch` as the branch ID or leave this field empty, to search
        # documents under the default branch.
        # Corresponds to the JSON property `branch`
        # @return [String]
        attr_accessor :branch
      
        # The default filter that is applied when a user performs a search without
        # checking any filters on the search page. The filter applied to every search
        # request when quality improvement such as query expansion is needed. In the
        # case a query does not have a sufficient amount of results this filter will be
        # used to determine whether or not to enable the query expansion flow. The
        # original filter will still be used for the query expanded search. This field
        # is strongly recommended to achieve high search quality. For more information
        # about filter syntax, see SearchRequest.filter.
        # Corresponds to the JSON property `canonicalFilter`
        # @return [String]
        attr_accessor :canonical_filter
      
        # A specification for configuring the behavior of content search.
        # Corresponds to the JSON property `contentSearchSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpec]
        attr_accessor :content_search_spec
      
        # Defines custom fine tuning spec.
        # Corresponds to the JSON property `customFineTuningSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaCustomFineTuningSpec]
        attr_accessor :custom_fine_tuning_spec
      
        # Specs defining DataStores to filter on in a search call and configurations for
        # those data stores. This is only considered for Engines with multiple data
        # stores. For engines with a single data store, the specs directly under
        # SearchRequest should be used.
        # Corresponds to the JSON property `dataStoreSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestDataStoreSpec>]
        attr_accessor :data_store_specs
      
        # The specification that uses customized query embedding vector to do semantic
        # document retrieval.
        # Corresponds to the JSON property `embeddingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestEmbeddingSpec]
        attr_accessor :embedding_spec
      
        # Facet specifications for faceted search. If empty, no facets are returned. A
        # maximum of 100 values are allowed. Otherwise, an `INVALID_ARGUMENT` error is
        # returned.
        # Corresponds to the JSON property `facetSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestFacetSpec>]
        attr_accessor :facet_specs
      
        # The filter syntax consists of an expression language for constructing a
        # predicate from one or more fields of the documents being filtered. Filter
        # expression is case-sensitive. If this field is unrecognizable, an `
        # INVALID_ARGUMENT` is returned. Filtering in Vertex AI Search is done by
        # mapping the LHS filter key to a key property defined in the Vertex AI Search
        # backend -- this mapping is defined by the customer in their schema. For
        # example a media customer might have a field 'name' in their schema. In this
        # case the filter would look like this: filter --> name:'ANY("king kong")' For
        # more information about filtering including syntax and filter operators, see [
        # Filter](https://cloud.google.com/generative-ai-app-builder/docs/filter-search-
        # metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Specifies the image query input.
        # Corresponds to the JSON property `imageQuery`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestImageQuery]
        attr_accessor :image_query
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information,
        # see [Standard fields](https://cloud.google.com/apis/design/standard_fields).
        # This field helps to better interpret the query. If a value isn't specified,
        # the query language code is automatically detected, which may not be accurate.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Specification to enable natural language understanding capabilities for search
        # requests.
        # Corresponds to the JSON property `naturalLanguageQueryUnderstandingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestNaturalLanguageQueryUnderstandingSpec]
        attr_accessor :natural_language_query_understanding_spec
      
        # A 0-indexed integer that specifies the current offset (that is, starting
        # result location, amongst the Documents deemed by the API as relevant) in
        # search results. This field is only considered if page_token is unset. If this
        # field is negative, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # The maximum number of results to return for OneBox. This applies to each
        # OneBox type individually. Default number is 10.
        # Corresponds to the JSON property `oneBoxPageSize`
        # @return [Fixnum]
        attr_accessor :one_box_page_size
      
        # The order in which documents are returned. Documents can be ordered by a field
        # in an Document object. Leave it unset if ordered by relevance. `order_by`
        # expression is case-sensitive. For more information on ordering the website
        # search results, see [Order web search results](https://cloud.google.com/
        # generative-ai-app-builder/docs/order-web-search-results). For more information
        # on ordering the healthcare search results, see [Order healthcare search
        # results](https://cloud.google.com/generative-ai-app-builder/docs/order-hc-
        # results). If this field is unrecognizable, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Maximum number of Documents to return. The maximum allowed value depends on
        # the data type. Values above the maximum value are coerced to the maximum value.
        # * Websites with basic indexing: Default `10`, Maximum `25`. * Websites with
        # advanced indexing: Default `25`, Maximum `50`. * Other: Default `50`, Maximum `
        # 100`. If this field is negative, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A page token received from a previous SearchService.Search call. Provide this
        # to retrieve the subsequent page. When paginating, all other parameters
        # provided to SearchService.Search must match the call that provided the page
        # token. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Additional search parameters. For public website search only, supported values
        # are: * `user_country_code`: string. Default empty. If set to non-empty,
        # results are restricted or boosted based on the location provided. For example,
        # `user_country_code: "au"` For available codes see [Country Codes](https://
        # developers.google.com/custom-search/docs/json_api_reference#countryCodes) * `
        # search_type`: double. Default empty. Enables non-webpage searching depending
        # on the value. The only valid non-default value is 1, which enables image
        # searching. For example, `search_type: 1`
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # The specification for personalization.
        # Corresponds to the JSON property `personalizationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestPersonalizationSpec]
        attr_accessor :personalization_spec
      
        # Raw search query.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Specification to determine under which conditions query expansion should occur.
        # Corresponds to the JSON property `queryExpansionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestQueryExpansionSpec]
        attr_accessor :query_expansion_spec
      
        # The ranking expression controls the customized ranking on retrieval documents.
        # This overrides ServingConfig.ranking_expression. The ranking expression is a
        # single function or multiple functions that are joined by "+". *
        # ranking_expression = function, ` " + ", function `; Supported functions: *
        # double * relevance_score * double * dotProduct(embedding_field_path) Function
        # variables: * `relevance_score`: pre-defined keywords, used for measure
        # relevance between query and document. * `embedding_field_path`: the document
        # embedding field used with query embedding vector. * `dotProduct`: embedding
        # function between embedding_field_path and query embedding vector. Example
        # ranking expression: If document has an embedding field doc_embedding, the
        # ranking expression could be `0.5 * relevance_score + 0.3 * dotProduct(
        # doc_embedding)`.
        # Corresponds to the JSON property `rankingExpression`
        # @return [String]
        attr_accessor :ranking_expression
      
        # The Unicode country/region code (CLDR) of a location, such as "US" and "419".
        # For more information, see [Standard fields](https://cloud.google.com/apis/
        # design/standard_fields). If set, then results will be boosted based on the
        # region_code provided.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # The relevance threshold of the search results. Default to Google defined
        # threshold, leveraging a balance of precision and recall to deliver both highly
        # accurate results and comprehensive coverage of relevant information.
        # Corresponds to the JSON property `relevanceThreshold`
        # @return [String]
        attr_accessor :relevance_threshold
      
        # Whether to turn on safe search. This is only supported for website search.
        # Corresponds to the JSON property `safeSearch`
        # @return [Boolean]
        attr_accessor :safe_search
        alias_method :safe_search?, :safe_search
      
        # Specification for search as you type in search requests.
        # Corresponds to the JSON property `searchAsYouTypeSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestSearchAsYouTypeSpec]
        attr_accessor :search_as_you_type_spec
      
        # Required. The resource name of the Search serving config, such as `projects/*/
        # locations/global/collections/default_collection/engines/*/servingConfigs/
        # default_serving_config`, or `projects/*/locations/global/collections/
        # default_collection/dataStores/default_data_store/servingConfigs/
        # default_serving_config`. This field is used to identify the serving
        # configuration name, set of models used to make the search.
        # Corresponds to the JSON property `servingConfig`
        # @return [String]
        attr_accessor :serving_config
      
        # The session resource name. Optional. Session allows users to do multi-turn /
        # search API calls or coordination between /search API calls and /answer API
        # calls. Example #1 (multi-turn /search API calls): 1. Call /search API with the
        # auto-session mode (see below). 2. Call /search API with the session ID
        # generated in the first call. Here, the previous search query gets considered
        # in query standing. I.e., if the first query is "How did Alphabet do in 2022?"
        # and the current query is "How about 2023?", the current query will be
        # interpreted as "How did Alphabet do in 2023?". Example #2 (coordination
        # between /search API calls and /answer API calls): 1. Call /search API with the
        # auto-session mode (see below). 2. Call /answer API with the session ID
        # generated in the first call. Here, the answer generation happens in the
        # context of the search results from the first search call. Auto-session mode:
        # when `projects/.../sessions/-` is used, a new session gets automatically
        # created. Otherwise, users can use the create-session API to create a session
        # manually. Multi-turn Search feature is currently at private GA stage. Please
        # use v1alpha or v1beta version instead before we launch this feature to public
        # GA. Or ask for allowlisting through Google Support team.
        # Corresponds to the JSON property `session`
        # @return [String]
        attr_accessor :session
      
        # Session specification. Multi-turn Search feature is currently at private GA
        # stage. Please use v1alpha or v1beta version instead before we launch this
        # feature to public GA. Or ask for allowlisting through Google Support team.
        # Corresponds to the JSON property `sessionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestSessionSpec]
        attr_accessor :session_spec
      
        # The specification for query spell correction.
        # Corresponds to the JSON property `spellCorrectionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestSpellCorrectionSpec]
        attr_accessor :spell_correction_spec
      
        # Information of an end user.
        # Corresponds to the JSON property `userInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaUserInfo]
        attr_accessor :user_info
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # A unique identifier for tracking visitors. For example, this could be
        # implemented with an HTTP cookie, which should be able to uniquely identify a
        # visitor on a single device. This unique identifier should not change if the
        # visitor logs in or out of the website. This field should NOT have a fixed
        # value such as `unknown_visitor`. This should be the same identifier as
        # UserEvent.user_pseudo_id and CompleteQueryRequest.user_pseudo_id The field
        # must be a UTF-8 encoded string with a length limit of 128 characters.
        # Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @branch = args[:branch] if args.key?(:branch)
          @canonical_filter = args[:canonical_filter] if args.key?(:canonical_filter)
          @content_search_spec = args[:content_search_spec] if args.key?(:content_search_spec)
          @custom_fine_tuning_spec = args[:custom_fine_tuning_spec] if args.key?(:custom_fine_tuning_spec)
          @data_store_specs = args[:data_store_specs] if args.key?(:data_store_specs)
          @embedding_spec = args[:embedding_spec] if args.key?(:embedding_spec)
          @facet_specs = args[:facet_specs] if args.key?(:facet_specs)
          @filter = args[:filter] if args.key?(:filter)
          @image_query = args[:image_query] if args.key?(:image_query)
          @language_code = args[:language_code] if args.key?(:language_code)
          @natural_language_query_understanding_spec = args[:natural_language_query_understanding_spec] if args.key?(:natural_language_query_understanding_spec)
          @offset = args[:offset] if args.key?(:offset)
          @one_box_page_size = args[:one_box_page_size] if args.key?(:one_box_page_size)
          @order_by = args[:order_by] if args.key?(:order_by)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @params = args[:params] if args.key?(:params)
          @personalization_spec = args[:personalization_spec] if args.key?(:personalization_spec)
          @query = args[:query] if args.key?(:query)
          @query_expansion_spec = args[:query_expansion_spec] if args.key?(:query_expansion_spec)
          @ranking_expression = args[:ranking_expression] if args.key?(:ranking_expression)
          @region_code = args[:region_code] if args.key?(:region_code)
          @relevance_threshold = args[:relevance_threshold] if args.key?(:relevance_threshold)
          @safe_search = args[:safe_search] if args.key?(:safe_search)
          @search_as_you_type_spec = args[:search_as_you_type_spec] if args.key?(:search_as_you_type_spec)
          @serving_config = args[:serving_config] if args.key?(:serving_config)
          @session = args[:session] if args.key?(:session)
          @session_spec = args[:session_spec] if args.key?(:session_spec)
          @spell_correction_spec = args[:spell_correction_spec] if args.key?(:spell_correction_spec)
          @user_info = args[:user_info] if args.key?(:user_info)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Boost specification to boost certain documents.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpec
        include Google::Apis::Core::Hashable
      
        # Condition boost specifications. If a document matches multiple conditions in
        # the specifictions, boost scores from these specifications are all applied and
        # combined in a non-linear way. Maximum number of specifications is 20.
        # Corresponds to the JSON property `conditionBoostSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpecConditionBoostSpec>]
        attr_accessor :condition_boost_specs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition_boost_specs = args[:condition_boost_specs] if args.key?(:condition_boost_specs)
        end
      end
      
      # Boost applies to documents which match a condition.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpecConditionBoostSpec
        include Google::Apis::Core::Hashable
      
        # Strength of the condition boost, which should be in [-1, 1]. Negative boost
        # means demotion. Default is 0.0. Setting to 1.0 gives the document a big
        # promotion. However, it does not necessarily mean that the boosted document
        # will be the top result at all times, nor that other documents will be excluded.
        # Results could still be shown even when none of them matches the condition.
        # And results that are significantly more relevant to the search query can still
        # trump your heavily favored but irrelevant documents. Setting to -1.0 gives the
        # document a big demotion. However, results that are deeply relevant might still
        # be shown. The document will have an upstream battle to get a fairly high
        # ranking, but it is not blocked out completely. Setting to 0.0 means no boost
        # applied. The boosting condition is ignored. Only one of the (condition, boost)
        # combination or the boost_control_spec below are set. If both are set then the
        # global boost is ignored and the more fine-grained boost_control_spec is
        # applied.
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Specification for custom ranking based on customer specified attribute value.
        # It provides more controls for customized ranking than the simple (condition,
        # boost) combination above.
        # Corresponds to the JSON property `boostControlSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpecConditionBoostSpecBoostControlSpec]
        attr_accessor :boost_control_spec
      
        # An expression which specifies a boost condition. The syntax and supported
        # fields are the same as a filter expression. See SearchRequest.filter for
        # detail syntax and limitations. Examples: * To boost documents with document ID
        # "doc_1" or "doc_2", and color "Red" or "Blue": `(document_id: ANY("doc_1", "
        # doc_2")) AND (color: ANY("Red", "Blue"))`
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @boost_control_spec = args[:boost_control_spec] if args.key?(:boost_control_spec)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # Specification for custom ranking based on customer specified attribute value.
      # It provides more controls for customized ranking than the simple (condition,
      # boost) combination above.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpecConditionBoostSpecBoostControlSpec
        include Google::Apis::Core::Hashable
      
        # The attribute type to be used to determine the boost amount. The attribute
        # value can be derived from the field value of the specified field_name. In the
        # case of numerical it is straightforward i.e. attribute_value =
        # numerical_field_value. In the case of freshness however, attribute_value = (
        # time.now() - datetime_field_value).
        # Corresponds to the JSON property `attributeType`
        # @return [String]
        attr_accessor :attribute_type
      
        # The control points used to define the curve. The monotonic function (defined
        # through the interpolation_type above) passes through the control points listed
        # here.
        # Corresponds to the JSON property `controlPoints`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpecConditionBoostSpecBoostControlSpecControlPoint>]
        attr_accessor :control_points
      
        # The name of the field whose value will be used to determine the boost amount.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # The interpolation type to be applied to connect the control points listed
        # below.
        # Corresponds to the JSON property `interpolationType`
        # @return [String]
        attr_accessor :interpolation_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_type = args[:attribute_type] if args.key?(:attribute_type)
          @control_points = args[:control_points] if args.key?(:control_points)
          @field_name = args[:field_name] if args.key?(:field_name)
          @interpolation_type = args[:interpolation_type] if args.key?(:interpolation_type)
        end
      end
      
      # The control points used to define the curve. The curve defined through these
      # control points can only be monotonically increasing or decreasing(constant
      # values are acceptable).
      class GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpecConditionBoostSpecBoostControlSpecControlPoint
        include Google::Apis::Core::Hashable
      
        # Can be one of: 1. The numerical field value. 2. The duration spec for
        # freshness: The value must be formatted as an XSD `dayTimeDuration` value (a
        # restricted subset of an ISO 8601 duration value). The pattern for this is: `
        # nDnM]`.
        # Corresponds to the JSON property `attributeValue`
        # @return [String]
        attr_accessor :attribute_value
      
        # The value between -1 to 1 by which to boost the score if the attribute_value
        # evaluates to the value specified above.
        # Corresponds to the JSON property `boostAmount`
        # @return [Float]
        attr_accessor :boost_amount
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_value = args[:attribute_value] if args.key?(:attribute_value)
          @boost_amount = args[:boost_amount] if args.key?(:boost_amount)
        end
      end
      
      # A specification for configuring the behavior of content search.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpec
        include Google::Apis::Core::Hashable
      
        # Specifies the chunk spec to be returned from the search response. Only
        # available if the SearchRequest.ContentSearchSpec.search_result_mode is set to
        # CHUNKS
        # Corresponds to the JSON property `chunkSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecChunkSpec]
        attr_accessor :chunk_spec
      
        # A specification for configuring the extractive content in a search response.
        # Corresponds to the JSON property `extractiveContentSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecExtractiveContentSpec]
        attr_accessor :extractive_content_spec
      
        # Specifies the search result mode. If unspecified, the search result mode
        # defaults to `DOCUMENTS`.
        # Corresponds to the JSON property `searchResultMode`
        # @return [String]
        attr_accessor :search_result_mode
      
        # A specification for configuring snippets in a search response.
        # Corresponds to the JSON property `snippetSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSnippetSpec]
        attr_accessor :snippet_spec
      
        # A specification for configuring a summary returned in a search response.
        # Corresponds to the JSON property `summarySpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSummarySpec]
        attr_accessor :summary_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_spec = args[:chunk_spec] if args.key?(:chunk_spec)
          @extractive_content_spec = args[:extractive_content_spec] if args.key?(:extractive_content_spec)
          @search_result_mode = args[:search_result_mode] if args.key?(:search_result_mode)
          @snippet_spec = args[:snippet_spec] if args.key?(:snippet_spec)
          @summary_spec = args[:summary_spec] if args.key?(:summary_spec)
        end
      end
      
      # Specifies the chunk spec to be returned from the search response. Only
      # available if the SearchRequest.ContentSearchSpec.search_result_mode is set to
      # CHUNKS
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecChunkSpec
        include Google::Apis::Core::Hashable
      
        # The number of next chunks to be returned of the current chunk. The maximum
        # allowed value is 3. If not specified, no next chunks will be returned.
        # Corresponds to the JSON property `numNextChunks`
        # @return [Fixnum]
        attr_accessor :num_next_chunks
      
        # The number of previous chunks to be returned of the current chunk. The maximum
        # allowed value is 3. If not specified, no previous chunks will be returned.
        # Corresponds to the JSON property `numPreviousChunks`
        # @return [Fixnum]
        attr_accessor :num_previous_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_next_chunks = args[:num_next_chunks] if args.key?(:num_next_chunks)
          @num_previous_chunks = args[:num_previous_chunks] if args.key?(:num_previous_chunks)
        end
      end
      
      # A specification for configuring the extractive content in a search response.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecExtractiveContentSpec
        include Google::Apis::Core::Hashable
      
        # The maximum number of extractive answers returned in each search result. An
        # extractive answer is a verbatim answer extracted from the original document,
        # which provides a precise and contextually relevant answer to the search query.
        # If the number of matching answers is less than the `
        # max_extractive_answer_count`, return all of the answers. Otherwise, return the
        # `max_extractive_answer_count`. At most five answers are returned for each
        # SearchResult.
        # Corresponds to the JSON property `maxExtractiveAnswerCount`
        # @return [Fixnum]
        attr_accessor :max_extractive_answer_count
      
        # The max number of extractive segments returned in each search result. Only
        # applied if the DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED or
        # DataStore.solution_types is SOLUTION_TYPE_CHAT. An extractive segment is a
        # text segment extracted from the original document that is relevant to the
        # search query, and, in general, more verbose than an extractive answer. The
        # segment could then be used as input for LLMs to generate summaries and answers.
        # If the number of matching segments is less than `max_extractive_segment_count`
        # , return all of the segments. Otherwise, return the `
        # max_extractive_segment_count`.
        # Corresponds to the JSON property `maxExtractiveSegmentCount`
        # @return [Fixnum]
        attr_accessor :max_extractive_segment_count
      
        # Return at most `num_next_segments` segments after each selected segments.
        # Corresponds to the JSON property `numNextSegments`
        # @return [Fixnum]
        attr_accessor :num_next_segments
      
        # Specifies whether to also include the adjacent from each selected segments.
        # Return at most `num_previous_segments` segments before each selected segments.
        # Corresponds to the JSON property `numPreviousSegments`
        # @return [Fixnum]
        attr_accessor :num_previous_segments
      
        # Specifies whether to return the confidence score from the extractive segments
        # in each search result. This feature is available only for new or allowlisted
        # data stores. To allowlist your data store, contact your Customer Engineer. The
        # default value is `false`.
        # Corresponds to the JSON property `returnExtractiveSegmentScore`
        # @return [Boolean]
        attr_accessor :return_extractive_segment_score
        alias_method :return_extractive_segment_score?, :return_extractive_segment_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_extractive_answer_count = args[:max_extractive_answer_count] if args.key?(:max_extractive_answer_count)
          @max_extractive_segment_count = args[:max_extractive_segment_count] if args.key?(:max_extractive_segment_count)
          @num_next_segments = args[:num_next_segments] if args.key?(:num_next_segments)
          @num_previous_segments = args[:num_previous_segments] if args.key?(:num_previous_segments)
          @return_extractive_segment_score = args[:return_extractive_segment_score] if args.key?(:return_extractive_segment_score)
        end
      end
      
      # A specification for configuring snippets in a search response.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSnippetSpec
        include Google::Apis::Core::Hashable
      
        # [DEPRECATED] This field is deprecated. To control snippet return, use `
        # return_snippet` field. For backwards compatibility, we will return snippet if
        # max_snippet_count > 0.
        # Corresponds to the JSON property `maxSnippetCount`
        # @return [Fixnum]
        attr_accessor :max_snippet_count
      
        # [DEPRECATED] This field is deprecated and will have no affect on the snippet.
        # Corresponds to the JSON property `referenceOnly`
        # @return [Boolean]
        attr_accessor :reference_only
        alias_method :reference_only?, :reference_only
      
        # If `true`, then return snippet. If no snippet can be generated, we return "No
        # snippet is available for this page." A `snippet_status` with `SUCCESS` or `
        # NO_SNIPPET_AVAILABLE` will also be returned.
        # Corresponds to the JSON property `returnSnippet`
        # @return [Boolean]
        attr_accessor :return_snippet
        alias_method :return_snippet?, :return_snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_snippet_count = args[:max_snippet_count] if args.key?(:max_snippet_count)
          @reference_only = args[:reference_only] if args.key?(:reference_only)
          @return_snippet = args[:return_snippet] if args.key?(:return_snippet)
        end
      end
      
      # A specification for configuring a summary returned in a search response.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSummarySpec
        include Google::Apis::Core::Hashable
      
        # Specifies whether to filter out adversarial queries. The default value is `
        # false`. Google employs search-query classification to detect adversarial
        # queries. No summary is returned if the search query is classified as an
        # adversarial query. For example, a user might ask a question regarding negative
        # comments about the company or submit a query designed to generate unsafe,
        # policy-violating output. If this field is set to `true`, we skip generating
        # summaries for adversarial queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreAdversarialQuery`
        # @return [Boolean]
        attr_accessor :ignore_adversarial_query
        alias_method :ignore_adversarial_query?, :ignore_adversarial_query
      
        # Optional. Specifies whether to filter out jail-breaking queries. The default
        # value is `false`. Google employs search-query classification to detect jail-
        # breaking queries. No summary is returned if the search query is classified as
        # a jail-breaking query. A user might add instructions to the query to change
        # the tone, style, language, content of the answer, or ask the model to act as a
        # different entity, e.g. "Reply in the tone of a competing company's CEO". If
        # this field is set to `true`, we skip generating summaries for jail-breaking
        # queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreJailBreakingQuery`
        # @return [Boolean]
        attr_accessor :ignore_jail_breaking_query
        alias_method :ignore_jail_breaking_query?, :ignore_jail_breaking_query
      
        # Specifies whether to filter out queries that have low relevance. The default
        # value is `false`. If this field is set to `false`, all search results are used
        # regardless of relevance to generate answers. If set to `true`, only queries
        # with high relevance search results will generate answers.
        # Corresponds to the JSON property `ignoreLowRelevantContent`
        # @return [Boolean]
        attr_accessor :ignore_low_relevant_content
        alias_method :ignore_low_relevant_content?, :ignore_low_relevant_content
      
        # Specifies whether to filter out queries that are not summary-seeking. The
        # default value is `false`. Google employs search-query classification to detect
        # summary-seeking queries. No summary is returned if the search query is
        # classified as a non-summary seeking query. For example, `why is the sky blue`
        # and `Who is the best soccer player in the world?` are summary-seeking queries,
        # but `SFO airport` and `world cup 2026` are not. They are most likely
        # navigational queries. If this field is set to `true`, we skip generating
        # summaries for non-summary seeking queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreNonSummarySeekingQuery`
        # @return [Boolean]
        attr_accessor :ignore_non_summary_seeking_query
        alias_method :ignore_non_summary_seeking_query?, :ignore_non_summary_seeking_query
      
        # Specifies whether to include citations in the summary. The default value is `
        # false`. When this field is set to `true`, summaries include in-line citation
        # numbers. Example summary including citations: BigQuery is Google Cloud's fully
        # managed and completely serverless enterprise data warehouse [1]. BigQuery
        # supports all data types, works across clouds, and has built-in machine
        # learning and business intelligence, all within a unified platform [2, 3]. The
        # citation numbers refer to the returned search results and are 1-indexed. For
        # example, [1] means that the sentence is attributed to the first search result.
        # [2, 3] means that the sentence is attributed to both the second and third
        # search results.
        # Corresponds to the JSON property `includeCitations`
        # @return [Boolean]
        attr_accessor :include_citations
        alias_method :include_citations?, :include_citations
      
        # Language code for Summary. Use language tags defined by [BCP47](https://www.
        # rfc-editor.org/rfc/bcp/bcp47.txt). Note: This is an experimental feature.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Specification of the prompt to use with the model.
        # Corresponds to the JSON property `modelPromptSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSummarySpecModelPromptSpec]
        attr_accessor :model_prompt_spec
      
        # Specification of the model.
        # Corresponds to the JSON property `modelSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSummarySpecModelSpec]
        attr_accessor :model_spec
      
        # The number of top results to generate the summary from. If the number of
        # results returned is less than `summaryResultCount`, the summary is generated
        # from all of the results. At most 10 results for documents mode, or 50 for
        # chunks mode, can be used to generate a summary. The chunks mode is used when
        # SearchRequest.ContentSearchSpec.search_result_mode is set to CHUNKS.
        # Corresponds to the JSON property `summaryResultCount`
        # @return [Fixnum]
        attr_accessor :summary_result_count
      
        # If true, answer will be generated from most relevant chunks from top search
        # results. This feature will improve summary quality. Note that with this
        # feature enabled, not all top search results will be referenced and included in
        # the reference list, so the citation source index only points to the search
        # results listed in the reference list.
        # Corresponds to the JSON property `useSemanticChunks`
        # @return [Boolean]
        attr_accessor :use_semantic_chunks
        alias_method :use_semantic_chunks?, :use_semantic_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_adversarial_query = args[:ignore_adversarial_query] if args.key?(:ignore_adversarial_query)
          @ignore_jail_breaking_query = args[:ignore_jail_breaking_query] if args.key?(:ignore_jail_breaking_query)
          @ignore_low_relevant_content = args[:ignore_low_relevant_content] if args.key?(:ignore_low_relevant_content)
          @ignore_non_summary_seeking_query = args[:ignore_non_summary_seeking_query] if args.key?(:ignore_non_summary_seeking_query)
          @include_citations = args[:include_citations] if args.key?(:include_citations)
          @language_code = args[:language_code] if args.key?(:language_code)
          @model_prompt_spec = args[:model_prompt_spec] if args.key?(:model_prompt_spec)
          @model_spec = args[:model_spec] if args.key?(:model_spec)
          @summary_result_count = args[:summary_result_count] if args.key?(:summary_result_count)
          @use_semantic_chunks = args[:use_semantic_chunks] if args.key?(:use_semantic_chunks)
        end
      end
      
      # Specification of the prompt to use with the model.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSummarySpecModelPromptSpec
        include Google::Apis::Core::Hashable
      
        # Text at the beginning of the prompt that instructs the assistant. Examples are
        # available in the user guide.
        # Corresponds to the JSON property `preamble`
        # @return [String]
        attr_accessor :preamble
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @preamble = args[:preamble] if args.key?(:preamble)
        end
      end
      
      # Specification of the model.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestContentSearchSpecSummarySpecModelSpec
        include Google::Apis::Core::Hashable
      
        # The model version used to generate the summary. Supported values are: * `
        # stable`: string. Default value when no value is specified. Uses a generally
        # available, fine-tuned model. For more information, see [Answer generation
        # model versions and lifecycle](https://cloud.google.com/generative-ai-app-
        # builder/docs/answer-generation-models). * `preview`: string. (Public preview)
        # Uses a preview model. For more information, see [Answer generation model
        # versions and lifecycle](https://cloud.google.com/generative-ai-app-builder/
        # docs/answer-generation-models).
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A struct to define data stores to filter on in a search call and
      # configurations for those data stores. Otherwise, an `INVALID_ARGUMENT` error
      # is returned.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestDataStoreSpec
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # Required. Full resource name of DataStore, such as `projects/`project`/
        # locations/`location`/collections/`collection_id`/dataStores/`data_store_id``.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Optional. Filter specification to filter documents in the data store specified
        # by data_store field. For more information on filtering, see [Filtering](https:/
        # /cloud.google.com/generative-ai-app-builder/docs/filter-search-metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # The specification that uses customized query embedding vector to do semantic
      # document retrieval.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestEmbeddingSpec
        include Google::Apis::Core::Hashable
      
        # The embedding vector used for retrieval. Limit to 1.
        # Corresponds to the JSON property `embeddingVectors`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestEmbeddingSpecEmbeddingVector>]
        attr_accessor :embedding_vectors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embedding_vectors = args[:embedding_vectors] if args.key?(:embedding_vectors)
        end
      end
      
      # Embedding vector.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestEmbeddingSpecEmbeddingVector
        include Google::Apis::Core::Hashable
      
        # Embedding field path in schema.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # Query embedding vector.
        # Corresponds to the JSON property `vector`
        # @return [Array<Float>]
        attr_accessor :vector
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_path = args[:field_path] if args.key?(:field_path)
          @vector = args[:vector] if args.key?(:vector)
        end
      end
      
      # A facet specification to perform faceted search.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestFacetSpec
        include Google::Apis::Core::Hashable
      
        # Enables dynamic position for this facet. If set to true, the position of this
        # facet among all facets in the response is determined automatically. If dynamic
        # facets are enabled, it is ordered together. If set to false, the position of
        # this facet in the response is the same as in the request, and it is ranked
        # before the facets with dynamic position enable and all dynamic facets. For
        # example, you may always want to have rating facet returned in the response,
        # but it's not necessarily to always display the rating facet at the top. In
        # that case, you can set enable_dynamic_position to true so that the position of
        # rating facet in response is determined automatically. Another example,
        # assuming you have the following facets in the request: * "rating",
        # enable_dynamic_position = true * "price", enable_dynamic_position = false * "
        # brands", enable_dynamic_position = false And also you have a dynamic facets
        # enabled, which generates a facet `gender`. Then the final order of the facets
        # in the response can be ("price", "brands", "rating", "gender") or ("price", "
        # brands", "gender", "rating") depends on how API orders "gender" and "rating"
        # facets. However, notice that "price" and "brands" are always ranked at first
        # and second position because their enable_dynamic_position is false.
        # Corresponds to the JSON property `enableDynamicPosition`
        # @return [Boolean]
        attr_accessor :enable_dynamic_position
        alias_method :enable_dynamic_position?, :enable_dynamic_position
      
        # List of keys to exclude when faceting. By default, FacetKey.key is not
        # excluded from the filter unless it is listed in this field. Listing a facet
        # key in this field allows its values to appear as facet results, even when they
        # are filtered out of search results. Using this field does not affect what
        # search results are returned. For example, suppose there are 100 documents with
        # the color facet "Red" and 200 documents with the color facet "Blue". A query
        # containing the filter "color:ANY("Red")" and having "color" as FacetKey.key
        # would by default return only "Red" documents in the search results, and also
        # return "Red" with count 100 as the only color facet. Although there are also
        # blue documents available, "Blue" would not be shown as an available facet
        # value. If "color" is listed in "excludedFilterKeys", then the query returns
        # the facet values "Red" with count 100 and "Blue" with count 200, because the "
        # color" key is now excluded from the filter. Because this field doesn't affect
        # search results, the search results are still correctly filtered to return only
        # "Red" documents. A maximum of 100 values are allowed. Otherwise, an `
        # INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `excludedFilterKeys`
        # @return [Array<String>]
        attr_accessor :excluded_filter_keys
      
        # Specifies how a facet is computed.
        # Corresponds to the JSON property `facetKey`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSearchRequestFacetSpecFacetKey]
        attr_accessor :facet_key
      
        # Maximum facet values that are returned for this facet. If unspecified,
        # defaults to 20. The maximum allowed value is 300. Values above 300 are coerced
        # to 300. For aggregation in healthcare search, when the [FacetKey.key] is "
        # healthcare_aggregation_key", the limit will be overridden to 10,000 internally,
        # regardless of the value set here. If this field is negative, an `
        # INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_dynamic_position = args[:enable_dynamic_position] if args.key?(:enable_dynamic_position)
          @excluded_filter_keys = args[:excluded_filter_keys] if args.key?(:excluded_filter_keys)
          @facet_key = args[:facet_key] if args.key?(:facet_key)
          @limit = args[:limit] if args.key?(:limit)
        end
      end
      
      # Specifies how a facet is computed.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestFacetSpecFacetKey
        include Google::Apis::Core::Hashable
      
        # True to make facet keys case insensitive when getting faceting values with
        # prefixes or contains; false otherwise.
        # Corresponds to the JSON property `caseInsensitive`
        # @return [Boolean]
        attr_accessor :case_insensitive
        alias_method :case_insensitive?, :case_insensitive
      
        # Only get facet values that contain the given strings. For example, suppose "
        # category" has three values "Action > 2022", "Action > 2021" and "Sci-Fi > 2022"
        # . If set "contains" to "2022", the "category" facet only contains "Action >
        # 2022" and "Sci-Fi > 2022". Only supported on textual fields. Maximum is 10.
        # Corresponds to the JSON property `contains`
        # @return [Array<String>]
        attr_accessor :contains
      
        # Set only if values should be bucketed into intervals. Must be set for facets
        # with numerical values. Must not be set for facet with text values. Maximum
        # number of intervals is 30.
        # Corresponds to the JSON property `intervals`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaInterval>]
        attr_accessor :intervals
      
        # Required. Supported textual and numerical facet keys in Document object, over
        # which the facet values are computed. Facet key is case-sensitive.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The order in which documents are returned. Allowed values are: * "count desc",
        # which means order by SearchResponse.Facet.values.count descending. * "value
        # desc", which means order by SearchResponse.Facet.values.value descending. Only
        # applies to textual facets. If not set, textual values are sorted in [natural
        # order](https://en.wikipedia.org/wiki/Natural_sort_order); numerical intervals
        # are sorted in the order given by FacetSpec.FacetKey.intervals.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Only get facet values that start with the given string prefix. For example,
        # suppose "category" has three values "Action > 2022", "Action > 2021" and "Sci-
        # Fi > 2022". If set "prefixes" to "Action", the "category" facet only contains "
        # Action > 2022" and "Action > 2021". Only supported on textual fields. Maximum
        # is 10.
        # Corresponds to the JSON property `prefixes`
        # @return [Array<String>]
        attr_accessor :prefixes
      
        # Only get facet for the given restricted values. Only supported on textual
        # fields. For example, suppose "category" has three values "Action > 2022", "
        # Action > 2021" and "Sci-Fi > 2022". If set "restricted_values" to "Action >
        # 2022", the "category" facet only contains "Action > 2022". Only supported on
        # textual fields. Maximum is 10.
        # Corresponds to the JSON property `restrictedValues`
        # @return [Array<String>]
        attr_accessor :restricted_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_insensitive = args[:case_insensitive] if args.key?(:case_insensitive)
          @contains = args[:contains] if args.key?(:contains)
          @intervals = args[:intervals] if args.key?(:intervals)
          @key = args[:key] if args.key?(:key)
          @order_by = args[:order_by] if args.key?(:order_by)
          @prefixes = args[:prefixes] if args.key?(:prefixes)
          @restricted_values = args[:restricted_values] if args.key?(:restricted_values)
        end
      end
      
      # Specifies the image query input.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestImageQuery
        include Google::Apis::Core::Hashable
      
        # Base64 encoded image bytes. Supported image formats: JPEG, PNG, and BMP.
        # Corresponds to the JSON property `imageBytes`
        # @return [String]
        attr_accessor :image_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_bytes = args[:image_bytes] if args.key?(:image_bytes)
        end
      end
      
      # Specification to enable natural language understanding capabilities for search
      # requests.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestNaturalLanguageQueryUnderstandingSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which filter extraction should occur. Default to Condition.
        # DISABLED.
        # Corresponds to the JSON property `filterExtractionCondition`
        # @return [String]
        attr_accessor :filter_extraction_condition
      
        # Field names used for location-based filtering, where geolocation filters are
        # detected in natural language search queries. Only valid when the
        # FilterExtractionCondition is set to `ENABLED`. If this field is set, it
        # overrides the field names set in ServingConfig.
        # geo_search_query_detection_field_names.
        # Corresponds to the JSON property `geoSearchQueryDetectionFieldNames`
        # @return [Array<String>]
        attr_accessor :geo_search_query_detection_field_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter_extraction_condition = args[:filter_extraction_condition] if args.key?(:filter_extraction_condition)
          @geo_search_query_detection_field_names = args[:geo_search_query_detection_field_names] if args.key?(:geo_search_query_detection_field_names)
        end
      end
      
      # The specification for personalization.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestPersonalizationSpec
        include Google::Apis::Core::Hashable
      
        # The personalization mode of the search request. Defaults to Mode.AUTO.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Specification to determine under which conditions query expansion should occur.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestQueryExpansionSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which query expansion should occur. Default to Condition.
        # DISABLED.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        # Whether to pin unexpanded results. If this field is set to true, unexpanded
        # products are always at the top of the search results, followed by the expanded
        # results.
        # Corresponds to the JSON property `pinUnexpandedResults`
        # @return [Boolean]
        attr_accessor :pin_unexpanded_results
        alias_method :pin_unexpanded_results?, :pin_unexpanded_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @pin_unexpanded_results = args[:pin_unexpanded_results] if args.key?(:pin_unexpanded_results)
        end
      end
      
      # Specification for search as you type in search requests.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestSearchAsYouTypeSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which search as you type should occur. Default to
        # Condition.DISABLED.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # Session specification. Multi-turn Search feature is currently at private GA
      # stage. Please use v1alpha or v1beta version instead before we launch this
      # feature to public GA. Or ask for allowlisting through Google Support team.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestSessionSpec
        include Google::Apis::Core::Hashable
      
        # If set, the search result gets stored to the "turn" specified by this query ID.
        # Example: Let's say the session looks like this: session ` name: ".../sessions/
        # xxx" turns ` query ` text: "What is foo?" query_id: ".../questions/yyy" `
        # answer: "Foo is ..." ` turns ` query ` text: "How about bar then?" query_id: ".
        # ../questions/zzz" ` ` ` The user can call /search API with a request like this:
        # session: ".../sessions/xxx" session_spec ` query_id: ".../questions/zzz" `
        # Then, the API stores the search result, associated with the last turn. The
        # stored search result can be used by a subsequent /answer API call (with the
        # session ID and the query ID specified). Also, it is possible to call /search
        # and /answer in parallel with the same session ID & query ID.
        # Corresponds to the JSON property `queryId`
        # @return [String]
        attr_accessor :query_id
      
        # The number of top search results to persist. The persisted search results can
        # be used for the subsequent /answer api call. This field is simliar to the `
        # summary_result_count` field in SearchRequest.ContentSearchSpec.SummarySpec.
        # summary_result_count. At most 10 results for documents mode, or 50 for chunks
        # mode.
        # Corresponds to the JSON property `searchResultPersistenceCount`
        # @return [Fixnum]
        attr_accessor :search_result_persistence_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_id = args[:query_id] if args.key?(:query_id)
          @search_result_persistence_count = args[:search_result_persistence_count] if args.key?(:search_result_persistence_count)
        end
      end
      
      # The specification for query spell correction.
      class GoogleCloudDiscoveryengineV1alphaSearchRequestSpellCorrectionSpec
        include Google::Apis::Core::Hashable
      
        # The mode under which spell correction replaces the original search query.
        # Defaults to Mode.AUTO.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # External session proto definition.
      class GoogleCloudDiscoveryengineV1alphaSession
        include Google::Apis::Core::Hashable
      
        # Optional. The display name of the session. This field is used to identify the
        # session in the UI. By default, the display name is the first turn query text
        # in the session.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. The time the session finished.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional. Whether the session is pinned, pinned session will be displayed on
        # the top of the session list.
        # Corresponds to the JSON property `isPinned`
        # @return [Boolean]
        attr_accessor :is_pinned
        alias_method :is_pinned?, :is_pinned
      
        # Immutable. Fully qualified name `projects/`project`/locations/global/
        # collections/`collection`/engines/`engine`/sessions/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time the session started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The state of the session.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Turns.
        # Corresponds to the JSON property `turns`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSessionTurn>]
        attr_accessor :turns
      
        # A unique identifier for tracking users.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @end_time = args[:end_time] if args.key?(:end_time)
          @is_pinned = args[:is_pinned] if args.key?(:is_pinned)
          @name = args[:name] if args.key?(:name)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @turns = args[:turns] if args.key?(:turns)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Represents a turn, including a query from the user and a answer from service.
      class GoogleCloudDiscoveryengineV1alphaSessionTurn
        include Google::Apis::Core::Hashable
      
        # The resource name of the answer to the user query. Only set if the answer
        # generation (/answer API call) happened in this turn.
        # Corresponds to the JSON property `answer`
        # @return [String]
        attr_accessor :answer
      
        # Defines an answer.
        # Corresponds to the JSON property `detailedAnswer`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaAnswer]
        attr_accessor :detailed_answer
      
        # Defines a user inputed query.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaQuery]
        attr_accessor :query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @answer = args[:answer] if args.key?(:answer)
          @detailed_answer = args[:detailed_answer] if args.key?(:detailed_answer)
          @query = args[:query] if args.key?(:query)
        end
      end
      
      # Metadata for DataConnectorService.SetUpDataConnector method.
      class GoogleCloudDiscoveryengineV1alphaSetUpDataConnectorMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # SetUriPatternDocumentData operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaSetUriPatternDocumentDataMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.SetUriPatternDocumentData method.
      class GoogleCloudDiscoveryengineV1alphaSetUriPatternDocumentDataResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata for single-regional CMEKs.
      class GoogleCloudDiscoveryengineV1alphaSingleRegionKey
        include Google::Apis::Core::Hashable
      
        # Required. Single-regional kms key resource name which will be used to encrypt
        # resources `projects/`project`/locations/`location`/keyRings/`keyRing`/
        # cryptoKeys/`keyId``.
        # Corresponds to the JSON property `kmsKey`
        # @return [String]
        attr_accessor :kms_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kms_key = args[:kms_key] if args.key?(:kms_key)
        end
      end
      
      # Verification information for target sites in advanced site search.
      class GoogleCloudDiscoveryengineV1alphaSiteVerificationInfo
        include Google::Apis::Core::Hashable
      
        # Site verification state indicating the ownership and validity.
        # Corresponds to the JSON property `siteVerificationState`
        # @return [String]
        attr_accessor :site_verification_state
      
        # Latest site verification time.
        # Corresponds to the JSON property `verifyTime`
        # @return [String]
        attr_accessor :verify_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @site_verification_state = args[:site_verification_state] if args.key?(:site_verification_state)
          @verify_time = args[:verify_time] if args.key?(:verify_time)
        end
      end
      
      # A sitemap for the SiteSearchEngine.
      class GoogleCloudDiscoveryengineV1alphaSitemap
        include Google::Apis::Core::Hashable
      
        # Output only. The sitemap's creation time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The fully qualified resource name of the sitemap. `projects/*/
        # locations/*/collections/*/dataStores/*/siteSearchEngine/sitemaps/*` The `
        # sitemap_id` suffix is system-generated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Public URI for the sitemap, e.g. `www.example.com/sitemap.xml`.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # A target site for the SiteSearchEngine.
      class GoogleCloudDiscoveryengineV1alphaTargetSite
        include Google::Apis::Core::Hashable
      
        # Input only. If set to false, a uri_pattern is generated to include all pages
        # whose address contains the provided_uri_pattern. If set to true, an
        # uri_pattern is generated to try to be an exact match of the
        # provided_uri_pattern or just the specific page if the provided_uri_pattern is
        # a specific one. provided_uri_pattern is always normalized to generate the URI
        # pattern to be used by the search engine.
        # Corresponds to the JSON property `exactMatch`
        # @return [Boolean]
        attr_accessor :exact_match
        alias_method :exact_match?, :exact_match
      
        # Site search indexing failure reasons.
        # Corresponds to the JSON property `failureReason`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaTargetSiteFailureReason]
        attr_accessor :failure_reason
      
        # Output only. This is system-generated based on the provided_uri_pattern.
        # Corresponds to the JSON property `generatedUriPattern`
        # @return [String]
        attr_accessor :generated_uri_pattern
      
        # Output only. Indexing status.
        # Corresponds to the JSON property `indexingStatus`
        # @return [String]
        attr_accessor :indexing_status
      
        # Output only. The fully qualified resource name of the target site. `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # siteSearchEngine/targetSites/`target_site`` The `target_site_id` is system-
        # generated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. Input only. The user provided URI pattern from which the `
        # generated_uri_pattern` is generated.
        # Corresponds to the JSON property `providedUriPattern`
        # @return [String]
        attr_accessor :provided_uri_pattern
      
        # Output only. Root domain of the provided_uri_pattern.
        # Corresponds to the JSON property `rootDomainUri`
        # @return [String]
        attr_accessor :root_domain_uri
      
        # Verification information for target sites in advanced site search.
        # Corresponds to the JSON property `siteVerificationInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSiteVerificationInfo]
        attr_accessor :site_verification_info
      
        # The type of the target site, e.g., whether the site is to be included or
        # excluded.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Output only. The target site's last updated time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exact_match = args[:exact_match] if args.key?(:exact_match)
          @failure_reason = args[:failure_reason] if args.key?(:failure_reason)
          @generated_uri_pattern = args[:generated_uri_pattern] if args.key?(:generated_uri_pattern)
          @indexing_status = args[:indexing_status] if args.key?(:indexing_status)
          @name = args[:name] if args.key?(:name)
          @provided_uri_pattern = args[:provided_uri_pattern] if args.key?(:provided_uri_pattern)
          @root_domain_uri = args[:root_domain_uri] if args.key?(:root_domain_uri)
          @site_verification_info = args[:site_verification_info] if args.key?(:site_verification_info)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Site search indexing failure reasons.
      class GoogleCloudDiscoveryengineV1alphaTargetSiteFailureReason
        include Google::Apis::Core::Hashable
      
        # Failed due to insufficient quota.
        # Corresponds to the JSON property `quotaFailure`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaTargetSiteFailureReasonQuotaFailure]
        attr_accessor :quota_failure
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quota_failure = args[:quota_failure] if args.key?(:quota_failure)
        end
      end
      
      # Failed due to insufficient quota.
      class GoogleCloudDiscoveryengineV1alphaTargetSiteFailureReasonQuotaFailure
        include Google::Apis::Core::Hashable
      
        # This number is an estimation on how much total quota this project needs to
        # successfully complete indexing.
        # Corresponds to the JSON property `totalRequiredQuota`
        # @return [Fixnum]
        attr_accessor :total_required_quota
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @total_required_quota = args[:total_required_quota] if args.key?(:total_required_quota)
        end
      end
      
      # Metadata related to the progress of the TrainCustomModel operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaTrainCustomModelMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the TrainCustomModelRequest. This message is returned by the
      # google.longrunning.Operations.response field.
      class GoogleCloudDiscoveryengineV1alphaTrainCustomModelResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the data.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # The metrics of the trained model.
        # Corresponds to the JSON property `metrics`
        # @return [Hash<String,Float>]
        attr_accessor :metrics
      
        # Fully qualified name of the CustomTuningModel.
        # Corresponds to the JSON property `modelName`
        # @return [String]
        attr_accessor :model_name
      
        # The trained model status. Possible values are: * **bad-data**: The training
        # data quality is bad. * **no-improvement**: Tuning didn't improve performance.
        # Won't deploy. * **in-progress**: Model training job creation is in progress. *
        # **training**: Model is actively training. * **evaluating**: The model is
        # evaluating trained metrics. * **indexing**: The model trained metrics are
        # indexing. * **ready**: The model is ready for serving.
        # Corresponds to the JSON property `modelStatus`
        # @return [String]
        attr_accessor :model_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @metrics = args[:metrics] if args.key?(:metrics)
          @model_name = args[:model_name] if args.key?(:model_name)
          @model_status = args[:model_status] if args.key?(:model_status)
        end
      end
      
      # Metadata associated with a tune operation.
      class GoogleCloudDiscoveryengineV1alphaTuneEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Required. The resource name of the engine that this tune applies to. Format: `
        # projects/`project`/locations/`location`/collections/`collection_id`/engines/`
        # engine_id``
        # Corresponds to the JSON property `engine`
        # @return [String]
        attr_accessor :engine
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @engine = args[:engine] if args.key?(:engine)
        end
      end
      
      # Response associated with a tune operation.
      class GoogleCloudDiscoveryengineV1alphaTuneEngineResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata related to the progress of the CmekConfigService.UpdateCmekConfig
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaUpdateCmekConfigMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the CollectionService.UpdateCollection
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1alphaUpdateCollectionMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for UpdateSchema LRO.
      class GoogleCloudDiscoveryengineV1alphaUpdateSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request for UpdateSession method.
      class GoogleCloudDiscoveryengineV1alphaUpdateSessionRequest
        include Google::Apis::Core::Hashable
      
        # External session proto definition.
        # Corresponds to the JSON property `session`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1alphaSession]
        attr_accessor :session
      
        # Indicates which fields in the provided Session to update. The following are
        # NOT supported: * Session.name If not set or empty, all supported fields are
        # updated.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @session = args[:session] if args.key?(:session)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # UpdateTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1alphaUpdateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Information of an end user.
      class GoogleCloudDiscoveryengineV1alphaUserInfo
        include Google::Apis::Core::Hashable
      
        # User agent as included in the HTTP header. The field must be a UTF-8 encoded
        # string with a length limit of 1,000 characters. Otherwise, an `
        # INVALID_ARGUMENT` error is returned. This should not be set when using the
        # client side event reporting with GTM or JavaScript tag in UserEventService.
        # CollectUserEvent or if UserEvent.direct_user_request is set.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        # Highly recommended for logged-in users. Unique identifier for logged-in user,
        # such as a user name. Don't set for anonymous users. Always use a hashed value
        # for this ID. Don't set the field to the same fixed ID for different users.
        # This mixes the event history of those users together, which results in
        # degraded model quality. The field must be a UTF-8 encoded string with a length
        # limit of 128 characters. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # Config to store data store type configuration for workspace data
      class GoogleCloudDiscoveryengineV1alphaWorkspaceConfig
        include Google::Apis::Core::Hashable
      
        # Obfuscated Dasher customer ID.
        # Corresponds to the JSON property `dasherCustomerId`
        # @return [String]
        attr_accessor :dasher_customer_id
      
        # Optional. The super admin email address for the workspace that will be used
        # for access token generation. For now we only use it for Native Google Drive
        # connector data ingestion.
        # Corresponds to the JSON property `superAdminEmailAddress`
        # @return [String]
        attr_accessor :super_admin_email_address
      
        # Optional. The super admin service account for the workspace that will be used
        # for access token generation. For now we only use it for Native Google Drive
        # connector data ingestion.
        # Corresponds to the JSON property `superAdminServiceAccount`
        # @return [String]
        attr_accessor :super_admin_service_account
      
        # The Google Workspace data source.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dasher_customer_id = args[:dasher_customer_id] if args.key?(:dasher_customer_id)
          @super_admin_email_address = args[:super_admin_email_address] if args.key?(:super_admin_email_address)
          @super_admin_service_account = args[:super_admin_service_account] if args.key?(:super_admin_service_account)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Configuration data for advance site search.
      class GoogleCloudDiscoveryengineV1betaAdvancedSiteSearchConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # BatchCreateTargetSites operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaBatchCreateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.BatchCreateTargetSites method.
      class GoogleCloudDiscoveryengineV1betaBatchCreateTargetSitesResponse
        include Google::Apis::Core::Hashable
      
        # TargetSites created.
        # Corresponds to the JSON property `targetSites`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaTargetSite>]
        attr_accessor :target_sites
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_sites = args[:target_sites] if args.key?(:target_sites)
        end
      end
      
      # Configurations used to enable CMEK data encryption with Cloud KMS keys.
      class GoogleCloudDiscoveryengineV1betaCmekConfig
        include Google::Apis::Core::Hashable
      
        # Output only. The default CmekConfig for the Customer.
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # Kms key resource name which will be used to encrypt resources `projects/`
        # project`/locations/`location`/keyRings/`keyRing`/cryptoKeys/`keyId``.
        # Corresponds to the JSON property `kmsKey`
        # @return [String]
        attr_accessor :kms_key
      
        # Kms key version resource name which will be used to encrypt resources `/
        # cryptoKeyVersions/`keyVersion``.
        # Corresponds to the JSON property `kmsKeyVersion`
        # @return [String]
        attr_accessor :kms_key_version
      
        # Output only. The timestamp of the last key rotation.
        # Corresponds to the JSON property `lastRotationTimestampMicros`
        # @return [Fixnum]
        attr_accessor :last_rotation_timestamp_micros
      
        # Required. Name of the CmekConfig, of the form `projects/`project`/locations/`
        # location`/cmekConfig` or `projects/`project`/locations/`location`/cmekConfigs/`
        # cmekConfig``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Single-regional CMEKs that are required for some VAIS features.
        # Corresponds to the JSON property `singleRegionKeys`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSingleRegionKey>]
        attr_accessor :single_region_keys
      
        # Output only. State of the CmekConfig.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_default = args[:is_default] if args.key?(:is_default)
          @kms_key = args[:kms_key] if args.key?(:kms_key)
          @kms_key_version = args[:kms_key_version] if args.key?(:kms_key_version)
          @last_rotation_timestamp_micros = args[:last_rotation_timestamp_micros] if args.key?(:last_rotation_timestamp_micros)
          @name = args[:name] if args.key?(:name)
          @single_region_keys = args[:single_region_keys] if args.key?(:single_region_keys)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Defines circumstances to be checked before allowing a behavior
      class GoogleCloudDiscoveryengineV1betaCondition
        include Google::Apis::Core::Hashable
      
        # Range of time(s) specifying when condition is active. Maximum of 10 time
        # ranges.
        # Corresponds to the JSON property `activeTimeRange`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaConditionTimeRange>]
        attr_accessor :active_time_range
      
        # Optional. Query regex to match the whole search query. Cannot be set when
        # Condition.query_terms is set. This is currently supporting promotion use case.
        # Corresponds to the JSON property `queryRegex`
        # @return [String]
        attr_accessor :query_regex
      
        # Search only A list of terms to match the query on. Cannot be set when
        # Condition.query_regex is set. Maximum of 10 query terms.
        # Corresponds to the JSON property `queryTerms`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaConditionQueryTerm>]
        attr_accessor :query_terms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_time_range = args[:active_time_range] if args.key?(:active_time_range)
          @query_regex = args[:query_regex] if args.key?(:query_regex)
          @query_terms = args[:query_terms] if args.key?(:query_terms)
        end
      end
      
      # Matcher for search request query
      class GoogleCloudDiscoveryengineV1betaConditionQueryTerm
        include Google::Apis::Core::Hashable
      
        # Whether the search query needs to exactly match the query term.
        # Corresponds to the JSON property `fullMatch`
        # @return [Boolean]
        attr_accessor :full_match
        alias_method :full_match?, :full_match
      
        # The specific query value to match against Must be lowercase, must be UTF-8.
        # Can have at most 3 space separated terms if full_match is true. Cannot be an
        # empty string. Maximum length of 5000 characters.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_match = args[:full_match] if args.key?(:full_match)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Used for time-dependent conditions.
      class GoogleCloudDiscoveryengineV1betaConditionTimeRange
        include Google::Apis::Core::Hashable
      
        # End of time range. Range is inclusive. Must be in the future.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Start of time range. Range is inclusive.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Defines a conditioned behavior to employ during serving. Must be attached to a
      # ServingConfig to be considered at serving time. Permitted actions dependent on
      # `SolutionType`.
      class GoogleCloudDiscoveryengineV1betaControl
        include Google::Apis::Core::Hashable
      
        # Output only. List of all ServingConfig IDs this control is attached to. May
        # take up to 10 minutes to update after changes.
        # Corresponds to the JSON property `associatedServingConfigIds`
        # @return [Array<String>]
        attr_accessor :associated_serving_config_ids
      
        # Adjusts order of products in returned list.
        # Corresponds to the JSON property `boostAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaControlBoostAction]
        attr_accessor :boost_action
      
        # Determines when the associated action will trigger. Omit to always apply the
        # action. Currently only a single condition may be specified. Otherwise an
        # INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaCondition>]
        attr_accessor :conditions
      
        # Required. Human readable name. The identifier used in UI views. Must be UTF-8
        # encoded string. Length limit is 128 characters. Otherwise an INVALID ARGUMENT
        # error is thrown.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Specified which products may be included in results. Uses same filter as boost.
        # Corresponds to the JSON property `filterAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaControlFilterAction]
        attr_accessor :filter_action
      
        # Immutable. Fully qualified name `projects/*/locations/global/dataStore/*/
        # controls/*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Promote certain links based on some trigger queries. Example: Promote shoe
        # store link when searching for `shoe` keyword. The link can be outside of
        # associated data store.
        # Corresponds to the JSON property `promoteAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaControlPromoteAction]
        attr_accessor :promote_action
      
        # Redirects a shopper to the provided URI.
        # Corresponds to the JSON property `redirectAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaControlRedirectAction]
        attr_accessor :redirect_action
      
        # Required. Immutable. What solution the control belongs to. Must be compatible
        # with vertical of resource. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Creates a set of terms that will act as synonyms of one another. Example: "
        # happy" will also be considered as "glad", "glad" will also be considered as "
        # happy".
        # Corresponds to the JSON property `synonymsAction`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaControlSynonymsAction]
        attr_accessor :synonyms_action
      
        # Specifies the use case for the control. Affects what condition fields can be
        # set. Only applies to SOLUTION_TYPE_SEARCH. Currently only allow one use case
        # per control. Must be set when solution_type is SolutionType.
        # SOLUTION_TYPE_SEARCH.
        # Corresponds to the JSON property `useCases`
        # @return [Array<String>]
        attr_accessor :use_cases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @associated_serving_config_ids = args[:associated_serving_config_ids] if args.key?(:associated_serving_config_ids)
          @boost_action = args[:boost_action] if args.key?(:boost_action)
          @conditions = args[:conditions] if args.key?(:conditions)
          @display_name = args[:display_name] if args.key?(:display_name)
          @filter_action = args[:filter_action] if args.key?(:filter_action)
          @name = args[:name] if args.key?(:name)
          @promote_action = args[:promote_action] if args.key?(:promote_action)
          @redirect_action = args[:redirect_action] if args.key?(:redirect_action)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @synonyms_action = args[:synonyms_action] if args.key?(:synonyms_action)
          @use_cases = args[:use_cases] if args.key?(:use_cases)
        end
      end
      
      # Adjusts order of products in returned list.
      class GoogleCloudDiscoveryengineV1betaControlBoostAction
        include Google::Apis::Core::Hashable
      
        # Required. Strength of the boost, which should be in [-1, 1]. Negative boost
        # means demotion. Default is 0.0 (No-op).
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Required. Specifies which data store's documents can be boosted by this
        # control. Full data store name e.g. projects/123/locations/global/collections/
        # default_collection/dataStores/default_data_store
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Required. Specifies which products to apply the boost to. If no filter is
        # provided all products will be boosted (No-op). Syntax documentation: https://
        # cloud.google.com/retail/docs/filter-and-order Maximum length is 5000
        # characters. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Specified which products may be included in results. Uses same filter as boost.
      class GoogleCloudDiscoveryengineV1betaControlFilterAction
        include Google::Apis::Core::Hashable
      
        # Required. Specifies which data store's documents can be filtered by this
        # control. Full data store name e.g. projects/123/locations/global/collections/
        # default_collection/dataStores/default_data_store
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Required. A filter to apply on the matching condition results. Required Syntax
        # documentation: https://cloud.google.com/retail/docs/filter-and-order Maximum
        # length is 5000 characters. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # Promote certain links based on some trigger queries. Example: Promote shoe
      # store link when searching for `shoe` keyword. The link can be outside of
      # associated data store.
      class GoogleCloudDiscoveryengineV1betaControlPromoteAction
        include Google::Apis::Core::Hashable
      
        # Required. Data store with which this promotion is attached to.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Promotion proto includes uri and other helping information to display the
        # promotion.
        # Corresponds to the JSON property `searchLinkPromotion`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchLinkPromotion]
        attr_accessor :search_link_promotion
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_store = args[:data_store] if args.key?(:data_store)
          @search_link_promotion = args[:search_link_promotion] if args.key?(:search_link_promotion)
        end
      end
      
      # Redirects a shopper to the provided URI.
      class GoogleCloudDiscoveryengineV1betaControlRedirectAction
        include Google::Apis::Core::Hashable
      
        # Required. The URI to which the shopper will be redirected. Required. URI must
        # have length equal or less than 2000 characters. Otherwise an INVALID ARGUMENT
        # error is thrown.
        # Corresponds to the JSON property `redirectUri`
        # @return [String]
        attr_accessor :redirect_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @redirect_uri = args[:redirect_uri] if args.key?(:redirect_uri)
        end
      end
      
      # Creates a set of terms that will act as synonyms of one another. Example: "
      # happy" will also be considered as "glad", "glad" will also be considered as "
      # happy".
      class GoogleCloudDiscoveryengineV1betaControlSynonymsAction
        include Google::Apis::Core::Hashable
      
        # Defines a set of synonyms. Can specify up to 100 synonyms. Must specify at
        # least 2 synonyms. Otherwise an INVALID ARGUMENT error is thrown.
        # Corresponds to the JSON property `synonyms`
        # @return [Array<String>]
        attr_accessor :synonyms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @synonyms = args[:synonyms] if args.key?(:synonyms)
        end
      end
      
      # Metadata related to the progress of the DataStoreService.CreateDataStore
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1betaCreateDataStoreMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the EngineService.CreateEngine operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaCreateEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for EvaluationService.CreateEvaluation method.
      class GoogleCloudDiscoveryengineV1betaCreateEvaluationMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata for Create Schema LRO.
      class GoogleCloudDiscoveryengineV1betaCreateSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.CreateSitemap
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1betaCreateSitemapMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # CreateTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaCreateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # DataStore captures global settings and configs at the DataStore level.
      class GoogleCloudDiscoveryengineV1betaDataStore
        include Google::Apis::Core::Hashable
      
        # Configuration data for advance site search.
        # Corresponds to the JSON property `advancedSiteSearchConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaAdvancedSiteSearchConfig]
        attr_accessor :advanced_site_search_config
      
        # Estimation of data size per data store.
        # Corresponds to the JSON property `billingEstimation`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDataStoreBillingEstimation]
        attr_accessor :billing_estimation
      
        # Configurations used to enable CMEK data encryption with Cloud KMS keys.
        # Corresponds to the JSON property `cmekConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaCmekConfig]
        attr_accessor :cmek_config
      
        # Immutable. The content config of the data store. If this field is unset, the
        # server behavior defaults to ContentConfig.NO_CONTENT.
        # Corresponds to the JSON property `contentConfig`
        # @return [String]
        attr_accessor :content_config
      
        # Output only. Timestamp the DataStore was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The id of the default Schema asscociated to this data store.
        # Corresponds to the JSON property `defaultSchemaId`
        # @return [String]
        attr_accessor :default_schema_id
      
        # Required. The data store display name. This field must be a UTF-8 encoded
        # string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT
        # error is returned.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A singleton resource of DataStore. If it's empty when DataStore is created and
        # DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED, the default
        # parser will default to digital parser.
        # Corresponds to the JSON property `documentProcessingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfig]
        attr_accessor :document_processing_config
      
        # Immutable. The industry vertical that the data store registers.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Optional. If set, this DataStore is an Infobot FAQ DataStore.
        # Corresponds to the JSON property `isInfobotFaqDataStore`
        # @return [Boolean]
        attr_accessor :is_infobot_faq_data_store
        alias_method :is_infobot_faq_data_store?, :is_infobot_faq_data_store
      
        # Input only. The KMS key to be used to protect this DataStore at creation time.
        # Must be set for requests that need to comply with CMEK Org Policy protections.
        # If this field is set and processed successfully, the DataStore will be
        # protected by the KMS key, as indicated in the cmek_config field.
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        # Language info for DataStore.
        # Corresponds to the JSON property `languageInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaLanguageInfo]
        attr_accessor :language_info
      
        # Immutable. The full resource name of the data store. Format: `projects/`
        # project`/locations/`location`/collections/`collection_id`/dataStores/`
        # data_store_id``. This field must be a UTF-8 encoded string with a length limit
        # of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration for Natural Language Query Understanding.
        # Corresponds to the JSON property `naturalLanguageQueryUnderstandingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaNaturalLanguageQueryUnderstandingConfig]
        attr_accessor :natural_language_query_understanding_config
      
        # Stores information regarding the serving configurations at DataStore level.
        # Corresponds to the JSON property `servingConfigDataStore`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDataStoreServingConfigDataStore]
        attr_accessor :serving_config_data_store
      
        # The solutions that the data store enrolls. Available solutions for each
        # industry_vertical: * `MEDIA`: `SOLUTION_TYPE_RECOMMENDATION` and `
        # SOLUTION_TYPE_SEARCH`. * `SITE_SEARCH`: `SOLUTION_TYPE_SEARCH` is
        # automatically enrolled. Other solutions cannot be enrolled.
        # Corresponds to the JSON property `solutionTypes`
        # @return [Array<String>]
        attr_accessor :solution_types
      
        # Defines the structure and layout of a type of document data.
        # Corresponds to the JSON property `startingSchema`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSchema]
        attr_accessor :starting_schema
      
        # Config to store data store type configuration for workspace data
        # Corresponds to the JSON property `workspaceConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaWorkspaceConfig]
        attr_accessor :workspace_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advanced_site_search_config = args[:advanced_site_search_config] if args.key?(:advanced_site_search_config)
          @billing_estimation = args[:billing_estimation] if args.key?(:billing_estimation)
          @cmek_config = args[:cmek_config] if args.key?(:cmek_config)
          @content_config = args[:content_config] if args.key?(:content_config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @default_schema_id = args[:default_schema_id] if args.key?(:default_schema_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @document_processing_config = args[:document_processing_config] if args.key?(:document_processing_config)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @is_infobot_faq_data_store = args[:is_infobot_faq_data_store] if args.key?(:is_infobot_faq_data_store)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
          @language_info = args[:language_info] if args.key?(:language_info)
          @name = args[:name] if args.key?(:name)
          @natural_language_query_understanding_config = args[:natural_language_query_understanding_config] if args.key?(:natural_language_query_understanding_config)
          @serving_config_data_store = args[:serving_config_data_store] if args.key?(:serving_config_data_store)
          @solution_types = args[:solution_types] if args.key?(:solution_types)
          @starting_schema = args[:starting_schema] if args.key?(:starting_schema)
          @workspace_config = args[:workspace_config] if args.key?(:workspace_config)
        end
      end
      
      # Estimation of data size per data store.
      class GoogleCloudDiscoveryengineV1betaDataStoreBillingEstimation
        include Google::Apis::Core::Hashable
      
        # Data size for structured data in terms of bytes.
        # Corresponds to the JSON property `structuredDataSize`
        # @return [Fixnum]
        attr_accessor :structured_data_size
      
        # Last updated timestamp for structured data.
        # Corresponds to the JSON property `structuredDataUpdateTime`
        # @return [String]
        attr_accessor :structured_data_update_time
      
        # Data size for unstructured data in terms of bytes.
        # Corresponds to the JSON property `unstructuredDataSize`
        # @return [Fixnum]
        attr_accessor :unstructured_data_size
      
        # Last updated timestamp for unstructured data.
        # Corresponds to the JSON property `unstructuredDataUpdateTime`
        # @return [String]
        attr_accessor :unstructured_data_update_time
      
        # Data size for websites in terms of bytes.
        # Corresponds to the JSON property `websiteDataSize`
        # @return [Fixnum]
        attr_accessor :website_data_size
      
        # Last updated timestamp for websites.
        # Corresponds to the JSON property `websiteDataUpdateTime`
        # @return [String]
        attr_accessor :website_data_update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @structured_data_size = args[:structured_data_size] if args.key?(:structured_data_size)
          @structured_data_update_time = args[:structured_data_update_time] if args.key?(:structured_data_update_time)
          @unstructured_data_size = args[:unstructured_data_size] if args.key?(:unstructured_data_size)
          @unstructured_data_update_time = args[:unstructured_data_update_time] if args.key?(:unstructured_data_update_time)
          @website_data_size = args[:website_data_size] if args.key?(:website_data_size)
          @website_data_update_time = args[:website_data_update_time] if args.key?(:website_data_update_time)
        end
      end
      
      # Stores information regarding the serving configurations at DataStore level.
      class GoogleCloudDiscoveryengineV1betaDataStoreServingConfigDataStore
        include Google::Apis::Core::Hashable
      
        # If set true, the DataStore will not be available for serving search requests.
        # Corresponds to the JSON property `disabledForServing`
        # @return [Boolean]
        attr_accessor :disabled_for_serving
        alias_method :disabled_for_serving?, :disabled_for_serving
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled_for_serving = args[:disabled_for_serving] if args.key?(:disabled_for_serving)
        end
      end
      
      # Metadata related to the progress of the DataStoreService.DeleteDataStore
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1betaDeleteDataStoreMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the EngineService.DeleteEngine operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaDeleteEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata for DeleteSchema LRO.
      class GoogleCloudDiscoveryengineV1betaDeleteSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.DeleteSitemap
      # operation. This will be returned by the google.longrunning.Operation.metadata
      # field.
      class GoogleCloudDiscoveryengineV1betaDeleteSitemapMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # DeleteTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaDeleteTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # DisableAdvancedSiteSearch operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaDisableAdvancedSiteSearchMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.DisableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1betaDisableAdvancedSiteSearchResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A singleton resource of DataStore. If it's empty when DataStore is created and
      # DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED, the default
      # parser will default to digital parser.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for chunking config.
        # Corresponds to the JSON property `chunkingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigChunkingConfig]
        attr_accessor :chunking_config
      
        # Related configurations applied to a specific type of document parser.
        # Corresponds to the JSON property `defaultParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfig]
        attr_accessor :default_parsing_config
      
        # The full resource name of the Document Processing Config. Format: `projects/*/
        # locations/*/collections/*/dataStores/*/documentProcessingConfig`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Map from file type to override the default parsing configuration based on the
        # file type. Supported keys: * `pdf`: Override parsing config for PDF files,
        # either digital parsing, ocr parsing or layout parsing is supported. * `html`:
        # Override parsing config for HTML files, only digital parsing and layout
        # parsing are supported. * `docx`: Override parsing config for DOCX files, only
        # digital parsing and layout parsing are supported. * `pptx`: Override parsing
        # config for PPTX files, only digital parsing and layout parsing are supported. *
        # `xlsm`: Override parsing config for XLSM files, only digital parsing and
        # layout parsing are supported. * `xlsx`: Override parsing config for XLSX files,
        # only digital parsing and layout parsing are supported.
        # Corresponds to the JSON property `parsingConfigOverrides`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfig>]
        attr_accessor :parsing_config_overrides
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunking_config = args[:chunking_config] if args.key?(:chunking_config)
          @default_parsing_config = args[:default_parsing_config] if args.key?(:default_parsing_config)
          @name = args[:name] if args.key?(:name)
          @parsing_config_overrides = args[:parsing_config_overrides] if args.key?(:parsing_config_overrides)
        end
      end
      
      # Configuration for chunking config.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigChunkingConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for the layout based chunking.
        # Corresponds to the JSON property `layoutBasedChunkingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigChunkingConfigLayoutBasedChunkingConfig]
        attr_accessor :layout_based_chunking_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @layout_based_chunking_config = args[:layout_based_chunking_config] if args.key?(:layout_based_chunking_config)
        end
      end
      
      # Configuration for the layout based chunking.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigChunkingConfigLayoutBasedChunkingConfig
        include Google::Apis::Core::Hashable
      
        # The token size limit for each chunk. Supported values: 100-500 (inclusive).
        # Default value: 500.
        # Corresponds to the JSON property `chunkSize`
        # @return [Fixnum]
        attr_accessor :chunk_size
      
        # Whether to include appending different levels of headings to chunks from the
        # middle of the document to prevent context loss. Default value: False.
        # Corresponds to the JSON property `includeAncestorHeadings`
        # @return [Boolean]
        attr_accessor :include_ancestor_headings
        alias_method :include_ancestor_headings?, :include_ancestor_headings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_size = args[:chunk_size] if args.key?(:chunk_size)
          @include_ancestor_headings = args[:include_ancestor_headings] if args.key?(:include_ancestor_headings)
        end
      end
      
      # Related configurations applied to a specific type of document parser.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfig
        include Google::Apis::Core::Hashable
      
        # The digital parsing configurations for documents.
        # Corresponds to the JSON property `digitalParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfigDigitalParsingConfig]
        attr_accessor :digital_parsing_config
      
        # The layout parsing configurations for documents.
        # Corresponds to the JSON property `layoutParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfigLayoutParsingConfig]
        attr_accessor :layout_parsing_config
      
        # The OCR parsing configurations for documents.
        # Corresponds to the JSON property `ocrParsingConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfigOcrParsingConfig]
        attr_accessor :ocr_parsing_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digital_parsing_config = args[:digital_parsing_config] if args.key?(:digital_parsing_config)
          @layout_parsing_config = args[:layout_parsing_config] if args.key?(:layout_parsing_config)
          @ocr_parsing_config = args[:ocr_parsing_config] if args.key?(:ocr_parsing_config)
        end
      end
      
      # The digital parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfigDigitalParsingConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The layout parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfigLayoutParsingConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The OCR parsing configurations for documents.
      class GoogleCloudDiscoveryengineV1betaDocumentProcessingConfigParsingConfigOcrParsingConfig
        include Google::Apis::Core::Hashable
      
        # [DEPRECATED] This field is deprecated. To use the additional enhanced document
        # elements processing, please switch to `layout_parsing_config`.
        # Corresponds to the JSON property `enhancedDocumentElements`
        # @return [Array<String>]
        attr_accessor :enhanced_document_elements
      
        # If true, will use native text instead of OCR text on pages containing native
        # text.
        # Corresponds to the JSON property `useNativeText`
        # @return [Boolean]
        attr_accessor :use_native_text
        alias_method :use_native_text?, :use_native_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enhanced_document_elements = args[:enhanced_document_elements] if args.key?(:enhanced_document_elements)
          @use_native_text = args[:use_native_text] if args.key?(:use_native_text)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # EnableAdvancedSiteSearch operation. This will be returned by the google.
      # longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaEnableAdvancedSiteSearchMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for SiteSearchEngineService.EnableAdvancedSiteSearch method.
      class GoogleCloudDiscoveryengineV1betaEnableAdvancedSiteSearchResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata that describes the training and serving parameters of an Engine.
      class GoogleCloudDiscoveryengineV1betaEngine
        include Google::Apis::Core::Hashable
      
        # Configurations for a Chat Engine.
        # Corresponds to the JSON property `chatEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEngineChatEngineConfig]
        attr_accessor :chat_engine_config
      
        # Additional information of a Chat Engine. Fields in this message are output
        # only.
        # Corresponds to the JSON property `chatEngineMetadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEngineChatEngineMetadata]
        attr_accessor :chat_engine_metadata
      
        # Common configurations for an Engine.
        # Corresponds to the JSON property `commonConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEngineCommonConfig]
        attr_accessor :common_config
      
        # Output only. Timestamp the Recommendation Engine was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The data stores associated with this engine. For SOLUTION_TYPE_SEARCH and
        # SOLUTION_TYPE_RECOMMENDATION type of engines, they can only associate with at
        # most one data store. If solution_type is SOLUTION_TYPE_CHAT, multiple
        # DataStores in the same Collection can be associated here. Note that when used
        # in CreateEngineRequest, one DataStore id must be provided as the system will
        # use it for necessary initializations.
        # Corresponds to the JSON property `dataStoreIds`
        # @return [Array<String>]
        attr_accessor :data_store_ids
      
        # Optional. Whether to disable analytics for searches performed on this engine.
        # Corresponds to the JSON property `disableAnalytics`
        # @return [Boolean]
        attr_accessor :disable_analytics
        alias_method :disable_analytics?, :disable_analytics
      
        # Required. The display name of the engine. Should be human readable. UTF-8
        # encoded string with limit of 1024 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The industry vertical that the engine registers. The restriction of the Engine
        # industry vertical is based on DataStore: Vertical on Engine has to match
        # vertical of the DataStore linked to the engine.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Immutable. The fully qualified resource name of the engine. This field must be
        # a UTF-8 encoded string with a length limit of 1024 characters. Format: `
        # projects/`project`/locations/`location`/collections/`collection`/engines/`
        # engine`` engine should be 1-63 characters, and valid characters are /a-z0-9*/.
        # Otherwise, an INVALID_ARGUMENT error is returned.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configurations for a Search Engine.
        # Corresponds to the JSON property `searchEngineConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEngineSearchEngineConfig]
        attr_accessor :search_engine_config
      
        # Required. The solutions of the engine.
        # Corresponds to the JSON property `solutionType`
        # @return [String]
        attr_accessor :solution_type
      
        # Output only. Timestamp the Recommendation Engine was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chat_engine_config = args[:chat_engine_config] if args.key?(:chat_engine_config)
          @chat_engine_metadata = args[:chat_engine_metadata] if args.key?(:chat_engine_metadata)
          @common_config = args[:common_config] if args.key?(:common_config)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data_store_ids = args[:data_store_ids] if args.key?(:data_store_ids)
          @disable_analytics = args[:disable_analytics] if args.key?(:disable_analytics)
          @display_name = args[:display_name] if args.key?(:display_name)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @name = args[:name] if args.key?(:name)
          @search_engine_config = args[:search_engine_config] if args.key?(:search_engine_config)
          @solution_type = args[:solution_type] if args.key?(:solution_type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Configurations for a Chat Engine.
      class GoogleCloudDiscoveryengineV1betaEngineChatEngineConfig
        include Google::Apis::Core::Hashable
      
        # Configurations for generating a Dialogflow agent. Note that these
        # configurations are one-time consumed by and passed to Dialogflow service. It
        # means they cannot be retrieved using EngineService.GetEngine or EngineService.
        # ListEngines API after engine creation.
        # Corresponds to the JSON property `agentCreationConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEngineChatEngineConfigAgentCreationConfig]
        attr_accessor :agent_creation_config
      
        # The resource name of an exist Dialogflow agent to link to this Chat Engine.
        # Customers can either provide `agent_creation_config` to create agent or
        # provide an agent name that links the agent with the Chat engine. Format: `
        # projects//locations//agents/`. Note that the `dialogflow_agent_to_link` are
        # one-time consumed by and passed to Dialogflow service. It means they cannot be
        # retrieved using EngineService.GetEngine or EngineService.ListEngines API after
        # engine creation. Use ChatEngineMetadata.dialogflow_agent for actual agent
        # association after Engine is created.
        # Corresponds to the JSON property `dialogflowAgentToLink`
        # @return [String]
        attr_accessor :dialogflow_agent_to_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_creation_config = args[:agent_creation_config] if args.key?(:agent_creation_config)
          @dialogflow_agent_to_link = args[:dialogflow_agent_to_link] if args.key?(:dialogflow_agent_to_link)
        end
      end
      
      # Configurations for generating a Dialogflow agent. Note that these
      # configurations are one-time consumed by and passed to Dialogflow service. It
      # means they cannot be retrieved using EngineService.GetEngine or EngineService.
      # ListEngines API after engine creation.
      class GoogleCloudDiscoveryengineV1betaEngineChatEngineConfigAgentCreationConfig
        include Google::Apis::Core::Hashable
      
        # Name of the company, organization or other entity that the agent represents.
        # Used for knowledge connector LLM prompt and for knowledge search.
        # Corresponds to the JSON property `business`
        # @return [String]
        attr_accessor :business
      
        # Required. The default language of the agent as a language tag. See [Language
        # Support](https://cloud.google.com/dialogflow/docs/reference/language) for a
        # list of the currently supported language codes.
        # Corresponds to the JSON property `defaultLanguageCode`
        # @return [String]
        attr_accessor :default_language_code
      
        # Agent location for Agent creation, supported values: global/us/eu. If not
        # provided, us Engine will create Agent using us-central-1 by default; eu Engine
        # will create Agent using eu-west-1 by default.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Required. The time zone of the agent from the [time zone database](https://www.
        # iana.org/time-zones), e.g., America/New_York, Europe/Paris.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @business = args[:business] if args.key?(:business)
          @default_language_code = args[:default_language_code] if args.key?(:default_language_code)
          @location = args[:location] if args.key?(:location)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # Additional information of a Chat Engine. Fields in this message are output
      # only.
      class GoogleCloudDiscoveryengineV1betaEngineChatEngineMetadata
        include Google::Apis::Core::Hashable
      
        # The resource name of a Dialogflow agent, that this Chat Engine refers to.
        # Format: `projects//locations//agents/`.
        # Corresponds to the JSON property `dialogflowAgent`
        # @return [String]
        attr_accessor :dialogflow_agent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dialogflow_agent = args[:dialogflow_agent] if args.key?(:dialogflow_agent)
        end
      end
      
      # Common configurations for an Engine.
      class GoogleCloudDiscoveryengineV1betaEngineCommonConfig
        include Google::Apis::Core::Hashable
      
        # The name of the company, business or entity that is associated with the engine.
        # Setting this may help improve LLM related features.
        # Corresponds to the JSON property `companyName`
        # @return [String]
        attr_accessor :company_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @company_name = args[:company_name] if args.key?(:company_name)
        end
      end
      
      # Configurations for a Search Engine.
      class GoogleCloudDiscoveryengineV1betaEngineSearchEngineConfig
        include Google::Apis::Core::Hashable
      
        # The add-on that this search engine enables.
        # Corresponds to the JSON property `searchAddOns`
        # @return [Array<String>]
        attr_accessor :search_add_ons
      
        # The search feature tier of this engine. Different tiers might have different
        # pricing. To learn more, check the pricing documentation. Defaults to
        # SearchTier.SEARCH_TIER_STANDARD if not specified.
        # Corresponds to the JSON property `searchTier`
        # @return [String]
        attr_accessor :search_tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @search_add_ons = args[:search_add_ons] if args.key?(:search_add_ons)
          @search_tier = args[:search_tier] if args.key?(:search_tier)
        end
      end
      
      # An evaluation is a single execution (or run) of an evaluation process. It
      # encapsulates the state of the evaluation and the resulting data.
      class GoogleCloudDiscoveryengineV1betaEvaluation
        include Google::Apis::Core::Hashable
      
        # Output only. Timestamp the Evaluation was created at.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Timestamp the Evaluation was completed at.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more
        # about this error model and how to work with it in the [API Design Guide](https:
        # //cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DiscoveryengineV1::GoogleRpcStatus]
        attr_accessor :error
      
        # Output only. A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Describes the specification of the evaluation.
        # Corresponds to the JSON property `evaluationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEvaluationEvaluationSpec]
        attr_accessor :evaluation_spec
      
        # Identifier. The full resource name of the Evaluation, in the format of `
        # projects/`project`/locations/`location`/evaluations/`evaluation``. This field
        # must be a UTF-8 encoded string with a length limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Describes the metrics produced by the evaluation.
        # Corresponds to the JSON property `qualityMetrics`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaQualityMetrics]
        attr_accessor :quality_metrics
      
        # Output only. The state of the evaluation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error = args[:error] if args.key?(:error)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @evaluation_spec = args[:evaluation_spec] if args.key?(:evaluation_spec)
          @name = args[:name] if args.key?(:name)
          @quality_metrics = args[:quality_metrics] if args.key?(:quality_metrics)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Describes the specification of the evaluation.
      class GoogleCloudDiscoveryengineV1betaEvaluationEvaluationSpec
        include Google::Apis::Core::Hashable
      
        # Describes the specification of the query set.
        # Corresponds to the JSON property `querySetSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaEvaluationEvaluationSpecQuerySetSpec]
        attr_accessor :query_set_spec
      
        # Request message for SearchService.Search method.
        # Corresponds to the JSON property `searchRequest`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequest]
        attr_accessor :search_request
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_set_spec = args[:query_set_spec] if args.key?(:query_set_spec)
          @search_request = args[:search_request] if args.key?(:search_request)
        end
      end
      
      # Describes the specification of the query set.
      class GoogleCloudDiscoveryengineV1betaEvaluationEvaluationSpecQuerySetSpec
        include Google::Apis::Core::Hashable
      
        # Required. The full resource name of the SampleQuerySet used for the evaluation,
        # in the format of `projects/`project`/locations/`location`/sampleQuerySets/`
        # sampleQuerySet``.
        # Corresponds to the JSON property `sampleQuerySet`
        # @return [String]
        attr_accessor :sample_query_set
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sample_query_set = args[:sample_query_set] if args.key?(:sample_query_set)
        end
      end
      
      # Response message for SiteSearchEngineService.FetchSitemaps method.
      class GoogleCloudDiscoveryengineV1betaFetchSitemapsResponse
        include Google::Apis::Core::Hashable
      
        # List of Sitemaps fetched.
        # Corresponds to the JSON property `sitemapsMetadata`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaFetchSitemapsResponseSitemapMetadata>]
        attr_accessor :sitemaps_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sitemaps_metadata = args[:sitemaps_metadata] if args.key?(:sitemaps_metadata)
        end
      end
      
      # Contains a Sitemap and its metadata.
      class GoogleCloudDiscoveryengineV1betaFetchSitemapsResponseSitemapMetadata
        include Google::Apis::Core::Hashable
      
        # A sitemap for the SiteSearchEngine.
        # Corresponds to the JSON property `sitemap`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSitemap]
        attr_accessor :sitemap
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sitemap = args[:sitemap] if args.key?(:sitemap)
        end
      end
      
      # Metadata related to the progress of the ImportCompletionSuggestions operation.
      # This will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaImportCompletionSuggestionsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of CompletionSuggestions that failed to be imported.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of CompletionSuggestions successfully imported.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the CompletionService.ImportCompletionSuggestions method. If the
      # long running operation is done, this message is returned by the google.
      # longrunning.Operations.response field if the operation is successful.
      class GoogleCloudDiscoveryengineV1betaImportCompletionSuggestionsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Metadata related to the progress of the ImportDocuments operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaImportDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were processed successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Total count of entries that were processed.
        # Corresponds to the JSON property `totalCount`
        # @return [Fixnum]
        attr_accessor :total_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @total_count = args[:total_count] if args.key?(:total_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the ImportDocumentsRequest. If the long running operation is done,
      # then this message is returned by the google.longrunning.Operations.response
      # field if the operation was successful.
      class GoogleCloudDiscoveryengineV1betaImportDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Configuration of destination for Import related errors.
      class GoogleCloudDiscoveryengineV1betaImportErrorConfig
        include Google::Apis::Core::Hashable
      
        # Cloud Storage prefix for import errors. This must be an empty, existing Cloud
        # Storage directory. Import errors are written to sharded files in this
        # directory, one per line, as a JSON-encoded `google.rpc.Status` message.
        # Corresponds to the JSON property `gcsPrefix`
        # @return [String]
        attr_accessor :gcs_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_prefix = args[:gcs_prefix] if args.key?(:gcs_prefix)
        end
      end
      
      # Metadata related to the progress of the ImportSampleQueries operation. This
      # will be returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaImportSampleQueriesMetadata
        include Google::Apis::Core::Hashable
      
        # ImportSampleQueries operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of SampleQuerys that failed to be imported.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of SampleQuerys successfully imported.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Total count of SampleQuerys that were processed.
        # Corresponds to the JSON property `totalCount`
        # @return [Fixnum]
        attr_accessor :total_count
      
        # ImportSampleQueries operation last update time. If the operation is done, this
        # is also the finish time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @total_count = args[:total_count] if args.key?(:total_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the SampleQueryService.ImportSampleQueries method. If the long
      # running operation is done, this message is returned by the google.longrunning.
      # Operations.response field if the operation is successful.
      class GoogleCloudDiscoveryengineV1betaImportSampleQueriesResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
        end
      end
      
      # Metadata related to the progress of the ImportSuggestionDenyListEntries
      # operation. This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaImportSuggestionDenyListEntriesMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for CompletionService.ImportSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1betaImportSuggestionDenyListEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Count of deny list entries that failed to be imported.
        # Corresponds to the JSON property `failedEntriesCount`
        # @return [Fixnum]
        attr_accessor :failed_entries_count
      
        # Count of deny list entries successfully imported.
        # Corresponds to the JSON property `importedEntriesCount`
        # @return [Fixnum]
        attr_accessor :imported_entries_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @failed_entries_count = args[:failed_entries_count] if args.key?(:failed_entries_count)
          @imported_entries_count = args[:imported_entries_count] if args.key?(:imported_entries_count)
        end
      end
      
      # Metadata related to the progress of the Import operation. This is returned by
      # the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaImportUserEventsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were processed successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the ImportUserEventsRequest. If the long running operation was
      # successful, then this message is returned by the google.longrunning.Operations.
      # response field if the operation was successful.
      class GoogleCloudDiscoveryengineV1betaImportUserEventsResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Count of user events imported with complete existing Documents.
        # Corresponds to the JSON property `joinedEventsCount`
        # @return [Fixnum]
        attr_accessor :joined_events_count
      
        # Count of user events imported, but with Document information not found in the
        # existing Branch.
        # Corresponds to the JSON property `unjoinedEventsCount`
        # @return [Fixnum]
        attr_accessor :unjoined_events_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @joined_events_count = args[:joined_events_count] if args.key?(:joined_events_count)
          @unjoined_events_count = args[:unjoined_events_count] if args.key?(:unjoined_events_count)
        end
      end
      
      # A floating point interval.
      class GoogleCloudDiscoveryengineV1betaInterval
        include Google::Apis::Core::Hashable
      
        # Exclusive upper bound.
        # Corresponds to the JSON property `exclusiveMaximum`
        # @return [Float]
        attr_accessor :exclusive_maximum
      
        # Exclusive lower bound.
        # Corresponds to the JSON property `exclusiveMinimum`
        # @return [Float]
        attr_accessor :exclusive_minimum
      
        # Inclusive upper bound.
        # Corresponds to the JSON property `maximum`
        # @return [Float]
        attr_accessor :maximum
      
        # Inclusive lower bound.
        # Corresponds to the JSON property `minimum`
        # @return [Float]
        attr_accessor :minimum
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exclusive_maximum = args[:exclusive_maximum] if args.key?(:exclusive_maximum)
          @exclusive_minimum = args[:exclusive_minimum] if args.key?(:exclusive_minimum)
          @maximum = args[:maximum] if args.key?(:maximum)
          @minimum = args[:minimum] if args.key?(:minimum)
        end
      end
      
      # Language info for DataStore.
      class GoogleCloudDiscoveryengineV1betaLanguageInfo
        include Google::Apis::Core::Hashable
      
        # Output only. Language part of normalized_language_code. E.g.: `en-US` -> `en`,
        # `zh-Hans-HK` -> `zh`, `en` -> `en`.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # The language code for the DataStore.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Output only. This is the normalized form of language_code. E.g.: language_code
        # of `en-GB`, `en_GB`, `en-UK` or `en-gb` will have normalized_language_code of `
        # en-GB`.
        # Corresponds to the JSON property `normalizedLanguageCode`
        # @return [String]
        attr_accessor :normalized_language_code
      
        # Output only. Region part of normalized_language_code, if present. E.g.: `en-US`
        # -> `US`, `zh-Hans-HK` -> `HK`, `en` -> ``.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @language = args[:language] if args.key?(:language)
          @language_code = args[:language_code] if args.key?(:language_code)
          @normalized_language_code = args[:normalized_language_code] if args.key?(:normalized_language_code)
          @region = args[:region] if args.key?(:region)
        end
      end
      
      # Configuration for Natural Language Query Understanding.
      class GoogleCloudDiscoveryengineV1betaNaturalLanguageQueryUnderstandingConfig
        include Google::Apis::Core::Hashable
      
        # Mode of Natural Language Query Understanding. If this field is unset, the
        # behavior defaults to NaturalLanguageQueryUnderstandingConfig.Mode.DISABLED.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Metadata and configurations for a Google Cloud project in the service.
      class GoogleCloudDiscoveryengineV1betaProject
        include Google::Apis::Core::Hashable
      
        # Output only. The timestamp when this project is created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. Full resource name of the project, for example `projects/`project`
        # `. Note that when making requests, project number and project id are both
        # acceptable, but the server will always respond in project number.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The timestamp when this project is successfully provisioned.
        # Empty value means this project is still provisioning and is not ready for use.
        # Corresponds to the JSON property `provisionCompletionTime`
        # @return [String]
        attr_accessor :provision_completion_time
      
        # Output only. A map of terms of services. The key is the `id` of ServiceTerms.
        # Corresponds to the JSON property `serviceTermsMap`
        # @return [Hash<String,Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaProjectServiceTerms>]
        attr_accessor :service_terms_map
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @provision_completion_time = args[:provision_completion_time] if args.key?(:provision_completion_time)
          @service_terms_map = args[:service_terms_map] if args.key?(:service_terms_map)
        end
      end
      
      # Metadata about the terms of service.
      class GoogleCloudDiscoveryengineV1betaProjectServiceTerms
        include Google::Apis::Core::Hashable
      
        # The last time when the project agreed to the terms of service.
        # Corresponds to the JSON property `acceptTime`
        # @return [String]
        attr_accessor :accept_time
      
        # The last time when the project declined or revoked the agreement to terms of
        # service.
        # Corresponds to the JSON property `declineTime`
        # @return [String]
        attr_accessor :decline_time
      
        # The unique identifier of this terms of service. Available terms: * `
        # GA_DATA_USE_TERMS`: [Terms for data use](https://cloud.google.com/retail/data-
        # use-terms). When using this as `id`, the acceptable version to provide is `
        # 2022-11-23`.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether the project has accepted/rejected the service terms or it is still
        # pending.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The version string of the terms of service. For acceptable values, see the
        # comments for id above.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accept_time = args[:accept_time] if args.key?(:accept_time)
          @decline_time = args[:decline_time] if args.key?(:decline_time)
          @id = args[:id] if args.key?(:id)
          @state = args[:state] if args.key?(:state)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Metadata associated with a project provision operation.
      class GoogleCloudDiscoveryengineV1betaProvisionProjectMetadata
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata related to the progress of the PurgeDocuments operation. This will be
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaPurgeDocumentsMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Count of entries that encountered errors while processing.
        # Corresponds to the JSON property `failureCount`
        # @return [Fixnum]
        attr_accessor :failure_count
      
        # Count of entries that were ignored as entries were not found.
        # Corresponds to the JSON property `ignoredCount`
        # @return [Fixnum]
        attr_accessor :ignored_count
      
        # Count of entries that were deleted successfully.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @failure_count = args[:failure_count] if args.key?(:failure_count)
          @ignored_count = args[:ignored_count] if args.key?(:ignored_count)
          @success_count = args[:success_count] if args.key?(:success_count)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for DocumentService.PurgeDocuments method. If the long
      # running operation is successfully done, then this message is returned by the
      # google.longrunning.Operations.response field.
      class GoogleCloudDiscoveryengineV1betaPurgeDocumentsResponse
        include Google::Apis::Core::Hashable
      
        # The total count of documents purged as a result of the operation.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        # A sample of document names that will be deleted. Only populated if `force` is
        # set to false. A max of 100 names will be returned and the names are chosen at
        # random.
        # Corresponds to the JSON property `purgeSample`
        # @return [Array<String>]
        attr_accessor :purge_sample
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
          @purge_sample = args[:purge_sample] if args.key?(:purge_sample)
        end
      end
      
      # Metadata related to the progress of the PurgeSuggestionDenyListEntries
      # operation. This is returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaPurgeSuggestionDenyListEntriesMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for CompletionService.PurgeSuggestionDenyListEntries method.
      class GoogleCloudDiscoveryengineV1betaPurgeSuggestionDenyListEntriesResponse
        include Google::Apis::Core::Hashable
      
        # A sample of errors encountered while processing the request.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # Number of suggestion deny list entries purged.
        # Corresponds to the JSON property `purgeCount`
        # @return [Fixnum]
        attr_accessor :purge_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @purge_count = args[:purge_count] if args.key?(:purge_count)
        end
      end
      
      # Describes the metrics produced by the evaluation.
      class GoogleCloudDiscoveryengineV1betaQualityMetrics
        include Google::Apis::Core::Hashable
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `docNdcg`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaQualityMetricsTopkMetrics]
        attr_accessor :doc_ndcg
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `docPrecision`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaQualityMetricsTopkMetrics]
        attr_accessor :doc_precision
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `docRecall`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaQualityMetricsTopkMetrics]
        attr_accessor :doc_recall
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `pageNdcg`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaQualityMetricsTopkMetrics]
        attr_accessor :page_ndcg
      
        # Stores the metric values at specific top-k levels.
        # Corresponds to the JSON property `pageRecall`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaQualityMetricsTopkMetrics]
        attr_accessor :page_recall
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @doc_ndcg = args[:doc_ndcg] if args.key?(:doc_ndcg)
          @doc_precision = args[:doc_precision] if args.key?(:doc_precision)
          @doc_recall = args[:doc_recall] if args.key?(:doc_recall)
          @page_ndcg = args[:page_ndcg] if args.key?(:page_ndcg)
          @page_recall = args[:page_recall] if args.key?(:page_recall)
        end
      end
      
      # Stores the metric values at specific top-k levels.
      class GoogleCloudDiscoveryengineV1betaQualityMetricsTopkMetrics
        include Google::Apis::Core::Hashable
      
        # The top-1 value.
        # Corresponds to the JSON property `top1`
        # @return [Float]
        attr_accessor :top1
      
        # The top-10 value.
        # Corresponds to the JSON property `top10`
        # @return [Float]
        attr_accessor :top10
      
        # The top-3 value.
        # Corresponds to the JSON property `top3`
        # @return [Float]
        attr_accessor :top3
      
        # The top-5 value.
        # Corresponds to the JSON property `top5`
        # @return [Float]
        attr_accessor :top5
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @top1 = args[:top1] if args.key?(:top1)
          @top10 = args[:top10] if args.key?(:top10)
          @top3 = args[:top3] if args.key?(:top3)
          @top5 = args[:top5] if args.key?(:top5)
        end
      end
      
      # Defines the structure and layout of a type of document data.
      class GoogleCloudDiscoveryengineV1betaSchema
        include Google::Apis::Core::Hashable
      
        # The JSON representation of the schema.
        # Corresponds to the JSON property `jsonSchema`
        # @return [String]
        attr_accessor :json_schema
      
        # Immutable. The full resource name of the schema, in the format of `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # schemas/`schema``. This field must be a UTF-8 encoded string with a length
        # limit of 1024 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The structured representation of the schema.
        # Corresponds to the JSON property `structSchema`
        # @return [Hash<String,Object>]
        attr_accessor :struct_schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @json_schema = args[:json_schema] if args.key?(:json_schema)
          @name = args[:name] if args.key?(:name)
          @struct_schema = args[:struct_schema] if args.key?(:struct_schema)
        end
      end
      
      # Promotion proto includes uri and other helping information to display the
      # promotion.
      class GoogleCloudDiscoveryengineV1betaSearchLinkPromotion
        include Google::Apis::Core::Hashable
      
        # Optional. The Promotion description. Maximum length: 200 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional. The enabled promotion will be returned for any serving configs
        # associated with the parent of the control this promotion is attached to. This
        # flag is used for basic site search only.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Optional. The promotion thumbnail image url.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # Required. The title of the promotion. Maximum length: 160 characters.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Required. The URL for the page the user wants to promote.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @enabled = args[:enabled] if args.key?(:enabled)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @title = args[:title] if args.key?(:title)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Request message for SearchService.Search method.
      class GoogleCloudDiscoveryengineV1betaSearchRequest
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # The branch resource name, such as `projects/*/locations/global/collections/
        # default_collection/dataStores/default_data_store/branches/0`. Use `
        # default_branch` as the branch ID or leave this field empty, to search
        # documents under the default branch.
        # Corresponds to the JSON property `branch`
        # @return [String]
        attr_accessor :branch
      
        # The default filter that is applied when a user performs a search without
        # checking any filters on the search page. The filter applied to every search
        # request when quality improvement such as query expansion is needed. In the
        # case a query does not have a sufficient amount of results this filter will be
        # used to determine whether or not to enable the query expansion flow. The
        # original filter will still be used for the query expanded search. This field
        # is strongly recommended to achieve high search quality. For more information
        # about filter syntax, see SearchRequest.filter.
        # Corresponds to the JSON property `canonicalFilter`
        # @return [String]
        attr_accessor :canonical_filter
      
        # A specification for configuring the behavior of content search.
        # Corresponds to the JSON property `contentSearchSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpec]
        attr_accessor :content_search_spec
      
        # Specs defining DataStores to filter on in a search call and configurations for
        # those data stores. This is only considered for Engines with multiple data
        # stores. For engines with a single data store, the specs directly under
        # SearchRequest should be used.
        # Corresponds to the JSON property `dataStoreSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestDataStoreSpec>]
        attr_accessor :data_store_specs
      
        # The specification that uses customized query embedding vector to do semantic
        # document retrieval.
        # Corresponds to the JSON property `embeddingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestEmbeddingSpec]
        attr_accessor :embedding_spec
      
        # Facet specifications for faceted search. If empty, no facets are returned. A
        # maximum of 100 values are allowed. Otherwise, an `INVALID_ARGUMENT` error is
        # returned.
        # Corresponds to the JSON property `facetSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestFacetSpec>]
        attr_accessor :facet_specs
      
        # The filter syntax consists of an expression language for constructing a
        # predicate from one or more fields of the documents being filtered. Filter
        # expression is case-sensitive. If this field is unrecognizable, an `
        # INVALID_ARGUMENT` is returned. Filtering in Vertex AI Search is done by
        # mapping the LHS filter key to a key property defined in the Vertex AI Search
        # backend -- this mapping is defined by the customer in their schema. For
        # example a media customer might have a field 'name' in their schema. In this
        # case the filter would look like this: filter --> name:'ANY("king kong")' For
        # more information about filtering including syntax and filter operators, see [
        # Filter](https://cloud.google.com/generative-ai-app-builder/docs/filter-search-
        # metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Specifies the image query input.
        # Corresponds to the JSON property `imageQuery`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestImageQuery]
        attr_accessor :image_query
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information,
        # see [Standard fields](https://cloud.google.com/apis/design/standard_fields).
        # This field helps to better interpret the query. If a value isn't specified,
        # the query language code is automatically detected, which may not be accurate.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Specification to enable natural language understanding capabilities for search
        # requests.
        # Corresponds to the JSON property `naturalLanguageQueryUnderstandingSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestNaturalLanguageQueryUnderstandingSpec]
        attr_accessor :natural_language_query_understanding_spec
      
        # A 0-indexed integer that specifies the current offset (that is, starting
        # result location, amongst the Documents deemed by the API as relevant) in
        # search results. This field is only considered if page_token is unset. If this
        # field is negative, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # The maximum number of results to return for OneBox. This applies to each
        # OneBox type individually. Default number is 10.
        # Corresponds to the JSON property `oneBoxPageSize`
        # @return [Fixnum]
        attr_accessor :one_box_page_size
      
        # The order in which documents are returned. Documents can be ordered by a field
        # in an Document object. Leave it unset if ordered by relevance. `order_by`
        # expression is case-sensitive. For more information on ordering the website
        # search results, see [Order web search results](https://cloud.google.com/
        # generative-ai-app-builder/docs/order-web-search-results). For more information
        # on ordering the healthcare search results, see [Order healthcare search
        # results](https://cloud.google.com/generative-ai-app-builder/docs/order-hc-
        # results). If this field is unrecognizable, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Maximum number of Documents to return. The maximum allowed value depends on
        # the data type. Values above the maximum value are coerced to the maximum value.
        # * Websites with basic indexing: Default `10`, Maximum `25`. * Websites with
        # advanced indexing: Default `25`, Maximum `50`. * Other: Default `50`, Maximum `
        # 100`. If this field is negative, an `INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A page token received from a previous SearchService.Search call. Provide this
        # to retrieve the subsequent page. When paginating, all other parameters
        # provided to SearchService.Search must match the call that provided the page
        # token. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Additional search parameters. For public website search only, supported values
        # are: * `user_country_code`: string. Default empty. If set to non-empty,
        # results are restricted or boosted based on the location provided. For example,
        # `user_country_code: "au"` For available codes see [Country Codes](https://
        # developers.google.com/custom-search/docs/json_api_reference#countryCodes) * `
        # search_type`: double. Default empty. Enables non-webpage searching depending
        # on the value. The only valid non-default value is 1, which enables image
        # searching. For example, `search_type: 1`
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # The specification for personalization.
        # Corresponds to the JSON property `personalizationSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestPersonalizationSpec]
        attr_accessor :personalization_spec
      
        # Raw search query.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Specification to determine under which conditions query expansion should occur.
        # Corresponds to the JSON property `queryExpansionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestQueryExpansionSpec]
        attr_accessor :query_expansion_spec
      
        # The ranking expression controls the customized ranking on retrieval documents.
        # This overrides ServingConfig.ranking_expression. The ranking expression is a
        # single function or multiple functions that are joined by "+". *
        # ranking_expression = function, ` " + ", function `; Supported functions: *
        # double * relevance_score * double * dotProduct(embedding_field_path) Function
        # variables: * `relevance_score`: pre-defined keywords, used for measure
        # relevance between query and document. * `embedding_field_path`: the document
        # embedding field used with query embedding vector. * `dotProduct`: embedding
        # function between embedding_field_path and query embedding vector. Example
        # ranking expression: If document has an embedding field doc_embedding, the
        # ranking expression could be `0.5 * relevance_score + 0.3 * dotProduct(
        # doc_embedding)`.
        # Corresponds to the JSON property `rankingExpression`
        # @return [String]
        attr_accessor :ranking_expression
      
        # The Unicode country/region code (CLDR) of a location, such as "US" and "419".
        # For more information, see [Standard fields](https://cloud.google.com/apis/
        # design/standard_fields). If set, then results will be boosted based on the
        # region_code provided.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # The relevance threshold of the search results. Default to Google defined
        # threshold, leveraging a balance of precision and recall to deliver both highly
        # accurate results and comprehensive coverage of relevant information.
        # Corresponds to the JSON property `relevanceThreshold`
        # @return [String]
        attr_accessor :relevance_threshold
      
        # Whether to turn on safe search. This is only supported for website search.
        # Corresponds to the JSON property `safeSearch`
        # @return [Boolean]
        attr_accessor :safe_search
        alias_method :safe_search?, :safe_search
      
        # Specification for search as you type in search requests.
        # Corresponds to the JSON property `searchAsYouTypeSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestSearchAsYouTypeSpec]
        attr_accessor :search_as_you_type_spec
      
        # Required. The resource name of the Search serving config, such as `projects/*/
        # locations/global/collections/default_collection/engines/*/servingConfigs/
        # default_serving_config`, or `projects/*/locations/global/collections/
        # default_collection/dataStores/default_data_store/servingConfigs/
        # default_serving_config`. This field is used to identify the serving
        # configuration name, set of models used to make the search.
        # Corresponds to the JSON property `servingConfig`
        # @return [String]
        attr_accessor :serving_config
      
        # The session resource name. Optional. Session allows users to do multi-turn /
        # search API calls or coordination between /search API calls and /answer API
        # calls. Example #1 (multi-turn /search API calls): 1. Call /search API with the
        # auto-session mode (see below). 2. Call /search API with the session ID
        # generated in the first call. Here, the previous search query gets considered
        # in query standing. I.e., if the first query is "How did Alphabet do in 2022?"
        # and the current query is "How about 2023?", the current query will be
        # interpreted as "How did Alphabet do in 2023?". Example #2 (coordination
        # between /search API calls and /answer API calls): 1. Call /search API with the
        # auto-session mode (see below). 2. Call /answer API with the session ID
        # generated in the first call. Here, the answer generation happens in the
        # context of the search results from the first search call. Auto-session mode:
        # when `projects/.../sessions/-` is used, a new session gets automatically
        # created. Otherwise, users can use the create-session API to create a session
        # manually. Multi-turn Search feature is currently at private GA stage. Please
        # use v1alpha or v1beta version instead before we launch this feature to public
        # GA. Or ask for allowlisting through Google Support team.
        # Corresponds to the JSON property `session`
        # @return [String]
        attr_accessor :session
      
        # Session specification. Multi-turn Search feature is currently at private GA
        # stage. Please use v1alpha or v1beta version instead before we launch this
        # feature to public GA. Or ask for allowlisting through Google Support team.
        # Corresponds to the JSON property `sessionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestSessionSpec]
        attr_accessor :session_spec
      
        # The specification for query spell correction.
        # Corresponds to the JSON property `spellCorrectionSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestSpellCorrectionSpec]
        attr_accessor :spell_correction_spec
      
        # Information of an end user.
        # Corresponds to the JSON property `userInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaUserInfo]
        attr_accessor :user_info
      
        # The user labels applied to a resource must meet the following requirements: *
        # Each resource can have multiple labels, up to a maximum of 64. * Each label
        # must be a key-value pair. * Keys have a minimum length of 1 character and a
        # maximum length of 63 characters and cannot be empty. Values can be empty and
        # have a maximum length of 63 characters. * Keys and values can contain only
        # lowercase letters, numeric characters, underscores, and dashes. All characters
        # must use UTF-8 encoding, and international characters are allowed. * The key
        # portion of a label must be unique. However, you can use the same key with
        # multiple resources. * Keys must start with a lowercase letter or international
        # character. See [Google Cloud Document](https://cloud.google.com/resource-
        # manager/docs/creating-managing-labels#requirements) for more details.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        # A unique identifier for tracking visitors. For example, this could be
        # implemented with an HTTP cookie, which should be able to uniquely identify a
        # visitor on a single device. This unique identifier should not change if the
        # visitor logs in or out of the website. This field should NOT have a fixed
        # value such as `unknown_visitor`. This should be the same identifier as
        # UserEvent.user_pseudo_id and CompleteQueryRequest.user_pseudo_id The field
        # must be a UTF-8 encoded string with a length limit of 128 characters.
        # Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `userPseudoId`
        # @return [String]
        attr_accessor :user_pseudo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @branch = args[:branch] if args.key?(:branch)
          @canonical_filter = args[:canonical_filter] if args.key?(:canonical_filter)
          @content_search_spec = args[:content_search_spec] if args.key?(:content_search_spec)
          @data_store_specs = args[:data_store_specs] if args.key?(:data_store_specs)
          @embedding_spec = args[:embedding_spec] if args.key?(:embedding_spec)
          @facet_specs = args[:facet_specs] if args.key?(:facet_specs)
          @filter = args[:filter] if args.key?(:filter)
          @image_query = args[:image_query] if args.key?(:image_query)
          @language_code = args[:language_code] if args.key?(:language_code)
          @natural_language_query_understanding_spec = args[:natural_language_query_understanding_spec] if args.key?(:natural_language_query_understanding_spec)
          @offset = args[:offset] if args.key?(:offset)
          @one_box_page_size = args[:one_box_page_size] if args.key?(:one_box_page_size)
          @order_by = args[:order_by] if args.key?(:order_by)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @params = args[:params] if args.key?(:params)
          @personalization_spec = args[:personalization_spec] if args.key?(:personalization_spec)
          @query = args[:query] if args.key?(:query)
          @query_expansion_spec = args[:query_expansion_spec] if args.key?(:query_expansion_spec)
          @ranking_expression = args[:ranking_expression] if args.key?(:ranking_expression)
          @region_code = args[:region_code] if args.key?(:region_code)
          @relevance_threshold = args[:relevance_threshold] if args.key?(:relevance_threshold)
          @safe_search = args[:safe_search] if args.key?(:safe_search)
          @search_as_you_type_spec = args[:search_as_you_type_spec] if args.key?(:search_as_you_type_spec)
          @serving_config = args[:serving_config] if args.key?(:serving_config)
          @session = args[:session] if args.key?(:session)
          @session_spec = args[:session_spec] if args.key?(:session_spec)
          @spell_correction_spec = args[:spell_correction_spec] if args.key?(:spell_correction_spec)
          @user_info = args[:user_info] if args.key?(:user_info)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
          @user_pseudo_id = args[:user_pseudo_id] if args.key?(:user_pseudo_id)
        end
      end
      
      # Boost specification to boost certain documents.
      class GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpec
        include Google::Apis::Core::Hashable
      
        # Condition boost specifications. If a document matches multiple conditions in
        # the specifictions, boost scores from these specifications are all applied and
        # combined in a non-linear way. Maximum number of specifications is 20.
        # Corresponds to the JSON property `conditionBoostSpecs`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpecConditionBoostSpec>]
        attr_accessor :condition_boost_specs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition_boost_specs = args[:condition_boost_specs] if args.key?(:condition_boost_specs)
        end
      end
      
      # Boost applies to documents which match a condition.
      class GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpecConditionBoostSpec
        include Google::Apis::Core::Hashable
      
        # Strength of the condition boost, which should be in [-1, 1]. Negative boost
        # means demotion. Default is 0.0. Setting to 1.0 gives the document a big
        # promotion. However, it does not necessarily mean that the boosted document
        # will be the top result at all times, nor that other documents will be excluded.
        # Results could still be shown even when none of them matches the condition.
        # And results that are significantly more relevant to the search query can still
        # trump your heavily favored but irrelevant documents. Setting to -1.0 gives the
        # document a big demotion. However, results that are deeply relevant might still
        # be shown. The document will have an upstream battle to get a fairly high
        # ranking, but it is not blocked out completely. Setting to 0.0 means no boost
        # applied. The boosting condition is ignored. Only one of the (condition, boost)
        # combination or the boost_control_spec below are set. If both are set then the
        # global boost is ignored and the more fine-grained boost_control_spec is
        # applied.
        # Corresponds to the JSON property `boost`
        # @return [Float]
        attr_accessor :boost
      
        # Specification for custom ranking based on customer specified attribute value.
        # It provides more controls for customized ranking than the simple (condition,
        # boost) combination above.
        # Corresponds to the JSON property `boostControlSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpecConditionBoostSpecBoostControlSpec]
        attr_accessor :boost_control_spec
      
        # An expression which specifies a boost condition. The syntax and supported
        # fields are the same as a filter expression. See SearchRequest.filter for
        # detail syntax and limitations. Examples: * To boost documents with document ID
        # "doc_1" or "doc_2", and color "Red" or "Blue": `(document_id: ANY("doc_1", "
        # doc_2")) AND (color: ANY("Red", "Blue"))`
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost = args[:boost] if args.key?(:boost)
          @boost_control_spec = args[:boost_control_spec] if args.key?(:boost_control_spec)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # Specification for custom ranking based on customer specified attribute value.
      # It provides more controls for customized ranking than the simple (condition,
      # boost) combination above.
      class GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpecConditionBoostSpecBoostControlSpec
        include Google::Apis::Core::Hashable
      
        # The attribute type to be used to determine the boost amount. The attribute
        # value can be derived from the field value of the specified field_name. In the
        # case of numerical it is straightforward i.e. attribute_value =
        # numerical_field_value. In the case of freshness however, attribute_value = (
        # time.now() - datetime_field_value).
        # Corresponds to the JSON property `attributeType`
        # @return [String]
        attr_accessor :attribute_type
      
        # The control points used to define the curve. The monotonic function (defined
        # through the interpolation_type above) passes through the control points listed
        # here.
        # Corresponds to the JSON property `controlPoints`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpecConditionBoostSpecBoostControlSpecControlPoint>]
        attr_accessor :control_points
      
        # The name of the field whose value will be used to determine the boost amount.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # The interpolation type to be applied to connect the control points listed
        # below.
        # Corresponds to the JSON property `interpolationType`
        # @return [String]
        attr_accessor :interpolation_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_type = args[:attribute_type] if args.key?(:attribute_type)
          @control_points = args[:control_points] if args.key?(:control_points)
          @field_name = args[:field_name] if args.key?(:field_name)
          @interpolation_type = args[:interpolation_type] if args.key?(:interpolation_type)
        end
      end
      
      # The control points used to define the curve. The curve defined through these
      # control points can only be monotonically increasing or decreasing(constant
      # values are acceptable).
      class GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpecConditionBoostSpecBoostControlSpecControlPoint
        include Google::Apis::Core::Hashable
      
        # Can be one of: 1. The numerical field value. 2. The duration spec for
        # freshness: The value must be formatted as an XSD `dayTimeDuration` value (a
        # restricted subset of an ISO 8601 duration value). The pattern for this is: `
        # nDnM]`.
        # Corresponds to the JSON property `attributeValue`
        # @return [String]
        attr_accessor :attribute_value
      
        # The value between -1 to 1 by which to boost the score if the attribute_value
        # evaluates to the value specified above.
        # Corresponds to the JSON property `boostAmount`
        # @return [Float]
        attr_accessor :boost_amount
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_value = args[:attribute_value] if args.key?(:attribute_value)
          @boost_amount = args[:boost_amount] if args.key?(:boost_amount)
        end
      end
      
      # A specification for configuring the behavior of content search.
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpec
        include Google::Apis::Core::Hashable
      
        # Specifies the chunk spec to be returned from the search response. Only
        # available if the SearchRequest.ContentSearchSpec.search_result_mode is set to
        # CHUNKS
        # Corresponds to the JSON property `chunkSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecChunkSpec]
        attr_accessor :chunk_spec
      
        # A specification for configuring the extractive content in a search response.
        # Corresponds to the JSON property `extractiveContentSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecExtractiveContentSpec]
        attr_accessor :extractive_content_spec
      
        # Specifies the search result mode. If unspecified, the search result mode
        # defaults to `DOCUMENTS`.
        # Corresponds to the JSON property `searchResultMode`
        # @return [String]
        attr_accessor :search_result_mode
      
        # A specification for configuring snippets in a search response.
        # Corresponds to the JSON property `snippetSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSnippetSpec]
        attr_accessor :snippet_spec
      
        # A specification for configuring a summary returned in a search response.
        # Corresponds to the JSON property `summarySpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSummarySpec]
        attr_accessor :summary_spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunk_spec = args[:chunk_spec] if args.key?(:chunk_spec)
          @extractive_content_spec = args[:extractive_content_spec] if args.key?(:extractive_content_spec)
          @search_result_mode = args[:search_result_mode] if args.key?(:search_result_mode)
          @snippet_spec = args[:snippet_spec] if args.key?(:snippet_spec)
          @summary_spec = args[:summary_spec] if args.key?(:summary_spec)
        end
      end
      
      # Specifies the chunk spec to be returned from the search response. Only
      # available if the SearchRequest.ContentSearchSpec.search_result_mode is set to
      # CHUNKS
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecChunkSpec
        include Google::Apis::Core::Hashable
      
        # The number of next chunks to be returned of the current chunk. The maximum
        # allowed value is 3. If not specified, no next chunks will be returned.
        # Corresponds to the JSON property `numNextChunks`
        # @return [Fixnum]
        attr_accessor :num_next_chunks
      
        # The number of previous chunks to be returned of the current chunk. The maximum
        # allowed value is 3. If not specified, no previous chunks will be returned.
        # Corresponds to the JSON property `numPreviousChunks`
        # @return [Fixnum]
        attr_accessor :num_previous_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_next_chunks = args[:num_next_chunks] if args.key?(:num_next_chunks)
          @num_previous_chunks = args[:num_previous_chunks] if args.key?(:num_previous_chunks)
        end
      end
      
      # A specification for configuring the extractive content in a search response.
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecExtractiveContentSpec
        include Google::Apis::Core::Hashable
      
        # The maximum number of extractive answers returned in each search result. An
        # extractive answer is a verbatim answer extracted from the original document,
        # which provides a precise and contextually relevant answer to the search query.
        # If the number of matching answers is less than the `
        # max_extractive_answer_count`, return all of the answers. Otherwise, return the
        # `max_extractive_answer_count`. At most five answers are returned for each
        # SearchResult.
        # Corresponds to the JSON property `maxExtractiveAnswerCount`
        # @return [Fixnum]
        attr_accessor :max_extractive_answer_count
      
        # The max number of extractive segments returned in each search result. Only
        # applied if the DataStore is set to DataStore.ContentConfig.CONTENT_REQUIRED or
        # DataStore.solution_types is SOLUTION_TYPE_CHAT. An extractive segment is a
        # text segment extracted from the original document that is relevant to the
        # search query, and, in general, more verbose than an extractive answer. The
        # segment could then be used as input for LLMs to generate summaries and answers.
        # If the number of matching segments is less than `max_extractive_segment_count`
        # , return all of the segments. Otherwise, return the `
        # max_extractive_segment_count`.
        # Corresponds to the JSON property `maxExtractiveSegmentCount`
        # @return [Fixnum]
        attr_accessor :max_extractive_segment_count
      
        # Return at most `num_next_segments` segments after each selected segments.
        # Corresponds to the JSON property `numNextSegments`
        # @return [Fixnum]
        attr_accessor :num_next_segments
      
        # Specifies whether to also include the adjacent from each selected segments.
        # Return at most `num_previous_segments` segments before each selected segments.
        # Corresponds to the JSON property `numPreviousSegments`
        # @return [Fixnum]
        attr_accessor :num_previous_segments
      
        # Specifies whether to return the confidence score from the extractive segments
        # in each search result. This feature is available only for new or allowlisted
        # data stores. To allowlist your data store, contact your Customer Engineer. The
        # default value is `false`.
        # Corresponds to the JSON property `returnExtractiveSegmentScore`
        # @return [Boolean]
        attr_accessor :return_extractive_segment_score
        alias_method :return_extractive_segment_score?, :return_extractive_segment_score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_extractive_answer_count = args[:max_extractive_answer_count] if args.key?(:max_extractive_answer_count)
          @max_extractive_segment_count = args[:max_extractive_segment_count] if args.key?(:max_extractive_segment_count)
          @num_next_segments = args[:num_next_segments] if args.key?(:num_next_segments)
          @num_previous_segments = args[:num_previous_segments] if args.key?(:num_previous_segments)
          @return_extractive_segment_score = args[:return_extractive_segment_score] if args.key?(:return_extractive_segment_score)
        end
      end
      
      # A specification for configuring snippets in a search response.
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSnippetSpec
        include Google::Apis::Core::Hashable
      
        # [DEPRECATED] This field is deprecated. To control snippet return, use `
        # return_snippet` field. For backwards compatibility, we will return snippet if
        # max_snippet_count > 0.
        # Corresponds to the JSON property `maxSnippetCount`
        # @return [Fixnum]
        attr_accessor :max_snippet_count
      
        # [DEPRECATED] This field is deprecated and will have no affect on the snippet.
        # Corresponds to the JSON property `referenceOnly`
        # @return [Boolean]
        attr_accessor :reference_only
        alias_method :reference_only?, :reference_only
      
        # If `true`, then return snippet. If no snippet can be generated, we return "No
        # snippet is available for this page." A `snippet_status` with `SUCCESS` or `
        # NO_SNIPPET_AVAILABLE` will also be returned.
        # Corresponds to the JSON property `returnSnippet`
        # @return [Boolean]
        attr_accessor :return_snippet
        alias_method :return_snippet?, :return_snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_snippet_count = args[:max_snippet_count] if args.key?(:max_snippet_count)
          @reference_only = args[:reference_only] if args.key?(:reference_only)
          @return_snippet = args[:return_snippet] if args.key?(:return_snippet)
        end
      end
      
      # A specification for configuring a summary returned in a search response.
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSummarySpec
        include Google::Apis::Core::Hashable
      
        # Specifies whether to filter out adversarial queries. The default value is `
        # false`. Google employs search-query classification to detect adversarial
        # queries. No summary is returned if the search query is classified as an
        # adversarial query. For example, a user might ask a question regarding negative
        # comments about the company or submit a query designed to generate unsafe,
        # policy-violating output. If this field is set to `true`, we skip generating
        # summaries for adversarial queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreAdversarialQuery`
        # @return [Boolean]
        attr_accessor :ignore_adversarial_query
        alias_method :ignore_adversarial_query?, :ignore_adversarial_query
      
        # Optional. Specifies whether to filter out jail-breaking queries. The default
        # value is `false`. Google employs search-query classification to detect jail-
        # breaking queries. No summary is returned if the search query is classified as
        # a jail-breaking query. A user might add instructions to the query to change
        # the tone, style, language, content of the answer, or ask the model to act as a
        # different entity, e.g. "Reply in the tone of a competing company's CEO". If
        # this field is set to `true`, we skip generating summaries for jail-breaking
        # queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreJailBreakingQuery`
        # @return [Boolean]
        attr_accessor :ignore_jail_breaking_query
        alias_method :ignore_jail_breaking_query?, :ignore_jail_breaking_query
      
        # Specifies whether to filter out queries that have low relevance. The default
        # value is `false`. If this field is set to `false`, all search results are used
        # regardless of relevance to generate answers. If set to `true`, only queries
        # with high relevance search results will generate answers.
        # Corresponds to the JSON property `ignoreLowRelevantContent`
        # @return [Boolean]
        attr_accessor :ignore_low_relevant_content
        alias_method :ignore_low_relevant_content?, :ignore_low_relevant_content
      
        # Specifies whether to filter out queries that are not summary-seeking. The
        # default value is `false`. Google employs search-query classification to detect
        # summary-seeking queries. No summary is returned if the search query is
        # classified as a non-summary seeking query. For example, `why is the sky blue`
        # and `Who is the best soccer player in the world?` are summary-seeking queries,
        # but `SFO airport` and `world cup 2026` are not. They are most likely
        # navigational queries. If this field is set to `true`, we skip generating
        # summaries for non-summary seeking queries and return fallback messages instead.
        # Corresponds to the JSON property `ignoreNonSummarySeekingQuery`
        # @return [Boolean]
        attr_accessor :ignore_non_summary_seeking_query
        alias_method :ignore_non_summary_seeking_query?, :ignore_non_summary_seeking_query
      
        # Specifies whether to include citations in the summary. The default value is `
        # false`. When this field is set to `true`, summaries include in-line citation
        # numbers. Example summary including citations: BigQuery is Google Cloud's fully
        # managed and completely serverless enterprise data warehouse [1]. BigQuery
        # supports all data types, works across clouds, and has built-in machine
        # learning and business intelligence, all within a unified platform [2, 3]. The
        # citation numbers refer to the returned search results and are 1-indexed. For
        # example, [1] means that the sentence is attributed to the first search result.
        # [2, 3] means that the sentence is attributed to both the second and third
        # search results.
        # Corresponds to the JSON property `includeCitations`
        # @return [Boolean]
        attr_accessor :include_citations
        alias_method :include_citations?, :include_citations
      
        # Language code for Summary. Use language tags defined by [BCP47](https://www.
        # rfc-editor.org/rfc/bcp/bcp47.txt). Note: This is an experimental feature.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Specification of the prompt to use with the model.
        # Corresponds to the JSON property `modelPromptSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSummarySpecModelPromptSpec]
        attr_accessor :model_prompt_spec
      
        # Specification of the model.
        # Corresponds to the JSON property `modelSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSummarySpecModelSpec]
        attr_accessor :model_spec
      
        # The number of top results to generate the summary from. If the number of
        # results returned is less than `summaryResultCount`, the summary is generated
        # from all of the results. At most 10 results for documents mode, or 50 for
        # chunks mode, can be used to generate a summary. The chunks mode is used when
        # SearchRequest.ContentSearchSpec.search_result_mode is set to CHUNKS.
        # Corresponds to the JSON property `summaryResultCount`
        # @return [Fixnum]
        attr_accessor :summary_result_count
      
        # If true, answer will be generated from most relevant chunks from top search
        # results. This feature will improve summary quality. Note that with this
        # feature enabled, not all top search results will be referenced and included in
        # the reference list, so the citation source index only points to the search
        # results listed in the reference list.
        # Corresponds to the JSON property `useSemanticChunks`
        # @return [Boolean]
        attr_accessor :use_semantic_chunks
        alias_method :use_semantic_chunks?, :use_semantic_chunks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_adversarial_query = args[:ignore_adversarial_query] if args.key?(:ignore_adversarial_query)
          @ignore_jail_breaking_query = args[:ignore_jail_breaking_query] if args.key?(:ignore_jail_breaking_query)
          @ignore_low_relevant_content = args[:ignore_low_relevant_content] if args.key?(:ignore_low_relevant_content)
          @ignore_non_summary_seeking_query = args[:ignore_non_summary_seeking_query] if args.key?(:ignore_non_summary_seeking_query)
          @include_citations = args[:include_citations] if args.key?(:include_citations)
          @language_code = args[:language_code] if args.key?(:language_code)
          @model_prompt_spec = args[:model_prompt_spec] if args.key?(:model_prompt_spec)
          @model_spec = args[:model_spec] if args.key?(:model_spec)
          @summary_result_count = args[:summary_result_count] if args.key?(:summary_result_count)
          @use_semantic_chunks = args[:use_semantic_chunks] if args.key?(:use_semantic_chunks)
        end
      end
      
      # Specification of the prompt to use with the model.
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSummarySpecModelPromptSpec
        include Google::Apis::Core::Hashable
      
        # Text at the beginning of the prompt that instructs the assistant. Examples are
        # available in the user guide.
        # Corresponds to the JSON property `preamble`
        # @return [String]
        attr_accessor :preamble
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @preamble = args[:preamble] if args.key?(:preamble)
        end
      end
      
      # Specification of the model.
      class GoogleCloudDiscoveryengineV1betaSearchRequestContentSearchSpecSummarySpecModelSpec
        include Google::Apis::Core::Hashable
      
        # The model version used to generate the summary. Supported values are: * `
        # stable`: string. Default value when no value is specified. Uses a generally
        # available, fine-tuned model. For more information, see [Answer generation
        # model versions and lifecycle](https://cloud.google.com/generative-ai-app-
        # builder/docs/answer-generation-models). * `preview`: string. (Public preview)
        # Uses a preview model. For more information, see [Answer generation model
        # versions and lifecycle](https://cloud.google.com/generative-ai-app-builder/
        # docs/answer-generation-models).
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A struct to define data stores to filter on in a search call and
      # configurations for those data stores. Otherwise, an `INVALID_ARGUMENT` error
      # is returned.
      class GoogleCloudDiscoveryengineV1betaSearchRequestDataStoreSpec
        include Google::Apis::Core::Hashable
      
        # Boost specification to boost certain documents.
        # Corresponds to the JSON property `boostSpec`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestBoostSpec]
        attr_accessor :boost_spec
      
        # Required. Full resource name of DataStore, such as `projects/`project`/
        # locations/`location`/collections/`collection_id`/dataStores/`data_store_id``.
        # Corresponds to the JSON property `dataStore`
        # @return [String]
        attr_accessor :data_store
      
        # Optional. Filter specification to filter documents in the data store specified
        # by data_store field. For more information on filtering, see [Filtering](https:/
        # /cloud.google.com/generative-ai-app-builder/docs/filter-search-metadata)
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boost_spec = args[:boost_spec] if args.key?(:boost_spec)
          @data_store = args[:data_store] if args.key?(:data_store)
          @filter = args[:filter] if args.key?(:filter)
        end
      end
      
      # The specification that uses customized query embedding vector to do semantic
      # document retrieval.
      class GoogleCloudDiscoveryengineV1betaSearchRequestEmbeddingSpec
        include Google::Apis::Core::Hashable
      
        # The embedding vector used for retrieval. Limit to 1.
        # Corresponds to the JSON property `embeddingVectors`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestEmbeddingSpecEmbeddingVector>]
        attr_accessor :embedding_vectors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @embedding_vectors = args[:embedding_vectors] if args.key?(:embedding_vectors)
        end
      end
      
      # Embedding vector.
      class GoogleCloudDiscoveryengineV1betaSearchRequestEmbeddingSpecEmbeddingVector
        include Google::Apis::Core::Hashable
      
        # Embedding field path in schema.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # Query embedding vector.
        # Corresponds to the JSON property `vector`
        # @return [Array<Float>]
        attr_accessor :vector
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_path = args[:field_path] if args.key?(:field_path)
          @vector = args[:vector] if args.key?(:vector)
        end
      end
      
      # A facet specification to perform faceted search.
      class GoogleCloudDiscoveryengineV1betaSearchRequestFacetSpec
        include Google::Apis::Core::Hashable
      
        # Enables dynamic position for this facet. If set to true, the position of this
        # facet among all facets in the response is determined automatically. If dynamic
        # facets are enabled, it is ordered together. If set to false, the position of
        # this facet in the response is the same as in the request, and it is ranked
        # before the facets with dynamic position enable and all dynamic facets. For
        # example, you may always want to have rating facet returned in the response,
        # but it's not necessarily to always display the rating facet at the top. In
        # that case, you can set enable_dynamic_position to true so that the position of
        # rating facet in response is determined automatically. Another example,
        # assuming you have the following facets in the request: * "rating",
        # enable_dynamic_position = true * "price", enable_dynamic_position = false * "
        # brands", enable_dynamic_position = false And also you have a dynamic facets
        # enabled, which generates a facet `gender`. Then the final order of the facets
        # in the response can be ("price", "brands", "rating", "gender") or ("price", "
        # brands", "gender", "rating") depends on how API orders "gender" and "rating"
        # facets. However, notice that "price" and "brands" are always ranked at first
        # and second position because their enable_dynamic_position is false.
        # Corresponds to the JSON property `enableDynamicPosition`
        # @return [Boolean]
        attr_accessor :enable_dynamic_position
        alias_method :enable_dynamic_position?, :enable_dynamic_position
      
        # List of keys to exclude when faceting. By default, FacetKey.key is not
        # excluded from the filter unless it is listed in this field. Listing a facet
        # key in this field allows its values to appear as facet results, even when they
        # are filtered out of search results. Using this field does not affect what
        # search results are returned. For example, suppose there are 100 documents with
        # the color facet "Red" and 200 documents with the color facet "Blue". A query
        # containing the filter "color:ANY("Red")" and having "color" as FacetKey.key
        # would by default return only "Red" documents in the search results, and also
        # return "Red" with count 100 as the only color facet. Although there are also
        # blue documents available, "Blue" would not be shown as an available facet
        # value. If "color" is listed in "excludedFilterKeys", then the query returns
        # the facet values "Red" with count 100 and "Blue" with count 200, because the "
        # color" key is now excluded from the filter. Because this field doesn't affect
        # search results, the search results are still correctly filtered to return only
        # "Red" documents. A maximum of 100 values are allowed. Otherwise, an `
        # INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `excludedFilterKeys`
        # @return [Array<String>]
        attr_accessor :excluded_filter_keys
      
        # Specifies how a facet is computed.
        # Corresponds to the JSON property `facetKey`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSearchRequestFacetSpecFacetKey]
        attr_accessor :facet_key
      
        # Maximum facet values that are returned for this facet. If unspecified,
        # defaults to 20. The maximum allowed value is 300. Values above 300 are coerced
        # to 300. For aggregation in healthcare search, when the [FacetKey.key] is "
        # healthcare_aggregation_key", the limit will be overridden to 10,000 internally,
        # regardless of the value set here. If this field is negative, an `
        # INVALID_ARGUMENT` is returned.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_dynamic_position = args[:enable_dynamic_position] if args.key?(:enable_dynamic_position)
          @excluded_filter_keys = args[:excluded_filter_keys] if args.key?(:excluded_filter_keys)
          @facet_key = args[:facet_key] if args.key?(:facet_key)
          @limit = args[:limit] if args.key?(:limit)
        end
      end
      
      # Specifies how a facet is computed.
      class GoogleCloudDiscoveryengineV1betaSearchRequestFacetSpecFacetKey
        include Google::Apis::Core::Hashable
      
        # True to make facet keys case insensitive when getting faceting values with
        # prefixes or contains; false otherwise.
        # Corresponds to the JSON property `caseInsensitive`
        # @return [Boolean]
        attr_accessor :case_insensitive
        alias_method :case_insensitive?, :case_insensitive
      
        # Only get facet values that contain the given strings. For example, suppose "
        # category" has three values "Action > 2022", "Action > 2021" and "Sci-Fi > 2022"
        # . If set "contains" to "2022", the "category" facet only contains "Action >
        # 2022" and "Sci-Fi > 2022". Only supported on textual fields. Maximum is 10.
        # Corresponds to the JSON property `contains`
        # @return [Array<String>]
        attr_accessor :contains
      
        # Set only if values should be bucketed into intervals. Must be set for facets
        # with numerical values. Must not be set for facet with text values. Maximum
        # number of intervals is 30.
        # Corresponds to the JSON property `intervals`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaInterval>]
        attr_accessor :intervals
      
        # Required. Supported textual and numerical facet keys in Document object, over
        # which the facet values are computed. Facet key is case-sensitive.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The order in which documents are returned. Allowed values are: * "count desc",
        # which means order by SearchResponse.Facet.values.count descending. * "value
        # desc", which means order by SearchResponse.Facet.values.value descending. Only
        # applies to textual facets. If not set, textual values are sorted in [natural
        # order](https://en.wikipedia.org/wiki/Natural_sort_order); numerical intervals
        # are sorted in the order given by FacetSpec.FacetKey.intervals.
        # Corresponds to the JSON property `orderBy`
        # @return [String]
        attr_accessor :order_by
      
        # Only get facet values that start with the given string prefix. For example,
        # suppose "category" has three values "Action > 2022", "Action > 2021" and "Sci-
        # Fi > 2022". If set "prefixes" to "Action", the "category" facet only contains "
        # Action > 2022" and "Action > 2021". Only supported on textual fields. Maximum
        # is 10.
        # Corresponds to the JSON property `prefixes`
        # @return [Array<String>]
        attr_accessor :prefixes
      
        # Only get facet for the given restricted values. Only supported on textual
        # fields. For example, suppose "category" has three values "Action > 2022", "
        # Action > 2021" and "Sci-Fi > 2022". If set "restricted_values" to "Action >
        # 2022", the "category" facet only contains "Action > 2022". Only supported on
        # textual fields. Maximum is 10.
        # Corresponds to the JSON property `restrictedValues`
        # @return [Array<String>]
        attr_accessor :restricted_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_insensitive = args[:case_insensitive] if args.key?(:case_insensitive)
          @contains = args[:contains] if args.key?(:contains)
          @intervals = args[:intervals] if args.key?(:intervals)
          @key = args[:key] if args.key?(:key)
          @order_by = args[:order_by] if args.key?(:order_by)
          @prefixes = args[:prefixes] if args.key?(:prefixes)
          @restricted_values = args[:restricted_values] if args.key?(:restricted_values)
        end
      end
      
      # Specifies the image query input.
      class GoogleCloudDiscoveryengineV1betaSearchRequestImageQuery
        include Google::Apis::Core::Hashable
      
        # Base64 encoded image bytes. Supported image formats: JPEG, PNG, and BMP.
        # Corresponds to the JSON property `imageBytes`
        # @return [String]
        attr_accessor :image_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_bytes = args[:image_bytes] if args.key?(:image_bytes)
        end
      end
      
      # Specification to enable natural language understanding capabilities for search
      # requests.
      class GoogleCloudDiscoveryengineV1betaSearchRequestNaturalLanguageQueryUnderstandingSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which filter extraction should occur. Default to Condition.
        # DISABLED.
        # Corresponds to the JSON property `filterExtractionCondition`
        # @return [String]
        attr_accessor :filter_extraction_condition
      
        # Field names used for location-based filtering, where geolocation filters are
        # detected in natural language search queries. Only valid when the
        # FilterExtractionCondition is set to `ENABLED`. If this field is set, it
        # overrides the field names set in ServingConfig.
        # geo_search_query_detection_field_names.
        # Corresponds to the JSON property `geoSearchQueryDetectionFieldNames`
        # @return [Array<String>]
        attr_accessor :geo_search_query_detection_field_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter_extraction_condition = args[:filter_extraction_condition] if args.key?(:filter_extraction_condition)
          @geo_search_query_detection_field_names = args[:geo_search_query_detection_field_names] if args.key?(:geo_search_query_detection_field_names)
        end
      end
      
      # The specification for personalization.
      class GoogleCloudDiscoveryengineV1betaSearchRequestPersonalizationSpec
        include Google::Apis::Core::Hashable
      
        # The personalization mode of the search request. Defaults to Mode.AUTO.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Specification to determine under which conditions query expansion should occur.
      class GoogleCloudDiscoveryengineV1betaSearchRequestQueryExpansionSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which query expansion should occur. Default to Condition.
        # DISABLED.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        # Whether to pin unexpanded results. If this field is set to true, unexpanded
        # products are always at the top of the search results, followed by the expanded
        # results.
        # Corresponds to the JSON property `pinUnexpandedResults`
        # @return [Boolean]
        attr_accessor :pin_unexpanded_results
        alias_method :pin_unexpanded_results?, :pin_unexpanded_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @pin_unexpanded_results = args[:pin_unexpanded_results] if args.key?(:pin_unexpanded_results)
        end
      end
      
      # Specification for search as you type in search requests.
      class GoogleCloudDiscoveryengineV1betaSearchRequestSearchAsYouTypeSpec
        include Google::Apis::Core::Hashable
      
        # The condition under which search as you type should occur. Default to
        # Condition.DISABLED.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
        end
      end
      
      # Session specification. Multi-turn Search feature is currently at private GA
      # stage. Please use v1alpha or v1beta version instead before we launch this
      # feature to public GA. Or ask for allowlisting through Google Support team.
      class GoogleCloudDiscoveryengineV1betaSearchRequestSessionSpec
        include Google::Apis::Core::Hashable
      
        # If set, the search result gets stored to the "turn" specified by this query ID.
        # Example: Let's say the session looks like this: session ` name: ".../sessions/
        # xxx" turns ` query ` text: "What is foo?" query_id: ".../questions/yyy" `
        # answer: "Foo is ..." ` turns ` query ` text: "How about bar then?" query_id: ".
        # ../questions/zzz" ` ` ` The user can call /search API with a request like this:
        # session: ".../sessions/xxx" session_spec ` query_id: ".../questions/zzz" `
        # Then, the API stores the search result, associated with the last turn. The
        # stored search result can be used by a subsequent /answer API call (with the
        # session ID and the query ID specified). Also, it is possible to call /search
        # and /answer in parallel with the same session ID & query ID.
        # Corresponds to the JSON property `queryId`
        # @return [String]
        attr_accessor :query_id
      
        # The number of top search results to persist. The persisted search results can
        # be used for the subsequent /answer api call. This field is simliar to the `
        # summary_result_count` field in SearchRequest.ContentSearchSpec.SummarySpec.
        # summary_result_count. At most 10 results for documents mode, or 50 for chunks
        # mode.
        # Corresponds to the JSON property `searchResultPersistenceCount`
        # @return [Fixnum]
        attr_accessor :search_result_persistence_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_id = args[:query_id] if args.key?(:query_id)
          @search_result_persistence_count = args[:search_result_persistence_count] if args.key?(:search_result_persistence_count)
        end
      end
      
      # The specification for query spell correction.
      class GoogleCloudDiscoveryengineV1betaSearchRequestSpellCorrectionSpec
        include Google::Apis::Core::Hashable
      
        # The mode under which spell correction replaces the original search query.
        # Defaults to Mode.AUTO.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Metadata for single-regional CMEKs.
      class GoogleCloudDiscoveryengineV1betaSingleRegionKey
        include Google::Apis::Core::Hashable
      
        # Required. Single-regional kms key resource name which will be used to encrypt
        # resources `projects/`project`/locations/`location`/keyRings/`keyRing`/
        # cryptoKeys/`keyId``.
        # Corresponds to the JSON property `kmsKey`
        # @return [String]
        attr_accessor :kms_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kms_key = args[:kms_key] if args.key?(:kms_key)
        end
      end
      
      # Verification information for target sites in advanced site search.
      class GoogleCloudDiscoveryengineV1betaSiteVerificationInfo
        include Google::Apis::Core::Hashable
      
        # Site verification state indicating the ownership and validity.
        # Corresponds to the JSON property `siteVerificationState`
        # @return [String]
        attr_accessor :site_verification_state
      
        # Latest site verification time.
        # Corresponds to the JSON property `verifyTime`
        # @return [String]
        attr_accessor :verify_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @site_verification_state = args[:site_verification_state] if args.key?(:site_verification_state)
          @verify_time = args[:verify_time] if args.key?(:verify_time)
        end
      end
      
      # A sitemap for the SiteSearchEngine.
      class GoogleCloudDiscoveryengineV1betaSitemap
        include Google::Apis::Core::Hashable
      
        # Output only. The sitemap's creation time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The fully qualified resource name of the sitemap. `projects/*/
        # locations/*/collections/*/dataStores/*/siteSearchEngine/sitemaps/*` The `
        # sitemap_id` suffix is system-generated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Public URI for the sitemap, e.g. `www.example.com/sitemap.xml`.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # A target site for the SiteSearchEngine.
      class GoogleCloudDiscoveryengineV1betaTargetSite
        include Google::Apis::Core::Hashable
      
        # Input only. If set to false, a uri_pattern is generated to include all pages
        # whose address contains the provided_uri_pattern. If set to true, an
        # uri_pattern is generated to try to be an exact match of the
        # provided_uri_pattern or just the specific page if the provided_uri_pattern is
        # a specific one. provided_uri_pattern is always normalized to generate the URI
        # pattern to be used by the search engine.
        # Corresponds to the JSON property `exactMatch`
        # @return [Boolean]
        attr_accessor :exact_match
        alias_method :exact_match?, :exact_match
      
        # Site search indexing failure reasons.
        # Corresponds to the JSON property `failureReason`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaTargetSiteFailureReason]
        attr_accessor :failure_reason
      
        # Output only. This is system-generated based on the provided_uri_pattern.
        # Corresponds to the JSON property `generatedUriPattern`
        # @return [String]
        attr_accessor :generated_uri_pattern
      
        # Output only. Indexing status.
        # Corresponds to the JSON property `indexingStatus`
        # @return [String]
        attr_accessor :indexing_status
      
        # Output only. The fully qualified resource name of the target site. `projects/`
        # project`/locations/`location`/collections/`collection`/dataStores/`data_store`/
        # siteSearchEngine/targetSites/`target_site`` The `target_site_id` is system-
        # generated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. Input only. The user provided URI pattern from which the `
        # generated_uri_pattern` is generated.
        # Corresponds to the JSON property `providedUriPattern`
        # @return [String]
        attr_accessor :provided_uri_pattern
      
        # Output only. Root domain of the provided_uri_pattern.
        # Corresponds to the JSON property `rootDomainUri`
        # @return [String]
        attr_accessor :root_domain_uri
      
        # Verification information for target sites in advanced site search.
        # Corresponds to the JSON property `siteVerificationInfo`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaSiteVerificationInfo]
        attr_accessor :site_verification_info
      
        # The type of the target site, e.g., whether the site is to be included or
        # excluded.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Output only. The target site's last updated time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exact_match = args[:exact_match] if args.key?(:exact_match)
          @failure_reason = args[:failure_reason] if args.key?(:failure_reason)
          @generated_uri_pattern = args[:generated_uri_pattern] if args.key?(:generated_uri_pattern)
          @indexing_status = args[:indexing_status] if args.key?(:indexing_status)
          @name = args[:name] if args.key?(:name)
          @provided_uri_pattern = args[:provided_uri_pattern] if args.key?(:provided_uri_pattern)
          @root_domain_uri = args[:root_domain_uri] if args.key?(:root_domain_uri)
          @site_verification_info = args[:site_verification_info] if args.key?(:site_verification_info)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Site search indexing failure reasons.
      class GoogleCloudDiscoveryengineV1betaTargetSiteFailureReason
        include Google::Apis::Core::Hashable
      
        # Failed due to insufficient quota.
        # Corresponds to the JSON property `quotaFailure`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaTargetSiteFailureReasonQuotaFailure]
        attr_accessor :quota_failure
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quota_failure = args[:quota_failure] if args.key?(:quota_failure)
        end
      end
      
      # Failed due to insufficient quota.
      class GoogleCloudDiscoveryengineV1betaTargetSiteFailureReasonQuotaFailure
        include Google::Apis::Core::Hashable
      
        # This number is an estimation on how much total quota this project needs to
        # successfully complete indexing.
        # Corresponds to the JSON property `totalRequiredQuota`
        # @return [Fixnum]
        attr_accessor :total_required_quota
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @total_required_quota = args[:total_required_quota] if args.key?(:total_required_quota)
        end
      end
      
      # Metadata related to the progress of the TrainCustomModel operation. This is
      # returned by the google.longrunning.Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaTrainCustomModelMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response of the TrainCustomModelRequest. This message is returned by the
      # google.longrunning.Operations.response field.
      class GoogleCloudDiscoveryengineV1betaTrainCustomModelResponse
        include Google::Apis::Core::Hashable
      
        # Configuration of destination for Import related errors.
        # Corresponds to the JSON property `errorConfig`
        # @return [Google::Apis::DiscoveryengineV1::GoogleCloudDiscoveryengineV1betaImportErrorConfig]
        attr_accessor :error_config
      
        # A sample of errors encountered while processing the data.
        # Corresponds to the JSON property `errorSamples`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleRpcStatus>]
        attr_accessor :error_samples
      
        # The metrics of the trained model.
        # Corresponds to the JSON property `metrics`
        # @return [Hash<String,Float>]
        attr_accessor :metrics
      
        # Fully qualified name of the CustomTuningModel.
        # Corresponds to the JSON property `modelName`
        # @return [String]
        attr_accessor :model_name
      
        # The trained model status. Possible values are: * **bad-data**: The training
        # data quality is bad. * **no-improvement**: Tuning didn't improve performance.
        # Won't deploy. * **in-progress**: Model training job creation is in progress. *
        # **training**: Model is actively training. * **evaluating**: The model is
        # evaluating trained metrics. * **indexing**: The model trained metrics are
        # indexing. * **ready**: The model is ready for serving.
        # Corresponds to the JSON property `modelStatus`
        # @return [String]
        attr_accessor :model_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_config = args[:error_config] if args.key?(:error_config)
          @error_samples = args[:error_samples] if args.key?(:error_samples)
          @metrics = args[:metrics] if args.key?(:metrics)
          @model_name = args[:model_name] if args.key?(:model_name)
          @model_status = args[:model_status] if args.key?(:model_status)
        end
      end
      
      # Metadata associated with a tune operation.
      class GoogleCloudDiscoveryengineV1betaTuneEngineMetadata
        include Google::Apis::Core::Hashable
      
        # Required. The resource name of the engine that this tune applies to. Format: `
        # projects/`project`/locations/`location`/collections/`collection_id`/engines/`
        # engine_id``
        # Corresponds to the JSON property `engine`
        # @return [String]
        attr_accessor :engine
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @engine = args[:engine] if args.key?(:engine)
        end
      end
      
      # Response associated with a tune operation.
      class GoogleCloudDiscoveryengineV1betaTuneEngineResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata for UpdateSchema LRO.
      class GoogleCloudDiscoveryengineV1betaUpdateSchemaMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata related to the progress of the SiteSearchEngineService.
      # UpdateTargetSite operation. This will be returned by the google.longrunning.
      # Operation.metadata field.
      class GoogleCloudDiscoveryengineV1betaUpdateTargetSiteMetadata
        include Google::Apis::Core::Hashable
      
        # Operation create time.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Operation last update time. If the operation is done, this is also the finish
        # time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Information of an end user.
      class GoogleCloudDiscoveryengineV1betaUserInfo
        include Google::Apis::Core::Hashable
      
        # User agent as included in the HTTP header. The field must be a UTF-8 encoded
        # string with a length limit of 1,000 characters. Otherwise, an `
        # INVALID_ARGUMENT` error is returned. This should not be set when using the
        # client side event reporting with GTM or JavaScript tag in UserEventService.
        # CollectUserEvent or if UserEvent.direct_user_request is set.
        # Corresponds to the JSON property `userAgent`
        # @return [String]
        attr_accessor :user_agent
      
        # Highly recommended for logged-in users. Unique identifier for logged-in user,
        # such as a user name. Don't set for anonymous users. Always use a hashed value
        # for this ID. Don't set the field to the same fixed ID for different users.
        # This mixes the event history of those users together, which results in
        # degraded model quality. The field must be a UTF-8 encoded string with a length
        # limit of 128 characters. Otherwise, an `INVALID_ARGUMENT` error is returned.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @user_agent = args[:user_agent] if args.key?(:user_agent)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # Config to store data store type configuration for workspace data
      class GoogleCloudDiscoveryengineV1betaWorkspaceConfig
        include Google::Apis::Core::Hashable
      
        # Obfuscated Dasher customer ID.
        # Corresponds to the JSON property `dasherCustomerId`
        # @return [String]
        attr_accessor :dasher_customer_id
      
        # Optional. The super admin email address for the workspace that will be used
        # for access token generation. For now we only use it for Native Google Drive
        # connector data ingestion.
        # Corresponds to the JSON property `superAdminEmailAddress`
        # @return [String]
        attr_accessor :super_admin_email_address
      
        # Optional. The super admin service account for the workspace that will be used
        # for access token generation. For now we only use it for Native Google Drive
        # connector data ingestion.
        # Corresponds to the JSON property `superAdminServiceAccount`
        # @return [String]
        attr_accessor :super_admin_service_account
      
        # The Google Workspace data source.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dasher_customer_id = args[:dasher_customer_id] if args.key?(:dasher_customer_id)
          @super_admin_email_address = args[:super_admin_email_address] if args.key?(:super_admin_email_address)
          @super_admin_service_account = args[:super_admin_service_account] if args.key?(:super_admin_service_account)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The request message for Operations.CancelOperation.
      class GoogleLongrunningCancelOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The response message for Operations.ListOperations.
      class GoogleLongrunningListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleLongrunningOperation>]
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
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class GoogleLongrunningOperation
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
        # @return [Google::Apis::DiscoveryengineV1::GoogleRpcStatus]
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
      
      # A single data point in a time series.
      class GoogleMonitoringV3Point
        include Google::Apis::Core::Hashable
      
        # A time interval extending just after a start time through an end time. If the
        # start time is the same as the end time, then the interval represents a single
        # point in time.
        # Corresponds to the JSON property `interval`
        # @return [Google::Apis::DiscoveryengineV1::GoogleMonitoringV3TimeInterval]
        attr_accessor :interval
      
        # A single strongly-typed value.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::DiscoveryengineV1::GoogleMonitoringV3TypedValue]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @interval = args[:interval] if args.key?(:interval)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A time interval extending just after a start time through an end time. If the
      # start time is the same as the end time, then the interval represents a single
      # point in time.
      class GoogleMonitoringV3TimeInterval
        include Google::Apis::Core::Hashable
      
        # Required. The end of the time interval.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional. The beginning of the time interval. The default value for the start
        # time is the end time. The start time must not be later than the end time.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A collection of data points that describes the time-varying values of a metric.
      # A time series is identified by a combination of a fully-specified monitored
      # resource and a fully-specified metric. This type is used for both listing and
      # creating time series.
      class GoogleMonitoringV3TimeSeries
        include Google::Apis::Core::Hashable
      
        # Input only. A detailed description of the time series that will be associated
        # with the google.api.MetricDescriptor for the metric. Once set, this field
        # cannot be changed through CreateTimeSeries.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Auxiliary metadata for a MonitoredResource object. MonitoredResource objects
        # contain the minimum set of information to uniquely identify a monitored
        # resource instance. There is some other useful auxiliary metadata. Monitoring
        # and Logging use an ingestion pipeline to extract metadata for cloud resources
        # of all types, and store the metadata in this message.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiMonitoredResourceMetadata]
        attr_accessor :metadata
      
        # A specific metric, identified by specifying values for all of the labels of a `
        # MetricDescriptor`.
        # Corresponds to the JSON property `metric`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiMetric]
        attr_accessor :metric
      
        # The metric kind of the time series. When listing time series, this metric kind
        # might be different from the metric kind of the associated metric if this time
        # series is an alignment or reduction of other time series. When creating a time
        # series, this field is optional. If present, it must be the same as the metric
        # kind of the associated metric. If the associated metric's descriptor must be
        # auto-created, then this field specifies the metric kind of the new descriptor
        # and must be either `GAUGE` (the default) or `CUMULATIVE`.
        # Corresponds to the JSON property `metricKind`
        # @return [String]
        attr_accessor :metric_kind
      
        # The data points of this time series. When listing time series, points are
        # returned in reverse time order. When creating a time series, this field must
        # contain exactly one point and the point's type must be the same as the value
        # type of the associated metric. If the associated metric's descriptor must be
        # auto-created, then the value type of the descriptor is determined by the point'
        # s type, which must be `BOOL`, `INT64`, `DOUBLE`, or `DISTRIBUTION`.
        # Corresponds to the JSON property `points`
        # @return [Array<Google::Apis::DiscoveryengineV1::GoogleMonitoringV3Point>]
        attr_accessor :points
      
        # An object representing a resource that can be used for monitoring, logging,
        # billing, or other purposes. Examples include virtual machine instances,
        # databases, and storage devices such as disks. The `type` field identifies a
        # MonitoredResourceDescriptor object that describes the resource's schema.
        # Information in the `labels` field identifies the actual resource and its
        # attributes according to the schema. For example, a particular Compute Engine
        # VM instance could be represented by the following object, because the
        # MonitoredResourceDescriptor for `"gce_instance"` has labels `"project_id"`, `"
        # instance_id"` and `"zone"`: ` "type": "gce_instance", "labels": ` "project_id":
        # "my-project", "instance_id": "12345678901234", "zone": "us-central1-a" ``
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiMonitoredResource]
        attr_accessor :resource
      
        # The units in which the metric value is reported. It is only applicable if the `
        # value_type` is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The `unit` defines the
        # representation of the stored metric values. This field can only be changed
        # through CreateTimeSeries when it is empty.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # The value type of the time series. When listing time series, this value type
        # might be different from the value type of the associated metric if this time
        # series is an alignment or reduction of other time series. When creating a time
        # series, this field is optional. If present, it must be the same as the type of
        # the data in the `points` field.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @metadata = args[:metadata] if args.key?(:metadata)
          @metric = args[:metric] if args.key?(:metric)
          @metric_kind = args[:metric_kind] if args.key?(:metric_kind)
          @points = args[:points] if args.key?(:points)
          @resource = args[:resource] if args.key?(:resource)
          @unit = args[:unit] if args.key?(:unit)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # A single strongly-typed value.
      class GoogleMonitoringV3TypedValue
        include Google::Apis::Core::Hashable
      
        # A Boolean value: `true` or `false`.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # `Distribution` contains summary statistics for a population of values. It
        # optionally contains a histogram representing the distribution of those values
        # across a set of buckets. The summary statistics are the count, mean, sum of
        # the squared deviation from the mean, the minimum, and the maximum of the set
        # of population of values. The histogram is based on a sequence of buckets and
        # gives a count of values that fall into each bucket. The boundaries of the
        # buckets are given either explicitly or by formulas for buckets of fixed or
        # exponentially increasing widths. Although it is not forbidden, it is generally
        # a bad idea to include non-finite values (infinities or NaNs) in the population
        # of values, as this will render the `mean` and `sum_of_squared_deviation`
        # fields meaningless.
        # Corresponds to the JSON property `distributionValue`
        # @return [Google::Apis::DiscoveryengineV1::GoogleApiDistribution]
        attr_accessor :distribution_value
      
        # A 64-bit double-precision floating-point number. Its magnitude is
        # approximately ±10±300 and it has 16 significant digits of precision.
        # Corresponds to the JSON property `doubleValue`
        # @return [Float]
        attr_accessor :double_value
      
        # A 64-bit integer. Its range is approximately ±9.2x1018.
        # Corresponds to the JSON property `int64Value`
        # @return [Fixnum]
        attr_accessor :int64_value
      
        # A variable-length string value.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @distribution_value = args[:distribution_value] if args.key?(:distribution_value)
          @double_value = args[:double_value] if args.key?(:double_value)
          @int64_value = args[:int64_value] if args.key?(:int64_value)
          @string_value = args[:string_value] if args.key?(:string_value)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance: service Foo ` rpc Bar(google.
      # protobuf.Empty) returns (google.protobuf.Empty); `
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by [
      # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
      # data: error code, error message, and error details. You can find out more
      # about this error model and how to work with it in the [API Design Guide](https:
      # //cloud.google.com/apis/design/errors).
      class GoogleRpcStatus
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
      
      # Represents a whole or partial calendar date, such as a birthday. The time of
      # day and time zone are either specified elsewhere or are insignificant. The
      # date is relative to the Gregorian Calendar. This can represent one of the
      # following: * A full date, with non-zero year, month, and day values. * A month
      # and day, with a zero year (for example, an anniversary). * A year on its own,
      # with a zero month and a zero day. * A year and month, with a zero day (for
      # example, a credit card expiration date). Related types: * google.type.
      # TimeOfDay * google.type.DateTime * google.protobuf.Timestamp
      class GoogleTypeDate
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
      
      # Represents civil time (or occasionally physical time). This type can represent
      # a civil time in one of a few possible ways: * When utc_offset is set and
      # time_zone is unset: a civil time on a calendar day with a particular offset
      # from UTC. * When time_zone is set and utc_offset is unset: a civil time on a
      # calendar day in a particular time zone. * When neither time_zone nor
      # utc_offset is set: a civil time on a calendar day in local time. The date is
      # relative to the Proleptic Gregorian Calendar. If year, month, or day are 0,
      # the DateTime is considered not to have a specific year, month, or day
      # respectively. This type may also be used to represent a physical time if all
      # the date and time fields are set and either case of the `time_offset` oneof is
      # set. Consider using `Timestamp` message for physical time instead. If your use
      # case also would like to store the user's timezone, that can be done in another
      # field. This type is more flexible than some applications may want. Make sure
      # to document and validate your application's limitations.
      class GoogleTypeDateTime
        include Google::Apis::Core::Hashable
      
        # Optional. Day of month. Must be from 1 to 31 and valid for the year and month,
        # or 0 if specifying a datetime without a day.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Optional. Hours of day in 24 hour format. Should be from 0 to 23, defaults to
        # 0 (midnight). An API may choose to allow the value "24:00:00" for scenarios
        # like business closing time.
        # Corresponds to the JSON property `hours`
        # @return [Fixnum]
        attr_accessor :hours
      
        # Optional. Minutes of hour of day. Must be from 0 to 59, defaults to 0.
        # Corresponds to the JSON property `minutes`
        # @return [Fixnum]
        attr_accessor :minutes
      
        # Optional. Month of year. Must be from 1 to 12, or 0 if specifying a datetime
        # without a month.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Optional. Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999,
        # defaults to 0.
        # Corresponds to the JSON property `nanos`
        # @return [Fixnum]
        attr_accessor :nanos
      
        # Optional. Seconds of minutes of the time. Must normally be from 0 to 59,
        # defaults to 0. An API may allow the value 60 if it allows leap-seconds.
        # Corresponds to the JSON property `seconds`
        # @return [Fixnum]
        attr_accessor :seconds
      
        # Represents a time zone from the [IANA Time Zone Database](https://www.iana.org/
        # time-zones).
        # Corresponds to the JSON property `timeZone`
        # @return [Google::Apis::DiscoveryengineV1::GoogleTypeTimeZone]
        attr_accessor :time_zone
      
        # UTC offset. Must be whole seconds, between -18 hours and +18 hours. For
        # example, a UTC offset of -4:00 would be represented as ` seconds: -14400 `.
        # Corresponds to the JSON property `utcOffset`
        # @return [String]
        attr_accessor :utc_offset
      
        # Optional. Year of date. Must be from 1 to 9999, or 0 if specifying a datetime
        # without a year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @hours = args[:hours] if args.key?(:hours)
          @minutes = args[:minutes] if args.key?(:minutes)
          @month = args[:month] if args.key?(:month)
          @nanos = args[:nanos] if args.key?(:nanos)
          @seconds = args[:seconds] if args.key?(:seconds)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
          @utc_offset = args[:utc_offset] if args.key?(:utc_offset)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # Represents a time zone from the [IANA Time Zone Database](https://www.iana.org/
      # time-zones).
      class GoogleTypeTimeZone
        include Google::Apis::Core::Hashable
      
        # IANA Time Zone Database time zone. For example "America/New_York".
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Optional. IANA Time Zone Database version number. For example "2019a".
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @version = args[:version] if args.key?(:version)
        end
      end
    end
  end
end
