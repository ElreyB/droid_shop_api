require 'rails_helper'

describe Location do
  it { should have_many :shops }
  it { should validate_presence_of :planet}
  it { should validate_presence_of :galaxy}
end
