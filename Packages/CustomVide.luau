local Vide = require(script.Parent.Vide)
local c = Vide.create

type Scale = {
	Scale: number?,
}

type Stroke = {
	ApplyStrokeMode: any,
	BorderStrokePosition: any,
	BorderOffset: UDim?,
	Thickness: number?,
	Transparency: number?,
	LineJoinMode: any,
	Enabled: boolean?,
	Color: Color3?,
}

type IMGLabel = {
	Name: string?,
	BackgroundColor3: Color3?,
	AnchorPoint: Vector2?,
	BackgroundTransparency: number?,
	BorderColor3: Color3?,
	BorderMode: any,
	BorderSizePixel: number?,
	Rotation: number?,
	Position: UDim2?,
	Size: UDim2?,
	Visible: any?,
	Image: string?,
	ImageColor3: Color3?,
	ImageTransparency: number?,
}

type IMGButton = {
	Name: any?,
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	BorderColor3: Color3?,
	BorderMode: any,
	BorderSizePixel: number?,
	Image: string?,
	ImageColor3: Color3?,
	ImageTransparency: number?,
	Rotation: number?,
	Visible: any?,
	Activated: any,
	MouseEnter: any,
	MouseLeave: any,
	MouseButton1Click: any,
	MouseButton2Click: any,
}

type Corner = {
	Name: string?,
	CornerRadius: UDim?,
}

type ListLayout = {
	Name: string?,
	Padding: UDim?,
	FillDirection: any,
	HorizontalAlignment: any,
	VerticalAlignment: any,
}

type TButton = {
	Text: any?,
	TextScaled: boolean?,
	TextColor3: any?,
	Font: any,
	Size: any?,
	Position: UDim2?,
	Name: any?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	AnchorPoint: Vector2?,
	Visible: boolean?,
	Activated: any,
	MouseEnter: any,
	MouseLeave: any,
	MouseButton1Click: any,
	MouseButton2Click: any,
}

type TLabel = {
	TextTransparency: number?,
	Text: any,
	Font: any,
	TextScaled: boolean?,
	TextColor3: any?,
	Size: any?,
	Position: any?,
	Name: any?,
	BackgroundColor3: any?,
	BackgroundTransparency: any?,
	AnchorPoint: Vector2?,
	Visible: boolean?,
}

type Fr = {
	Size: any,
	Position: any?,
	Name: any?,
	BackgroundTransparency: any?,
	BackgroundColor3: any?,
	AnchorPoint: Vector2?,
	Visible: boolean?,
}

local V = {}

function V.UIScale(p: Scale)
	return c("UIScale")({ p })
end

function V.UIStroke(props: Stroke)
	return c("UIStroke")({ props })
end

function V.ImageButton(props: IMGButton)
	return c("ImageButton")({ props })
end

function V.ImageLabel(props: IMGLabel)
	return c("ImageLabel")({ props })
end

function V.UIListLayout(props: ListLayout)
	return c("UIListLayout")({ props })
end

function V.UICorner(props: Corner)
	return c("UICorner")({ props })
end

function V.Frame(props: Fr)
	return c("Frame")({ props })
end

function V.TextLabel(props: TLabel)
	return c("TextLabel")({ props })
end

function V.TextButton(props: TButton)
	return c("TextButton")({ props })
end

return V
