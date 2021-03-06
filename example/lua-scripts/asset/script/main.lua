--[[
Copyright (c) 2013 Aerys

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

function main:start(root)
	self.lights = self:initializeLights(root)

	local assets = 	getSceneManager().assets

	assets
		:queue('effect/Basic.effect')
		:queue('effect/Phong.effect')
		:queue('texture/box.png')
		:queue('script/framerate.lua')
		:queue('script/camera.lua')
	
	self.assetsComplete = assets.complete:connect(function(assets)
		self.assetsComplete:disconnect()
		self.assetsComplete = nil

		self:initializeCamera(root, assets)

		root:addComponent(assets:script('script/framerate.lua'))

		local cube = Node.create()
			:addComponent(Transform.create())
			:addComponent(Surface.create(
				CubeGeometry.create(assets.context),
				Material.create():setTexture('diffuseMap', assets:texture('texture/box.png')),
				assets:effect('effect/Phong.effect')
			))
		root:addChild(cube)
	end)

	assets:load()
end

function main:initializeCamera(root, assets)
	self.camera = Node.create()
	self.camera.name = 'mainCamera'
	self.camera:addComponent(assets:script('script/camera.lua'))
	root:addChild(self.camera)
end

function main:initializeLights(root)
	local lights = Node.create()
		:addComponent(AmbientLight.create(.2))
		:addComponent(DirectionalLight.create(.4, 1.0))
	root:addChild(lights)

	return lights
end
