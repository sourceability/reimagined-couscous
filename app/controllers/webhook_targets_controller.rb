class WebhookTargetsController < ApplicationController
  before_action :set_webhook_target, only: %i[ show edit update destroy ]

  # GET /webhook_targets or /webhook_targets.json
  def index
    @webhook_targets = WebhookTarget.all
  end

  # GET /webhook_targets/1 or /webhook_targets/1.json
  def show
  end

  # GET /webhook_targets/new
  def new
    @webhook_target = WebhookTarget.new
  end

  # GET /webhook_targets/1/edit
  def edit
  end

  # POST /webhook_targets or /webhook_targets.json
  def create
    @webhook_target = WebhookTarget.new(webhook_target_params)

    if @webhook_target.save
      redirect_to webhook_target_url(@webhook_target), notice: "Webhook target was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /webhook_targets/1 or /webhook_targets/1.json
  def update
    if @webhook_target.update(webhook_target_params)
      redirect_to webhook_target_url(@webhook_target), notice: "Webhook target was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /webhook_targets/1 or /webhook_targets/1.json
  def destroy
    @webhook_target.destroy

      redirect_to webhook_targets_url, notice: "Webhook target was successfully destroyed."
  end

  def hooks
    @webhook_target = WebhookTarget.find_by(token: params[:token])
    if @webhook_target.nil?
      render plain: "Invalid token", status: :unauthorized
    else
      @webhook_target.update!(last_used_at: Time.now)
      render plain: "OK"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webhook_target
      @webhook_target = WebhookTarget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webhook_target_params
      params.require(:webhook_target).permit(:repository)
    end
end
