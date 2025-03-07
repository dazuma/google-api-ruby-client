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

require 'google/apis/displayvideo_v4/service.rb'
require 'google/apis/displayvideo_v4/classes.rb'
require 'google/apis/displayvideo_v4/representations.rb'
require 'google/apis/displayvideo_v4/gem_version.rb'

module Google
  module Apis
    # Display & Video 360 API
    #
    # Display & Video 360 API allows users to automate complex Display & Video 360
    # workflows, such as creating insertion orders and setting targeting options for
    # individual line items.
    #
    # @see https://developers.google.com/display-video/
    module DisplayvideoV4
      # Version of the Display & Video 360 API this client connects to.
      # This is NOT the gem version.
      VERSION = 'V4'

      # Create, see, edit, and permanently delete your Display & Video 360 entities and reports
      AUTH_DISPLAY_VIDEO = 'https://www.googleapis.com/auth/display-video'

      # Create, see, and edit Display & Video 360 Campaign entities and see billing invoices
      AUTH_DISPLAY_VIDEO_MEDIAPLANNING = 'https://www.googleapis.com/auth/display-video-mediaplanning'

      # Private Service: https://www.googleapis.com/auth/display-video-user-management
      AUTH_DISPLAY_VIDEO_USER_MANAGEMENT = 'https://www.googleapis.com/auth/display-video-user-management'

      # View and manage your reports in DoubleClick Bid Manager
      AUTH_DOUBLECLICKBIDMANAGER = 'https://www.googleapis.com/auth/doubleclickbidmanager'
    end
  end
end
