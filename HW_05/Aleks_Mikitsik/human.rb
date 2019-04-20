class Human

  attr_reader :first_name, :last_name

  def initialize(name)
  	@first_name = name[:first_name]
  	@last_name = name[:last_name]
  end

end