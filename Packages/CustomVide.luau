local Vide = require(script.Parent.Vide)
local c = Vide.create

local V = {}

function V.UIScale(p: UIScale?)
	return c("UIScale")({ p })
end

function V.UIStroke(props: UIStroke?)
	return c("UIStroke")({ props })
end

function V.ImageButton(props: ImageButton?)
	return c("ImageButton")({ props })
end

function V.ImageLabel(props: ImageLabel?)
	return c("ImageLabel")({ props })
end

function V.UIListLayout(props: UIListLayout?)
	return c("UIListLayout")({ props })
end

function V.UICorner(props: UICorner?)
	return c("UICorner")({ props })
end

function V.Frame(props: Frame?)
	return c("Frame")({ props })
end

function V.TextLabel(props: TextLabel?)
	return c("TextLabel")({ props })
end

function V.TextButton(props: TextButton?)
	return c("TextButton")({ props })
end

return V
