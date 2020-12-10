package = "nacos-sdk-lua"
version = "dev-1"
source = {
   url = "git://github.com/huifer/nacos-sdk-lua"
}
description = {
   homepage = "https://github.com/huifer/nacos-sdk-lua.git",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      ["api.NacosConfigManager"] = "src/api/NacosConfigManager.lua",
      ["api.NacosNamespace"] = "src/api/NacosNamespace.lua",
      ["api.NacosService"] = "src/api/NacosService.lua",
      ["api.NacosServiceDiscovery"] = "src/api/NacosServiceDiscovery.lua",
      demo = "src/demo.lua",
      ["utils.HttpUtils"] = "src/utils/HttpUtils.lua",
      ["utils.UrlDecod"] = "src/utils/UrlDecod.lua"
   }
}
