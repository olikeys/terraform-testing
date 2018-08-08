def lint_terraform_configurations_in_this_directory
  lint_result = `\/usr/local/bin/terraform validate 2>&1`
  lint_successful = false
  if lint_result.empty?
    lint_successful = true
  end
  return lint_successful, lint_result
end

