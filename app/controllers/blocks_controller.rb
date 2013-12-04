class BlocksController < ApplicationController
  before_filter :find_block, except: [:create, :index]

  def index
    @sandbox = Sandbox.find(params[:sandbox_id])
    respond_to do |format|
      format.json { render json: @sandbox.blocks }
    end
  end

  def create
    @block = Block.new(params[:block])
    respond_to do |format|
      if @block.save
        format.json { render json: @block, status: :created, head: :no_content }
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
      format.json { head :no_content }
    end
  end

private

  def find_block
    @block = Block.find(params[:id])
  end
end
