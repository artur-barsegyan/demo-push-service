## Как запустить?

```bash
tarantoolctl rocks install cartridge-cli
tarantoolctl rocks make
.rocks/bin/cartridge start
```

Далее, необходимо зайти на `localhost:8081` и сконфигурировать инстансы:
- активировать написанные нами роли,
- активировать шардинг (кнопка "Bootstrap vshard")

После этого, наш Push Service готов к работе. С помощью POST/GET запросов, можно будет взаимодействовать
с очередью.