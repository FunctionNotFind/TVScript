local part = script.Parent -- Hace referencia al objeto donde está el script
local launchForce = 100 -- La fuerza del empuje (ajústala según necesites)

-- Evento que se activa cuando algo toca el objeto
part.Touched:Connect(function(hit)
    -- Verifica si el objeto tocado tiene un Humanoid (es un jugador)
    local character = hit.Parent
    local humanoid = character:FindFirstChild("Humanoid")

    if humanoid then
        -- Encuentra la raíz del personaje para aplicar el empuje
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            -- Calcula la dirección del empuje (puedes personalizarla)
            local direction = (root.Position - part.Position).unit * launchForce
            direction = Vector3.new(direction.X, math.abs(direction.Y) + 50, direction.Z) -- Asegura que empuje hacia arriba

            -- Aplica el empuje usando BodyVelocity
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = direction
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000) -- Asegura que pueda mover al jugador
            bodyVelocity.Parent = root

            -- Elimina el BodyVelocity después de un tiempo para que no afecte permanentemente al jugador
            game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
        end
    end
end)
