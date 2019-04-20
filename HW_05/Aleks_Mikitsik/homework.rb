class Homework

  attr_reader :hw_number, :hw_tasks

  def initialize(homework)
    @hw_number = homework[:hw_number]
    @hw_tasks = homework[:hw_tasks]
  end
end