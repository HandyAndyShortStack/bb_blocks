class PagesController < ApplicationController
  before_filter :find_page, except: :create

  def create
    @page = Page.new(params[:page])
    respond_to do |format|
      if @page.save
        format.json { render json: @page, status: :created, location: @page }
      else
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @page }
    end
  end

  def update
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.json { head :no_content }
      else
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

private

  def find_page
    @page = Page.find(params[:id])
  end
end
