local HttpUtils = require("utils.HttpUtils")

domain = "http://localhost:8848"

local nacosConfigManager = require("api.NacosConfigManager")
local nacosServiceDiscovery = require("api.NacosServiceDiscovery")

require("api.NacosService")

-- 获取配置
--local v = nacosConfigManager.getConfig("http://localhost:8848", nil, "demo.properties", nil)
--print(v)
-- 新增
--local var = nacosConfigManager.pushConfig("http://localhost:8848", nil, 'nacos.example', nil, '1111', nil)


-- 删除
--local var = nacosConfigManager.deleteConfig(domain, nil, "nacos.example", "com.alibaba.nacos")


--print(var)

-- 注册实例
--local registerReturn = NacosServiceDiscovery.registerInstance(domain, "1.1.1.1", "9012", nil, nil, nil,
--        nil, nil, nil, "testRegister", nil, nil)
--print(registerReturn)

-- 获取实例列表
--local instanceList = NacosServiceDiscovery.instanceList(domain, "nacos.test.3", nil, nil, nil, nil)
--print(instanceList)


-- 查询实例详情
--local detail = NacosServiceDiscovery.queryDetail(domain, 'nacos.test.3', 'DEFAULT_GROUP', '11.11.11.11', 8848, nil, nil, nil, nil)
--print(detail)



-- 发送实例心跳
--local s = NacosServiceDiscovery.sendBeat(domain, 'nacos.test.3', nil, nil, '%7b%22cluster%22%3a%22c1%22%2c%22ip%22%3a%22127.0.0.1%22%2c%22metadata%22%3a%7b%7d%2c%22port%22%3a8080%2c%22scheduled%22%3atrue%2c%22serviceName%22%3a%22jinhan0Fx4s.173TL.net%22%2c%22weight%22%3a1%7d')
--print(s)

-- 发送实例心跳-带上namespaceId
-- local sn = NacosServiceDiscovery.sendBeatWithNamespace(domain, 'nacos.test.3', nil, nil, '%7B%22cluster%22%3A%22c1%22%2C%22ip%22%3A%22127.0.0.1%22%2C%22metadata%22%3A%7B%7D%2C%22port%22%3A8080%2C%22scheduled%22%3Atrue%2C%22serviceName%22%3A%22jinhan0Fx4s.173TL.net%22%2C%22weight%22%3A1%2C%22namespaceId%22%3A%22test%22%7D')
-- print(sn)

--创建服务
--local createService = NacosService.createService(
--        domain,
--        "test-service",
--        nil,
--        nil,
--        nil,
--        nil,
--        nil
--)
--print(createService)


-- 删除服务
--local DeleteService = NacosService.DeleteService(domain, "test-service", nil, nil)
--print(DeleteService)


-- 查询服务
--local ServiceDetail = NacosService.ServiceDetail(domain, "test-service", nil, nil)
--print(ServiceDetail)


-- 更新服务
--local UpdateService = NacosService.UpdateService(domain, "test-service", nil, nil, 0, nil, nil)
--print(UpdateService)

-- 服务列表
--local queryServiceList = NacosService.QueryServiceList(domain, nil, nil, nil, nil)
--print(queryServiceList)


--查询系统开关
--local systemSwitch = NacosService.SystemSwitch(domain)
--print(systemSwitch)

--修改系统开关
--local up = NacosService.UpdateSystemSwitch(domain, "aa", "bb", true)
--print(up)

--查看系统当前数据指标
--local Metrics = NacosService.Metrics(domain)
--print(Metrics)


--查看当前集群Server列表

--local operatorServers = NacosService.operatorServers(domain, false)
--print(operatorServers)

-- leader
--local leader = NacosService.Leader(domain)
--print(leader)

local UpdateHealth = NacosService.UpdateHealth(domain, "public", "test-service",
        "DEFAULT_GROUP", nil, '11.11.11.11', '8848', true)
print(UpdateHealth)
