require 'spec_helper'

describe 'tmux program' do

  it 'should have tmux package installed on Ubuntu and binary on others OS' do
    case RSpec.configuration.os[:family]
    when "Ubuntu"
      expect(package 'tmux').to be_installed
    else
      expect(command 'which tmux').to return_stdout /\/usr\/bin\/tmux/
    end
  end
end
