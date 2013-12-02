class BlocksController < ApplicationController
  before_filter :find_block, except: :create

  def create
    @block = Block.new(params[:block])
    respond_to do |format|
      if @block.save
        format.json { render json: @block, status: :created, location: @block }
      else
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @block }
    end
  end

  def update
    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.json { head :no_content }
      else
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end

private

  def find_block
    @block = Block.find(params[:id])
  end
end
