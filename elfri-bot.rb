=begin

Бот для ведения игр Эльфри на Диване

Функции:
	roll - бросает кубики по указанной формуле
	chance - бросает кубики на успех без модификаторов

=end

require 'discordrb'
require 'dicebag'
require './helpers.rb'
require './funcs.rb'

# Common variables
@crlf = "\n"

# Setup the bot
bot = Discordrb::Commands::CommandBot.new(
	token: app_token,
	client_id: Config::Bot.client_id,
	prefix: Config::Bot.prefix,
	no_permission_message: "PVP Bot can't write any message on this channel!#{@crlf}"+
		"Check settings in 'config.ini' or in Discord server/channel settings."
)

puts '-'*40
puts "PVP Bot is running."
puts "This bot's invite URL is #{bot.invite_url}."


# Commands
bot.command(
	:inv,
	min_args: 0, 
	max_args: 1, 
	usage: "roll [xDx][+/- e\#|d\#|k\#|r\#|t\#, ...]",
	description: "Бросает кубики на успех того или иного действия#{@crlf}"+
			"Возвращает полученное значение и интерпретацию."
) do |event, formula|
	formula = '2d10' if formula.nil?
	event.respond roll(event,formula)
end

bot.command(
	:chance,
	description: "Бросок успеха без модификаторов.#{@crlf}"+
	"По умолчанию бросает два десятигранных кубика.#{@crlf}"+
	"Возвращает полученное значение и интерпретацию."
) do |event|
	event.respond roll_chance(event)
end