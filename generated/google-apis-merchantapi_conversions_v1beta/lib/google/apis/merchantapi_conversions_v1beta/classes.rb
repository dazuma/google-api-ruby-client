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
    module MerchantapiConversionsV1beta
      
      # Represents attribution settings for conversion sources receiving pre-
      # attribution data.
      class AttributionSettings
        include Google::Apis::Core::Hashable
      
        # Required. Lookback windows (in days) used for attribution in this source.
        # Supported values are 7, 30, 40.
        # Corresponds to the JSON property `attributionLookbackWindowDays`
        # @return [Fixnum]
        attr_accessor :attribution_lookback_window_days
      
        # Required. Attribution model.
        # Corresponds to the JSON property `attributionModel`
        # @return [String]
        attr_accessor :attribution_model
      
        # Immutable. Unordered list. List of different conversion types a conversion
        # event can be classified as. A standard "purchase" type will be automatically
        # created if this list is empty at creation time.
        # Corresponds to the JSON property `conversionType`
        # @return [Array<Google::Apis::MerchantapiConversionsV1beta::ConversionType>]
        attr_accessor :conversion_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribution_lookback_window_days = args[:attribution_lookback_window_days] if args.key?(:attribution_lookback_window_days)
          @attribution_model = args[:attribution_model] if args.key?(:attribution_model)
          @conversion_type = args[:conversion_type] if args.key?(:conversion_type)
        end
      end
      
      # Represents a conversion source owned by a Merchant account. A merchant account
      # can have up to 200 conversion sources.
      class ConversionSource
        include Google::Apis::Core::Hashable
      
        # Output only. Controller of the conversion source.
        # Corresponds to the JSON property `controller`
        # @return [String]
        attr_accessor :controller
      
        # Output only. The time when an archived conversion source becomes permanently
        # deleted and is no longer available to undelete.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # "Google Analytics Link" sources can be used to get conversion data from an
        # existing Google Analytics property into the linked Merchant Center account.
        # Corresponds to the JSON property `googleAnalyticsLink`
        # @return [Google::Apis::MerchantapiConversionsV1beta::GoogleAnalyticsLink]
        attr_accessor :google_analytics_link
      
        # "Merchant Center Destination" sources can be used to send conversion events
        # from an online store using a Google tag directly to a Merchant Center account
        # where the source is created.
        # Corresponds to the JSON property `merchantCenterDestination`
        # @return [Google::Apis::MerchantapiConversionsV1beta::MerchantCenterDestination]
        attr_accessor :merchant_center_destination
      
        # Output only. Identifier. Generated by the Content API upon creation of a new `
        # ConversionSource`. Format: [a-z]`4`:.+ The four characters before the colon
        # represent the type of conversio source. Content after the colon represents the
        # ID of the conversion source within that type. The ID of two different
        # conversion sources might be the same across different types. The following
        # type prefixes are supported: - galk: For GoogleAnalyticsLink sources. - mcdn:
        # For MerchantCenterDestination sources.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Current state of this conversion source. Can't be edited through
        # the API.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @controller = args[:controller] if args.key?(:controller)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @google_analytics_link = args[:google_analytics_link] if args.key?(:google_analytics_link)
          @merchant_center_destination = args[:merchant_center_destination] if args.key?(:merchant_center_destination)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Message representing a types of conversion events
      class ConversionType
        include Google::Apis::Core::Hashable
      
        # Output only. Conversion event name, as it'll be reported by the client.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. Option indicating if the type should be included in Merchant
        # Center reporting.
        # Corresponds to the JSON property `report`
        # @return [Boolean]
        attr_accessor :report
        alias_method :report?, :report
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @report = args[:report] if args.key?(:report)
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
      
      # "Google Analytics Link" sources can be used to get conversion data from an
      # existing Google Analytics property into the linked Merchant Center account.
      class GoogleAnalyticsLink
        include Google::Apis::Core::Hashable
      
        # Represents attribution settings for conversion sources receiving pre-
        # attribution data.
        # Corresponds to the JSON property `attributionSettings`
        # @return [Google::Apis::MerchantapiConversionsV1beta::AttributionSettings]
        attr_accessor :attribution_settings
      
        # Output only. Name of the Google Analytics property the merchant is linked to.
        # Corresponds to the JSON property `property`
        # @return [String]
        attr_accessor :property
      
        # Required. Immutable. ID of the Google Analytics property the merchant is
        # linked to.
        # Corresponds to the JSON property `propertyId`
        # @return [Fixnum]
        attr_accessor :property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribution_settings = args[:attribution_settings] if args.key?(:attribution_settings)
          @property = args[:property] if args.key?(:property)
          @property_id = args[:property_id] if args.key?(:property_id)
        end
      end
      
      # Response message for the ListConversionSources method.
      class ListConversionSourcesResponse
        include Google::Apis::Core::Hashable
      
        # List of conversion sources.
        # Corresponds to the JSON property `conversionSources`
        # @return [Array<Google::Apis::MerchantapiConversionsV1beta::ConversionSource>]
        attr_accessor :conversion_sources
      
        # Token to be used to fetch the next results page.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversion_sources = args[:conversion_sources] if args.key?(:conversion_sources)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # "Merchant Center Destination" sources can be used to send conversion events
      # from an online store using a Google tag directly to a Merchant Center account
      # where the source is created.
      class MerchantCenterDestination
        include Google::Apis::Core::Hashable
      
        # Represents attribution settings for conversion sources receiving pre-
        # attribution data.
        # Corresponds to the JSON property `attributionSettings`
        # @return [Google::Apis::MerchantapiConversionsV1beta::AttributionSettings]
        attr_accessor :attribution_settings
      
        # Required. Three-letter currency code (ISO 4217). The currency code defines in
        # which currency the conversions sent to this destination will be reported in
        # Merchant Center.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # Output only. Merchant Center Destination ID.
        # Corresponds to the JSON property `destination`
        # @return [String]
        attr_accessor :destination
      
        # Required. Merchant-specified display name for the destination. This is the
        # name that identifies the conversion source within the Merchant Center UI.
        # Limited to 64 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribution_settings = args[:attribution_settings] if args.key?(:attribution_settings)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @destination = args[:destination] if args.key?(:destination)
          @display_name = args[:display_name] if args.key?(:display_name)
        end
      end
      
      # The change that happened to the product including old value, new value,
      # country code as the region code and reporting context.
      class ProductChange
        include Google::Apis::Core::Hashable
      
        # The new value of the changed resource or attribute.
        # Corresponds to the JSON property `newValue`
        # @return [String]
        attr_accessor :new_value
      
        # The old value of the changed resource or attribute.
        # Corresponds to the JSON property `oldValue`
        # @return [String]
        attr_accessor :old_value
      
        # Countries that have the change (if applicable)
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # Reporting contexts that have the change (if applicable)
        # Corresponds to the JSON property `reportingContext`
        # @return [String]
        attr_accessor :reporting_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @new_value = args[:new_value] if args.key?(:new_value)
          @old_value = args[:old_value] if args.key?(:old_value)
          @region_code = args[:region_code] if args.key?(:region_code)
          @reporting_context = args[:reporting_context] if args.key?(:reporting_context)
        end
      end
      
      # The message that the merchant will receive to notify about product status
      # change event
      class ProductStatusChangeMessage
        include Google::Apis::Core::Hashable
      
        # The target account that owns the entity that changed. Format : `accounts/`
        # merchant_id``
        # Corresponds to the JSON property `account`
        # @return [String]
        attr_accessor :account
      
        # The attribute in the resource that changed, in this case it will be always `
        # Status`.
        # Corresponds to the JSON property `attribute`
        # @return [String]
        attr_accessor :attribute
      
        # A message to describe the change that happened to the product
        # Corresponds to the JSON property `changes`
        # @return [Array<Google::Apis::MerchantapiConversionsV1beta::ProductChange>]
        attr_accessor :changes
      
        # The product expiration time. This field will not bet set if the notification
        # is sent for a product deletion event.
        # Corresponds to the JSON property `expirationTime`
        # @return [String]
        attr_accessor :expiration_time
      
        # The account that manages the merchant's account. can be the same as merchant
        # id if it is standalone account. Format : `accounts/`service_provider_id``
        # Corresponds to the JSON property `managingAccount`
        # @return [String]
        attr_accessor :managing_account
      
        # The product name. Format: ``product.name=accounts/`account`/products/`product``
        # `
        # Corresponds to the JSON property `resource`
        # @return [String]
        attr_accessor :resource
      
        # The product id.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # The resource that changed, in this case it will always be `Product`.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account = args[:account] if args.key?(:account)
          @attribute = args[:attribute] if args.key?(:attribute)
          @changes = args[:changes] if args.key?(:changes)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @managing_account = args[:managing_account] if args.key?(:managing_account)
          @resource = args[:resource] if args.key?(:resource)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
        end
      end
      
      # Request message for the UndeleteConversionSource method.
      class UndeleteConversionSourceRequest
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
