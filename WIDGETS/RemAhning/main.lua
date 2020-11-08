 
---- #########################################################################
---- #                                                                       #
---- # Remaining Battery Widget for FrSky Horus                              #
---- #                                                                       #
---- # by Max Winterstein // https://github.com/MaxWinterstein/RemAhning     #
---- #                                                                       #
---- # Inspired by Björn Pasteuning / Hobby4life 2019                        #
---- # https://github.com/Hobby4life/Horus-Battery-Percentage-Widget         #
---- #                                                                       #
---- #########################################################################


local options = {
    {"Color", COLOR, WHITE}, -- font color
    {"Source", SOURCE, 1}, -- source of battery consumption
    {"Alarm", VALUE, 1, 0, 3}, -- 0 = off, 1 = vibrate, 2 = vibrate and beep, 3 = beep
    {"Reserve", VALUE, 0, 0, 9900}, -- toggle alarm when this many mAh are left 
    {"Capacity", VALUE, 1000, 100, 10000} -- battery capacity
}

function create(zone, options)
    local Context = {zone = zone, options = options}
    return Context
end

local function update(Context, options) Context.options = options end

function calc(LocalContext)
    total = LocalContext.options.Capacity
    used = getValue(LocalContext.options.Source)
    reserve = LocalContext.options.Reserve

    if (used == nil) then used = total end

    remaining = total - used
end

function ScreenUpdate(LocalContext)

    lcd.setColor(CUSTOM_COLOR, LocalContext.options.Color)

    lcd.drawText(LocalContext.zone.x + LocalContext.zone.w,
                 LocalContext.zone.y + 50, "mAh", CUSTOM_COLOR + RIGHT + SMLSIZE)

    if (remaining - reserve <= 0) then
        lcd.drawText(LocalContext.zone.x, LocalContext.zone.y + 2, remaining,
                     CUSTOM_COLOR + XXLSIZE + BLINK + INVERS + SHADOWED)

        if (LocalContext.options.Alarm == 1 or LocalContext.options.Alarm == 2) then
            playHaptic(100, 100)
        end

        if (LocalContext.options.Alarm == 2 or LocalContext.options.Alarm == 3) then
            playTone(1000, 100, 100)
        end

    else
        lcd.drawText(LocalContext.zone.x, LocalContext.zone.y + 2, remaining,
                     CUSTOM_COLOR + XXLSIZE + SHADOWED)
    end
end

function update(Context, options)
    Context.options = options
    Context.back = nil
end

function refresh(Context)
    calc(Context)
    ScreenUpdate(Context)
end

return {
    name = "RemAhning",
    options = options,
    create = create,
    update = update,
    refresh = refresh
}
