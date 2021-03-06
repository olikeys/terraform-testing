def initialise_global_terraform_plan!
  tfjson_location = '/Users/okeys/go/bin/tfjson'
  if not File.exist? tfjson_location
    raise "tfjson not found. Rakefile should have installed it..."
  end

  print "INFO: Generating Terraform plan now. This might take a short while...".yellow
  system("/usr/local/bin/terraform init > /dev/null")
  system("/usr/local/bin/terraform plan \
-var aws_region=eu-west-1 \
-state=discarded_state_not_required_for_unit_tests \
-out=terraform_fixture.tfplan > /dev/null")

  terraform_plan_json_serialized = `#{tfjson_location} ./terraform_fixture.tfplan`
  if terraform_plan_json_serialized.nil? or terraform_plan_json_serialized.empty?
    raise "Mock Terraform plan was not generated. See above errors for more details."
  end
  puts "done!".green
  temp_tfplan_json_file_for_future_perusal = '/tmp/terraform_plan.json'
  if File.exist? temp_tfplan_json_file_for_future_perusal
    `rm -f #{temp_tfplan_json_file_for_future_perusal} 2>/dev/null`
  end
  File.open(temp_tfplan_json_file_for_future_perusal, 'w') do |file_handle|
    file_handle.write(terraform_plan_json_serialized)
  end
  puts "INFO: A copy of the terraform plan JSON generated for this run can \
be found at #{temp_tfplan_json_file_for_future_perusal}".cyan

  terraform_plan = JSON.parse(terraform_plan_json_serialized)
  return terraform_plan
end
