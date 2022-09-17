local S
if minetest.get_modpath("intllib") then
    S = (intllib.make_gettext_pair and intllib.make_gettext_pair()) or intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

local bed = 'wool:white'
if  minetest.get_modpath("beds") then
	bed = 'beds:bed'
end

local door = 'default:steel_ingot'
if minetest.get_modpath("doors") then
	door = 'doors:door_steel'
end

----------------------------------------------------------------------------------------

local wagons = {
	{
		wagon_type = "classic_coaches:corridor_coach_class1",
		mesh = "classic_coaches_corridor_coach_class1.b3d",
		textures = {"classic_coaches_corridor_coach_class1_001.png"},
		name = S("Intercity Corridor Coach Class 1"),
		inventory_image = "classic_coaches_corridor_coach_class1_inv.png",
		recipe = {
			{'default:goldblock'},
			{'classic_coaches:corridor_coach_class2'},
		},
	},
	{
		wagon_type = "classic_coaches:corridor_coach_class2",
		mesh = "classic_coaches_corridor_coach_class2.b3d",
		textures = {"classic_coaches_corridor_coach_class2_001.png"},
		name = S("Intercity Corridor Coach Class 2"),
		inventory_image = "classic_coaches_corridor_coach_class2_inv.png",
		recipe = {
			{'default:steelblock', 'dye:grey', 'default:steelblock'},
			{'default:glass', 'wool:blue', door},
			{'advtrains:wheel', 'default:steelblock', 'advtrains:wheel'},
		},
	},
	{
		wagon_type = "classic_coaches:open_coach_class1",
		mesh = "classic_coaches_open_coach_class1.b3d",
		textures = {"classic_coaches_open_coach_class1_001.png"},
		name = S("Intercity Open Coach Class 1"),
		inventory_image = "classic_coaches_open_coach_class1_inv.png",
		recipe = {
			{'default:goldblock'},
			{'classic_coaches:open_coach_class2'},
		},
	},
	{
		wagon_type = "classic_coaches:open_coach_class2",
		mesh = "classic_coaches_open_coach_class2.b3d",
		textures = {"classic_coaches_open_coach_class2_001.png"},
		name = S("Intercity Open Coach Class 2"),
		inventory_image = "classic_coaches_open_coach_class2_inv.png",
		recipe = {
			{'default:steelblock', 'dye:grey', 'default:steelblock'},
			{'default:glass', 'wool:cyan', door},
			{'advtrains:wheel', 'default:steelblock', 'advtrains:wheel'},
		},
	},
}

local livery_templates = {
	["classic_coaches:corridor_coach_class1"] = {
		[1] = {
			base_texture = "classic_coaches_corridor_coach_class1_001.png",
			overlay = "classic_coaches_overlay_001_class1_side_walls.png",
		},
		[2] = {
			base_texture = "classic_coaches_corridor_coach_class1_002.png",
			overlay = "classic_coaches_overlay_002_class1_exterior_walls.png",
		},
		[3] = {
			base_texture = "classic_coaches_corridor_coach_class1_003.png",
			overlay = "classic_coaches_overlay_003_side_walls.png",
		},
		[4] = {
			base_texture = "classic_coaches_corridor_coach_class1_004.png",
			overlay = "classic_coaches_overlay_004_side_walls.png",
		},
		[5] = {
			base_texture = "classic_coaches_corridor_coach_class1_005.png",
			overlay = "classic_coaches_overlay_005_class1_side_walls.png",
		},
		[6] = {
			base_texture = "classic_coaches_corridor_coach_class1_006.png",
			overlay = "classic_coaches_overlay_006_side_walls.png",
		},
		[7] = {
			base_texture = "classic_coaches_corridor_coach_class1_007.png",
			overlay = "classic_coaches_overlay_007_class1_exterior_walls.png",
		},
	},
	["classic_coaches:corridor_coach_class2"] = {
		[1] = {
			base_texture = "classic_coaches_corridor_coach_class2_001.png",
			overlay = "classic_coaches_overlay_001_class2_side_walls.png",
		},
		[2] = {
			base_texture = "classic_coaches_corridor_coach_class2_002.png",
			overlay = "classic_coaches_overlay_002_class2_exterior_walls.png",
		},
		[3] = {
			base_texture = "classic_coaches_corridor_coach_class2_003.png",
			overlay = "classic_coaches_overlay_003_side_walls.png",
		},
		[4] = {
			base_texture = "classic_coaches_corridor_coach_class2_004.png",
			overlay = "classic_coaches_overlay_004_side_walls.png",
		},
		[5] = {
			base_texture = "classic_coaches_corridor_coach_class2_005.png",
			overlay = "classic_coaches_overlay_005_class2_side_walls.png",
		},
		[6] = {
			base_texture = "classic_coaches_corridor_coach_class2_006.png",
			overlay = "classic_coaches_overlay_006_side_walls.png",
		},
		[7] = {
			base_texture = "classic_coaches_corridor_coach_class2_007.png",
			overlay = "classic_coaches_overlay_007_class2_exterior_walls.png",
		},
	},
	["classic_coaches:open_coach_class1"] = {
		[1] = {
			base_texture = "classic_coaches_open_coach_class1_001.png",
			overlay = "classic_coaches_overlay_001_class1_side_walls.png"
		},
		[2] = {
			base_texture = "classic_coaches_open_coach_class1_002.png",
			overlay = "classic_coaches_overlay_002_class1_exterior_walls.png",
		},
		[3] = {
			base_texture = "classic_coaches_open_coach_class1_003.png",
			overlay = "classic_coaches_overlay_003_side_walls.png",
		},
		[4] = {
			base_texture = "classic_coaches_open_coach_class1_004.png",
			overlay = "classic_coaches_overlay_004_side_walls.png",
		},
		[5] = {
			base_texture = "classic_coaches_open_coach_class1_005.png",
			overlay = "classic_coaches_overlay_005_class1_side_walls.png",
		},
		[6] = {
			base_texture = "classic_coaches_open_coach_class1_006.png",
			overlay = "classic_coaches_overlay_006_side_walls.png",
		},
		[7] = {
			base_texture = "classic_coaches_open_coach_class1_007.png",
			overlay = "classic_coaches_overlay_007_class1_exterior_walls.png",
		},
	},
	["classic_coaches:open_coach_class2"] = {
		[1] = {
			base_texture = "classic_coaches_open_coach_class2_001.png",
			overlay = "classic_coaches_overlay_001_class2_side_walls.png",
		},
		[2] = {
			base_texture = "classic_coaches_open_coach_class2_002.png",
			overlay = "classic_coaches_overlay_002_class2_exterior_walls.png",
		},
		[3] = {
			base_texture = "classic_coaches_open_coach_class2_003.png",
			overlay = "classic_coaches_overlay_003_side_walls.png",
		},
		[4] = {
			base_texture = "classic_coaches_open_coach_class2_004.png",
			overlay = "classic_coaches_overlay_004_side_walls.png",
		},
		[5] = {
			base_texture = "classic_coaches_open_coach_class2_005.png",
			overlay = "classic_coaches_overlay_005_class2_side_walls.png",
		},
		[6] = {
			base_texture = "classic_coaches_open_coach_class2_006.png",
			overlay = "classic_coaches_overlay_006_side_walls.png",
		},
		[7] = {
			base_texture = "classic_coaches_open_coach_class2_007.png",
			overlay = "classic_coaches_overlay_007_class2_exterior_walls.png",
		},
	},
}

