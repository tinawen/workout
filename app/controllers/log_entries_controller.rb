class LogEntriesController < ApplicationController
  # GET /log_entries
  # GET /log_entries.json
  def index
    @log_entries = LogEntry.all.group_by { |log_entry| log_entry.member.team }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @log_entries }
    end
  end

  # GET /log_entries/1
  # GET /log_entries/1.json
  def show
    @log_entry = LogEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @log_entry }
    end
  end

  # GET /log_entries/new
  # GET /log_entries/new.json
  def new
    @log_entry = LogEntry.new
    @log_entry.points = 0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @log_entry }
    end
  end

  # GET /log_entries/1/edit
  def edit
    @log_entry = LogEntry.find(params[:id])
  end

  # POST /log_entries
  # POST /log_entries.json
  def create
    @log_entry = LogEntry.new(params[:log_entry])

    respond_to do |format|
      if @log_entry.save
        format.html { redirect_to log_entries_path, :notice => 'Log entry was successfully created.' }
        format.json { render :json => @log_entry, :status => :created, :location => @log_entry }
      else
        format.html { render :action => "new" }
        format.json { render :json => @log_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /log_entries/1
  # PUT /log_entries/1.json
  def update
    @log_entry = LogEntry.find(params[:id])

    respond_to do |format|
      if @log_entry.update_attributes(params[:log_entry])
        format.html { redirect_to @log_entry, :notice => 'Log entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @log_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /log_entries/1
  # DELETE /log_entries/1.json
  def destroy
    @log_entry = LogEntry.find(params[:id])
    @log_entry.destroy

    respond_to do |format|
      format.html { redirect_to log_entries_url }
      format.json { head :ok }
    end
  end
end
