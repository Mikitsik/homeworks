require_relative '../../../HW_05/Aleks_Mikitsik/human'

RSpec.describe Human do
  subject { described_class.new(first_name: 'Piotr', last_name: 'Petrov') }

  it 'has first name' do
    expect(subject.first_name).to eq('Piotr')
  end

  it 'has last name' do
    expect(subject.last_name).to eq('Petrov')
  end
end
