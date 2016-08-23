class TypesController < ApplicationController
  def index
    render json: Type.all
  end

  def create
    @type = Type.new(new_type_params)
    @type.save!
    render json: Type.all
  end

  private
  def new_type_params
    params.require(:type).permit(
        :name,
        :description
    )
  end
end
