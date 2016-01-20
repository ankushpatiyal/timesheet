class HomesController<ApplicationController

	def index
	@homes=Home.all
	end


	def new
		if current_user.admin?
			@home=Home.new		
		else
			redirect_to homes_path
		end
	end

	def create
		if current_user.admin?
			@home=Home.create(params.require(:home).permit(:name,:add1,:add2,:price))
			if @home.save
				redirect_to homes_path
			else
				render 'new'
			end
		else
			redirect_to root
		end
	end


	def show
	@home= Home.where(:id=>params[:id])
	end

	def edit

	end

	def import
		@homes=Home.save(params[:file])
		if @homes.map(&:valid?).all?
		 @homes.each(&:save!)
		 redirect_to homes_path, notice: "Products Imported"
		else
		 @i=0
		 @homes.each do |s|
			 s.errors.full_messages.each do |message|
			 
			 debugger
				 s.errors.add :base, "Row #{@i+1}: #{message}"
			 end
			 @i=@i+1
		 end
		end 
		render 'new'
	end

end
