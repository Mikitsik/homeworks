# set Human class
class Human
  attr_reader :first_name, :last_name

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
  end
end

RSpec.describe Human do
  subject { described_class.new(first_name: 'Piotr', last_name: 'Petrov') }

  it 'has first name' do
    expect(subject.first_name).to eq('Piotr')
  end

  it 'has last name' do
    expect(subject.last_name).to eq('Petrov')
  end
end
