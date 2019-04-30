# set Human class
class Human
  attr_reader :first_name, :last_name

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
  end
end

RSpec.describe Human do
  subject { described_class.new('Piotr', 'Petrov') }

  it 'has first_name' do
    expect(subject.first_name).to eq('Piotr')
  end

  it 'has last_name' do
    expect(subject.first_name).to eq('Petrov')
  end
end
