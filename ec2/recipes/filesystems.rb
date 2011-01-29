if node[:ebs_volumes]
  node[:ebs_volumes].each do |conf|
    if File.exists?(conf[:device])
      if !File.directory?(conf[:mount_point])
        directory conf[:mount_point] do
          owner "root"
          group "root"
          mode 0755
          action :create
        end
      end


      mount conf[:mount_point] do
        fstype  conf[:type]
        device  conf[:device]
        options conf[:options]
        action  [ :enable, :mount ]

        # Do not execute if its already mounted
        not_if "grep #{conf[:mount_point]} /proc/mounts"
      end
    else
      Chef::Log.info "Before mounting, you must attach volume #{name} to this instance #{node[:ec2][:instance_id]} at #{conf[:device]}"
    end
  end
end