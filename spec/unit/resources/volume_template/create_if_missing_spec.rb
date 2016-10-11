require_relative './../../../spec_helper'

describe 'oneview_test::volume_template_create_if_missing' do
  let(:resource_name) { 'volume_template' }
  include_context 'chef context'

  it 'creates it when it does not exist' do
    allow_any_instance_of(OneviewSDK::VolumeTemplate).to receive(:exists?).and_return(false)
    allow_any_instance_of(OneviewSDK::VolumeTemplate).to receive(:retrieve!).and_return(false)
    allow(OneviewSDK::StorageSystem).to receive(:find_by).and_return(
      [
        OneviewSDK::StorageSystem.new(client, credentials: { ip_hostname: '172.18.11.11' })
      ]
    )
    allow_any_instance_of(OneviewSDK::StorageSystem).to receive(:exists?).and_return(true)
    allow_any_instance_of(OneviewSDK::StorageSystem).to receive(:retrieve!).and_return(true)
    allow(OneviewSDK::StoragePool).to receive(:find_by)
      .and_return([OneviewSDK::StoragePool.new(client, uri: 'rest/sp1')])
    expect_any_instance_of(OneviewSDK::VolumeTemplate).to receive(:create).and_return(true)
    expect(real_chef_run).to create_oneview_volume_template_if_missing('VolumeTemplate1')
  end

  it 'does nothing when it exists' do
    allow_any_instance_of(OneviewSDK::VolumeTemplate).to receive(:exists?).and_return(true)
    allow_any_instance_of(OneviewSDK::VolumeTemplate).to receive(:retrieve!).and_return(true)
    allow(OneviewSDK::StorageSystem).to receive(:find_by).and_return(
      [
        OneviewSDK::StorageSystem.new(client, credentials: { ip_hostname: '172.18.11.11' })
      ]
    )
    allow_any_instance_of(OneviewSDK::StorageSystem).to receive(:exists?).and_return(true)
    allow_any_instance_of(OneviewSDK::StorageSystem).to receive(:retrieve!).and_return(true)
    allow(OneviewSDK::StoragePool).to receive(:find_by)
      .and_return([OneviewSDK::StoragePool.new(client, uri: 'rest/sp1')])
    expect_any_instance_of(OneviewSDK::VolumeTemplate).to_not receive(:create)
    expect(real_chef_run).to create_oneview_volume_template_if_missing('VolumeTemplate1')
  end
end
