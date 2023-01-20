surface.CreateFont( "Nig3", {
	font = "College Block 2.0",
	extended = true,
	size = 22,
	weight = 400,
	blursize = 0,
	scanlines = 0,
})
surface.CreateFont( "Nig4", {
	font = "College Block 2.0",
	extended = true,
	size = 27,
	weight = 500,

})
surface.CreateFont( "Nig5", {
	font = "College Block 2.0",
	extended = true,
	size = 35,
	weight = 500,

})
surface.CreateFont( "MetroFont", {
	font = "Capture it",
	extended = true,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
})
surface.CreateFont( "MetroFontBig", {
	font = "Capture it",
	extended = true,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
})
local function ToggleScoreboard( yes )
    if yes then
    else    
    	Main:Remove()
    	TablePlayers:Remove()
		sahakolPlayers:Remove()
    end
end
-- --------------------------------------------------
local x,y = ScrW(), ScrH()


local accessList = {
	["superadmin"] = true,
	["admin"] = true
}

function DownLoad_Image(url,name)
	file.CreateDir('RopLeR/image/')
	http.Fetch(url,function(x)
		local f = file.Open( "RopLeR/image/" .. name, "wb", "DATA" )
		f:Write( x )
		f:Close()
    end)
end	

	DownLoad_Image("https://i.ibb.co//Y09tz4Z//signalgud.png","signalgud.png")

	DownLoad_Image("https://i.ibb.co/t2HscFn/signalbad.png","signalbad.png")

	DownLoad_Image("https://i.ibb.co/1ZVgJ76/notmutewhite.png","notmutewhite.png")

	DownLoad_Image("https://i.ibb.co/H2XQ75M/notmute.png","notmute.png")

	DownLoad_Image("https://i.ibb.co/Qkzwynz/mutewhite.png","mutewhite.png")

	DownLoad_Image("https://i.ibb.co/6FgrYL1/mute.png","mute.png")

	DownLoad_Image("https://i.ibb.co/SvBGjtc/logo.png","logo.png")




