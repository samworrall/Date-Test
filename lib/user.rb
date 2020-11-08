# frozen_string_literal: true

require 'date'

# User class responsible for calculating age and next birthday
class User
  attr_reader :name, :date_of_birth

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  # Returns an Integer representing the current age
  def age
    now = Date.today
    current_day = now.day
    current_month = now.month
    current_year = now.year

    age = current_year - date_of_birth.year

    return age if current_month > date_of_birth.month

    return age if current_month == date_of_birth.month && current_day >= date_of_birth.day

    age - 1
  end

  # Returns a Date object for current upcoming birthday
  def next_birthday
    now = Date.today
    current_day = now.day
    current_month = now.month
    current_year = now.year

    year = current_year + 1

    return Date.new(year, date_of_birth.month, date_of_birth.day) if current_month > date_of_birth.month

    return Date.new(year, date_of_birth.month, date_of_birth.day) if current_month == date_of_birth.month && current_day >= date_of_birth.day

    Date.new(year - 1, date_of_birth.month, date_of_birth.day)
  end
end

tests = [
  Date.new(1986, 1, 1),
  Date.new(1988, Date.today.month, Date.today.day),
  Date.new(1990, 12, 30)
]

puts '====== ages ======'
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).age}"
end

puts '====== birthdays ======'
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).next_birthday}"
end
