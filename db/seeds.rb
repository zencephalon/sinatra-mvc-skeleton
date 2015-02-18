company1 = Company.create(name:"Chase")
company2 = Company.create(name:"Citi")

user1 = User.create(username: "chase-user1", password: "123", password_confirmation: "123", company_id: company1.id)
user2 = User.create(username: "citi-user1", password: "123", password_confirmation: "123", company_id: company2.id)

contract1 = Contract.create(status: "draft", maker: company1, taker: company2, maker_agreement: "#{company1.name} gives $30 Million dollars and 5 cents worth of trident layers to #{company2.name}", taker_agreement: "#{company2.name} will provide #{company2.name} with services.")

comment1 = Comment.create(user_id: user1.id, contract_id: contract1.id , company_id: company1.id, ref_type: "log", content: "Added Contract")

log1 = Log.create(action: "Added Contract", company_id: contract1.maker, contract_id: contract1.id, user_id: user1.id, comment_id: comment1.id)

comment2 = Comment.create(user_id: user1.id, contract_id: contract1.id , company_id: company1.id, ref_type: "comment", content: "@#{user2.username} ... Why is it taking so long.  As per our phone conversation, you said you would approve this contract request.")

log2 = Log.create(action: "Added Comment", company_id: contract1.maker, contract_id: contract1.id, user_id: user1.id, comment_id: comment2.id)

