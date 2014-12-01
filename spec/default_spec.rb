require 'spec_helper'

describe 'tmux::default' do
  context 'when the installation method is source' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new do |node|
        node.set['tmux']['install_method'] = 'source'
      end.converge('tmux::default')
    end

    it 'includes the source recipe' do
      expect(chef_run).to include_recipe('tmux::source')
    end

    it 'does not include the package recipe' do
      expect(chef_run).to_not include_recipe('tmux::package')
    end
  end

  context 'when the installation method is package' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new do |node|
        node.set['tmux']['install_method'] = 'package'
      end.converge('tmux::default')
    end
  end
end
