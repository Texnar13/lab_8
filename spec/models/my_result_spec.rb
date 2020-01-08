require 'rails_helper'

RSpec.describe MyResult, type: :model do

  describe 'add record to database' do
    it 'should add record to database and check it' do
      field = MyResult.new(pm: 1500, result: '{"result":[[0], ["0"], ["0"]]}')
      MyResult.find_by(pm: 1500).destroy unless field.valid?
      field.save
      expect(MyResult.where(pm: 1500).exists?).to be_truthy
    end
  end

  context 'if program trying to add not valid options' do
    it 'should say that not valid input is not valid' do
      exs = MyResult.find_by(pm: 144)
      MyResult.new(pm: 144, result: '{"result":[[0], ["0"], ["0"]]}').save if exs.nil?
      expect(MyResult.new(pm: 144).valid?).to be_falsy
      MyResult.find_by(pm: 144).destroy
      unless exs.nil?
        MyResult.new(pm: 144, result: exs.result).save
      end
    end
  end
end
