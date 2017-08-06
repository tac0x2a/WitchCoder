class AttemptsController < ApplicationController
  AttemptStatus = {
    "NS" => "NotSubmitted", # Open problem to Submit
    "RT" => "Retired",      # After Open attempt, user retired.
    "JP" => "JudgeProgress",# After Submit, Judging...
    "PS" => "Passed",       # After Submit, All cases are passed.
    "TE" => "TimeExceeded", # After Submit, there are time exceeded case.
    "ME" => "MemoryExceeded", # After Submit, there are memory exceeded case.
    "FA" => "Fail", # After Submit, there are failed case.
    "ER" => "Error" # After Submit, submitted code has errors, in prepareing or running.
  }

  Languages = {
    "RB" => "Ruby"
  }

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

  def update
    @attempt = Attempt.find(params[:id])
    @attempt.submitted_at = DateTime.now
    @attempt.result = "JP"

    if not @attempt.update_attributes(attempt_params)
      redirect_to
        action:"show",
        controller:"problems",
        id: @attempt.problem.id,
        notice:"Failed Challenge Problem by Internal Error."
    end

    # Todo: Judge here.
    @attempt.problem.cases.each do |caze|
      attempt_case = AttemptCase.new(attempt:@attempt, case:caze)
      attempt_case.result = "PS"
      attempt_case.exec_time = 42
      attempt_case.exec_mem  = 4423
      attempt_case.actual    = "2"
      attempt_case.save
    end

    @attempt.result = "PS"    # Todo
    @attempt.answer_time = 42 # Todo

    if not @attempt.save
      redirect_to
        action:"show",
        controller:"problems",
        id: @attempt.problem.id,
        notice:"Failed Challenge Problem by Internal Error."
    end

    redirect_to action:"show", id:@attempt.id
  end

  def index
  end

  def show
    @attempt = Attempt.find(params[:id])
    @problem = @attempt.problem
    @player  = @attempt.user
  end

  private
  def attempt_params
    params.require(:attempt).permit(
      :language,
      :code
      )
  end
end
