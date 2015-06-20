class SummariesController < ApplicationController

  def index
    @summaries = Summary.all
  end

  def new
    @summary = Summary.new
  end

  def show
    @summary = Summary.find(params[:id])
  end

  def edit
    @summary = Summary.find(params[:id])
  end

  def create
    @summary = Summary.find(params[:summary])
  end

  def update
    @summary = Summary.find(params[:id])
  end
end
