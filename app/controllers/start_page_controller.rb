class StartPageController < ApplicationController
  require 'json'

  def index ()

  end

  before_action :parse_params, only: :result
  def result

    # ищем запись в бд MyResult::ActiveRecord_Relation
    record = (MyResult.where(:pm => @m))[0]

    #ActiveRecord::Base.connection.execute("delete from #{MyResult.table_name} where pm = 144")

    if(record) # если запись есть
      @where = 'из базы данных'
      # выводим ее на страницу
      @temp_arr = JSON.parse(record.result)["result"]
    else # если записи нет
      @where = 'из расчетов'
      # расчитываем результат и выводим ответ на страницу
      @temp_arr = calculate_result(@m)
      # получаем строку результата и создаем запись в бд
      result_in_db = MyResult.new({pm: @m, result: get_gson_string_from_result(@temp_arr)})
      result_in_db.save
    end
  end

  private

  def parse_params
   @m = params[:pm].to_i
  end


  def calculate_result (m)
    bin_m = ''
    temp_arr = Array.new()
    ans = 0
    bin_ans = ''

    i = 0
    temp_m = m

    while temp_m > 0 do
      ans = ans * 2 + (temp_m % 2)
      bin_ans = bin_ans + (temp_m % 2).to_s
      bin_m = (temp_m % 2).to_s + bin_m

      # новую строку в матрицу
      temp_arr.push Array.new(3)

      # ячейки строки
      temp_arr[-1][0] = ans
      temp_arr[-1][1] = bin_ans
      temp_arr[-1][2] = bin_m

      temp_m = temp_m / 2
      i = i + 1
    end

    return temp_arr
  end


  def get_gson_string_from_result(temp_arr)
    return "{\"result\": #{temp_arr.to_s}}"
  end


end
