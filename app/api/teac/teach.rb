module API
	module TEAC
		class Teach < Grape::API
			format :json
			get '/' do
				Teacher.all 
			end
			resource :tea do 
				get '/' do
					Teacher.all

				end
				desc "new teacher"
				params do
					requires :subject,type: String
					requires :phone,type: Integer
					requires :name,type: String
				end
				post :new do
					Teacher.create!({subject:params[:subject],phone:params[:phone],name:params[:name]})
				end
				desc "delete"
				params do
					requires :id,type:String
				end
				delete ':id' do
					Teacher.find(params[:id]).destroy!

				end
				desc "update"
				params do
					requires :id,type: String
					requires :phone,type: Integer
				end
				put ':id' do
					Teacher.find(params[:id]).update({
						phone:params[:phone]
						})
				end
			end
		end
	end
end
