# create index.html
task :build do
  exec 'ruby hakunamata.rb'
end

task :up do
  require 'uri'
  require "highline/import"
  require 'net/sftp'

  uri = URI.parse('ftp://coworking-saar.de')

  Net::SFTP.start(uri.host, username, password: password) do |ftp|
    ftp.upload!('index.html')
    ftp.upload!('impressum.html')
  end

  puts
  puts 'done'
end
