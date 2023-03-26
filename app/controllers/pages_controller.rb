# frozen_string_literal = true

require 'csv'

class PagesController < ApplicationController
  def home() end

  def export
    @number_of_companies = Company.all.size
  end

  def csv
    @companies = Company.order(:name)

    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = 'attachment; filename=ruby_companies.csv'
        render template: 'pages/companies'
      end
    end
  end
end
