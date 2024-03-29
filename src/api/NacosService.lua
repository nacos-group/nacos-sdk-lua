---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by huifer.
--- DateTime: 2020/12/10 15:32
---

NacosService = {}

local httpUtils = require("utils.HttpUtils")

serviceUrl = '/nacos/v1/ns/service'

serviceList = '/nacos/v1/ns/service/list'

--创建服务
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--namespaceId	字符串	否	命名空间ID
--protectThreshold	浮点数	否	保护阈值,取值0到1,默认0
--metadata	字符串	否	元数据
--selector	JSON格式字符串	否	访问策略
function NacosService.createService(
        domain,
        serviceName,
        groupName,
        namespaceId,
        protectThreshold,
        metadata,
        selector
)
    if domain == nil then
        error("nacos domain is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end

    if groupName == nil then
        groupName = 'DEFAULT_GROUP'
    end
    if namespaceId == nil then
        namespaceId = 'public'
    end
    if protectThreshold == nil then
        protectThreshold = 0
    end
    if metadata == nil then
        metadata = ''
    end
    if selector == nil then
        selector = ''
    end

    local url = domain .. serviceUrl .. "?"
            .. 'serviceName=' .. tostring(serviceName)
            .. '&groupName=' .. tostring(groupName)
            .. '&namespaceId=' .. tostring(namespaceId)
            .. '&protectThreshold=' .. tostring(protectThreshold)
            .. '&metadata=' .. tostring(metadata)
            .. '&selector=' .. tostring(selector)

    print("request url ", url)

    local body = httpUtils.wb_postUrl(url)

    return body
end


--删除服务
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--namespaceId	字符串	否	命名空间ID
function NacosService.DeleteService(
        domain,
        serviceName,
        groupName,
        namespaceId
)

    if domain == nil then
        error("nacos domain is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end
    if groupName == nil then
        groupName = 'DEFAULT_GROUP'
    end
    if namespaceId == nil then
        namespaceId = 'public'
    end

    local url = domain .. serviceUrl .. "?"
            .. 'serviceName=' .. tostring(serviceName)
            .. '&groupName=' .. tostring(groupName)
            .. '&namespaceId=' .. tostring(namespaceId)

    print("request url ", url)

    local body = httpUtils.wb_deleteUrl(url)
    return body


end

--查询服务
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--namespaceId

function NacosService.ServiceDetail(
        domain,
        serviceName,
        groupName,
        namespaceId
)

    if domain == nil then
        error("nacos domain is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end
    if groupName == nil then
        groupName = 'DEFAULT_GROUP'
    end
    if namespaceId == nil then
        namespaceId = 'public'
    end

    local url = domain .. serviceUrl .. "?"
            .. 'serviceName=' .. tostring(serviceName)
            .. '&groupName=' .. tostring(groupName)
            .. '&namespaceId=' .. tostring(namespaceId)

    print("request url ", url)

    local body = httpUtils.wb_getUrl(url)
    return body


end


--修改服务
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--namespaceId	字符串	否	命名空间ID
--protectThreshold	浮点数	否	保护阈值,取值0到1,默认0
--metadata	字符串	否	元数据
--selector	JSON格式字符串	否	访问策略
function NacosService.UpdateService(
        domain,
        serviceName,
        groupName,
        namespaceId,
        protectThreshold,
        metadata,
        selector
)

    if domain == nil then
        error("nacos domain is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end
    if groupName == nil then
        groupName = 'DEFAULT_GROUP'
    end
    if namespaceId == nil then
        namespaceId = 'public'
    end
    if protectThreshold == nil then
        protectThreshold = 0
    end
    if metadata == nil then
        metadata = ''
    end
    if selector == nil then
        selector = ''
    end

    local url = domain .. serviceUrl .. "?"
            .. 'serviceName=' .. tostring(serviceName)
            .. '&groupName=' .. tostring(groupName)
            .. '&namespaceId=' .. tostring(namespaceId)
            .. '&protectThreshold=' .. tostring(protectThreshold)
            .. '&metadata=' .. tostring(metadata)
            .. '&selector=' .. tostring(selector)

    print("request url ", url)
    local body = httpUtils.wb_putUrl(url)
    return body

end


--查询服务列表
--pageNo	int	是	当前页码
--pageSize	int	是	分页大小
--groupName	字符串	否	分组名
--namespaceId	字符串	否	命名空间ID
function NacosService.QueryServiceList(
        domain,
        pageNo,
        pageSize,
        groupName,
        namespaceId
)
    if domain == nil then
        error("nacos domain is not null")
    end
    if pageNo == nil then
        pageNo = 0
    end
    if pageSize == nil then
        pageSize = 10
    end
    if groupName == nil or groupName == '' then
        groupName = 'DEFAULT_GROUP'
    end
    if namespaceId == nil then
        namespaceId = 'public'
    end

    local url = domain .. serviceList .. "?"
            .. 'pageNo=' .. tostring(pageNo)
            .. '&pageSize=' .. tostring(pageSize)
            .. '&groupName=' .. tostring(groupName)
            .. '&namespaceId=' .. tostring(namespaceId)

    print("request url " .. url)

    local body = httpUtils.wb_getUrl(url)
    return body
end

operatorSwitches = '/nacos/v1/ns/operator/switches'
--查询系统开关
function NacosService.SystemSwitch(
        domain

)
    if domain == nil then
        error("nacos domain is not null")
    end

    local url = domain .. operatorSwitches
    print("request url " .. url)

    local var = httpUtils.wb_getUrl(url)
    return var

end


--修改系统开关
--entry	字符串	是	开关名
--value	字符串	是	开关值
--debug	boolean	否	是否只在本机生效,true表示本机生效,false表示集群生效
function NacosService.UpdateSystemSwitch(
        domain,
        entry,
        value,
        debug

)
    if domain == nil then
        error("nacos domain is not null")
    end

    if entry == nil or entry == '' then
        error("entry is not null")
    end
    if value == nil or value == '' then
        error("value is not null")
    end
    if debug == nil then
        error("debug is not null")
    end

    local url = domain .. operatorSwitches .. '?'
            .. 'entry=' .. tostring(entry)
            .. '&value=' .. tostring(value)
            .. '&debug=' .. tostring(debug)
    print("request url " .. url)
    local var = httpUtils.wb_putUrl(url)
    return var

end

operatorMetrics = '/nacos/v1/ns/operator/metrics'
--查看系统当前数据指标
function NacosService.Metrics(domain)
    if domain == nil then
        error("nacos domain is not null")
    end

    local url = domain .. operatorMetrics
    print("request url " .. url)
    return httpUtils.wb_getUrl(url)


end

operatorServers = '/nacos/v1/ns/operator/servers'
--查看当前集群Server列表
function NacosService.operatorServers(domain, healthy)

    if domain == nil then
        error("nacos domain is not null")
    end

    if healthy == nil then
        healthy = false
    end
    local url = domain .. operatorServers

    print("request url " .. url)
    return httpUtils.wb_getUrl(url)

end

leaderUrl = '/nacos/v1/ns/raft/leader'
--查看当前集群leader
function NacosService.Leader(domain)
    if domain == nil then
        error("nacos domain is not null")
    end
    local url = domain .. leaderUrl
    print("request url " .. url)
    return httpUtils.wb_getUrl(url)


end
updateHealthUrl = '/nacos/v1/ns/health/instance'
--更新实例的健康状态
--namespaceId	字符串	否	命名空间ID
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--clusterName	字符串	否	集群名
--ip	字符串	是	服务实例IP
--port	int	是	服务实例port
--healthy	boolean	是	是否健康
function NacosService.UpdateHealth(
        domain,
        namespaceId,
        serviceName,
        groupName,
        clusterName,
        ip,
        port,
        healthy

)
    if domain == nil then
        error("nacos domain is not null")
    end

    if namespaceId == nil then
        error("namespaceId is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end
    if groupName == nil then
        groupName = "DEFAULT_GROUP"
    end
    if ip == nil then
        error("ip is not null")
    end
    if port == nil then
        error("port is not null")
    end
    if healthy == nil then
        error("healthy is not null")
    end
    if clusterName == nil then
        clusterName = ''
    end

    local url = domain .. updateHealthUrl .. "?"
            .. 'namespaceId=' .. tostring(namespaceId)
            .. '&serviceName=' .. tostring(serviceName)
            .. '&groupName=' .. tostring(groupName)
            .. '&clusterName=' .. tostring(clusterName)
            .. '&ip=' .. tostring(ip)
            .. '&port=' .. tostring(port)
            .. '&healthy=' .. tostring(healthy)
    print("request url " .. url)
    return httpUtils.wb_putUrl(url)

end
return NacosService
