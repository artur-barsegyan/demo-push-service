package = 'pushservice'
version = 'scm-1'
source  = {
    url = '/dev/null',
}
-- Put any modules your app depends on here
dependencies = {
    'tarantool',
    'lua >= 5.1',
    'luatest == 0.3.0-1',
    'cartridge == 1.2.0-1',
    'sharded-queue == scm-1'
}
build = {
    type = 'none';
}
