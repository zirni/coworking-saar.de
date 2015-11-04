# create index.html
task :build do
  exec 'ruby hakunamata.rb'
end

task :up do
  require 'uri'
  require "highline/import"
  require 'net/ftp'

  uri = URI.parse('ftp://coworking-saar.de')

  username = ask 'user: '
  password = ask('passwd: ') { |q| q.echo = false }

  ftp = Net::FTP.new
  ftp.connect(uri.host, uri.port)
  ftp.passive = true
  ftp.login(username, password)
  ftp.chdir(uri.path)
  ftp.putbinaryfile('index.html')
  ftp.putbinaryfile('impressum.html')
  ftp.close

  puts
  puts 'done'
end
