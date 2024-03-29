#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/order' do
	erb :order
end

post '/cart' do

	# получаем список параметров и разбираем их
	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	# выводим сообщение о том, что корзина пуста
	if @items.length <= 0
		return erb 'Your cart is now empty'
	end
	@items.each do |item|
		#id, cnt
		item[0] = Product.find(item[0])
	end

	# возвращаем значение по умодчанию
	erb :cart
end

def parse_orders_input orders_input
	s1 = orders_input.split(/,/)

	arr = []

	s1.each do |x|
		s2 = x.split(/\=/)

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]

		arr.push arr2
	end

	return arr
end

post '/place_order' do
	@o = Order.new(params[:order])
	if @o.save
		erb :order_placed
		# erb "<h2>Thanks, you has order, he in process</h2>"
		# написать команду для очистки localStorage в браузере
	end

end
