require_relative '../../../HW_05/Aleks_Mikitsik/homework_solution'

RSpec.describe HomeworkSolution do
  subject do
    described_class.new(
      student: 'any of student', homework: 'hw_01',
      solved_tasks: { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
                      task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' }
    )
  end

  it {
    is_expected.to have_attributes(
      student: 'any of student', homework: 'hw_01', solved_tasks:
      { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
        task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' }
    )
  }
end
