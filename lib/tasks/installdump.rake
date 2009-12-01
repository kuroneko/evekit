DBDUMP = "dom100-sqlite3-v1.db"
DBDUMPURL = "http://eve.no-ip.de/dom100/dom100-sqlite3-v1.db.bz2"
desc "Installs DB dump from eve-id"
task :installEveDump
  if File.exists?("#{RAILS_ROOT}/db/#{DBDUMP}")
    puts "Eve Database Dump already installed."
  else
    puts "Please wait.  Downloading and decompressing Eve Database Dump."
    sh "curl #{DBDUMPURL} | bzip2 -dc > #{RAILS_ROOT}/db/#{DBDUMP}"
    puts "Database Dump Installed."
  end
end