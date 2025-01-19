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
    module GkehubV2alpha
      
      class AppDevExperienceState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppDevExperienceStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CancelOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudBuildSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterUpgradeGkeUpgrade
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterUpgradeIgnoredMembership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterUpgradeMembershipGkeUpgradeState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterUpgradeState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClusterUpgradeUpgradeStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementBinauthzConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementBinauthzState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementBinauthzVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementConfigSync
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementConfigSyncDeploymentState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementConfigSyncError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementConfigSyncState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementConfigSyncVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementErrorResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementGatekeeperDeploymentState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementGitConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementGroupVersionKind
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementHierarchyControllerConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementHierarchyControllerDeploymentState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementHierarchyControllerState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementHierarchyControllerVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementInstallError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementOciConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementOperatorState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementPolicyController
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementPolicyControllerMigration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementPolicyControllerMonitoring
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementPolicyControllerState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementPolicyControllerVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementSyncError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigManagementSyncState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleRpcStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceAuthMethod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceAzureAdConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceDiagnosticInterface
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceGoogleConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceGroupConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceIdentityServiceOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceLdapConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceOidcConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceSamlConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceServerConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceServiceAccountConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceSimpleBindCredentials
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentityServiceUserConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LifecycleState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMembershipFeaturesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MembershipFeature
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MeteringState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Origin
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerBundleInstallSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerHubConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerMonitoringConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerOnClusterState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerPolicyContentSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerPolicyContentState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerPolicyControllerDeploymentConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerResourceList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerResourceRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerTemplateLibraryConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyControllerToleration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshAnalysisMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshAnalysisMessageBase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshControlPlaneManagement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshDataPlaneManagement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshStatusDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceMeshType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class State
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkloadCertificateSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppDevExperienceState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :networking_install_succeeded, as: 'networkingInstallSucceeded', class: Google::Apis::GkehubV2alpha::AppDevExperienceStatus, decorator: Google::Apis::GkehubV2alpha::AppDevExperienceStatus::Representation
      
        end
      end
      
      class AppDevExperienceStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :description, as: 'description'
        end
      end
      
      class CancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class CloudBuildSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :security_policy, as: 'securityPolicy'
          property :version, as: 'version'
        end
      end
      
      class ClusterUpgradeGkeUpgrade
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :version, as: 'version'
        end
      end
      
      class ClusterUpgradeIgnoredMembership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ignored_time, as: 'ignoredTime'
          property :reason, as: 'reason'
        end
      end
      
      class ClusterUpgradeMembershipGkeUpgradeState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :status, as: 'status', class: Google::Apis::GkehubV2alpha::ClusterUpgradeUpgradeStatus, decorator: Google::Apis::GkehubV2alpha::ClusterUpgradeUpgradeStatus::Representation
      
          property :upgrade, as: 'upgrade', class: Google::Apis::GkehubV2alpha::ClusterUpgradeGkeUpgrade, decorator: Google::Apis::GkehubV2alpha::ClusterUpgradeGkeUpgrade::Representation
      
        end
      end
      
      class ClusterUpgradeState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ignored, as: 'ignored', class: Google::Apis::GkehubV2alpha::ClusterUpgradeIgnoredMembership, decorator: Google::Apis::GkehubV2alpha::ClusterUpgradeIgnoredMembership::Representation
      
          collection :upgrades, as: 'upgrades', class: Google::Apis::GkehubV2alpha::ClusterUpgradeMembershipGkeUpgradeState, decorator: Google::Apis::GkehubV2alpha::ClusterUpgradeMembershipGkeUpgradeState::Representation
      
        end
      end
      
      class ClusterUpgradeUpgradeStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :reason, as: 'reason'
          property :update_time, as: 'updateTime'
        end
      end
      
      class ConfigManagementBinauthzConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
        end
      end
      
      class ConfigManagementBinauthzState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :version, as: 'version', class: Google::Apis::GkehubV2alpha::ConfigManagementBinauthzVersion, decorator: Google::Apis::GkehubV2alpha::ConfigManagementBinauthzVersion::Representation
      
          property :webhook, as: 'webhook'
        end
      end
      
      class ConfigManagementBinauthzVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :webhook_version, as: 'webhookVersion'
        end
      end
      
      class ConfigManagementConfigSync
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
          property :git, as: 'git', class: Google::Apis::GkehubV2alpha::ConfigManagementGitConfig, decorator: Google::Apis::GkehubV2alpha::ConfigManagementGitConfig::Representation
      
          property :metrics_gcp_service_account_email, as: 'metricsGcpServiceAccountEmail'
          property :oci, as: 'oci', class: Google::Apis::GkehubV2alpha::ConfigManagementOciConfig, decorator: Google::Apis::GkehubV2alpha::ConfigManagementOciConfig::Representation
      
          property :prevent_drift, as: 'preventDrift'
          property :source_format, as: 'sourceFormat'
          property :stop_syncing, as: 'stopSyncing'
        end
      end
      
      class ConfigManagementConfigSyncDeploymentState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :admission_webhook, as: 'admissionWebhook'
          property :git_sync, as: 'gitSync'
          property :importer, as: 'importer'
          property :monitor, as: 'monitor'
          property :otel_collector, as: 'otelCollector'
          property :reconciler_manager, as: 'reconcilerManager'
          property :resource_group_controller_manager, as: 'resourceGroupControllerManager'
          property :root_reconciler, as: 'rootReconciler'
          property :syncer, as: 'syncer'
        end
      end
      
      class ConfigManagementConfigSyncError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_message, as: 'errorMessage'
        end
      end
      
      class ConfigManagementConfigSyncState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cluster_level_stop_syncing_state, as: 'clusterLevelStopSyncingState'
          property :cr_count, as: 'crCount'
          property :deployment_state, as: 'deploymentState', class: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncDeploymentState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncDeploymentState::Representation
      
          collection :errors, as: 'errors', class: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncError, decorator: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncError::Representation
      
          property :reposync_crd, as: 'reposyncCrd'
          property :rootsync_crd, as: 'rootsyncCrd'
          property :state, as: 'state'
          property :sync_state, as: 'syncState', class: Google::Apis::GkehubV2alpha::ConfigManagementSyncState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementSyncState::Representation
      
          property :version, as: 'version', class: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncVersion, decorator: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncVersion::Representation
      
        end
      end
      
      class ConfigManagementConfigSyncVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :admission_webhook, as: 'admissionWebhook'
          property :git_sync, as: 'gitSync'
          property :importer, as: 'importer'
          property :monitor, as: 'monitor'
          property :otel_collector, as: 'otelCollector'
          property :reconciler_manager, as: 'reconcilerManager'
          property :resource_group_controller_manager, as: 'resourceGroupControllerManager'
          property :root_reconciler, as: 'rootReconciler'
          property :syncer, as: 'syncer'
        end
      end
      
      class ConfigManagementErrorResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_gvk, as: 'resourceGvk', class: Google::Apis::GkehubV2alpha::ConfigManagementGroupVersionKind, decorator: Google::Apis::GkehubV2alpha::ConfigManagementGroupVersionKind::Representation
      
          property :resource_name, as: 'resourceName'
          property :resource_namespace, as: 'resourceNamespace'
          property :source_path, as: 'sourcePath'
        end
      end
      
      class ConfigManagementGatekeeperDeploymentState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gatekeeper_audit, as: 'gatekeeperAudit'
          property :gatekeeper_controller_manager_state, as: 'gatekeeperControllerManagerState'
          property :gatekeeper_mutation, as: 'gatekeeperMutation'
        end
      end
      
      class ConfigManagementGitConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcp_service_account_email, as: 'gcpServiceAccountEmail'
          property :https_proxy, as: 'httpsProxy'
          property :policy_dir, as: 'policyDir'
          property :secret_type, as: 'secretType'
          property :sync_branch, as: 'syncBranch'
          property :sync_repo, as: 'syncRepo'
          property :sync_rev, as: 'syncRev'
          property :sync_wait_secs, :numeric_string => true, as: 'syncWaitSecs'
        end
      end
      
      class ConfigManagementGroupVersionKind
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :group, as: 'group'
          property :kind, as: 'kind'
          property :version, as: 'version'
        end
      end
      
      class ConfigManagementHierarchyControllerConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_hierarchical_resource_quota, as: 'enableHierarchicalResourceQuota'
          property :enable_pod_tree_labels, as: 'enablePodTreeLabels'
          property :enabled, as: 'enabled'
        end
      end
      
      class ConfigManagementHierarchyControllerDeploymentState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :extension, as: 'extension'
          property :hnc, as: 'hnc'
        end
      end
      
      class ConfigManagementHierarchyControllerState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state, as: 'state', class: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerDeploymentState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerDeploymentState::Representation
      
          property :version, as: 'version', class: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerVersion, decorator: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerVersion::Representation
      
        end
      end
      
      class ConfigManagementHierarchyControllerVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :extension, as: 'extension'
          property :hnc, as: 'hnc'
        end
      end
      
      class ConfigManagementInstallError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_message, as: 'errorMessage'
        end
      end
      
      class ConfigManagementOciConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gcp_service_account_email, as: 'gcpServiceAccountEmail'
          property :policy_dir, as: 'policyDir'
          property :secret_type, as: 'secretType'
          property :sync_repo, as: 'syncRepo'
          property :sync_wait_secs, :numeric_string => true, as: 'syncWaitSecs'
        end
      end
      
      class ConfigManagementOperatorState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment_state, as: 'deploymentState'
          collection :errors, as: 'errors', class: Google::Apis::GkehubV2alpha::ConfigManagementInstallError, decorator: Google::Apis::GkehubV2alpha::ConfigManagementInstallError::Representation
      
          property :version, as: 'version'
        end
      end
      
      class ConfigManagementPolicyController
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audit_interval_seconds, :numeric_string => true, as: 'auditIntervalSeconds'
          property :enabled, as: 'enabled'
          collection :exemptable_namespaces, as: 'exemptableNamespaces'
          property :log_denies_enabled, as: 'logDeniesEnabled'
          property :monitoring, as: 'monitoring', class: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerMonitoring, decorator: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerMonitoring::Representation
      
          property :mutation_enabled, as: 'mutationEnabled'
          property :referential_rules_enabled, as: 'referentialRulesEnabled'
          property :template_library_installed, as: 'templateLibraryInstalled'
          property :update_time, as: 'updateTime'
        end
      end
      
      class ConfigManagementPolicyControllerMigration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :copy_time, as: 'copyTime'
          property :stage, as: 'stage'
        end
      end
      
      class ConfigManagementPolicyControllerMonitoring
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :backends, as: 'backends'
        end
      end
      
      class ConfigManagementPolicyControllerState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment_state, as: 'deploymentState', class: Google::Apis::GkehubV2alpha::ConfigManagementGatekeeperDeploymentState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementGatekeeperDeploymentState::Representation
      
          property :migration, as: 'migration', class: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerMigration, decorator: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerMigration::Representation
      
          property :version, as: 'version', class: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerVersion, decorator: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerVersion::Representation
      
        end
      end
      
      class ConfigManagementPolicyControllerVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :version, as: 'version'
        end
      end
      
      class ConfigManagementSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binauthz, as: 'binauthz', class: Google::Apis::GkehubV2alpha::ConfigManagementBinauthzConfig, decorator: Google::Apis::GkehubV2alpha::ConfigManagementBinauthzConfig::Representation
      
          property :cluster, as: 'cluster'
          property :config_sync, as: 'configSync', class: Google::Apis::GkehubV2alpha::ConfigManagementConfigSync, decorator: Google::Apis::GkehubV2alpha::ConfigManagementConfigSync::Representation
      
          property :hierarchy_controller, as: 'hierarchyController', class: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerConfig, decorator: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerConfig::Representation
      
          property :management, as: 'management'
          property :policy_controller, as: 'policyController', class: Google::Apis::GkehubV2alpha::ConfigManagementPolicyController, decorator: Google::Apis::GkehubV2alpha::ConfigManagementPolicyController::Representation
      
          property :version, as: 'version'
        end
      end
      
      class ConfigManagementState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binauthz_state, as: 'binauthzState', class: Google::Apis::GkehubV2alpha::ConfigManagementBinauthzState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementBinauthzState::Representation
      
          property :cluster_name, as: 'clusterName'
          property :config_sync_state, as: 'configSyncState', class: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementConfigSyncState::Representation
      
          property :hierarchy_controller_state, as: 'hierarchyControllerState', class: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementHierarchyControllerState::Representation
      
          property :membership_spec, as: 'membershipSpec', class: Google::Apis::GkehubV2alpha::ConfigManagementSpec, decorator: Google::Apis::GkehubV2alpha::ConfigManagementSpec::Representation
      
          property :operator_state, as: 'operatorState', class: Google::Apis::GkehubV2alpha::ConfigManagementOperatorState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementOperatorState::Representation
      
          property :policy_controller_state, as: 'policyControllerState', class: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementPolicyControllerState::Representation
      
        end
      end
      
      class ConfigManagementSyncError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :error_message, as: 'errorMessage'
          collection :error_resources, as: 'errorResources', class: Google::Apis::GkehubV2alpha::ConfigManagementErrorResource, decorator: Google::Apis::GkehubV2alpha::ConfigManagementErrorResource::Representation
      
        end
      end
      
      class ConfigManagementSyncState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :errors, as: 'errors', class: Google::Apis::GkehubV2alpha::ConfigManagementSyncError, decorator: Google::Apis::GkehubV2alpha::ConfigManagementSyncError::Representation
      
          property :import_token, as: 'importToken'
          property :last_sync, as: 'lastSync'
          property :last_sync_time, as: 'lastSyncTime'
          property :source_token, as: 'sourceToken'
          property :sync_token, as: 'syncToken'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FeatureSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloudbuild, as: 'cloudbuild', class: Google::Apis::GkehubV2alpha::CloudBuildSpec, decorator: Google::Apis::GkehubV2alpha::CloudBuildSpec::Representation
      
          property :configmanagement, as: 'configmanagement', class: Google::Apis::GkehubV2alpha::ConfigManagementSpec, decorator: Google::Apis::GkehubV2alpha::ConfigManagementSpec::Representation
      
          property :identityservice, as: 'identityservice', class: Google::Apis::GkehubV2alpha::IdentityServiceSpec, decorator: Google::Apis::GkehubV2alpha::IdentityServiceSpec::Representation
      
          property :origin, as: 'origin', class: Google::Apis::GkehubV2alpha::Origin, decorator: Google::Apis::GkehubV2alpha::Origin::Representation
      
          property :policycontroller, as: 'policycontroller', class: Google::Apis::GkehubV2alpha::PolicyControllerSpec, decorator: Google::Apis::GkehubV2alpha::PolicyControllerSpec::Representation
      
          property :servicemesh, as: 'servicemesh', class: Google::Apis::GkehubV2alpha::ServiceMeshSpec, decorator: Google::Apis::GkehubV2alpha::ServiceMeshSpec::Representation
      
          property :workloadcertificate, as: 'workloadcertificate', class: Google::Apis::GkehubV2alpha::WorkloadCertificateSpec, decorator: Google::Apis::GkehubV2alpha::WorkloadCertificateSpec::Representation
      
        end
      end
      
      class FeatureState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :appdevexperience, as: 'appdevexperience', class: Google::Apis::GkehubV2alpha::AppDevExperienceState, decorator: Google::Apis::GkehubV2alpha::AppDevExperienceState::Representation
      
          property :clusterupgrade, as: 'clusterupgrade', class: Google::Apis::GkehubV2alpha::ClusterUpgradeState, decorator: Google::Apis::GkehubV2alpha::ClusterUpgradeState::Representation
      
          property :configmanagement, as: 'configmanagement', class: Google::Apis::GkehubV2alpha::ConfigManagementState, decorator: Google::Apis::GkehubV2alpha::ConfigManagementState::Representation
      
          property :identityservice, as: 'identityservice', class: Google::Apis::GkehubV2alpha::IdentityServiceState, decorator: Google::Apis::GkehubV2alpha::IdentityServiceState::Representation
      
          property :metering, as: 'metering', class: Google::Apis::GkehubV2alpha::MeteringState, decorator: Google::Apis::GkehubV2alpha::MeteringState::Representation
      
          property :policycontroller, as: 'policycontroller', class: Google::Apis::GkehubV2alpha::PolicyControllerState, decorator: Google::Apis::GkehubV2alpha::PolicyControllerState::Representation
      
          property :servicemesh, as: 'servicemesh', class: Google::Apis::GkehubV2alpha::ServiceMeshState, decorator: Google::Apis::GkehubV2alpha::ServiceMeshState::Representation
      
          property :state, as: 'state', class: Google::Apis::GkehubV2alpha::State, decorator: Google::Apis::GkehubV2alpha::State::Representation
      
        end
      end
      
      class GoogleRpcStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class IdentityServiceAuthMethod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :azuread_config, as: 'azureadConfig', class: Google::Apis::GkehubV2alpha::IdentityServiceAzureAdConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceAzureAdConfig::Representation
      
          property :google_config, as: 'googleConfig', class: Google::Apis::GkehubV2alpha::IdentityServiceGoogleConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceGoogleConfig::Representation
      
          property :ldap_config, as: 'ldapConfig', class: Google::Apis::GkehubV2alpha::IdentityServiceLdapConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceLdapConfig::Representation
      
          property :name, as: 'name'
          property :oidc_config, as: 'oidcConfig', class: Google::Apis::GkehubV2alpha::IdentityServiceOidcConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceOidcConfig::Representation
      
          property :proxy, as: 'proxy'
          property :saml_config, as: 'samlConfig', class: Google::Apis::GkehubV2alpha::IdentityServiceSamlConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceSamlConfig::Representation
      
        end
      end
      
      class IdentityServiceAzureAdConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          property :client_secret, as: 'clientSecret'
          property :encrypted_client_secret, :base64 => true, as: 'encryptedClientSecret'
          property :group_format, as: 'groupFormat'
          property :kubectl_redirect_uri, as: 'kubectlRedirectUri'
          property :tenant, as: 'tenant'
          property :user_claim, as: 'userClaim'
        end
      end
      
      class IdentityServiceDiagnosticInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
          property :expiration_time, as: 'expirationTime'
        end
      end
      
      class IdentityServiceGoogleConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable, as: 'disable'
        end
      end
      
      class IdentityServiceGroupConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_dn, as: 'baseDn'
          property :filter, as: 'filter'
          property :id_attribute, as: 'idAttribute'
        end
      end
      
      class IdentityServiceIdentityServiceOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :diagnostic_interface, as: 'diagnosticInterface', class: Google::Apis::GkehubV2alpha::IdentityServiceDiagnosticInterface, decorator: Google::Apis::GkehubV2alpha::IdentityServiceDiagnosticInterface::Representation
      
          property :session_duration, as: 'sessionDuration'
        end
      end
      
      class IdentityServiceLdapConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :group, as: 'group', class: Google::Apis::GkehubV2alpha::IdentityServiceGroupConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceGroupConfig::Representation
      
          property :server, as: 'server', class: Google::Apis::GkehubV2alpha::IdentityServiceServerConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceServerConfig::Representation
      
          property :service_account, as: 'serviceAccount', class: Google::Apis::GkehubV2alpha::IdentityServiceServiceAccountConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceServiceAccountConfig::Representation
      
          property :user, as: 'user', class: Google::Apis::GkehubV2alpha::IdentityServiceUserConfig, decorator: Google::Apis::GkehubV2alpha::IdentityServiceUserConfig::Representation
      
        end
      end
      
      class IdentityServiceOidcConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_authority_data, as: 'certificateAuthorityData'
          property :client_id, as: 'clientId'
          property :client_secret, as: 'clientSecret'
          property :deploy_cloud_console_proxy, as: 'deployCloudConsoleProxy'
          property :enable_access_token, as: 'enableAccessToken'
          property :encrypted_client_secret, :base64 => true, as: 'encryptedClientSecret'
          property :extra_params, as: 'extraParams'
          property :group_prefix, as: 'groupPrefix'
          property :groups_claim, as: 'groupsClaim'
          property :issuer_uri, as: 'issuerUri'
          property :kubectl_redirect_uri, as: 'kubectlRedirectUri'
          property :scopes, as: 'scopes'
          property :user_claim, as: 'userClaim'
          property :user_prefix, as: 'userPrefix'
        end
      end
      
      class IdentityServiceSamlConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attribute_mapping, as: 'attributeMapping'
          property :group_prefix, as: 'groupPrefix'
          property :groups_attribute, as: 'groupsAttribute'
          collection :identity_provider_certificates, as: 'identityProviderCertificates'
          property :identity_provider_id, as: 'identityProviderId'
          property :identity_provider_sso_uri, as: 'identityProviderSsoUri'
          property :user_attribute, as: 'userAttribute'
          property :user_prefix, as: 'userPrefix'
        end
      end
      
      class IdentityServiceServerConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_authority_data, :base64 => true, as: 'certificateAuthorityData'
          property :connection_type, as: 'connectionType'
          property :host, as: 'host'
        end
      end
      
      class IdentityServiceServiceAccountConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :simple_bind_credentials, as: 'simpleBindCredentials', class: Google::Apis::GkehubV2alpha::IdentityServiceSimpleBindCredentials, decorator: Google::Apis::GkehubV2alpha::IdentityServiceSimpleBindCredentials::Representation
      
        end
      end
      
      class IdentityServiceSimpleBindCredentials
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dn, as: 'dn'
          property :encrypted_password, :base64 => true, as: 'encryptedPassword'
          property :password, as: 'password'
        end
      end
      
      class IdentityServiceSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auth_methods, as: 'authMethods', class: Google::Apis::GkehubV2alpha::IdentityServiceAuthMethod, decorator: Google::Apis::GkehubV2alpha::IdentityServiceAuthMethod::Representation
      
          property :identity_service_options, as: 'identityServiceOptions', class: Google::Apis::GkehubV2alpha::IdentityServiceIdentityServiceOptions, decorator: Google::Apis::GkehubV2alpha::IdentityServiceIdentityServiceOptions::Representation
      
        end
      end
      
      class IdentityServiceState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :failure_reason, as: 'failureReason'
          property :installed_version, as: 'installedVersion'
          property :member_config, as: 'memberConfig', class: Google::Apis::GkehubV2alpha::IdentityServiceSpec, decorator: Google::Apis::GkehubV2alpha::IdentityServiceSpec::Representation
      
          property :state, as: 'state'
        end
      end
      
      class IdentityServiceUserConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_dn, as: 'baseDn'
          property :filter, as: 'filter'
          property :id_attribute, as: 'idAttribute'
          property :login_attribute, as: 'loginAttribute'
        end
      end
      
      class LifecycleState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state, as: 'state'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::GkehubV2alpha::Location, decorator: Google::Apis::GkehubV2alpha::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListMembershipFeaturesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :membership_features, as: 'membershipFeatures', class: Google::Apis::GkehubV2alpha::MembershipFeature, decorator: Google::Apis::GkehubV2alpha::MembershipFeature::Representation
      
          property :next_page_token, as: 'nextPageToken'
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::GkehubV2alpha::Operation, decorator: Google::Apis::GkehubV2alpha::Operation::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class MembershipFeature
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :delete_time, as: 'deleteTime'
          hash :labels, as: 'labels'
          property :lifecycle_state, as: 'lifecycleState', class: Google::Apis::GkehubV2alpha::LifecycleState, decorator: Google::Apis::GkehubV2alpha::LifecycleState::Representation
      
          property :name, as: 'name'
          property :spec, as: 'spec', class: Google::Apis::GkehubV2alpha::FeatureSpec, decorator: Google::Apis::GkehubV2alpha::FeatureSpec::Representation
      
          property :state, as: 'state', class: Google::Apis::GkehubV2alpha::FeatureState, decorator: Google::Apis::GkehubV2alpha::FeatureState::Representation
      
          property :update_time, as: 'updateTime'
        end
      end
      
      class MeteringState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_measurement_time, as: 'lastMeasurementTime'
          property :precise_last_measured_cluster_vcpu_capacity, as: 'preciseLastMeasuredClusterVcpuCapacity'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::GkehubV2alpha::GoogleRpcStatus, decorator: Google::Apis::GkehubV2alpha::GoogleRpcStatus::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :cancel_requested, as: 'cancelRequested'
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          property :status_detail, as: 'statusDetail'
          property :target, as: 'target'
          property :verb, as: 'verb'
        end
      end
      
      class Origin
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class PolicyControllerBundleInstallSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_namespaces, as: 'exemptedNamespaces'
        end
      end
      
      class PolicyControllerHubConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audit_interval_seconds, :numeric_string => true, as: 'auditIntervalSeconds'
          property :constraint_violation_limit, :numeric_string => true, as: 'constraintViolationLimit'
          hash :deployment_configs, as: 'deploymentConfigs', class: Google::Apis::GkehubV2alpha::PolicyControllerPolicyControllerDeploymentConfig, decorator: Google::Apis::GkehubV2alpha::PolicyControllerPolicyControllerDeploymentConfig::Representation
      
          collection :exemptable_namespaces, as: 'exemptableNamespaces'
          property :install_spec, as: 'installSpec'
          property :log_denies_enabled, as: 'logDeniesEnabled'
          property :monitoring, as: 'monitoring', class: Google::Apis::GkehubV2alpha::PolicyControllerMonitoringConfig, decorator: Google::Apis::GkehubV2alpha::PolicyControllerMonitoringConfig::Representation
      
          property :mutation_enabled, as: 'mutationEnabled'
          property :policy_content, as: 'policyContent', class: Google::Apis::GkehubV2alpha::PolicyControllerPolicyContentSpec, decorator: Google::Apis::GkehubV2alpha::PolicyControllerPolicyContentSpec::Representation
      
          property :referential_rules_enabled, as: 'referentialRulesEnabled'
        end
      end
      
      class PolicyControllerMonitoringConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :backends, as: 'backends'
        end
      end
      
      class PolicyControllerOnClusterState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :details, as: 'details'
          property :state, as: 'state'
        end
      end
      
      class PolicyControllerPolicyContentSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :bundles, as: 'bundles', class: Google::Apis::GkehubV2alpha::PolicyControllerBundleInstallSpec, decorator: Google::Apis::GkehubV2alpha::PolicyControllerBundleInstallSpec::Representation
      
          property :template_library, as: 'templateLibrary', class: Google::Apis::GkehubV2alpha::PolicyControllerTemplateLibraryConfig, decorator: Google::Apis::GkehubV2alpha::PolicyControllerTemplateLibraryConfig::Representation
      
        end
      end
      
      class PolicyControllerPolicyContentState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :bundle_states, as: 'bundleStates', class: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState, decorator: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState::Representation
      
          property :referential_sync_config_state, as: 'referentialSyncConfigState', class: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState, decorator: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState::Representation
      
          property :template_library_state, as: 'templateLibraryState', class: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState, decorator: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState::Representation
      
        end
      end
      
      class PolicyControllerPolicyControllerDeploymentConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_resources, as: 'containerResources', class: Google::Apis::GkehubV2alpha::PolicyControllerResourceRequirements, decorator: Google::Apis::GkehubV2alpha::PolicyControllerResourceRequirements::Representation
      
          property :pod_affinity, as: 'podAffinity'
          property :pod_anti_affinity, as: 'podAntiAffinity'
          collection :pod_tolerations, as: 'podTolerations', class: Google::Apis::GkehubV2alpha::PolicyControllerToleration, decorator: Google::Apis::GkehubV2alpha::PolicyControllerToleration::Representation
      
          property :replica_count, :numeric_string => true, as: 'replicaCount'
        end
      end
      
      class PolicyControllerResourceList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpu, as: 'cpu'
          property :memory, as: 'memory'
        end
      end
      
      class PolicyControllerResourceRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :limits, as: 'limits', class: Google::Apis::GkehubV2alpha::PolicyControllerResourceList, decorator: Google::Apis::GkehubV2alpha::PolicyControllerResourceList::Representation
      
          property :requests, as: 'requests', class: Google::Apis::GkehubV2alpha::PolicyControllerResourceList, decorator: Google::Apis::GkehubV2alpha::PolicyControllerResourceList::Representation
      
        end
      end
      
      class PolicyControllerSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy_controller_hub_config, as: 'policyControllerHubConfig', class: Google::Apis::GkehubV2alpha::PolicyControllerHubConfig, decorator: Google::Apis::GkehubV2alpha::PolicyControllerHubConfig::Representation
      
          property :version, as: 'version'
        end
      end
      
      class PolicyControllerState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :component_states, as: 'componentStates', class: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState, decorator: Google::Apis::GkehubV2alpha::PolicyControllerOnClusterState::Representation
      
          property :policy_content_state, as: 'policyContentState', class: Google::Apis::GkehubV2alpha::PolicyControllerPolicyContentState, decorator: Google::Apis::GkehubV2alpha::PolicyControllerPolicyContentState::Representation
      
          property :state, as: 'state'
        end
      end
      
      class PolicyControllerTemplateLibraryConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :installation, as: 'installation'
        end
      end
      
      class PolicyControllerToleration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :effect, as: 'effect'
          property :key, as: 'key'
          property :operator, as: 'operator'
          property :value, as: 'value'
        end
      end
      
      class ServiceMeshAnalysisMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :args, as: 'args'
          property :description, as: 'description'
          property :message_base, as: 'messageBase', class: Google::Apis::GkehubV2alpha::ServiceMeshAnalysisMessageBase, decorator: Google::Apis::GkehubV2alpha::ServiceMeshAnalysisMessageBase::Representation
      
          collection :resource_paths, as: 'resourcePaths'
        end
      end
      
      class ServiceMeshAnalysisMessageBase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :documentation_url, as: 'documentationUrl'
          property :level, as: 'level'
          property :type, as: 'type', class: Google::Apis::GkehubV2alpha::ServiceMeshType, decorator: Google::Apis::GkehubV2alpha::ServiceMeshType::Representation
      
        end
      end
      
      class ServiceMeshCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :details, as: 'details'
          property :documentation_link, as: 'documentationLink'
          property :severity, as: 'severity'
        end
      end
      
      class ServiceMeshControlPlaneManagement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :details, as: 'details', class: Google::Apis::GkehubV2alpha::ServiceMeshStatusDetails, decorator: Google::Apis::GkehubV2alpha::ServiceMeshStatusDetails::Representation
      
          property :implementation, as: 'implementation'
          property :state, as: 'state'
        end
      end
      
      class ServiceMeshDataPlaneManagement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :details, as: 'details', class: Google::Apis::GkehubV2alpha::ServiceMeshStatusDetails, decorator: Google::Apis::GkehubV2alpha::ServiceMeshStatusDetails::Representation
      
          property :state, as: 'state'
        end
      end
      
      class ServiceMeshSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_api, as: 'configApi'
          property :control_plane, as: 'controlPlane'
          property :default_channel, as: 'defaultChannel'
          property :management, as: 'management'
        end
      end
      
      class ServiceMeshState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :analysis_messages, as: 'analysisMessages', class: Google::Apis::GkehubV2alpha::ServiceMeshAnalysisMessage, decorator: Google::Apis::GkehubV2alpha::ServiceMeshAnalysisMessage::Representation
      
          collection :conditions, as: 'conditions', class: Google::Apis::GkehubV2alpha::ServiceMeshCondition, decorator: Google::Apis::GkehubV2alpha::ServiceMeshCondition::Representation
      
          property :config_api_version, as: 'configApiVersion'
          property :control_plane_management, as: 'controlPlaneManagement', class: Google::Apis::GkehubV2alpha::ServiceMeshControlPlaneManagement, decorator: Google::Apis::GkehubV2alpha::ServiceMeshControlPlaneManagement::Representation
      
          property :data_plane_management, as: 'dataPlaneManagement', class: Google::Apis::GkehubV2alpha::ServiceMeshDataPlaneManagement, decorator: Google::Apis::GkehubV2alpha::ServiceMeshDataPlaneManagement::Representation
      
        end
      end
      
      class ServiceMeshStatusDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :details, as: 'details'
        end
      end
      
      class ServiceMeshType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :display_name, as: 'displayName'
        end
      end
      
      class State
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :description, as: 'description'
          property :update_time, as: 'updateTime'
        end
      end
      
      class WorkloadCertificateSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_management, as: 'certificateManagement'
        end
      end
    end
  end
end
