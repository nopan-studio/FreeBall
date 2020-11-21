function varToString(var) -- CREDITS PEOPLE ON THE WEB
    if type(var) == "string" then
        return "\"" .. var .. "\""
    elseif type(var) ~= "table" then
        return tostring(var)
    else
        local ret = "{ "
        local ts = {}
        local ti = {}
        for i, v in pairs(var) do
            if type(i) == "string" then
                table.insert(ts, i)
            else
                table.insert(ti, i)
            end
        end
        table.sort(ti)
        table.sort(ts)
        
        local comma = ""
        if #ti >= 1 then
            for i, v in ipairs(ti) do
                ret = ret .. comma .. varToString(var[v])
                comma = ", "
            end
        end
        
        if #ts >= 1 then
            for i, v in ipairs(ts) do
                ret = ret .. comma .. "[\"" .. v .. "\"] = " .. varToString(var[v])
                comma = ", "
            end
        end
        
        return ret .. "}"
    end
end

---------------------------------------------------
function save_file(filename,t)
    love.filesystem.write(filename,"savefile ="..varToString(t))
end

function load_file(filename) 
    love.filesystem.load(filename)()
end

function check_scores(t)
    if savefile.HighScore <= t.score then
        savefile.HighScore = t.score 
    end
    savefile.Score = savefile.Score + t.score
    savefile.GameColor = gameColor
    save_file("save.lua",savefile)
end

function check_changes(t)
    savefile.GameColor = gameColor
    save_file("save.lua",savefile)
end

function check_save()
			local create_savefile = {
				HighScore = 0,
                Score = 0,
                GameColor = "white",
                locked_red = true,
                locked_blue = true,
                locked_green = true,
                locked_violet = true,
                locked_pink = true,
                locked_yellow = true,
                locked_marine = true,
                locked_aqua = true,
                locked_white = false,
			}
            
			if love.filesystem.getInfo("save.lua") == nil then
				save_file("save.lua",create_savefile)
					print("create")
				load_file("save.lua")
				print("loaded save file")
			else
				load_file("save.lua")
				print("loaded save file")
            end
end