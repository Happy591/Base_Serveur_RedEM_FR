RedEM = exports["redem_roleplay"]:RedEM()

BucketId = GetRandomIntInRange(0, 0xffffff)
ComponentsMale = {}
ComponentsFemale = {}
LoadedComponents = {}
CreatorCache = {}
local SpawnedPeds = {}
MenuData = {}
TriggerEvent("redemrp_creator_menu:getData", function(call)    MenuData = call
end)

local MainMenus = {
    ["body"] = function()
        OpenBodyMenu()
    end,
    ["face"] = function()
        OpenFaceMenu()
    end,
    ["hair"] = function()
        OpenHairMenu()
    end,
    ["makeup"] = function()
        OpenMakeupMenu()
    end,
    ["save"] = function()
		TriggerServerEvent("rdr_creator:SetPlayerBucket" , 0)
        -- if NetworkIsInTutorialSession() then
        --     NetworkEndTutorialSession()
        -- end
        EndCharacterCreatorCam()
        MenuData.CloseAll()
        LoadedComponents = CreatorCache
        TriggerServerEvent("rdr_creator:SaveSkin", CreatorCache)
        TriggerEvent("redemrp_respawn:respawn", true)
    end
}
local BodyFunctions = {
    ["head"] = function(target, data)
        -- print("test")
        LoadHead(target, data)
        LoadOverlays(target, data)
    end,
    ["face_width"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["skin_tone"] = function(target, data)
        LoadBody(target, data)
        LoadOverlays(target, data)
    end,
    ["body_size"] = function(target, data)
        LoadBodySize(target, data)
        LoadBody(target, data)
    end,
    ["body_waist"] = function(target, data)
        LoadBodyWaist(target, data)
    end,
    ["height"] = function(target, data)
        LoadHeight(target, data)
    end,
}

local FaceFunctions = {
    ["eyes"] = function()
        OpenEyesMenu()
    end,
    ["eyelids"] = function()
        OpenEyelidsMenu()
    end,
    ["eyebrows"] = function()
        OpenEyebrowsMenu()
    end,
    ["nose"] = function()
        OpenNoseMenu()
    end,
    ["mouth"] = function()
        OpenMouthMenu()
    end,
    ["cheekbones"] = function()
        OpenCheekbonesMenu()
    end,
    ["jaw"] = function()
        OpenJawMenu()
    end,
    ["ears"] = function()
        OpenEarsMenu()
    end,
    ["chin"] = function()
        OpenChinMenu()
    end,
    ["defects"] = function()
        OpenDefectsMenu()
    end

}

local HairFunctions = {
    ["hair"] = function(target, data)
        LoadHair(target, data)
    end,
    ["beard"] = function(target, data)
        LoadBeard(target, data)
    end

}

local EyesFunctions = {
    ["eyes_color"] = function(target, data)
        LoadEyes(target, data)
    end,
    ["eyes_depth"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyes_angle"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyes_distance"] = function(target, data)
        LoadFeatures(target, data)
    end

}

local EyelidsFunctions = {
    ["eyelid_height"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyelid_width"] = function(target, data)
        LoadFeatures(target, data)
    end
}

local EyebrowsFunctions = {
    ["eyebrows_t"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrows_op"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrows_id"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrows_c1"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrow_height"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyebrow_width"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyebrow_depth"] = function(target, data)
        LoadFeatures(target, data)
    end
}

Citizen.CreateThread(function()
    for i, v in pairs(cloth_hash_names) do
        if v.category_hashname == "BODIES_LOWER" or v.category_hashname == "BODIES_UPPER" or v.category_hashname ==
            "heads" or v.category_hashname == "hair" or v.category_hashname == "teeth" or v.category_hashname == "eyes" then
            if v.ped_type == "female" and v.is_multiplayer and v.hashname ~= "" then
                if ComponentsFemale[v.category_hashname] == nil then
                    ComponentsFemale[v.category_hashname] = {}
                end
                table.insert(ComponentsFemale[v.category_hashname], v.hash)
            elseif v.ped_type == "male" and v.is_multiplayer and v.hashname ~= "" then
                if ComponentsMale[v.category_hashname] == nil then
                    ComponentsMale[v.category_hashname] = {}
                end

                table.insert(ComponentsMale[v.category_hashname], v.hash)
            end
        end
    end
    if not IsImapActive(183712523) then
        RequestImap(183712523) -- CharacterCreator
    end
    if not IsImapActive(-1699673416) then
        RequestImap(-1699673416) -- CharacterCreator
    end
    if not IsImapActive(1679934574) then
        RequestImap(1679934574) -- CharacterCreator
    end
end)

local onCooldown = false

RegisterNetEvent('RedEM:client:ApplySkin')
AddEventHandler('RedEM:client:ApplySkin', function(SkinData, Target, ClothesData)
    Citizen.CreateThread(function()
        local _Target = Target or PlayerPedId()
        local _SkinData = SkinData
        local health = GetEntityHealth(_Target) -- Get health value
        local healthCore = GetAttributeCoreValue(_Target, 0) -- Get health core value
        if _Target == PlayerPedId() then
            local model = GetPedModel(tonumber(_SkinData.sex))
            LoadModel(PlayerPedId(), model)
            _Target = PlayerPedId()
            SetEntityAlpha(_Target, 0)
            LoadedComponents = _SkinData
        end
        SetEntityHealth(_Target, health) -- Set health back to what it was
        Citizen.InvokeNative( 0xC6258F41D86676E0, _Target, 0, healthCore) -- Set Health Core back to what it was
        print("Loading...")
        -- print(_Target, PlayerPedId())
        FixIssues(_Target, _SkinData)
        LoadHeight(_Target, _SkinData)
        LoadBody(_Target, _SkinData)
        LoadHead(_Target, _SkinData)
        LoadHair(_Target, _SkinData)
        LoadBeard(_Target, _SkinData)
        LoadEyes(_Target, _SkinData)
        LoadFeatures(_Target, _SkinData)
        LoadBodySize(_Target, _SkinData)
        LoadBodyWaist(_Target, _SkinData)
        LoadOverlays(_Target, _SkinData)
        TriggerServerEvent("redemrp_respawn:TestDeathStatus")
        SetEntityAlpha(_Target, 255)
        TriggerEvent("rdr_creator:SkinLoaded", _SkinData, _Target, ClothesData)
        if _Target == PlayerPedId() then
            TriggerServerEvent("rdr_clothes_store:LoadClothes", 1)
            TriggerServerEvent("redemrp_clothing:loadClothes", 1)
        else
            TriggerEvent("rdr_clothes_store:ApplyClothes", ClothesData, _Target)
            for i, m in pairs(overlay_all_layers) do
                overlay_all_layers[i] = {
                    name = m.name,
                    visibility = 0,
                    tx_id = 1,
                    tx_normal = 0,
                    tx_material = 0,
                    tx_color_type = 0,
                    tx_opacity = 1.0,
                    tx_unk = 0,
                    palette = 0,
                    palette_color_primary = 0,
                    palette_color_secondary = 0,
                    palette_color_tertiary = 0,
                    var = 0,
                    opacity = 0.0
                }
            end
        end  
    end)
end)

RegisterNetEvent('RedEM:client:ApplySkinCommand', function(SkinData, Target, ClothesData)
    Citizen.CreateThread(function()
        if not onCooldown then
            onCooldown = true
            doCooldown()
            local _Target = Target or PlayerPedId()
            local _SkinData = SkinData
            local health = GetEntityHealth(_Target) -- Get health value
            local healthCore = GetAttributeCoreValue(_Target, 0) -- Get health core value
            if _Target == PlayerPedId() then
                local model = GetPedModel(tonumber(_SkinData.sex))
                LoadModel(PlayerPedId(), model)
                _Target = PlayerPedId()
                SetEntityAlpha(_Target, 0)
                LoadedComponents = _SkinData
            end
            SetEntityHealth(_Target, health) -- Set health back to what it was
            Citizen.InvokeNative( 0xC6258F41D86676E0, _Target, 0, healthCore) -- Set Health Core back to what it was
            print("Loading...")
            -- print(_Target, PlayerPedId())
            FixIssues(_Target, _SkinData)
            LoadHeight(_Target, _SkinData)
            LoadBody(_Target, _SkinData)
            LoadHead(_Target, _SkinData)
            LoadHair(_Target, _SkinData)
            LoadBeard(_Target, _SkinData)
            LoadEyes(_Target, _SkinData)
            LoadFeatures(_Target, _SkinData)
            LoadBodySize(_Target, _SkinData)
            LoadBodyWaist(_Target, _SkinData)
            LoadOverlays(_Target, _SkinData)
            TriggerServerEvent("redemrp_respawn:TestDeathStatus")
            SetEntityAlpha(_Target, 255)
            TriggerEvent("rdr_creator:SkinLoaded", _SkinData, _Target, ClothesData)
            if _Target == PlayerPedId() then
                TriggerServerEvent("rdr_clothes_store:LoadClothes", 1)
                TriggerServerEvent("redemrp_clothing:loadClothes", 1)
            else
                TriggerEvent("rdr_clothes_store:ApplyClothes", ClothesData, _Target)
                for i, m in pairs(overlay_all_layers) do
                    overlay_all_layers[i] = {
                        name = m.name,
                        visibility = 0,
                        tx_id = 1,
                        tx_normal = 0,
                        tx_material = 0,
                        tx_color_type = 0,
                        tx_opacity = 1.0,
                        tx_unk = 0,
                        palette = 0,
                        palette_color_primary = 0,
                        palette_color_secondary = 0,
                        palette_color_tertiary = 0,
                        var = 0,
                        opacity = 0.0
                    }
                end
            end
        else
            RedEM.Functions.NotifyRight("You can only use this command once every 3 seconds!", 3000)
        end  
    end)
end)

function doCooldown()
    Citizen.CreateThread(function()
        Wait(3000)
        onCooldown = false
    end)
end

RegisterNetEvent('rdr_creator:OpenCreator')
AddEventHandler('rdr_creator:OpenCreator', function()
    StartCreator()
end)

RegisterNetEvent('redemrp_skin:LoadSkinClient')
AddEventHandler('redemrp_skin:LoadSkinClient', function()
    TriggerServerEvent("RedEM:server:LoadSkin")
end)

RegisterCommand('loadskin', function(source, args, raw)
    TriggerServerEvent("RedEM:server:LoadSkin", true)
end)

function StartCreator()
    TriggerServerEvent("rdr_creator:SetPlayerBucket" , BucketId)
    Wait(500)
    -- while not NetworkIsSessionStarted() do
    --     Wait(0)
    -- end
    for i, m in pairs(overlay_all_layers) do
        overlay_all_layers[i] = {
            name = m.name,
            visibility = 0,
            tx_id = 1,
            tx_normal = 0,
            tx_material = 0,
            tx_color_type = 0,
            tx_opacity = 1.0,
            tx_unk = 0,
            palette = 0,
            palette_color_primary = 0,
            palette_color_secondary = 0,
            palette_color_tertiary = 0,
            var = 0,
            opacity = 0.0
        }
    end
    -- NetworkStartSoloTutorialSession()
    MenuData.CloseAll()
    SpawnedPeds = SpawnPeds()
    local selectedSex = StartSelectCam()
    CreatorCache["sex"] = selectedSex
    local model = GetPedModel(selectedSex)
    LoadModel(PlayerPedId(), model)
    FixIssues(PlayerPedId())
    -- ClonePedToTarget(SpawnedPeds[selectedSex],  PlayerPedId())
    DeletePeds(SpawnedPeds)
    MainMenu()

end

function MainMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Corps",
        value = 'body',
        desc = "Edit your body"
    }, {
        label = "Visage",
        value = 'face',
        desc = "Edit your face"
    }, {
        label = "Pilosité",
        value = 'hair',
        desc = "Edit your hair"
    }, {
        label = "Makeup",
        value = 'makeup',
        desc = "Edit your makeup"
    }, {
        label = "Sauvegarder",
        value = 'save',
        desc = "Save your character"
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'main_character_creator_menu', {
        title = 'Apparence',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        MainMenus[data.current.value]()
    end, function(data, menu)
    end)
end

function OpenBodyMenu()
    MenuData.CloseAll()
    local BodySizeOptions = {"Maigre", "Athlétique", "Moyen", "Lourd", "Corpulent"}
    local BodyWaistOptions = {}
    for i, v in ipairs(WAIST_TYPES) do
        table.insert(BodyWaistOptions, "+ " .. (i / 2) .. " kg")
    end

    local HeightOptions = {}
    for i=88,106 do
        table.insert(HeightOptions, i.."")
    end
    local SkinToneOptions = {"<img src='nui://redemrp_creator/img/skin1.png' height='20'>",
                             "<img src='nui://redemrp_creator/img/skin2.png' height='20'>",
                             "<img src='nui://redemrp_creator/img/skin3.png' height='20'>",
                             "<img src='nui://redemrp_creator/img/skin4.png' height='20'>",
                             "<img src='nui://redemrp_creator/img/skin5.png' height='20'>",
                             "<img src='nui://redemrp_creator/img/skin6.png' height='20'>"}
    local elements = {{
        label = "Visage",
        value = CreatorCache["head"] or 1,
        category = "head",
        desc = "Changez votre visage",
        type = "slider",
        min = 1,
        max = 120,
        hop = 6
    }, {
        label = "Largeur du visage",
        value = CreatorCache["face_width"] or 0,
        category = "face_width",
        desc = "Changer la largeur de votre visage",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Couleur de peau",
        value = CreatorCache["skin_tone"] or 1,
        category = "skin_tone",
        desc = "Changez la couleur de peau",
        type = "slider",
        min = 1,
        max = 6,
        options = SkinToneOptions
    }, {
        label = "Poids",
        value = CreatorCache["body_size"] or 3,
        category = "body_size",
        desc = "Changez votre poid",
        type = "slider",
        min = 1,
        max = 5,
        options = BodySizeOptions
    }, {
        label = "Largeur des hanches",
        value = CreatorCache["body_waist"] or 7,
        category = "body_waist",
        desc = "Changer la largeur des hanches",
        type = "slider",
        min = 1,
        max = 21,
        options = BodyWaistOptions
    }, {
        label = "Taille",
        value = CreatorCache["height"] or 94,
        category = "height",
        desc = "Changer votre taille",
        type = "slider",
        min = 88,
        max = 106,
        options = HeightOptions
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'body_character_creator_menu', {
        title = 'Apparance',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)

    end, function(data, menu)
        MainMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            BodyFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenFaceMenu()
    MoveCharacterCreatorCamera(-558.97, -3780.95, 239.18)
    MenuData.CloseAll()
    local elements = {{
        label = "Yeux",
        value = 'eyes',
        desc = "Changer les yeux"
    }, {
        label = "Paupières",
        value = 'eyelids',
        desc = "Changer les paupières"
    }, {
        label = "Sourcils",
        value = 'eyebrows',
        desc = "Changer les sourcils"
    }, {
        label = "Nez",
        value = 'nose',
        desc = "Changer le nez"
    }, {
        label = "Bouche",
        value = 'mouth',
        desc = "Changer la bouche"
    }, {
        label = "Pommettes",
        value = 'cheekbones',
        desc = "Changer les pommettes"
    }, {
        label = "Machoire",
        value = 'jaw',
        desc = "Changer la machoire"
    }, {
        label = "Oreilles",
        value = 'ears',
        desc = "Chnager les oreilles"
    }, {
        label = "Menton",
        value = 'chin',
        desc = "Changer le menton"
    }, {
        label = "Défauts",
        value = 'defects',
        desc = "Changer les défauts"
    }}


    MenuData.Open('default', GetCurrentResourceName(), 'face_main_character_creator_menu', {
        title = 'Visage',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        FaceFunctions[data.current.value]()
    end, function(data, menu)
        MoveCharacterCreatorCamera(-560.133, -3780.92, 238.6)
        MainMenu()
    end)
end
RegisterNetEvent("rdr_creator:client:HairMenu", function(cb)
    OpenHairMenu2(cb)
end)

function OpenHairMenu2(cb)
    MenuData.CloseAll()
    local elements = {}
    if IsPedMale(PlayerPedId()) then
            local a = 1
            local category = hairs_list["male"]["hair"]
            -- print(CreatorCache["hair"])
            -- print(CreatorCache["beard"])
            if CreatorCache["hair"] == nil or type(CreatorCache["hair"]) ~= "table" then
                CreatorCache["hair"] = {}
                CreatorCache["hair"].model = 0
                CreatorCache["hair"].texture = 1
            end
            if CreatorCache["beard"] == nil or type(CreatorCache["beard"]) ~= "table" then
                CreatorCache["beard"] = {}
                -- print(CreatorCache["beard"])
                CreatorCache["beard"].model = 0
                -- print(CreatorCache["beard"])
                CreatorCache["beard"].texture = 1
                
            end
            local options = {}
            for k, v in pairs(category) do
                table.insert(options, "Styl " .. k)
            end
            table.insert(elements, {
                label = "Cheveaux",
                value = CreatorCache["hair"].model or 0,
                category = "hair",
                desc = "Changer les cheveux",
                type = "slider",
                min = 0,
                max = #category,
                change_type = "model",
                id = a,
                options = options
            })
            a = a + 1
            options = {}

            for i = 1, GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), 1 do
                table.insert(options, "Couleur " .. i)
            end
            table.insert(elements, {
                label = "Couleur de cheveux",
                value = CreatorCache["hair"].texture or 1,
                category = "hair",
                desc = "Changer la couleur des cheveux",
                type = "slider",
                min = 1,
                max = GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1),
                change_type = "texture",
                id = a,
                options = options
            })

            options = {}
            a = a + 1


            local category = hairs_list["male"]["beard"]
            for k, v in pairs(category) do
                table.insert(options, "Style " .. k)
            end
            table.insert(elements, {
                label = "Barbe",
                value = CreatorCache["beard"].model or 0,
                category = "beard",
                desc = "Changer la barbe",
                type = "slider",
                min = 0,
                max = #category,
                change_type = "model",
                id = a,
                options = options
            })
            a = a + 1
            options = {}

            for i = 1, GetMaxTexturesForModel("beard", CreatorCache["beard"].model or 1), 1 do
                table.insert(options, "Couleur " .. i)
            end
            table.insert(elements, {
                label = "Couleur de barbe",
                value = CreatorCache["beard"].texture or 1,
                category = "beard",
                desc = "Changer la couleur de barbe",
                type = "slider",
                min = 1,
                max = GetMaxTexturesForModel("beard", CreatorCache["beard"].model or 1),
                change_type = "texture",
                id = a,
                options = options
            })

            options = {}
            a = a + 1
    else
        local a = 1
        local category = hairs_list["female"]["hair"]
        if CreatorCache["hair"] == nil or type(CreatorCache["hair"]) ~= "table" then
            CreatorCache["hair"] = {}
            CreatorCache["hair"].model = 0
            CreatorCache["hair"].texture = 1
        end
        local options = {}
        for k, v in pairs(category) do
            table.insert(options, k .. " Style")
        end
        table.insert(elements, {
            label = "Cheveux",
            value = CreatorCache["hair"].model or 0,
            category = "hair",
            desc = "Changer les cheveux",
            type = "slider",
            min = 0,
            max = #category,
            change_type = "model",
            id = a,
            options = options
        })
        a = a + 1
        options = {}

        for i = 1, GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), 1 do
            table.insert(options, i .. " Couleur")
        end
        table.insert(elements, {
            label = "Couleur de cheveux",
            value = CreatorCache["hair"].texture or 1,
            category = "hair",
            desc = "Changer la couleur des cheveux",
            type = "slider",
            min = 1,
            max = GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1),
            change_type = "texture",
            id = a,
            options = options
        })

        options = {}
        a = a + 1
    end

    table.insert(elements,{
        label = "Sauvegarder",
        value = "save",
        desc = "Sauvegarder les changements",
    })
    MenuData.Open('default', GetCurrentResourceName(), 'hair_main_character_creator_menu2', {
        title = 'Cheveux',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)

        if data.current.value == "save" then
            MenuData.CloseAll()
            LoadedComponents = CreatorCache
            TriggerServerEvent("rdr_creator:SaveHair", CreatorCache.hair, CreatorCache.beard)
            Wait(500)
            ExecuteCommand("loadskin")
            cb()
        end
    end, function(data, menu)
        MenuData.CloseAll()
        ExecuteCommand("loadskin")
        cb()
    end, function(data, menu)
        if data.current.change_type == "model" then
            if CreatorCache[data.current.category].model ~= data.current.value then
                CreatorCache[data.current.category].texture = 1
                CreatorCache[data.current.category].model = data.current.value
                if data.current.value > 0 then
                    local options = {}
                    -- print(GetMaxTexturesForModel(data.current.category, data.current.value))
                    if GetMaxTexturesForModel(data.current.category, data.current.value) > 1 then
                        for i = 1, GetMaxTexturesForModel(data.current.category, data.current.value), 1 do
                            table.insert(options, "Couleur " .. i)
                        end
                    else
                        table.insert(options, "Aucun")
    
                    end
                    menu.setElement(data.current.id + 1, "options", options)
                    menu.setElement(data.current.id + 1, "max",
                        GetMaxTexturesForModel(data.current.category, data.current.value))
                    menu.setElement(data.current.id + 1, "min", 1)
                    menu.setElement(data.current.id + 1, "value", 1)
                    menu.refresh()
    
                else
                    menu.setElement(data.current.id + 1, "max", 0)
                    menu.setElement(data.current.id + 1, "min", 0)
                    menu.setElement(data.current.id + 1, "value", 0)
                    menu.refresh()
    
                end
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
         elseif data.current.change_type == "texture" then
            -- print(CreatorCache[data.current.category].texture)
            if CreatorCache[data.current.category].texture ~= data.current.value then
                CreatorCache[data.current.category].texture = data.current.value
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
        else
            if CreatorCache[data.current.category] ~= data.current.value then
                CreatorCache[data.current.category] = data.current.value
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
        end
    end)
end


function OpenHairMenu()
    MoveCharacterCreatorCamera(-558.97, -3780.95, 239.18)
    MenuData.CloseAll()
    local elements = {}
    if IsPedMale(PlayerPedId()) then
            local a = 1
            local category = hairs_list["male"]["hair"]
            -- print(CreatorCache["hair"])
            -- print(CreatorCache["beard"])
            if CreatorCache["hair"] == nil or type(CreatorCache["hair"]) ~= "table" then
                CreatorCache["hair"] = {}
                CreatorCache["hair"].model = 0
                CreatorCache["hair"].texture = 1
            end
            if CreatorCache["beard"] == nil or type(CreatorCache["beard"]) ~= "table" then
                CreatorCache["beard"] = {}
                -- print(CreatorCache["beard"])
                CreatorCache["beard"].model = 0
                -- print(CreatorCache["beard"])
                CreatorCache["beard"].texture = 1
                
            end
            local options = {}
            for k, v in pairs(category) do
                table.insert(options, "Styl " .. k)
            end
            table.insert(elements, {
                label = "Cheveux",
                value = CreatorCache["hair"].model or 0,
                category = "hair",
                desc = "Changer les cheveux",
                type = "slider",
                min = 0,
                max = #category,
                change_type = "model",
                id = a,
                options = options
            })
            a = a + 1
            options = {}

            for i = 1, GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), 1 do
                table.insert(options,i.." Couleur")
            end
            table.insert(elements, {
                label = "Couleur des cheveux",
                value = CreatorCache["hair"].texture or 1,
                category = "hair",
                desc = "Changer la couleur des cheveux",
                type = "slider",
                min = 1,
                max = GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1),
                change_type = "texture",
                id = a,
                options = options
            })

            options = {}
            a = a + 1


            local category = hairs_list["male"]["beard"]
            for k, v in pairs(category) do
                table.insert(options, k.." Style")
            end
            table.insert(elements, {
                label = "Barbe",
                value = CreatorCache["beard"].model or 0,
                category = "beard",
                desc = "Changer la barbe",
                type = "slider",
                min = 0,
                max = #category,
                change_type = "model",
                id = a,
                options = options
            })
            a = a + 1
            options = {}

            for i = 1, GetMaxTexturesForModel("beard", CreatorCache["beard"].model or 1), 1 do
                table.insert(options, "Couleur " .. i)
            end
            table.insert(elements, {
                label = "Couleur Barbe",
                value = CreatorCache["beard"].texture or 1,
                category = "beard",
                desc = "Changer la couleur de la barbe",
                type = "slider",
                min = 1,
                max = GetMaxTexturesForModel("beard", CreatorCache["beard"].model or 1),
                change_type = "texture",
                id = a,
                options = options
            })

            options = {}
            a = a + 1
    else
        local a = 1
        local category = hairs_list["female"]["hair"]
        if CreatorCache["hair"] == nil or type(CreatorCache["hair"]) ~= "table" then
            CreatorCache["hair"] = {}
            CreatorCache["hair"].model = 0
            CreatorCache["hair"].texture = 1
        end
        local options = {}
        for k, v in pairs(category) do
            table.insert(options, "Styl " .. k)
        end
        table.insert(elements, {
            label = "Cheveux",
            value = CreatorCache["hair"].model or 0,
            category = "hair",
            desc = "Changer les cheveux",
            type = "slider",
            min = 0,
            max = #category,
            change_type = "model",
            id = a,
            options = options
        })
        a = a + 1
        options = {}

        for i = 1, GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), 1 do
            table.insert(options, "Couleur " .. i)
        end
        table.insert(elements, {
            label = "Couleur des cheveux",
            value = CreatorCache["hair"].texture or 1,
            category = "hair",
            desc = "Changer la couleur des cheveux",
            type = "slider",
            min = 1,
            max = GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1),
            change_type = "texture",
            id = a,
            options = options
        })

        options = {}
        a = a + 1
    end
    MenuData.Open('default', GetCurrentResourceName(), 'hair_main_character_creator_menu', {
        title = 'Cheveux',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)

    end, function(data, menu)
        MoveCharacterCreatorCamera(-560.133, -3780.92, 238.6)
        MainMenu()
    end, function(data, menu)


        if data.current.change_type == "model" then
            if CreatorCache[data.current.category].model ~= data.current.value then
                CreatorCache[data.current.category].texture = 1
                CreatorCache[data.current.category].model = data.current.value
                if data.current.value > 0 then
                    local options = {}
                    -- print(GetMaxTexturesForModel(data.current.category, data.current.value))
                    if GetMaxTexturesForModel(data.current.category, data.current.value) > 1 then
                        for i = 1, GetMaxTexturesForModel(data.current.category, data.current.value), 1 do
                            table.insert(options, "Couleur " .. i)
                        end
                    else
                        table.insert(options, "Aucun")
    
                    end
                    menu.setElement(data.current.id + 1, "options", options)
                    menu.setElement(data.current.id + 1, "max",
                        GetMaxTexturesForModel(data.current.category, data.current.value))
                    menu.setElement(data.current.id + 1, "min", 1)
                    menu.setElement(data.current.id + 1, "value", 1)
                    menu.refresh()
    
                else
                    menu.setElement(data.current.id + 1, "max", 0)
                    menu.setElement(data.current.id + 1, "min", 0)
                    menu.setElement(data.current.id + 1, "value", 0)
                    menu.refresh()
    
                end
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
         elseif data.current.change_type == "texture" then
            -- print(CreatorCache[data.current.category].texture)
            if CreatorCache[data.current.category].texture ~= data.current.value then
                CreatorCache[data.current.category].texture = data.current.value
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
        else
            if CreatorCache[data.current.category] ~= data.current.value then
                CreatorCache[data.current.category] = data.current.value
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
        end
    end)
