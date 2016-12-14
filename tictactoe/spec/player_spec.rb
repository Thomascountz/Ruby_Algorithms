require_relative 'spec_helper'

describe Player.new 'Thomas', 'X' do
  it { is_expected.to have_attributes(name: 'Thomas') }
  it { is_expected.to have_attributes(mark: 'X') }
end
