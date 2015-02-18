get '/contracts' do

  @contracts = Contract.where(["maker_id = ? or taker_id = ?", "#{company_id}", "#{company_id}"])
  p @contracts
  erb :'contracts/all_my_contracts'
end

get '/contracts/status/:status' do

  @contracts = Contract.where(["maker_id = ? or taker_id = ?", "#{company_id}", "#{company_id}"]).where("status = ?", "#{params[:status]}")
    erb :'contracts/contracts_by_status'

end


get '/contracts/:id' do

	  @contract = Contract.find(params[:id])
	   erb :'contracts/contract'
  
end