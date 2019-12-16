#
# Cookbook:: frBase
# Recipe:: packages
#
# Copyright:: 2018, Fast Robot, LLC, Apachev2.

%w{curl netcat lsof tmux}.each do |p|
  package p do
    # nothing special yet
  end
end


