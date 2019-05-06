require_relative '../../../HW_05/Aleks_Mikitsik/homework'

RSpec.describe Homework do
  subject do
    described_class.new(
      hw_number: 'hw_01',
      hw_tasks:
      { task_1_1: 'some task_1_1 contents',
        task_1_2: 'some task_1_2 contents',
        task_1_3: 'some task_1_3 contents',
        task_1_4: 'some task_1_4 contents' }
    )
  end

  it {
    is_expected.to have_attributes(
      hw_number: 'hw_01',
      hw_tasks:
        { task_1_1: 'some task_1_1 contents',
          task_1_2: 'some task_1_2 contents',
          task_1_3: 'some task_1_3 contents',
          task_1_4: 'some task_1_4 contents' }
    )
  }
end
