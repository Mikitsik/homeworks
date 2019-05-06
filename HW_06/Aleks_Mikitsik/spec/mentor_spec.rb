require_relative '../../../HW_05/Aleks_Mikitsik/human'
require_relative '../../../HW_05/Aleks_Mikitsik/homework'
require_relative '../../../HW_05/Aleks_Mikitsik/mentor'

RSpec.describe Mentor do
  subject { described_class.new(first_name: 'Piotr', last_name: 'Petrov') }

  it '#read_notifications! method' do
    subject.notifications << { notification: 'Student has sent',
                               status: 'unread' }
    subject.read_notifications!
    expect(subject.notifications[0][:status]).to eq('read')
  end
end
