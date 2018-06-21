class NotesController < ApplicationController
  before_action :set_project
  before_action :project_owner?
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = @project.notes.search(params[:term])
  end

  def show
  end

  def new
    @note = @project.notes.new
  end

  def edit
  end

  def create
    @note = @project.notes.new(note_params.merge(user: current_user))

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note.project, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note.project, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to @note.project, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:message, :project_id)
    end
end
