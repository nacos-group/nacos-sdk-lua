local HttpUtils = require("utils.HttpUtils")

domain = "http://localhost:8848"

local nacosConfigManager = require("api.NacosConfigManager")

-- 获取配置
local v = nacosConfigManager.getConfig("http://localhost:8848", nil, "demo.properties", nil)
print(v)
-- 新增
--local var = nacosConfigManager.pushConfig("http://localhost:8848", nil, 'nacos.example', nil, '1111', nil)


-- 删除
--local var = nacosConfigManager.deleteConfig(domain, nil, "nacos.example", "com.alibaba.nacos")


--print(var)