get '/contracts/:id/logs' do
	@logs = Log.where(contract_id: "#{params[:id]}")
  erb :'logs/index'
end