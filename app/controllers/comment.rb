get '/contracts/:id/comments' do
	@comments = Comment.where(contract_id: "#{params[:id]}", ref_type: "comment")
  erb :'comments/_comments', :layout => false

end

post '/contracts/:id/comments' do
	comment = Comment.create(user_id: current_user.id, contract_id: params[:id] , company_id: current_user.company.id, ref_type: "comment", content: params[:comment])
	log = Log.create(action: "Added Comment", company_id: current_user.company.id, contract_id: params[:id], user_id: current_user.id, comment_id: comment.id)
	redirect back
end