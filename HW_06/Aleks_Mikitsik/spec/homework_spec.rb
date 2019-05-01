# set Homework class
class Homework
  attr_reader :hw_number, :hw_tasks

  def initialize(hw_number:, hw_tasks:)
    @hw_number = hw_number
    @hw_tasks = hw_tasks
  end
end

RSpec.describe Homework do
  subject do
    described_class.new(hw_number: 'hw_01', hw_tasks:
    { task_1_1: 'some task_1_1 contents', task_1_2: 'some task_1_2 contents',
      task_1_3: 'some task_1_3 contents', task_1_4: 'some task_1_4 contents' })
  end

  it 'has homework number' do
    expect(subject.hw_number).to eq('hw_01')
  end

  it 'has homework tasks' do
    expect(subject.hw_tasks).to eq(
      task_1_1: 'some task_1_1 contents', task_1_2: 'some task_1_2 contents',
      task_1_3: 'some task_1_3 contents', task_1_4: 'some task_1_4 contents'
    )
  end
end
