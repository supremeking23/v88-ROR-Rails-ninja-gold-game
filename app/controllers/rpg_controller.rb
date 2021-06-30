class RpgController < ApplicationController
  def index
  end

  def process_form
    date_time = Time.new
    #https://www.tutorialspoint.com/ruby/ruby_date_time.htm
    curr_date = date_time.strftime("%b %d, %Y %H:%M:%S %p")

    # if session[:score]
    #   puts "session is set"
    # else
    #   puts "session is not set"
    #   session[:score] = 1
    # end 

    unless session[:score]
      session[:score] = 0
    end

    unless session[:activities]
      session[:activities] = []
    end


    case params[:building]
    when "farm"
      random_score = rand 11..20
      session[:score] = session[:score] + random_score
      data = {
        building: "farm",
        status: "earned",
        curr_date: curr_date,
        random_score: random_score
      }

      session[:activities] << data

    when "cave"
      random_score = rand 6..10

      session[:score] = session[:score] + random_score
      data = {
        building: "cave",
        status: "earned",
        curr_date: curr_date,
        random_score: random_score
      }

      session[:activities] << data
      
    when "house"
      random_score = rand 2..5
      session[:score] = session[:score] + random_score
      data = {
        building: "house",
        status: "earned",
        curr_date: curr_date,
        random_score: random_score
      }

      session[:activities] << data
    when "casino"
      random_score = rand 0..50
      add_or_deduct = rand 0..1
     if add_or_deduct == 0
      session[:score] = session[:score] - random_score
      data = {
        building: "casino",
        status: "loss",
        curr_date: curr_date,
        random_score: random_score
      }
     
      #subtract
     else
      session[:score] = session[:score] + random_score
      data = {
        building: "casino",
        status: "earned",
        curr_date: curr_date,
        random_score: random_score
      }
      #add
     end

     session[:activities] << data

    end

    session[:activities]
    redirect_to "/"
  end

  def reset
    reset_session

    redirect_to "/"
  end

  # def farm
  # end

  # def cave
  # end

  # def casino
  # end

  # def house
  # end
end
