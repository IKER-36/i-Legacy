### ABOUT 🔨
Ks Peds is a script created in 2022 for esx and qb, it allows you to manage ingame peds with a nice UI and a clean and simple code, to get the version of your framework go to the "releases" section.

### INSTALATION 🚀

Run the insert.sql in your database

Put this line in  your server.cfg
  ```
  ensure ks_peds
  ```

### ADMIN COMMANDS 🤖

_These commands can only be used if you have administrator permissions on the server._

```
command : ks_peds
arguments : {
    function : (add | remove)
    id : (player id)
    ped: (ped what you want to add or remove ex: a_f_m_beach_01)
    type: (animal | ped)
    label: (name of the ped in menu)
}
```


## USAGE ✋

1. Add a ped
```
/ks_peds add id a_f_m_beach_01 ped example_ped
```

1. Remove a ped
```
/ks_peds remove id a_f_m_beach_01
```

3. Open ped menu
```
/PedMenu
```



<!-- USAGE EXAMPLES -->
## CONFIGURATION  🛠️

1. Config.AlloweRanks you can add more admin groups this is a example
```lua
Config.AlloweRanks = {
    'god',
    'superadmin',
    'admin',
    'ped_panarger'
    'mod'
}
```

2. Config.Lang you can change the script language

```lua
Config.Lang = {
    NoPed = "You don't have peds now",
    AddedPed = "You added a ped ",
    To = " to the id ",
    HavePed = "This player haves the ped",
    RemovedPed = "Ped removed ",
    NoPermissions = "You don't have permissions to do this :)"
}
```

3. Config.KeyMapping you can configure the open menu key
```lua
Config.KeyMapping = {
    Key = 'F9',
    Lang = 'Abrir menu ks peds'
}
```
