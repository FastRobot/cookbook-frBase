default['prometheus_exporters']['node']['version'] = '0.18.1'

default['prometheus_exporters']['node']['checksum'] = case node['kernel']['machine']
                                                      when 'armv7l'
                                                        '5de85067f44b42b22d62b2789cb1a379ff5559649b99795cd1ba0c144b512ad0'
                                                      when 'x86_64'
                                                        'b2503fd932f85f4e5baf161268854bf5d22001869b84f00fd2d1f57b51b72424'
                                                      end

# abstract out to get working on armv7
default['prometheus_exporters']['node']['os_arch'] = case node['kernel']['machine']
                                                     when "armv7l"
                                                       "#{node['os']}-armv7"
                                                     when "x86_64"
                                                       "#{node['os']}-amd64"
                                                     end

default['prometheus_exporters']['node']['url'] = "https://github.com/prometheus/node_exporter/releases/download/v#{node['prometheus_exporters']['node']['version']}/node_exporter-#{node['prometheus_exporters']['node']['version']}.#{node['prometheus_exporters']['node']['os_arch']}.tar.gz"
