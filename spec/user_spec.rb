# frozen_string_literal: true

require 'user'

RSpec.describe User do
  let(:subject) { User.new('John', date_of_birth) }
  let(:date_of_birth) { nil }

  describe '#name' do
    it 'returns the name as a string' do
      expect(subject.name).to eq('John')
    end
  end

  describe '#age' do
    before do
      allow(Date).to receive(:today).and_return(Date.new(2020, 11, 8))
    end

    context 'when todays date is before this years birthday' do
      let(:date_of_birth) { Date.new(2018, 12, 8) }

      it 'calculates the age of the user' do
        expect(subject.age).to eq(1)
      end
    end

    context 'when todays date is after this years birthday' do
      let(:date_of_birth) { Date.new(2018, 10, 9) }

      it 'calculates the age of the user' do
        expect(subject.age).to eq(2)
      end
    end

    context 'when todays date is this years birthday' do
      let(:date_of_birth) { Date.new(2018, 11, 8) }

      it 'calculates the age of the user' do
        expect(subject.age).to eq(2)
      end
    end

    context 'when todays date is the birth month and the birth day has passed' do
      let(:date_of_birth) { Date.new(2018, 11, 7) }

      it 'calculates the age of the user' do
        expect(subject.age).to eq(2)
      end
    end

    context 'when todays date is the birth month but the birth day has not been passed' do
      let(:date_of_birth) { Date.new(2018, 11, 9) }

      it 'calculates the age of the user' do
        expect(subject.age).to eq(1)
      end
    end
  end

  describe '#next_birthday' do
    before do
      allow(Date).to receive(:today).and_return(Date.new(2020, 11, 8))
    end

    context 'when todays date is before this years birthday' do
      let(:date_of_birth) { Date.new(2018, 12, 8) }

      it 'calculates the date of the next birthday' do
        next_birthday = subject.next_birthday
        expect(next_birthday.year).to eq(2020)
        expect(next_birthday.month).to eq(12)
        expect(next_birthday.day).to eq(8)
      end
    end

    context 'when todays date is after this years birthday' do
      let(:date_of_birth) { Date.new(2018, 10, 9) }

      it 'calculates the date of the next birthday' do
        next_birthday = subject.next_birthday
        expect(next_birthday.year).to eq(2021)
        expect(next_birthday.month).to eq(10)
        expect(next_birthday.day).to eq(9)
      end
    end

    context 'when todays date is this years birthday' do
      let(:date_of_birth) { Date.new(2018, 11, 8) }

      it 'calculates the date of the next birthday' do
        next_birthday = subject.next_birthday
        expect(next_birthday.year).to eq(2021)
        expect(next_birthday.month).to eq(11)
        expect(next_birthday.day).to eq(8)
      end
    end

    context 'when todays date is the birth month and the birth day has passed' do
      let(:date_of_birth) { Date.new(2018, 11, 7) }

      it 'calculates the date of the next birthday' do
        next_birthday = subject.next_birthday
        expect(next_birthday.year).to eq(2021)
        expect(next_birthday.month).to eq(11)
        expect(next_birthday.day).to eq(7)
      end
    end

    context 'when todays date is the birth month but the birth day has not been passed' do
      let(:date_of_birth) { Date.new(2018, 11, 9) }

      it 'calculates the date of the next birthday' do
        next_birthday = subject.next_birthday
        expect(next_birthday.year).to eq(2020)
        expect(next_birthday.month).to eq(11)
        expect(next_birthday.day).to eq(9)
      end
    end
  end
end
