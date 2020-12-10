local HttpUtils = require("utils.HttpUtils")



local nacosConfigManager = require("constant.NacosConfigManager")

--local v =  nacosConfigManager.getConfig("http://localhost:8848",nil,"demo.properties",nil)

-- 新增
local var = nacosConfigManager.pushConfig("http://localhost:8848", nil, 'nacos.example', nil, '1111', nil)




print(var)
