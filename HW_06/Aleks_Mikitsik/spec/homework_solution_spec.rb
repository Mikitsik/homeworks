# set HomeworkSolution class
class HomeworkSolution
  attr_accessor :status
  attr_reader :student, :homework, :solved_tasks

  def initialize(student:, homework:, solved_tasks:)
    @student = student
    @homework = homework
    @solved_tasks = solved_tasks
  end
end

RSpec.describe HomeworkSolution do
  subject do
    described_class.new(student: 'any of student', homework: 'hw_01', solved_tasks: { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
    task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' })
  end

  it { is_expected.to have_attributes(
    student: 'any of student', homework: 'hw_01', solved_tasks: { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
    task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' })}
end
