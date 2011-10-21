class DocumentsController < ApplicationController

  def index
    @documents = Project.find(params[:project_id]).documents
  end

  def new
    @document = Document.new
  end

  def edit
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.new(params[:document])
    @document.project = current_user.current_project
    @document.save
    redirect_to project_documents_path(@document.project)
  end

  def update
    @document = Document.find(params[:id])
    @document.update_attributes params[:document]
    @document.save
    redirect_to project_documents_path(@document.project)
  end

  def show
    @document = Document.find(params[:id])
    send_file @document.file.to_s
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to project_documents_path(@document.project)
  end
end