-- ===============================================================================================================================================

local function get_wagon_texture(wagon_type, livery_template_id, color)

	-- Get and then verify that the base texture is valid
	local wagon_texture = livery_templates[wagon_type][livery_template_id].base_texture
	if not wagon_texture then
		return nil
	end

	-- The color "#000000" is reserved and used to force the livery tempalte to
	-- be displayed without any color overrides.
	if color and color ~= "#000000" and livery_templates[wagon_type][livery_template_id].overlay then
		local overlay_texture = "^("..
				livery_templates[wagon_type][livery_template_id].overlay..
				"^[colorize:"..color..":253)"
		wagon_texture = wagon_texture..overlay_texture 
	end

	return wagon_texture
end

-- The following enables the bike painter to colorize the overlay.
local function set_livery(wagon, puncher, itemstack, data)
	local meta = itemstack:get_meta()
	local color = meta:get_string("paint_color")
	if not color or not color:find("^#%x%x%x%x%x%x$") then
		return
	end

	local alpha = tonumber(meta:get_string("alpha"))
	if not alpha then
		return
	end

	-- The alpha value is used to select the livery template. Note that the alpha
	-- values can range from 0 to 255. Livery template ids start with 1. Livery
	-- template ids greater than the number of defined livery tempaltes will cause
	-- the painter to have no effect.
	local livery_template_id = alpha + 1

	-- It is possible that a given livery template may not be defined for all
	-- wagon types.
	local wagon_type = data.type
	if not livery_templates[wagon_type] or
	   not livery_templates[wagon_type][livery_template_id] or
	   not livery_templates[wagon_type][livery_template_id].base_texture then
		return
	end

	local wagon_texture = get_wagon_texture(wagon_type, livery_template_id, color)
	if not wagon_texture then
		return
	end

	data.livery = wagon_texture
	wagon:set_textures(data)
end

local function set_textures(wagon, data)
	if data.livery then
		wagon.object:set_properties({textures={data.livery}})
	end
end

----------------------------------------------------------------------------------------

for _, wagon in ipairs(wagons) do
	advtrains.register_wagon(wagon.wagon_type, {
		mesh = wagon.mesh,
		textures = wagon.textures,
		set_textures = set_textures,
		set_livery = set_livery,
		drives_on={default=true},
		max_speed=20,
		seats = {
			{
				name="1",
				attach_offset={x=0, y=-2, z=17},
				view_offset={x=0, y=-1.7, z=0},
				group="pass",
			},
			{
				name="2",
				attach_offset={x=0, y=-2, z=6},
				view_offset={x=0, y=-1.7, z=0},
				group="pass",
			},
			{
				name="3",
				attach_offset={x=0, y=-2, z=-6},
				view_offset={x=0, y=-1.7, z=0},
				group="pass",
			},
			{
				name="4",
				attach_offset={x=0, y=-2, z=-17},
				view_offset={x=0, y=-1.7, z=0},
				group="pass",
			},
		},
		seat_groups = {
			pass={
				name = "Passenger area",
				access_to = {},
				require_doors_open=true,
			},
		},
		doors={
			open={
				[-1]={frames={x=21, y=30}, time=1},
				[1]={frames={x=1, y=10}, time=1}
			},
			close={
				[-1]={frames={x=30, y=41}, time=1},
				[1]={frames={x=10, y=20}, time=1}
			}
		},
		door_entry={-2, 2},
		assign_to_seat_group = {"pass"},
		visual_size = {x=1, y=1},
		wagon_span=3,
		collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
		drops={"default:steelblock"},
	}, wagon.name, wagon.inventory_image)

	minetest.register_craft({
		output = wagon.wagon_type,
		recipe = wagon.recipe,
	})
end
