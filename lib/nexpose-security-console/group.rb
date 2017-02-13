module NexposeSecurityConsole
  module Group
    include NexposeSecurityConsole

    def self.list
      begin
        puts "Login"
        nsc = Nexpose::Connection.new(@host, @user, @password, @port)
        nsc.login

        puts "Total: #{total}"
        bar = ProgressBar.new(total, :counter, :percentage, :eta)
        devices.each_with_index do |device , index|
          id = device["asset_id"].to_i
          if @dry_run
            puts "Asset##{id}"
          else
            nsc.delete_device(id)
          end
          bar.increment!
        end
      ensure
        nsc.logout
      end
    end
  end

end
