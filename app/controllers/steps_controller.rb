class StepsController < ApplicationController
  def create
    @guide = Guide.find(params[:guide_id])
    @step = @guide.steps.build(step_params)

    if @step.save
      redirect_to @guide, notice: 'Step added!'
    else
      render 'articles/#{@article}.id'
    end
  end

  def edit
    @guide = Guide.find(params[:guide_id])
    @step = @guide.steps.find(params[:id])
  end

  def update
    @guide = Guide.find(params[:guide_id])
    @step = @guide.steps.find(params[:id])

    if @step.update(step_params)
      redirect_to @guide, notice: 'Step updated!'
    else
      render :edit
    end
  end

  def destroy
    @guide = Guide.find(params[:guide_id])
    @step = @guide.steps.find(params[:id])

    @step.destroy
    redirect_to @guide, notice: 'Step deleted!'
  end

  private

  def step_params
    params.require(:step).permit(:action)
  end
end
