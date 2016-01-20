class Home<ActiveRecord::Base

geocoded_by :add1

require 'roo'
require 'iconv'
@all=Array.new
validates :price, numericality: {greater_than_or_equal_to: 0.01}

	def self.save(file)
		import(file)
		@all
	end

  def self.import(file)
		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
		  row = Hash[[header, spreadsheet.row(i)].transpose]
		  home = find_by_id(row["id"]) || new
		  home.attributes = row.to_hash.slice("id","name","price") 	
		 	@all<< home
		end
	end

	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when ".csv" then Roo::Csv.new(file.path, packed: nil, file_warning: :ignore)
		when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
		when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end
	
end
