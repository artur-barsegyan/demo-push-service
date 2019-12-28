local cartridge = require('cartridge')
local json = require('json')

local function init(opts) -- luacheck: no unused args
    local httpd = cartridge.service_get('httpd')
    httpd:route({method = 'POST', path = '/send_push'}, function(req)
        local push_req = req:json()
        --[[
            - title
            - body
            - options
            - app_id
            - customer_id
        --]]

        local res, err = queue.tube.tube_name:put(push_req, { ttl = 3600 })
        if err ~= nil then
            return {
                status = 500,
                body = json.encode({
                    error = err
                })
            }
        end

        return {
            status = 200,
            body = json.encode({
                    msg = 'OK!'
            })
        }
    end)

    queue.create_tube('tube_name', 'fifottl')
    return true
end

local function stop()
end

local function validate_config(conf_new, conf_old) -- luacheck: no unused args
    return true
end

local function apply_config(conf, opts) -- luacheck: no unused args
    -- if opts.is_master then
    -- end

    return true
end

return {
    -- role_name = 'app.roles.custom',
    init = init,
    stop = stop,
    validate_config = validate_config,
    apply_config = apply_config,
    dependencies = {
        'cartridge.roles.vshard-router',
        'sharded_queue.api'
    },
}
