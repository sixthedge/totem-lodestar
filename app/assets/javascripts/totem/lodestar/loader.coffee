
window.TotemLodestar =
  _modules: {}

  load: ->
    this.version = $('.settings').data('version')
    this.user_settings._init()

    settings     = $('.settings').data('settings')

    for module of this._modules
      this._modules[module].init(module, settings['modules'][module]);

  load_module: (id, module, settings) ->
    module._settings = settings
    module._id       = id
    this.load_module_plugins(module)

  load_module_plugins: (module) ->
    for plugin of module._settings
      module[plugin](module._settings[plugin])
    

  user_settings: 
    _init: ->
      # Cookies.defaults = {expires: 30}
      if Cookies.get('TotemLodestar') then return
      Cookies.set('TotemLodestar', this._defaults)

    _defaults: 
      layout: 
        full_width: true

    set: (value) -> Cookies.set('TotemLodestar', value)
    get: (cname) -> return Cookies.getJSON('TotemLodestar')
    remove: (cname) -> console.log 'Needs implementation'


