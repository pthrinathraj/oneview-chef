#
# Cookbook Name:: oneview_test_api300_synergy_api300_synergy
# Recipe:: sas_logical_interconnect_replace_drive_enclosure
#
# (c) Copyright 2017 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#

oneview_sas_logical_interconnect 'SASLogicalInterconnect-replace_drive_enclosure' do
  client node['oneview_test']['client']
  old_drive_enclosure 'OLD_DRIVE'
  new_drive_enclosure 'NEW_DRIVE'
  action :replace_drive_enclosure
end
