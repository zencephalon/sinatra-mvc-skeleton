get '/contracts' do

  @contracts = Contract.where(["maker_id = ? or taker_id = ?", "#{company_id}", "#{company_id}"])
  p @contracts
  erb :'contracts/all_my_contracts'
end

get '/contracts/new' do

  erb :'contracts/new'
end


post '/contracts/new' do

  erb :'contracts/new'
end

get '/contracts/status/:status' do

  @contracts = Contract.where(["maker_id = ? or taker_id = ?", "#{company_id}", "#{company_id}"]).where("status = ?", "#{params[:status]}")
    erb :'contracts/contracts_by_status', :layout => false

end


get '/contracts/:id' do

	  @contract = Contract.find(params[:id])
	   erb :'contracts/contract'
  
end


get '/contracts/:id/update_agreement' do
# status = Prosal changed
# change maker_agreement and taker_agreement
	
  
end


get '/contracts/:id/update_status/:status' do
	 Contract.update(params[:id], {:status => params[:status]})
  	redirect back
  
end






