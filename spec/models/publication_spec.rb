require 'rails_helper'

describe Publication do
  it { should validate_presence_of(:title) }
end
