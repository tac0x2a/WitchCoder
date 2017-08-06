class AttemptsController < ApplicationController
  AttemptStatus = [
    "NS" => "NotSubmitted",
    "PS" => "Passed",
    "TE" => "TimeExceeded",
    "ME" => "MemoryExceeded",
    "FA" => "Fail",
    "ER" => "Error"
  ]

  Languages = [
    "RB" => "Ruby"
  ]

  def new
    @problem = Problem.find(params[:problem])
    @user    = current_user

    # Load last attempt status NotSubmitted.
    attempts = Attempt.select{|a| a.problem == @problem && a.user == @user && a.attempted_at}
    last_attempt = attempts.max_by{|a| a.attempted_at}

    @attempt =
      if last_attempt&.result == "NS"
        last_attempt
      else
        Attempt.new(
          problem: @problem,
          user: @user,
          result: "NS",
          answer_time: 0,
          attempted_at: DateTime.now)
      end

    if not @attempt.save
      redirect_to
        action:"show",
        controller:"problems",
        id:@problem.id,
        notice:"Failed Challenge Problem by Internal Error."
    end

    @attempted_count = attempts.count
  end

  def create
  end

  def index
  end

  def show
  end
end
