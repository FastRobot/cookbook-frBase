
describe http('http://localhost:9100/metrics') do
  its('status') { should eq 200 }
end
