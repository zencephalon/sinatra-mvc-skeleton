get '/contracts/:id/comments' do
	@comments = Comment.where(contract_id: "#{params[:id]}", ref_type: "comment")
  erb :'comments/index'
end