hook.Add( "ScoreboardShow", "Scoreboard_Open", function()

  	Main = vgui.Create("DFrame")
	Main:SetPos(x * .06	, y * 0.05)
	Main:SetSize(0,0)
	Main:SizeTo(x* 0.88,y * 0.2,0.1,0,-1)
    Main:MakePopup()
    Main.Paint = function(self,w,h)
    	surface.SetDrawColor(color_black)
    	surface.DrawRect(0, 0, w, h / 1.3)
    	surface.SetDrawColor(0,0,0,240)
    	surface.DrawRect(0,h/1.3,w,h)
    end
    Main:SetTitle("")
    Main:ShowCloseButton(false)
    Main:SetDraggable(false)

	
    local icon = Main:Add("DImage")
    icon.Think = function (self)
    	if Main:GetWide() > 0 then
     self:SetMaterial("data/RopLeR/image/logo.png")
    self:SetSize(Main:GetWide() * .17 , Main:GetTall() * .5)
    self:SetPos(Main:GetWide() * .026 , Main:GetTall() * .12)
end
    end

    local mapandmode = Main:Add("DLabel")
    mapandmode.Think = function(self)
    	if Main:GetWide() > 0 then
	    self:SetFont("MetroFont")
	    self:SetSize(250,50)
	    self:SetText("Map: " .. game.GetMap() .. "\nGamemode: " .. gmod.GetGamemode().Name)
	    self:SetColor(color_white)
	    self:SetPos(Main:GetWide() * .24,Main:GetTall() * .1)	
	end
    end





    sahakolPlayers = Main:Add("DLabel")
    sahakolPlayers.Think = function(self)
    if Main:GetWide() > 0 then
    sahakolPlayers:SetSize(x * 0.2, y * 0.1)
	sahakolPlayers:SetPos(Main:GetWide() * 0.77,Main:GetTall() * .005)
	sahakolPlayers.Paint = nil

		sahakolPlayers:SetText("     Players count " .. player.GetCount() .. " / " .. game.MaxPlayers())

	sahakolPlayers:SetFont("MetroFontBig")
	sahakolPlayers:SetColor(Color(255,255,255))
	end
    end


    TablePlayers = vgui.Create("DFrame")
	TablePlayers:ShowCloseButton(false)
	TablePlayers:SetTitle("")
	TablePlayers:SetDraggable(false)
	TablePlayers:SetPos(x * .06, y * .25)
	TablePlayers:SetSize(x* 0.88,y * 0.7)
	TablePlayers.Paint = function(self,w,h)
		surface.SetDrawColor(color_black)
		surface.DrawRect(0,0,w,h)
	end

	local ScrollBar = vgui.Create( "DScrollPanel", TablePlayers )
	ScrollBar:Dock( FILL )
	local movedown = 0

	for k,v in pairs(player.GetAll()) do
		local playerButton = ScrollBar:Add("DButton")

		playerButton.DoClick = function()
			Main:Hide()
			TablePlayers:Hide()
		    playerInfo = vgui.Create("DPanel")
			playerInfo:MakePopup()
			playerInfo:SetPos(x * .06, y * .05)
	        playerInfo:SetSize(x* 0.88,y * 0.9)
	        playerInfo.Paint = function(self,w,h)
	        	surface.SetDrawColor(color_black)
	        	surface.DrawRect(0,0, w, h  * .1)
	        	surface.SetDrawColor(0,0,0,240)
	        	surface.DrawRect(0,h *.1, w, h )
	        end



	        local back = playerInfo:Add("DButton")
	        back:SetFont("Nig5")
	        back:SetText("Назад")
	        back:SetSize(x * 0.06,y * 0.04)
	        back:SetPos(playerInfo:GetWide() * .03,playerInfo:GetTall() * .025)
	        back.DoClick = function()
	        	playerInfo:Remove()
	        	if IsValid(TablePlayers) and IsValid(Main) then
	        	TablePlayers:Show()
	        	Main:Show()
	        end
	        end
	       --[[-------------------------------------------------------------------------
	        Title
	        ---------------------------------------------------------------------------]] 
	        back.Paint = nil
	        back:SetColor(color_white)



		    local AboutPlayerBack = playerInfo:Add("DPanel")
		    AboutPlayerBack:SetSize(playerInfo:GetWide() * .5, playerInfo:GetTall() * .18)
		    AboutPlayerBack:SetPos(playerInfo:GetWide() * .065, playerInfo:GetTall() * .2)
		    AboutPlayerBack.Paint = function (s,w,h)
		    	surface.SetDrawColor(color_black)
		    	surface.DrawRect(0,0,w,h)
		    	draw.SimpleText(v:Nick(), "Nig5",w * .23,  h * 0.1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		    	draw.SimpleText(team.GetName(v:Team()), "Nig4",w * .23,  h * 0.3, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		    	draw.SimpleText(v:GetUserGroup(), "Nig5",w * .23,  h * 0.55, Color(200,100,4), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		    	if v:Ping() < 100 then
				surface.SetMaterial(Material("data/RopLeR/image/signalgud.png"))
				else
				surface.SetMaterial(Material("data/RopLeR/image/signalbad.png"))
				end
					surface.SetDrawColor(color_white)
					surface.DrawTexturedRect(w * .95,h * .1, w * .035, h * .15)


				if v.ismuted then
					surface.SetMaterial(Material("data/RopLeR/image/mutewhite.png"))
				else
					surface.SetMaterial(Material("data/RopLeR/image/notmutewhite.png"))
				end
				if LocalPlayer() != v then
				surface.SetDrawColor(color_white)
				surface.DrawTexturedRect(w * .95,h * .35, w * .035, h * .15)
				end

		    end
		    if not IsValid(plyAvatar) then
		     local plyAvatar = AboutPlayerBack:Add("AvatarImage")
		
		    plyAvatar:SetSize( playerInfo:GetWide() * 0.1, playerInfo:GetTall() * 0.18)
		    plyAvatar:SetPos( 0,0)
		    plyAvatar:SetPlayer( v, 128 )
		end
		    local backforstats = playerInfo:Add("DPanel")
		    backforstats:SetSize(playerInfo:GetWide() * .5, playerInfo:GetTall() * .08)
		    backforstats:SetPos(playerInfo:GetWide() * .065, playerInfo:GetTall() * .4)
		    backforstats.Paint = function(s,w,h)
		        surface.SetDrawColor(color_black)
		    	surface.DrawRect(0,0,w,h)
		    	draw.SimpleText("Kills: " .. v:Frags() .. "     Deaths: " .. v:Deaths(), "MetroFont",w * .23,  h * 0.2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		    	if v:Alive() then
		    	draw.SimpleText("Current weapon: " .. v:GetActiveWeapon():GetClass() , "MetroFont",w * .23,  h * 0.55, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		    else
		    	draw.SimpleText("Current weapon: None"  , "MetroFont",w * .23,  h * 0.55, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		    end
		    end
		    local steamidButt = backforstats:Add("DButton")
		    steamidButt:SetSize(x * 0.065, backforstats:GetTall() * .5)
			steamidButt:SetPos(backforstats:GetWide() * .045, backforstats:GetTall() * .25)
			steamidButt:SetText("Steam")
			steamidButt:SetFont("MetroFontBig")
			steamidButt:SetColor(color_white)
			steamidButt.Paint = nil
			steamidButt.Think = function(self)
				if self:IsHovered() then
					self:SetColor(Color(200,52,4))
				else
					self:SetColor(color_white)
				end
			end
			steamidButt.DoClick = function()
				SetClipboardText(v:SteamID())
				notification.AddLegacy("Successfully copied player's steamid " .. v:Nick(), 0, 4)
				surface.PlaySound("UI/buttonclick.wav")
			end






        local mins, maxs = v:GetModelBounds()
		local modelback = playerInfo:Add("DPanel")
		modelback:SetSize(playerInfo:GetWide() * .3,maxs[3] * 9.8)
		modelback:SetPos(playerInfo:GetWide() * .63,playerInfo:GetTall() * .1965)
		modelback.Paint = function(s,w,h)
		draw.RoundedBox(5, w,0, w * 1.2,h, color_white)
			draw.RoundedBox(5, 0,0, w,h, color_black)
		end

	    local finalmodel = vgui.Create( "DModelPanel", playerInfo  )
        finalmodel:SetSize(playerInfo:GetWide() * .5,playerInfo:GetTall())
        finalmodel:SetPos(playerInfo:GetWide() * .53,playerInfo:GetTall() * .025)
        finalmodel:SetModel( v:GetModel() )
        function finalmodel:LayoutEntity( Entity ) return end
        finalmodel:SetLookAt(Vector(-80,-0,20))
        finalmodel:SetCamPos(-Vector(-70, -0, -60))   
        finalmodel:SetFOV(65)


	    if accessList[LocalPlayer():GetUserGroup()]  then
	    	for i =1, 3 do
	    		local command = playerInfo:Add("DButton")
	    		command:SetPos(playerInfo:GetWide() * (i/7.5), playerInfo:GetTall() * .55)
	    		command:SetSize(playerInfo:GetWide() * .1, playerInfo:GetTall() * .08)
	    		command:SetFont("Nig5")

	    	   command.Paint = function (self,w,h)
	    		if self:IsHovered() then
	    			draw.RoundedBox(0, 0, 0, w, h, Color(200,52,4))
	    		else
	    			draw.RoundedBox(0, 0, 0, w, h, Color(200,100,4))
	    		end
		    	if not v:IsFrozen() then
		    	  tableofCommands = {"goto","bring","freeze"}
		         else
		    	tableofCommands = {"goto","bring","unfreeze"}
	            end
	            command:SetText(tableofCommands[i])
			    end
	    		
	    		command:SetColor(color_white)
	

				command.DoClick = function()
					LocalPlayer():ConCommand( 'ulx ' .. tableofCommands[i] .. ' "' .. v:Nick() .. '"' )
				end

	    	end

	    end
	end








		if LocalPlayer() != v then
		local muteorno = playerButton:Add("DButton")
		if player.GetCount() > 8 then
		muteorno:SetPos(x * 0.822,playerButton:GetTall() * .9)	
	else
		muteorno:SetPos(x * 0.83,playerButton:GetTall() * .9)
	end
		muteorno:SetSize(playerButton:GetWide() * .55, playerButton:GetTall() * 2)
		muteorno:SetText("")
		muteorno.Paint = nil

		muteorno.DoClick = function ()
		     v.ismuted = !v.ismuted
		     v:SetMuted(v.ismuted)
		end
	end
		local Avatar = playerButton:Add("AvatarImage")
		
		Avatar:SetSize( playerButton:GetWide() * 1.3, y * 0.08)
		Avatar:SetPos( playerButton:GetWide() * .2, playerButton:GetTall() * .03  )
		Avatar:SetPlayer( v, 128 )
		-- 
		playerButton:SetPos(0, movedown) 
		playerButton:SetSize(TablePlayers:GetWide() * 0.994, y * .08)
		playerButton:SetColor(Color(255,255,255))
		playerButton:SetText("")
		playerButton:SetFont("Nig3")
		playerButton.isAnimating = true

		playerButton.Paint = function(self,w,h)
			if self:IsHovered() then 
				if self.isAnimating then	
				self:SetAlpha(0)
				self:AlphaTo(255,0.1,0,function()
					self.isAnimating = false	
				end)
			end
		else
			self.isAnimating = true

		end
		if not self.isAnimating then 
		surface.SetDrawColor(200,52,4)
	else
        surface.SetDrawColor(200,100,4)
	end
		surface.DrawRect(0,0,w,h)

		draw.SimpleText(v:Ping(),"Nig3", w * .88, h * .35, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		if v:Ping() < 100 then
		surface.SetMaterial(Material("data/RopLeR/image/signalgud.png"))
	else
		surface.SetMaterial(Material("data/RopLeR/image/signalbad.png"))
	end
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(w * .85,h * .35, w * .02, h * .3)

		if v.ismuted  then

			surface.SetMaterial(Material("data/RopLeR/image/mute.png"))
		else
			surface.SetMaterial(Material("data/RopLeR/image/notmute.png"))
		end
		if LocalPlayer() != v then
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(w * .95,h * .31, w * .02, h * .4)
	end
		if player.GetCount() > 8 then
			self:SetSize(TablePlayers:GetWide() * 0.985, y * .08)
		else
			self:SetSize(TablePlayers:GetWide() * 0.994, y * .08)
		end
		--
	end

	local playerInfo = playerButton:Add("DLabel")
		playerInfo:SetText(v:Nick())
		playerInfo:SetPos(Avatar:GetWide() * 1.37,playerButton:GetTall() / 4.5)
		playerInfo:SetColor(Color(255,255,255))
		playerInfo:SetFont("Nig4")
		playerInfo:SetSize(x ,y / 40)
		
		
		local playerTeam = playerButton:Add("DLabel")
		playerTeam:SetText(team.GetName(v:Team()))
		playerTeam:SetColor(Color(255,255,255))
		playerTeam:SetFont("Nig3")	
		playerTeam:SetPos(playerButton:GetWide() * .068, playerButton:GetTall() * .35)	
		playerTeam:SetSize(250,50)
		movedown = movedown + y * 0.083	
	end





  	ToggleScoreboard(true)
  	return false
end )
hook.Add( 'ScoreboardHide', 'ScoreboardClose', function()

    ToggleScoreboard(false)

end)