function RequireFolder(folder)
    if love.filesystem.getDirectoryItems(folder) then 
        for k, v in pairs(love.filesystem.getDirectoryItems(folder)) do
            if string.find(v, ".lua") then
            local n = string.gsub(v, ".lua", "")
         require(folder.."/"..n)
            end
        end
    end
end

function love.load()
    io.stdout:setvbuf("no")

    Game = {}
    Game.Width = 1280
    Game.Height = 704
    Game.ImageSize = 32
    Game.Title = "ForOurKingdom"

    love.window.setMode(Game.Width, Game.Height)
    love.window.setTitle(Game.Title)

    love.graphics.setDefaultFilter("nearest")

    RequireFolder("lua")
end

function love.update(dt)
    Players:Update(dt)
end

function love.draw()
    Map:Draw()

    Players:Draw()
end

function love.keypressed(k)
    Players:Key(k)
end
