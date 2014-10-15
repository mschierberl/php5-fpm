require 'resolv'

actions :create, :delete, :modify
default_action :create if defined?(default_action)

attribute :file_name, :name_attribute => true, :kind_of => String, :required => true
attribute :pool_name, :kind_of => String, :required => true
attribute :pool_user, :kind_of => String, :required => true, :default => 'www-data'
attribute :pool_group, :kind_of => String, :required => true, :default => 'www-data'
attribute :listen_address, :kind_of => String, :required => true, :default => '127.0.0.1', :regex => Resolv::IPv4::Regex
attribute :listen_port, :kind_of => Fixnum, :default => 9000

attribute :pm, :kind_of => String, :required => true, :default => 'dynamic'
attribute :pm_max_children, :kind_of => Fixnum, :required => true, :default => '10'
attribute :pm_start_servers, :kind_of => Fixnum, :required => true, :default => '4'
attribute :pm_min_spare_servers, :kind_of => Fixnum, :required => true, :default => '2'
attribute :pm_max_spare_servers, :kind_of => Fixnum, :required => true, :default => '6'
attribute :pm_process_idle_timeout, :kind_of => String, :required => true, :default => '10s'
attribute :pm_max_requests, :kind_of => Fixnum, :required => true, :default => '0'
attribute :pm_status_path, :kind_of => String, :required => false, :default => nil

attribute :ping_path, :kind_of => String, :required => false, :default => nil
attribute :ping_response, :kind_of => String, :required => false, :default => nil

attribute :access_format, :kind_of => String, :required => true, :default => '%R - %u %t \"%m %r\" %s'
attribute :request_slowlog_timeout, :kind_of => Fixnum, :required => false, :default => nil
attribute :request_terminate_timeout, :kind_of => Fixnum, :required => false, :default => nil

attribute :chdir, :kind_of => String, :required => false, :default => nil
attribute :catch_workers_output, :kind_of => String, :required => false, :equal_to => ['yes', 'no'], :default => nil

attribute :security_limit_extensions, :kind_of => String, :required => false, :default => nil

attribute :access_log, :kind_of => String, :required => false, :default => nil
attribute :slow_log, :kind_of => String, :required => false, :default => nil

attribute :rlimit_files, :kind_of => String, :required => false, :default => nil
attribute :rlimit_core, :kind_of => String, :required => false, :default => nil

attribute :chroot, :kind_of => String, :required => false, :default => nil

attr_accessor :exists