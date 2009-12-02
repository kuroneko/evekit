DBDUMP = "dom100-sqlite3-v1.db"
DBDUMPURL = "http://eve.no-ip.de/dom100/dom100-sqlite3-v1.db.bz2"

# decompress the dump from the tmp directory into the database directory
file "#{RAILS_ROOT}/db/#{DBDUMP}" => ["#{RAILS_ROOT}/tmp/#{DBDUMP}.bz2"] do |t|
  begin
    sh "bzip2 -dc #{t.prerequisites.join(" ")} > #{t.name}"
  rescue
    rm t.name
  end
end

file "#{RAILS_ROOT}/tmp/#{DBDUMP}.bz2" => ["#{RAILS_ROOT}/tmp"] do |t|
  begin
    sh "curl -o #{t.name} #{DBDUMPURL}"
  rescue
    rm t.name
  end
end

file "#{RAILS_ROOT}/tmp" do |t|
  mkdir t.name
end

desc "Installs DB dump from eve-id"
task :install_eve_dump => ["#{RAILS_ROOT}/db/#{DBDUMP}"]
