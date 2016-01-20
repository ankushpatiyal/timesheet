class AddAdd1AndAdd2ToHomes < ActiveRecord::Migration

	def change
		add_column :homes, :add1, :string
		add_column :homes, :add2, :string
	end

end
