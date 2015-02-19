get '/contracts' do

  @contracts = Contract.where(["maker_id = ? or taker_id = ?", "#{company_id}", "#{company_id}"])
  p @contracts
  erb :'contracts/all_my_contracts'
end

get '/contracts/new' do
  @companies = Company.all
  erb :'contracts/new'
end


post '/contracts/new' do

  puts "\n\n\n\n\n\n"
  p params
  @contract = Contract.create(name: params[:name], status: "draft", maker_id: current_user.company.id, taker_id: params[:companyID], maker_agreement: params[:maker_agreement], taker_agreement: params[:taker_agreement])
  redirect '/dashboard'

end

get '/contracts/status/:status' do

  @contracts = Contract.where(["maker_id = ? or taker_id = ?", "#{company_id}", "#{company_id}"]).where("status = ?", "#{params[:status]}")
    erb :'contracts/contracts_by_status', :layout => false

end


get '/contracts/:id' do
    @comments = Comment.where(contract_id: "#{params[:id]}", ref_type: "comment")

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






