require 'csv'
class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  # handle file upload
  def upload
    # headers true signals that the first row just defines the fields and isn't actually part of the dataset
    # each row is ordinal, so pos 0 = email, pos 1 = first_name, and pos 2 = last_name
    CSV.foreach(params[:leads].path, headers: true) do |lead|
      Customer.create(email:lead[0], first_name: lead[1], last_name: lead[2])
    end
    redirect_to customers_path
  end

end
