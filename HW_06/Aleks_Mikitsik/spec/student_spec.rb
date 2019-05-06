require_relative '../../../HW_05/Aleks_Mikitsik/homework_solution'
require_relative '../../../HW_05/Aleks_Mikitsik/human'
require_relative '../../../HW_05/Aleks_Mikitsik/student'

RSpec.describe 'Student #takes_hw and #complete_hw methods' do
  subject { Student.new(first_name: 'Ivan', last_name: 'Ivanov') }

  let(:homework) { double(hw_number: 'hw_01', hw_tasks: { task_1_1: 'task' }) }

  let(:solutions_params) { { solved_tasks: { task_1_1: 'answer' } } }

  it '#takes_hw method' do
    expect(subject.takes_hw(homework)).to be(homework)
  end

  it '#complete_hw method' do
    subject.takes_hw(homework)

    expect(subject.complete_hw(solutions_params).class).to \
      be(HomeworkSolution)
    expect(subject.complete_hw(solutions_params)).to have_attributes(
      student: "#{subject.first_name} #{subject.last_name}",
      homework: homework.hw_number.to_s,
      solved_tasks: { task_1_1: 'answer' }
    )
  end
end
