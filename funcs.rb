# functions
def app_token
	if FileTest.exist?("./token.txt")
		File.open("./token.txt", "r").each { |line|
			return line
		}
	else
		return ENV['TOKEN']
	end
end

def roll(event,formula)
	dice = DiceBag::Roll.new(formula)
	result = dice.result
	maximum = dice.total
	chance = result.to_f / maximum
	chance_str = helper_chance_sense(chance)

	[
		helper_mention(event),
		result,
		chance_str
	].join(" ")
end

def roll_chance(event)
	dice = DiceBag::Roll.new('2d10')
	result = dice.result
	maximum = dice.total
	chance = result.to_f / maximum
	chance_str = helper_chance_sense(chance)

	[
		helper_mention(event),
		result,
		chance_str
	].join(" ")
end