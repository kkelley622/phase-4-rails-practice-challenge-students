class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 

    private 

    def render_record_not_found_response(exemption)
        render json: { error: "#{exemption.model} not found" }, status: :not_found 
    end

    def render_unprocessable_entity_response(exemption)
        render json: { errors: exemption.record.errors.full_messages }, status: :unprocessable_entity 
    end
    
end
