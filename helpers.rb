# helpers
def helper_mention(event)
	"#{event.user.mention} "
end

def helper_chance_sense(chance)
	chance_str = "(%s)"
	if chance < 0.10
		chance_str % "критический провал"
	elsif chance < 0.49
		chance_str % "провал"
	elsif chance < 0.94
		chance_str % "успех"
	else
		chance_str % "невероятный успех"
	end

	chance_str
end