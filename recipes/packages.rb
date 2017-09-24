#
# Cookbook:: frBase
# Recipe:: packages
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w{netcat lsof tmux}.each do |p|
  package p do
    # nothing special yet
  end
end


