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
    module JobsV3
      
      class ApplicationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDeleteJobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketizedCount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClientEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommuteFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommuteInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Company
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompanyDerivedInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationHistogramRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationHistogramResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompensationRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompleteQueryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompletionResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateClientEventRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateCompanyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttribute
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttributeHistogramRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAttributeHistogramResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistogramFacets
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistogramResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HistogramResults
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobDerivedInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JobQuery
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LatLng
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCompaniesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MatchingJob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Money
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NumericBucketingOption
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NumericBucketingResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProcessingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResponseMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchJobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpellingCorrection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeOfDay
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimestampRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateCompanyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateJobRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :emails, as: 'emails'
          property :instruction, as: 'instruction'
          collection :uris, as: 'uris'
        end
      end
      
      class BatchDeleteJobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
        end
      end
      
      class BucketRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :from, as: 'from'
          property :to, as: 'to'
        end
      end
      
      class BucketizedCount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, as: 'count'
          property :range, as: 'range', class: Google::Apis::JobsV3::BucketRange, decorator: Google::Apis::JobsV3::BucketRange::Representation
      
        end
      end
      
      class ClientEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :event_id, as: 'eventId'
          hash :extra_info, as: 'extraInfo'
          property :job_event, as: 'jobEvent', class: Google::Apis::JobsV3::JobEvent, decorator: Google::Apis::JobsV3::JobEvent::Representation
      
          property :parent_event_id, as: 'parentEventId'
          property :request_id, as: 'requestId'
        end
      end
      
      class CommuteFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_imprecise_addresses, as: 'allowImpreciseAddresses'
          property :commute_method, as: 'commuteMethod'
          property :departure_time, as: 'departureTime', class: Google::Apis::JobsV3::TimeOfDay, decorator: Google::Apis::JobsV3::TimeOfDay::Representation
      
          property :road_traffic, as: 'roadTraffic'
          property :start_coordinates, as: 'startCoordinates', class: Google::Apis::JobsV3::LatLng, decorator: Google::Apis::JobsV3::LatLng::Representation
      
          property :travel_duration, as: 'travelDuration'
        end
      end
      
      class CommuteInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job_location, as: 'jobLocation', class: Google::Apis::JobsV3::Location, decorator: Google::Apis::JobsV3::Location::Representation
      
          property :travel_duration, as: 'travelDuration'
        end
      end
      
      class Company
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :career_site_uri, as: 'careerSiteUri'
          property :derived_info, as: 'derivedInfo', class: Google::Apis::JobsV3::CompanyDerivedInfo, decorator: Google::Apis::JobsV3::CompanyDerivedInfo::Representation
      
          property :display_name, as: 'displayName'
          property :eeo_text, as: 'eeoText'
          property :external_id, as: 'externalId'
          property :headquarters_address, as: 'headquartersAddress'
          property :hiring_agency, as: 'hiringAgency'
          property :image_uri, as: 'imageUri'
          collection :keyword_searchable_job_custom_attributes, as: 'keywordSearchableJobCustomAttributes'
          property :name, as: 'name'
          property :size, as: 'size'
          property :suspended, as: 'suspended'
          property :website_uri, as: 'websiteUri'
        end
      end
      
      class CompanyDerivedInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :headquarters_location, as: 'headquartersLocation', class: Google::Apis::JobsV3::Location, decorator: Google::Apis::JobsV3::Location::Representation
      
        end
      end
      
      class CompensationEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount', class: Google::Apis::JobsV3::Money, decorator: Google::Apis::JobsV3::Money::Representation
      
          property :description, as: 'description'
          property :expected_units_per_year, as: 'expectedUnitsPerYear'
          property :range, as: 'range', class: Google::Apis::JobsV3::CompensationRange, decorator: Google::Apis::JobsV3::CompensationRange::Representation
      
          property :type, as: 'type'
          property :unit, as: 'unit'
        end
      end
      
      class CompensationFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :include_jobs_with_unspecified_compensation_range, as: 'includeJobsWithUnspecifiedCompensationRange'
          property :range, as: 'range', class: Google::Apis::JobsV3::CompensationRange, decorator: Google::Apis::JobsV3::CompensationRange::Representation
      
          property :type, as: 'type'
          collection :units, as: 'units'
        end
      end
      
      class CompensationHistogramRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucketing_option, as: 'bucketingOption', class: Google::Apis::JobsV3::NumericBucketingOption, decorator: Google::Apis::JobsV3::NumericBucketingOption::Representation
      
          property :type, as: 'type'
        end
      end
      
      class CompensationHistogramResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::JobsV3::NumericBucketingResult, decorator: Google::Apis::JobsV3::NumericBucketingResult::Representation
      
          property :type, as: 'type'
        end
      end
      
      class CompensationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annualized_base_compensation_range, as: 'annualizedBaseCompensationRange', class: Google::Apis::JobsV3::CompensationRange, decorator: Google::Apis::JobsV3::CompensationRange::Representation
      
          property :annualized_total_compensation_range, as: 'annualizedTotalCompensationRange', class: Google::Apis::JobsV3::CompensationRange, decorator: Google::Apis::JobsV3::CompensationRange::Representation
      
          collection :entries, as: 'entries', class: Google::Apis::JobsV3::CompensationEntry, decorator: Google::Apis::JobsV3::CompensationEntry::Representation
      
        end
      end
      
      class CompensationRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_compensation, as: 'maxCompensation', class: Google::Apis::JobsV3::Money, decorator: Google::Apis::JobsV3::Money::Representation
      
          property :min_compensation, as: 'minCompensation', class: Google::Apis::JobsV3::Money, decorator: Google::Apis::JobsV3::Money::Representation
      
        end
      end
      
      class CompleteQueryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :completion_results, as: 'completionResults', class: Google::Apis::JobsV3::CompletionResult, decorator: Google::Apis::JobsV3::CompletionResult::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV3::ResponseMetadata, decorator: Google::Apis::JobsV3::ResponseMetadata::Representation
      
        end
      end
      
      class CompletionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_uri, as: 'imageUri'
          property :suggestion, as: 'suggestion'
          property :type, as: 'type'
        end
      end
      
      class CreateClientEventRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_event, as: 'clientEvent', class: Google::Apis::JobsV3::ClientEvent, decorator: Google::Apis::JobsV3::ClientEvent::Representation
      
        end
      end
      
      class CreateCompanyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :company, as: 'company', class: Google::Apis::JobsV3::Company, decorator: Google::Apis::JobsV3::Company::Representation
      
        end
      end
      
      class CreateJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job, as: 'job', class: Google::Apis::JobsV3::Job, decorator: Google::Apis::JobsV3::Job::Representation
      
        end
      end
      
      class CustomAttribute
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filterable, as: 'filterable'
          collection :long_values, as: 'longValues'
          collection :string_values, as: 'stringValues'
        end
      end
      
      class CustomAttributeHistogramRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :long_value_histogram_bucketing_option, as: 'longValueHistogramBucketingOption', class: Google::Apis::JobsV3::NumericBucketingOption, decorator: Google::Apis::JobsV3::NumericBucketingOption::Representation
      
          property :string_value_histogram, as: 'stringValueHistogram'
        end
      end
      
      class CustomAttributeHistogramResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :long_value_histogram_result, as: 'longValueHistogramResult', class: Google::Apis::JobsV3::NumericBucketingResult, decorator: Google::Apis::JobsV3::NumericBucketingResult::Representation
      
          hash :string_value_histogram_result, as: 'stringValueHistogramResult'
        end
      end
      
      class DeviceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_type, as: 'deviceType'
          property :id, as: 'id'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class HistogramFacets
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :compensation_histogram_facets, as: 'compensationHistogramFacets', class: Google::Apis::JobsV3::CompensationHistogramRequest, decorator: Google::Apis::JobsV3::CompensationHistogramRequest::Representation
      
          collection :custom_attribute_histogram_facets, as: 'customAttributeHistogramFacets', class: Google::Apis::JobsV3::CustomAttributeHistogramRequest, decorator: Google::Apis::JobsV3::CustomAttributeHistogramRequest::Representation
      
          collection :simple_histogram_facets, as: 'simpleHistogramFacets'
        end
      end
      
      class HistogramResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :search_type, as: 'searchType'
          hash :values, as: 'values'
        end
      end
      
      class HistogramResults
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :compensation_histogram_results, as: 'compensationHistogramResults', class: Google::Apis::JobsV3::CompensationHistogramResult, decorator: Google::Apis::JobsV3::CompensationHistogramResult::Representation
      
          collection :custom_attribute_histogram_results, as: 'customAttributeHistogramResults', class: Google::Apis::JobsV3::CustomAttributeHistogramResult, decorator: Google::Apis::JobsV3::CustomAttributeHistogramResult::Representation
      
          collection :simple_histogram_results, as: 'simpleHistogramResults', class: Google::Apis::JobsV3::HistogramResult, decorator: Google::Apis::JobsV3::HistogramResult::Representation
      
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :addresses, as: 'addresses'
          property :application_info, as: 'applicationInfo', class: Google::Apis::JobsV3::ApplicationInfo, decorator: Google::Apis::JobsV3::ApplicationInfo::Representation
      
          property :company_display_name, as: 'companyDisplayName'
          property :company_name, as: 'companyName'
          property :compensation_info, as: 'compensationInfo', class: Google::Apis::JobsV3::CompensationInfo, decorator: Google::Apis::JobsV3::CompensationInfo::Representation
      
          hash :custom_attributes, as: 'customAttributes', class: Google::Apis::JobsV3::CustomAttribute, decorator: Google::Apis::JobsV3::CustomAttribute::Representation
      
          collection :degree_types, as: 'degreeTypes'
          property :department, as: 'department'
          property :derived_info, as: 'derivedInfo', class: Google::Apis::JobsV3::JobDerivedInfo, decorator: Google::Apis::JobsV3::JobDerivedInfo::Representation
      
          property :description, as: 'description'
          collection :employment_types, as: 'employmentTypes'
          property :incentives, as: 'incentives'
          collection :job_benefits, as: 'jobBenefits'
          property :job_end_time, as: 'jobEndTime'
          property :job_level, as: 'jobLevel'
          property :job_start_time, as: 'jobStartTime'
          property :language_code, as: 'languageCode'
          property :name, as: 'name'
          property :posting_create_time, as: 'postingCreateTime'
          property :posting_expire_time, as: 'postingExpireTime'
          property :posting_publish_time, as: 'postingPublishTime'
          property :posting_region, as: 'postingRegion'
          property :posting_update_time, as: 'postingUpdateTime'
          property :processing_options, as: 'processingOptions', class: Google::Apis::JobsV3::ProcessingOptions, decorator: Google::Apis::JobsV3::ProcessingOptions::Representation
      
          property :promotion_value, as: 'promotionValue'
          property :qualifications, as: 'qualifications'
          property :requisition_id, as: 'requisitionId'
          property :responsibilities, as: 'responsibilities'
          property :title, as: 'title'
          property :visibility, as: 'visibility'
        end
      end
      
      class JobDerivedInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :job_categories, as: 'jobCategories'
          collection :locations, as: 'locations', class: Google::Apis::JobsV3::Location, decorator: Google::Apis::JobsV3::Location::Representation
      
        end
      end
      
      class JobEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs'
          property :type, as: 'type'
        end
      end
      
      class JobQuery
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commute_filter, as: 'commuteFilter', class: Google::Apis::JobsV3::CommuteFilter, decorator: Google::Apis::JobsV3::CommuteFilter::Representation
      
          collection :company_display_names, as: 'companyDisplayNames'
          collection :company_names, as: 'companyNames'
          property :compensation_filter, as: 'compensationFilter', class: Google::Apis::JobsV3::CompensationFilter, decorator: Google::Apis::JobsV3::CompensationFilter::Representation
      
          property :custom_attribute_filter, as: 'customAttributeFilter'
          property :disable_spell_check, as: 'disableSpellCheck'
          collection :employment_types, as: 'employmentTypes'
          collection :job_categories, as: 'jobCategories'
          collection :language_codes, as: 'languageCodes'
          collection :location_filters, as: 'locationFilters', class: Google::Apis::JobsV3::LocationFilter, decorator: Google::Apis::JobsV3::LocationFilter::Representation
      
          property :publish_time_range, as: 'publishTimeRange', class: Google::Apis::JobsV3::TimestampRange, decorator: Google::Apis::JobsV3::TimestampRange::Representation
      
          property :query, as: 'query'
          property :query_language_code, as: 'queryLanguageCode'
        end
      end
      
      class LatLng
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
      
      class ListCompaniesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :companies, as: 'companies', class: Google::Apis::JobsV3::Company, decorator: Google::Apis::JobsV3::Company::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV3::ResponseMetadata, decorator: Google::Apis::JobsV3::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::JobsV3::Job, decorator: Google::Apis::JobsV3::Job::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV3::ResponseMetadata, decorator: Google::Apis::JobsV3::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lat_lng, as: 'latLng', class: Google::Apis::JobsV3::LatLng, decorator: Google::Apis::JobsV3::LatLng::Representation
      
          property :location_type, as: 'locationType'
          property :postal_address, as: 'postalAddress', class: Google::Apis::JobsV3::PostalAddress, decorator: Google::Apis::JobsV3::PostalAddress::Representation
      
          property :radius_in_miles, as: 'radiusInMiles'
        end
      end
      
      class LocationFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :distance_in_miles, as: 'distanceInMiles'
          property :lat_lng, as: 'latLng', class: Google::Apis::JobsV3::LatLng, decorator: Google::Apis::JobsV3::LatLng::Representation
      
          property :region_code, as: 'regionCode'
          property :telecommute_preference, as: 'telecommutePreference'
        end
      end
      
      class MatchingJob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commute_info, as: 'commuteInfo', class: Google::Apis::JobsV3::CommuteInfo, decorator: Google::Apis::JobsV3::CommuteInfo::Representation
      
          property :job, as: 'job', class: Google::Apis::JobsV3::Job, decorator: Google::Apis::JobsV3::Job::Representation
      
          property :job_summary, as: 'jobSummary'
          property :job_title_snippet, as: 'jobTitleSnippet'
          property :search_text_snippet, as: 'searchTextSnippet'
        end
      end
      
      class Money
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency_code, as: 'currencyCode'
          property :nanos, as: 'nanos'
          property :units, :numeric_string => true, as: 'units'
        end
      end
      
      class NumericBucketingOption
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bucket_bounds, as: 'bucketBounds'
          property :requires_min_max, as: 'requiresMinMax'
        end
      end
      
      class NumericBucketingResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :counts, as: 'counts', class: Google::Apis::JobsV3::BucketizedCount, decorator: Google::Apis::JobsV3::BucketizedCount::Representation
      
          property :max_value, as: 'maxValue'
          property :min_value, as: 'minValue'
        end
      end
      
      class PostalAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :address_lines, as: 'addressLines'
          property :administrative_area, as: 'administrativeArea'
          property :language_code, as: 'languageCode'
          property :locality, as: 'locality'
          property :organization, as: 'organization'
          property :postal_code, as: 'postalCode'
          collection :recipients, as: 'recipients'
          property :region_code, as: 'regionCode'
          property :revision, as: 'revision'
          property :sorting_code, as: 'sortingCode'
          property :sublocality, as: 'sublocality'
        end
      end
      
      class ProcessingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_street_address_resolution, as: 'disableStreetAddressResolution'
          property :html_sanitization, as: 'htmlSanitization'
        end
      end
      
      class RequestMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_info, as: 'deviceInfo', class: Google::Apis::JobsV3::DeviceInfo, decorator: Google::Apis::JobsV3::DeviceInfo::Representation
      
          property :domain, as: 'domain'
          property :session_id, as: 'sessionId'
          property :user_id, as: 'userId'
        end
      end
      
      class ResponseMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :request_id, as: 'requestId'
        end
      end
      
      class SearchJobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_keyword_match, as: 'disableKeywordMatch'
          property :diversification_level, as: 'diversificationLevel'
          property :enable_broadening, as: 'enableBroadening'
          property :histogram_facets, as: 'histogramFacets', class: Google::Apis::JobsV3::HistogramFacets, decorator: Google::Apis::JobsV3::HistogramFacets::Representation
      
          property :job_query, as: 'jobQuery', class: Google::Apis::JobsV3::JobQuery, decorator: Google::Apis::JobsV3::JobQuery::Representation
      
          property :job_view, as: 'jobView'
          property :offset, as: 'offset'
          property :order_by, as: 'orderBy'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
          property :request_metadata, as: 'requestMetadata', class: Google::Apis::JobsV3::RequestMetadata, decorator: Google::Apis::JobsV3::RequestMetadata::Representation
      
          property :require_precise_result_size, as: 'requirePreciseResultSize'
          property :search_mode, as: 'searchMode'
        end
      end
      
      class SearchJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :broadened_query_jobs_count, as: 'broadenedQueryJobsCount'
          property :estimated_total_size, as: 'estimatedTotalSize'
          property :histogram_results, as: 'histogramResults', class: Google::Apis::JobsV3::HistogramResults, decorator: Google::Apis::JobsV3::HistogramResults::Representation
      
          collection :location_filters, as: 'locationFilters', class: Google::Apis::JobsV3::Location, decorator: Google::Apis::JobsV3::Location::Representation
      
          collection :matching_jobs, as: 'matchingJobs', class: Google::Apis::JobsV3::MatchingJob, decorator: Google::Apis::JobsV3::MatchingJob::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::JobsV3::ResponseMetadata, decorator: Google::Apis::JobsV3::ResponseMetadata::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :spell_correction, as: 'spellCorrection', class: Google::Apis::JobsV3::SpellingCorrection, decorator: Google::Apis::JobsV3::SpellingCorrection::Representation
      
          property :total_size, as: 'totalSize'
        end
      end
      
      class SpellingCorrection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :corrected, as: 'corrected'
          property :corrected_text, as: 'correctedText'
        end
      end
      
      class TimeOfDay
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hours, as: 'hours'
          property :minutes, as: 'minutes'
          property :nanos, as: 'nanos'
          property :seconds, as: 'seconds'
        end
      end
      
      class TimestampRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class UpdateCompanyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :company, as: 'company', class: Google::Apis::JobsV3::Company, decorator: Google::Apis::JobsV3::Company::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class UpdateJobRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :job, as: 'job', class: Google::Apis::JobsV3::Job, decorator: Google::Apis::JobsV3::Job::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
    end
  end
end
