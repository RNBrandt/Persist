class DocumentsController < ApplicationController
  include DocusignHelper

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    #where we upload and base64 the doc
    @document = Document.new(document_params)
  end

  def show
    @document = Document.find(params[:id])
  end

  private

  def document_params
    params.require(:document).permit(
      :name,
      :documentId,
      :documentBase64
      )
  end

end
