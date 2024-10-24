require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @apr = (params.fetch("user_apr").to_f)/100/12
  @years = (params.fetch("user_years").to_f)*12
  @principal = params.fetch("user_pv").to_f
  @numerator = @apr * @principal
  @quotes = 1+@apr
  @exp = @quotes ** -@years
  @denominator = 1-@exp
  @the_result = @numerator/@denominator
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_calc)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @the_result = rand(@min .. @max)
  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
