lock '~> 3.17.0'

set :application, 'cars'
set :repo_url, 'git@github.com:yuliatokaryk/paganel-cars.git'

set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'

set :keep_releases, 1

set :branch, 'main'
set :passenger_restart_with_touch, true
