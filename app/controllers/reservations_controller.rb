class ReservationsController < ApplicationController

    before_action :permit_params, except: :new

    def new
		@reseration = Reseration.new
	end

    def back
		@reseration = Reseration.new(@attr)
		render :new
	end

    def confirm
		@reseration = Reseration.new(@attr)
		if @reseration.invalid?
			render :new
		end
	end

    def complete
		Reseration.create!(@attr)
	end

    private

    def permit_params
		@attr = params.require('reseration').permit(:id, :reseration_date, :name, :note)
	end


end
