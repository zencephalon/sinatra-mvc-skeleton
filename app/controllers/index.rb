before do
  @messages ||= {}
  # @locations ||= {}
end

get '/' do
  erb :login
end
