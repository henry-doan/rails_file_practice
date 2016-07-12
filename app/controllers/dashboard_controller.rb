class DashboardController < ApplicationController
	require 'csv'

  def index
  end

  def read_csv
  	csv_file = "#{File.expand_path(".")}/tmp/user.csv"
  	users = []
  	CSV.foreach(csv_file, { headers: true, header_converters: :symbol }) do |row|
  		users << row.to_hash
  	end
  end

  def write_csv
  	CSV.open("tmp/my_file.csv", "wb") do |csv|
  		csv << ['this', 'is', 'a', 'row']
  		csv << ['this', 'is', 'another', 'row']
  	end
  end

  def write
  	path = "#{File.expand_path(".")}/tmp/"
  	File.open("#{path}#{params[:file][:filename]}", "wb") do |file|
  		begin
  			file.write(params[:file][:content])
  		rescue => e
  			logger.error e.messages
  		end
  	end
	  redirect_to :root
  end

  def read
  	base_file = "#{File.expand_path(".")}/tmp/my_file.txt"
  	File.open(file, 'r') do |file|
  		@content = file.read
  	end
  end

end
