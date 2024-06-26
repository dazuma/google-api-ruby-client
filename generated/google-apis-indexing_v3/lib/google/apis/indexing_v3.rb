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

require 'google/apis/indexing_v3/service.rb'
require 'google/apis/indexing_v3/classes.rb'
require 'google/apis/indexing_v3/representations.rb'
require 'google/apis/indexing_v3/gem_version.rb'

module Google
  module Apis
    # Web Search Indexing API
    #
    # Notifies Google Web Search when your web pages change.
    #
    # @see https://developers.google.com/search/apis/indexing-api/
    module IndexingV3
      # Version of the Web Search Indexing API this client connects to.
      # This is NOT the gem version.
      VERSION = 'V3'

      # Submit data to Google for indexing
      AUTH_INDEXING = 'https://www.googleapis.com/auth/indexing'
    end
  end
end
