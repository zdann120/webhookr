class DataSets::IncomingRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:show]
  def create
    body = request.body.read
    payload = JSON.parse body
    data_set = DataSet.find_by_uid(params[:uid])
    incoming_request = data_set.incoming_requests.new(payload: payload)
    if incoming_request.save
      render json: { result: 'success', uid: incoming_request.uid }, status: 200
    else
      render json: { result: 'error' }, status: 500
    end
  end

  def show
    @incoming_request = IncomingRequest.find_by_uid(params[:uid])
  end
end
