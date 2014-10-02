class GuidesController < ApplicationController
  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find(params[:id])
    @step = Step.new
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)

    if @guide.save
      redirect_to guide_path(@guide), notice: 'Guide created! Add steps below.'
    else
      render :new
    end
  end

  def edit
    @guide = Guide.find(params[:id])
  end

  def update
    @guide = Guide.find(params[:id])

    if @guide.update(guide_params)
      redirect_to @guide, notice: "Guide updated!"
    else
      render :edit
    end
  end

  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy
    redirect_to guides_path
  end

  private

  def guide_params
    params.require(:guide).permit(:title)
  end
end
