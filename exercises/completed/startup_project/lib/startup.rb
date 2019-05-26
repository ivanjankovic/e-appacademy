require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.key?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(name, title)
    if self.valid_title?(title)
      @employees << Employee.new(name, title)
    else
      raise 'title is invalid!'
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]

    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise 'not enough funding!'
    end
  end

  def payday
    @employees.each { |e| self.pay_employee(e)}
  end

  def average_salary
    sum = 0
    @employees.each {|e| sum += @salaries[e.title]}
    avg = sum/@employees.length
    avg
  end

  def close
    @funding = 0
    @employees = []
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |title, salary|
      @salaries[title] = salary if !@salaries.key?(title)
    end
    @employees += startup.employees
    startup.close
  end
end
