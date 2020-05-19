class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  
  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = unless result.nil?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      { notice: t('.success', link: result.html_url) }
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  def update
    if @test_passage.time_over?
      @test_passage.current_question = nil
      next_action
    else
      @test_passage.accept!(params[:answer_ids])
      next_action
    end

    # @test_passage.accept!(params[:answer_ids])

    # if @test_passage.completed?
    #   @test_passage.user.badges << BadgeService.new(@test_passage).call
    #   TestsMailer.completed_test(@test_passage).deliver_now
    #   redirect_to result_test_passage_path(@test_passage)
    # else
    #   render :show      
    # end
  end

  private
  
  def next_action
    if @test_passage.completed?
      @test_passage.user.badges << BadgeService.new(@test_passage).call
      send_mail
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def send_mail
    TestsMailer.completed_test(@test_passage).deliver_now
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
