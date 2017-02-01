# class ApiController < ActionController::API
# 	protect_from_forgery with: :null_session
# 	acts_as_token_authentication_handler_for User
# 	before_filter :cors_set_access_control_headers

	
# 	def cors_set_access_control_headers
# 	  headers['Access-Control-Allow-Origin'] = '*'
# 	  headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
# 	  headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
# 	  headers['Access-Control-Max-Age'] = "1728000"
# 	end
# 	# before_filter :authenticate_user!
# 	#   prepend_before_filter :get_auth_token

# 	#   respond_to :xml, :json

# 	# private
#  #   def get_auth_token
#  #      if auth_token = params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"]
#  #        params[:auth_token] = auth_token
#  #      end
#  #   end
# end