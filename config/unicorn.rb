root = "/home/deployer/apps/codingdojo_flash/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.codingdojo_flash.sock"
worker_processes 2
timeout 30