def company_id
	if current_user
		company_id = current_user.company.id
	end

end