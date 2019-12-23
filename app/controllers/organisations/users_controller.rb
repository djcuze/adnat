module Organisations
  class UsersController < ApplicationController
    def create
      @facade ||= ::Organisations::JoinFacade.new(join_organisation_params)
      return unless @facade.form.save

      redirect_to root_path
    end

    private

    def join_organisation_params
      params.permit(:user_id, :organisation_id)
    end
  end
end
