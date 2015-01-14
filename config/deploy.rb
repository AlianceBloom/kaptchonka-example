# config valid only for current version of Capistrano
lock '3.3.3'

set :application, 'kapchonka_example'
set :repo_url, 'git@github.com:AlianceBloom/kaptchonka-example.git'

set :bundle_gemfile, -> { release_path.join('Gemfile') }


