require 'colorize'
require 'dotenv/tasks'
require 'rspec/core/rake_task'
require_relative 'lib/terraform_helper'

namespace :static_analysis do
  task :lint do
    print "INFO: Linting Terraform configurations...".yellow
    lint_successful, lint_error_message = lint_terraform_configurations_in_this_directory
    if !lint_successful
      print "failed!\n".red
      raise "ERROR: terraform-lint failed! Error: #{lint_error_message}".red
    end
    print "done!\n".green
  end
end

namespace :unit do
  RSpec::Core::RakeTask.new(:spec) do |task|
    task.rspec_opts = ['--color', '-f progress', '-r ./spec/spec_helper.rb']
    task.pattern = 'spec/**/*_spec.rb'
  end
end

task :unit => [ 'static_analysis:lint',
                'unit:spec']

task :integration => [ ]

task :deploy => [ ]

task :default => [ 'unit',
                   'integration',
                   'deploy' ]