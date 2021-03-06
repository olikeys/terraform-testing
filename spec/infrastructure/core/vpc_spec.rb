require 'spec_helper'

describe "VPC" do
  before(:all) do
    @vpc_details = $terraform_plan['aws_vpc.infrastructure']
  end
  it "should have the right CIDR block" do
    cidr_block_expected = "10.1.0.0/16"
    expect(@vpc_details['cidr_block']).to eq(cidr_block_expected)
  end
  it "shouldn't be destroyed" do
    expect(@vpc_details['destroy']).to eq(false)
  end
end
