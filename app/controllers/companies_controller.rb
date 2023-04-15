class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :set_locations, only: %i[index edit create]
  before_action :authenticate_user!, only: %i[edit]

  # GET /companies or /companies.json
  def index
    # TODO: Time to turn it into a UseCase is coming
    scope = policy_scope(Company)
    scope = scope.by_province(params[:province]) if params[:province].present?
    @companies = scope.page(params[:page]).per(9)
  end

  # GET /companies/1 or /companies/1.json
  def show
    @comments = @company.comments.with_author.where(parent: nil)
    @comment = @company.comments.build

    authorize @company
  end

  # GET /companies/new
  def new
    @company = Company.new
    authorize @company
  end

  # GET /companies/1/edit
  def edit
    authorize @company
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    authorize @companies

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    authorize @company

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    authorize(@company)

    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def set_locations
    @locations = Company::VALID_LOCATIONS
  end

  def company_params
    params.require(:company).permit(:name, :url, :location)
  end
end
