class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, "").length

    x=0

    @text.split.each do |word|
      if word.downcase.gsub(/[^a-z0-9\s]/i, "")==@special_word.downcase
        x+=1
      end
    end
    @occurrences = x

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
 
    r = (@apr / 100.0) / 12.0
    x = (1+r)**(@years*12)
    m = (@principal*r*x)/(x-1)

    @monthly_payment = m

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 60
    @hours = @minutes / 60
    @days = @hours / 24
    @weeks = @days/7
    @years = @days/365

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min
    
    center = @numbers.count / 2
    if @numbers.count.even?
      @median = (@numbers.sort[center] + @numbers.sort[center-1])/2
    else 
      @median = @numbers.sort[center.floor]
    end 
    
    x=0
    @numbers.each do |num|
      x=x+num
    end    
    @sum = x

    @mean = x / (@numbers.count)

    x=0
    @numbers.each do |num|
      x=x+(num - @mean)**2
    end  
    @variance = x/@count

    @standard_deviation = @variance**(1.0/2.0)

    unique = @numbers.uniq
    mode_table = {}
    x=0
    unique.each do |num|
      mode_table[num] = @numbers.count(num)
    end  
    
    x = mode_table.values.max
    
    @mode = mode_table.key(x)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
