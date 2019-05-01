require 'json'
require 'net/http'
require 'uri'

# HomeworkSolution class
class HomeworkSolution
  attr_accessor :status
  attr_reader :student, :homework, :solved_tasks

  def initialize(student:, homework:, solved_tasks:)
    @student = student
    @homework = homework
    @solved_tasks = solved_tasks
  end
end

# Human class
class Human
  attr_reader :first_name, :last_name

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
  end
end

# Student class
class Student < Human
  attr_accessor :mentor
  attr_reader :hw, :hw_solutions

  def takes_hw(homework)
    @hw = homework
  end

  def complete_hw(solutions_params)
    solutions_params[:student] = "#{first_name} #{last_name}"
    solutions_params[:homework] = hw.hw_number
    @hw_solutions = solutions_params
    HomeworkSolution.new(solutions_params)
  end

  def submit_hw
    Net::HTTP.post URI('http://www.example.com/api/search'),
                   hw_solutions.to_json, 'Content-Type' => 'application/json'
    return unless mentor

    mentor.notifications <<
      { notification:
      "Student #{first_name} #{last_name} has sent #{hw.hw_number}",
        status: 'unread' }
  end
end

RSpec.describe Student do
  subject { described_class.new(first_name: 'Ivan', last_name: 'Ivanov') }

  let(:mentor) { double(notifications: []) }

  describe 'Student #takes_hw and #complete_hw methods' do
    let(:homework) { double(hw_number: 'hw_01', hw_tasks:
      { task_1_1: 'some task_1_1 contents', task_1_2: 'some task_1_2 contents',
        task_1_3: 'some task_1_3 contents', task_1_4: 'some task_1_4 contents' })}

    let(:solutions_params) { {solved_tasks:
      { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
        task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' }} }

    it '#takes_hw method' do
      expect(subject.takes_hw(homework)).to be(homework)
    end

    it '#complete_hw method' do
      subject.takes_hw(homework)

      expect(subject.complete_hw(solutions_params).class).to be(HomeworkSolution)
      expect(subject.complete_hw(solutions_params)).to have_attributes(
        student: "#{subject.first_name} #{subject.last_name}",
        homework: "#{homework.hw_number}",
        solved_tasks:
      { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
        task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' })
    end
  end
  # it '#submit_hw' do
  # expect(subject.submit_hw.length).to eq(1)
  # end

  describe '#submit_hw method' do
    context 'with mentor subscription' do

    end

    context 'without mentor subscription' do

    end
  end

end
