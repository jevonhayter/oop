# This is a practice exercise
class Student
  attr_accessor :name
  attr_writer :grade

  def better_grade_than?(other)
    grade > other.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new
mark = Student.new
joe.name = 'joe'
mark.name = 'mark'
mark.grade = 80
joe.grade = 90
puts 'Well done!' if joe.better_grade_than?(mark)
