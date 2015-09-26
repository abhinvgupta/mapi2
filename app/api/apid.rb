
require_relative 'st/stud.rb'
require_relative 'teac/teach.rb'
module API
	class Apid < Grape::API
		# prefix 'api'
		# version 'v1', using: :paths
		mount API::TEAC::Teach
		mount API::ST::Stud
	end
end
