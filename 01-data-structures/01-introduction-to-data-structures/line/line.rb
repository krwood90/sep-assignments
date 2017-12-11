# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
    return members
  end

  def leave(person)
    members.delete(person)
    return members
  end

  def front
    return members.last
  end

  def middle
    midpoint = (members.length / 2).floor
    return members[midpoint]
  end

  def back
    return members.first
  end

  def search(person)
    members.each_with_index do |foo, index|
      if members.include?(person) ==true
        if foo == person
          return "#{foo}\'s position in line is #{index}"
        end
      end
    end
  end

  private

  def index(person)
    members.each_with_index do |foo, index|
      if foo == person
        return index
      end
    end
  end

end