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
    module TasksV1
      
      class AssignmentInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DriveResourceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SpaceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Task
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Link
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TaskList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TaskLists
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tasks
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AssignmentInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drive_resource_info, as: 'driveResourceInfo', class: Google::Apis::TasksV1::DriveResourceInfo, decorator: Google::Apis::TasksV1::DriveResourceInfo::Representation
      
          property :link_to_task, as: 'linkToTask'
          property :space_info, as: 'spaceInfo', class: Google::Apis::TasksV1::SpaceInfo, decorator: Google::Apis::TasksV1::SpaceInfo::Representation
      
          property :surface_type, as: 'surfaceType'
        end
      end
      
      class DriveResourceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :drive_file_id, as: 'driveFileId'
          property :resource_key, as: 'resourceKey'
        end
      end
      
      class SpaceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :space, as: 'space'
        end
      end
      
      class Task
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :assignment_info, as: 'assignmentInfo', class: Google::Apis::TasksV1::AssignmentInfo, decorator: Google::Apis::TasksV1::AssignmentInfo::Representation
      
          property :completed, as: 'completed'
          property :deleted, as: 'deleted'
          property :due, as: 'due'
          property :etag, as: 'etag'
          property :hidden, as: 'hidden'
          property :id, as: 'id'
          property :kind, as: 'kind'
          collection :links, as: 'links', class: Google::Apis::TasksV1::Task::Link, decorator: Google::Apis::TasksV1::Task::Link::Representation
      
          property :notes, as: 'notes'
          property :parent, as: 'parent'
          property :position, as: 'position'
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :title, as: 'title'
          property :updated, as: 'updated'
          property :web_view_link, as: 'webViewLink'
        end
        
        class Link
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :description, as: 'description'
            property :link, as: 'link'
            property :type, as: 'type'
          end
        end
      end
      
      class TaskList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :updated, as: 'updated'
        end
      end
      
      class TaskLists
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::TasksV1::TaskList, decorator: Google::Apis::TasksV1::TaskList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Tasks
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::TasksV1::Task, decorator: Google::Apis::TasksV1::Task::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