end

function OpenEyesMenu()
    MenuData.CloseAll()
    local EyesColorOptions = {"<img src='nui://redemrp_creator/img/skin1.png' height='20'>",
                              "<img src='nui://redemrp_creator/img/skin2.png' height='20'>",
                              "<img src='nui://redemrp_creator/img/skin3.png' height='20'>",
                              "<img src='nui://redemrp_creator/img/skin4.png' height='20'>",
                              "<img src='nui://redemrp_creator/img/skin5.png' height='20'>",
                              "<img src='nui://redemrp_creator/img/skin6.png' height='20'>"}
    local elements = {{
        label = "Couleur",
        value = CreatorCache["eyes_color"] or 1,
        category = "eyes_color",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 18
    }, {
        label = "Profondeur",
        value = CreatorCache["eyes_depth"] or 0,
        category = "eyes_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Angle",
        value = CreatorCache["eyes_angle"] or 0,
        category = "eyes_angle",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Espacement",
        value = CreatorCache["eyes_distance"] or 0,
        category = "eyes_distance",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'eyes_character_creator_menu', {
        title = 'Yeux',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            EyesFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenEyelidsMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Hauteur",
        value = CreatorCache["eyelid_height"] or 0,
        category = "eyelid_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur",
        value = CreatorCache["eyelid_width"] or 0,
        category = "eyelid_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'eyelid_character_creator_menu', {
        title = 'Paupières',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            EyelidsFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenEyebrowsMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Hauteur",
        value = CreatorCache["eyebrow_height"] or 0,
        category = "eyebrow_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur",
        value = CreatorCache["eyebrow_width"] or 0,
        category = "eyebrow_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Profondeur",
        value = CreatorCache["eyebrow_depth"] or 0,
        category = "eyebrow_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Type",
        value = CreatorCache["eyebrows_t"] or 1,
        category = "eyebrows_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 15
    }, {
        label = "Visibilité",
        value = CreatorCache["eyebrows_op"] or 100,
        category = "eyebrows_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Palette de couleur",
        value = CreatorCache["eyebrows_id"] or 10,
        category = "eyebrows_id",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 25
    }, {
        label = "Couleur primaire",
        value = CreatorCache["eyebrows_c1"] or 0,
        category = "eyebrows_c1",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 64
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'eyebrows_character_creator_menu', {
        title = 'Sourcils',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            EyebrowsFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenNoseMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Largeur",
        value = CreatorCache["nose_width"] or 0,
        category = "nose_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Taille",
        value = CreatorCache["nose_size"] or 0,
        category = "nose_size",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Hauteur",
        value = CreatorCache["nose_height"] or 0,
        category = "nose_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Angle",
        value = CreatorCache["nose_angle"] or 0,
        category = "nose_angle",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Courbure",
        value = CreatorCache["nose_curvature"] or 0,
        category = "nose_curvature",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Distance",
        value = CreatorCache["nostrils_distance"] or 0,
        category = "nostrils_distance",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'nose_character_creator_menu', {
        title = 'Nez',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenMouthMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Largeur",
        value = CreatorCache["mouth_width"] or 0,
        category = "mouth_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Profondeur",
        value = CreatorCache["mouth_depth"] or 0,
        category = "mouth_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Placement",
        value = CreatorCache["mouth_x_pos"] or 0,
        category = "mouth_x_pos",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Droite / Gauche",
        value = CreatorCache["mouth_y_pos"] or 0,
        category = "mouth_y_pos",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Hauteur Lèvre supérieure",
        value = CreatorCache["upper_lip_height"] or 0,
        category = "upper_lip_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur lèvre supérieure",
        value = CreatorCache["upper_lip_width"] or 0,
        category = "upper_lip_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Profondeur lèvre supérieure",
        value = CreatorCache["upper_lip_depth"] or 0,
        category = "upper_lip_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Hauteur Lèvre inférieure",
        value = CreatorCache["lower_lip_height"] or 0,
        category = "lower_lip_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur lèvre inférieure",
        value = CreatorCache["lower_lip_width"] or 0,
        category = "lower_lip_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Lower Lip Depth",
        value = CreatorCache["lower_lip_depth"] or 0,
        category = "lower_lip_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'mouth_character_creator_menu', {
        title = 'Bouche',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenCheekbonesMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Hauteur",
        value = CreatorCache["cheekbones_height"] or 0,
        category = "cheekbones_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur",
        value = CreatorCache["cheekbones_width"] or 0,
        category = "cheekbones_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Profondeur",
        value = CreatorCache["cheekbones_depth"] or 0,
        category = "cheekbones_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'cheekbones_character_creator_menu', {
        title = 'Pommettes',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenJawMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Hauteur",
        value = CreatorCache["jaw_height"] or 0,
        category = "jaw_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur",
        value = CreatorCache["jaw_width"] or 0,
        category = "jaw_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Profondeur",
        value = CreatorCache["jaw_depth"] or 0,
        category = "jaw_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'jaw_character_creator_menu', {
        title = 'Machoire',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenEarsMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Largeur",
        value = CreatorCache["ears_width"] or 0,
        category = "ears_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Angle",
        value = CreatorCache["ears_angle"] or 0,
        category = "ears_angle",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Hauteur",
        value = CreatorCache["ears_height"] or 0,
        category = "ears_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Taille",
        value = CreatorCache["earlobe_size"] or 0,
        category = "earlobe_size",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'ears_character_creator_menu', {
        title = 'Oreilles',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenChinMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Hauteur",
        value = CreatorCache["chin_height"] or 0,
        category = "chin_height",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Largeur",
        value = CreatorCache["chin_width"] or 0,
        category = "chin_width",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }, {
        label = "Profondeur",
        value = CreatorCache["chin_depth"] or 0,
        category = "chin_depth",
        desc = "Changer",
        type = "slider",
        min = -100,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'chin_character_creator_menu', {
        title = 'Menton',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenDefectsMenu()
    MenuData.CloseAll()
    local elements = {{
        label = "Cicatrice",
        value = CreatorCache["scars_t"] or 1,
        category = "scars_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 16,
        options = nil
    }, {
        label = "Visibilité",
        value = CreatorCache["scars_op"] or 0,
        category = "scars_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Age",
        value = CreatorCache["ageing_t"] or 1,
        category = "ageing_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 24,
        options = nil
    }, {
        label = "Visibilité",
        value = CreatorCache["ageing_op"] or 0,
        category = "ageing_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Tache de rousseur",
        value = CreatorCache["freckles_t"] or 1,
        category = "freckles_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 15,
        options = nil
    }, {
        label = "Visibilité",
        value = CreatorCache["freckles_op"] or 0,
        category = "freckles_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Grains de beauté",
        value = CreatorCache["moles_t"] or 1,
        category = "moles_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 16,
        options = nil
    }, {
        label = "Visibilité",
        value = CreatorCache["moles_op"] or 0,
        category = "moles_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Tâche",
        value = CreatorCache["spots_t"] or 1,
        category = "spots_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 16,
        options = nil
    }, {
        label = "Visibilité",
        value = CreatorCache["spots_op"] or 0,
        category = "spots_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'defects_character_creator_menu', {
        title = 'Défauts',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadOverlays(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenMakeupMenu()
    MoveCharacterCreatorCamera(-558.97, -3780.95, 239.18)
    MenuData.CloseAll()
    local elements = {{
        label = "Fard à paupières",
        value = CreatorCache["shadows_t"] or 1,
        category = "shadows_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 5
    }, {
        label = "Visibilité",
        value = CreatorCache["shadows_op"] or 0,
        category = "shadows_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Couleur",
        value = CreatorCache["shadows_id"] or 1,
        category = "shadows_id",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 25
    }, {
        label = "Couleur 2",
        value = CreatorCache["shadows_c1"] or 0,
        category = "shadows_c1",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 64
    }, {
        label = "Blush",
        value = CreatorCache["blush_t"] or 1,
        category = "blush_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 4
    }, {
        label = "Visibilité",
        value = CreatorCache["blush_op"] or 0,
        category = "blush_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Couleur",
        value = CreatorCache["blush_id"] or 1,
        category = "blush_id",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 25
    }, {
        label = "Blush Primary Color",
        value = CreatorCache["blush_c1"] or 0,
        category = "blush_c1",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 64
    }, {
        label = "Rouge à lèvre",
        value = CreatorCache["lipsticks_t"] or 1,
        category = "lipsticks_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 7
    }, {
        label = "Visibilité",
        value = CreatorCache["lipsticks_op"] or 0,
        category = "lipsticks_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Couleur",
        value = CreatorCache["lipsticks_id"] or 1,
        category = "lipsticks_id",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 25
    }, {
        label = "Couleur 2",
        value = CreatorCache["lipsticks_c1"] or 0,
        category = "lipsticks_c1",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 64
    }, {
        label = "Couleur 3",
        value = CreatorCache["lipsticks_c2"] or 0,
        category = "lipsticks_c2",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 64
    }, {
        label = "Eyeliner",
        value = CreatorCache["eyeliners_t"] or 1,
        category = "eyeliners_t",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 15
    }, {
        label = "Visibilité",
        value = CreatorCache["eyeliners_op"] or 0,
        category = "eyeliners_op",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 100,
        hop = 5
    }, {
        label = "Couleur",
        value = CreatorCache["eyeliners_id"] or 1,
        category = "eyeliners_id",
        desc = "Changer",
        type = "slider",
        min = 1,
        max = 25
    }, {
        label = "Couleur 2",
        value = CreatorCache["eyeliners_c1"] or 0,
        category = "eyeliners_c1",
        desc = "Changer",
        type = "slider",
        min = 0,
        max = 64
    }}

    MenuData.Open('default', GetCurrentResourceName(), 'makeup_character_creator_menu', {
        title = 'Makeup',
        subtext = 'Options',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
    end, function(data, menu)
        MoveCharacterCreatorCamera(-560.133, -3780.92, 238.6)
        MainMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadOverlays(PlayerPedId(), CreatorCache)
        end
    end)
end

exports('GetComponentId', function(name)
    return LoadedComponents[name]
end)

exports('GetBodyComponents', function()
    return {ComponentsMale, ComponentsFemale}
end)

exports('GetBodyCurrentComponentHash', function(name)
    local hash
    if name == "hair" or name == "beard" then
        local info = LoadedComponents[name]
        local texture = info.texture
        local model = info.model
        if model == 0 or texture == 0 then
            return
        end
        if type(info) == "table" then
            if IsPedMale(PlayerPedId()) then
                if hairs_list["male"][name][model][texture] ~= nil then
                    hash = hairs_list["male"][name][model][texture].hash
                end
            else
                if hairs_list["female"][name][model][texture] ~= nil then
                    hash = hairs_list["female"][name][model][texture].hash
                end
            end
        end
        return hash
    else

        local id = LoadedComponents[name]

        if not id then
            return
        end
        if IsPedMale(PlayerPedId()) then
            if ComponentsMale[name] ~= nil then
                hash = ComponentsMale[name][id]
            end
        else
            if ComponentsFemale[name] ~= nil then
                hash = ComponentsFemale[name][id]
            end
        end
        return hash
    end
end)


exports('SetFaceOverlays', function(target, data)
    LoadOverlays(target, data)
end)

exports('SetHair', function(target, data)
    LoadHair(target, data)
end)

exports('SetBeard', function(target, data)
    LoadBeard(target, data)
end)

exports('GetComponentsMax', function(name)
    if name == "hair" or name == "beard" then
        if IsPedMale(PlayerPedId()) then
            if hairs_list["male"][name] ~= nil then
                return #hairs_list["male"][name]
            end
        else
            if hairs_list["female"][name] ~= nil then
                return #hairs_list["female"][name]
            end
        end
    else
        if IsPedMale(PlayerPedId()) then
            if ComponentsMale[name] ~= nil then
                return #ComponentsMale[name]
            end
        else
            if ComponentsFemale[name] ~= nil then
                return #ComponentsFemale[name]
            end
        end
    end
end)

exports('GetMaxTexturesForModel', function(category , model)
    return GetMaxTexturesForModel(category,model)
end)