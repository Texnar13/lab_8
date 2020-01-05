class StartPageController < ApplicationController

  def number_or_nil(string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end

  def my_calc_method(qestion_m)
    m = qestion_m
    bin_m = ' '
    temp_arr = Array.new()
    ans = 0
    bin_ans = ' '

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
      temp_arr[-1][1] = number_or_nil(bin_ans)
      temp_arr[-1][2] = number_or_nil(bin_m)

      temp_m = temp_m / 2
      i = i + 1
    end

    return {qestion_m: m, bin_m: number_or_nil(bin_m), temp_arr: temp_arr, ans: ans, bin_ans: number_or_nil(bin_ans)}

  end


  # начальная страничка считающая значения
  before_action :parse_params, only: :index
  def index ()

    respond_to do |format|
      format.xml {
        @data = my_calc_method(@m)
        render xml: @data.to_xml
      }
      format.rss {
        @data = my_calc_method(@m)
        render xml: @data.to_xml
      }
    end
  end


  def parse_params
   @m = params[:pm].to_i
   @format = params[:format]
  end

end
