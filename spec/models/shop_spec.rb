require 'rails_helper'

describe Shop do
  it { should belong_to :location }
  it { should validate_presence_of :name }
  it { should validate_presence_of :owner }
  it { should validate_presence_of :motto }
  it { should validate_presence_of :rating }
end
