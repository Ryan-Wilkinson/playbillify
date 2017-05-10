class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          if current_user.user_type == 'advertiser'
          	format.json { head :forbidden, content_type: 'text/html' }
          	format.html { redirect_to main_app.ads_index_path, notice: exception.message }
          	format.js   { head :forbidden, content_type: 'text/html' }
          else
          	format.json { head :forbidden, content_type: 'text/html' }
          	format.html { redirect_to main_app.organizations_path, notice: exception.message }
          	format.js   { head :forbidden, content_type: 'text/html' }
          end
        end
      end
      def after_sign_in_path_for(resource)
    		if resource.user_type == 'organization'
    	  	'/organizations'
    		elsif current_user.business.nil?
    			'/businesses/new'
        else
          '/ads'
    		end
      end
end
