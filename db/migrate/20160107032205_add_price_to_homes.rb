class AddPriceToHomes < ActiveRecord::Migration
	
	def change
		add_column :homes, :price , :string	
	end

end
