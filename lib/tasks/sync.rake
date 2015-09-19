namespace :sync do

  desc 'Synchronizes local database from production'
  task :local => :backup do
    file_name = "mongodump.#{Time.now.strftime('%Y%m%d')}"
    app_name = "#{ENV['MONGO_DATABASE']}"
    cmd = "mongorestore -v -h 127.0.0.1 " \
      "--port 27017 " \
      "--db auriga_development " \
      "--drop tmp/#{file_name}/#{app_name}"
    system cmd
  end

  task :reload do |t, args|
    file_name = "mongodump.#{Time.now.strftime('%Y%m%d')}"
    app_name = "#{ENV['MONGO_DATABASE']}"
    cmd = "mongorestore -v -h 127.0.0.1 " \
      "--port 27017 " \
      "--db auriga_development " \
      "--drop tmp/#{file_name}/#{app_name}"
    system cmd
  end

  task :backup do |t, args|
    file_name = "mongodump.#{Time.now.strftime('%Y%m%d')}"
    cmd = "mongodump -h #{ENV['MONGO_URL']} " \
      "-d #{ENV['MONGO_DATABASE']} -u #{ENV['MONGO_USERNAME']} " \
      "-p #{ENV['MONGO_PASSWORD']} " \
      "-o tmp/#{file_name}"
    system cmd
  end

  # rake sync:restore['tmp/mongodump.20131127/app18709586']
  task :restore, :file do |t, args|
    puts "keep fews secondes for considers your action, you are going to EREASE production database for restoring with your provided dump file, you are allright with this ? [Y,n]"
    if $stdin.gets.chomp == 'Y'
      cmd = "mongorestore -h #{ENV['MONGO_URL']} " \
        "-d #{ENV['MONGO_DATABASE']} " \
        "-u #{ENV['MONGO_USERNAME']} " \
        "-p #{ENV['MONGO_PASSWORD']} " \
        "#{args.file}"
      system cmd
    else
      puts "Ok bye bye"
    end
  end

  task :console do
    cmd = "mongo #{ENV['MONGO_URL']}/#{ENV['MONGO_DATABASE']} " \
      "-u #{ENV['MONGO_USERNAME']} " \
      "-p #{ENV['MONGO_PASSWORD']} "
    system cmd
  end

end
