class SandboxesController < ApplicationController
  before_filter :find_sandbox, except: [:index, :create]

  def index
    @page = Page.find(params[:page_id])
    respond_to do |format|
      format.json { render json: @page.sandboxes }
    end
  end

  def create
    @sandbox = Sandbox.new(params[:sandbox])
    respond_to do |format|
      if @sandbox.save
        format.json { render json: @sandbox, status: :created, location: @sandbox }
      else
        format.json { render json: @sandbox.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @sandbox }
    end
  end

  def update
    respond_to do |format|
      if @sandbox.update_attributes(params[:sandbox])
        @sandbox.trim_blocks
        format.json { head :no_content }
      else
        format.json { render json: @sandbox.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sandbox.destroy
    respond_to do |format|
      format.html { redirect_to sandboxs_url }
      format.json { head :no_content }
    end
  end

private

  def find_sandbox
    @sandbox = Sandbox.find(params[:id])
  end
end
