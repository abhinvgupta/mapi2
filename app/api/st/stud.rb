require_relative '../../controllers/application_controller.rb'
module API
	module ST
		class Stud < Grape::API
			
			format :json
			formatter :json, Grape::Formatter::Roar
			#before_action :authenticate_user!
			resource :students do 
				#S=Student.find_by_roll_no(1)

				get do 
					if user_signed_in?
						Student.all
					else
						present Student.find(params[:id]), with: ProductRepresenter
					end
				end

				#desc "new student"
				params do
					requires :roll_no, type:Integer
					requires :name, type:String
					requires :marks, type:Integer
				end
				post :new do

					puts 'test'
					stu = Student.create!({roll_no:params[:roll_no],s_name:params[:name] ,marks:params[:marks]  })
					Student.all
				end
				desc "delete student"
				params do 
					requires :name,type: String
				end
				delete ':name' do
					Student.find_by_s_name(params[:name]).destroy!
					#Student.where(roll_no: params[:roll_no]).destroy
				end

				desc "update student"
				params do 
					requires :roll_no,type: Integer
					requires :name,type: String
					requires :marks,type: Integer
				end
				put :upd do
					Student.find_by_roll_no(params[:roll_no]).update({
						s_name: params[:name],marks:params[:marks]
						})
				end

				get 'lala' do 
					arr = {"yo" => "go"}
				end


				
			end
		end
	end
end





		