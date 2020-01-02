class StartPageController < ApplicationController
  def index ()

  end



  def result
    @m = params[:v1].to_i
    @bin_m = ' '
    @temp_arr = Array.new()
    @ans = 0
    @bin_ans = ' '

    i = 0
    temp_m = @m

    while temp_m > 0 do
      @ans = @ans * 2 + (temp_m % 2)
      @bin_ans = @bin_ans + (temp_m % 2).to_s
      @bin_m = (temp_m % 2).to_s + @bin_m

      # новую строку в матрицу
      @temp_arr.push Array.new(3)

      # ячейки строки
      @temp_arr[-1][0] = @ans
      @temp_arr[-1][1] = @bin_ans
      @temp_arr[-1][2] = @bin_m

      temp_m = temp_m / 2
      i = i + 1
    end
  end
end
