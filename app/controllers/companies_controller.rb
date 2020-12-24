class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    
    
  end

end

  def company_params
    params.require(:company).permit(:company_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :phone_numaber, :prefecture_id, :city).merge(company_id: current_company.id)
  end

