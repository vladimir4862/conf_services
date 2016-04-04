#
# Cookbook Name:: myssh
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#for check
package "vim"


#Read filename from "files" in this cookbook and check specificity, get filename without .pub
run_context.cookbook_collection["conf_services"].manifest["files"].each do |filename|
  if filename["specificity"] == "pubkey"
    user = filename["name"].split(".pub")[0]
      user user do
        comment "A #{user} user"
        home "/home/#{user}"
        shell "/bin/bash"
        password "1q2w#E$R"
      end

    directory "/home/#{user}" do
      owner "#{user}"
      mode "0750"
    end

    directory "/home/#{user}/.ssh/" do
      owner "#{user}"
      mode "0750"
    end

    cookbook_file "/home/#{user}/.ssh/authorized_keys" do
      source "pubkey/#{filename["name"]}"
      owner "#{user}"
      mode "0640"
      end
  end
end
include_recipe "openssh"
include_recipe "mypypi"
include_recipe "conf_services::site"
