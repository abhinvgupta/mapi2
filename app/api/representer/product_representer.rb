module ProductRepresenter
	include Roar::JSON
	include Roar::Hypermedia
	include Grape::Roar::Representer 

	property :tilte
	property :id 

end
