---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by huifer.
--- DateTime: 2020/12/10 14:28
---

NacosServiceDiscovery = {}

local httpUtils = require("utils.HttpUtils")

instance = '/nacos/v1/ns/instance'
instanceList = '/nacos/v1/ns/instance/list'
instanceBeat = '/nacos/v1/ns/instance/beat'

-- 注册实例
--ip	字符串	是	服务实例IP
--port	int	是	服务实例port
--namespaceId	字符串	否	命名空间ID
--weight	double	否	权重
--enabled	boolean	否	是否上线
--healthy	boolean	否	是否健康
--metadata	字符串	否	扩展信息
--clusterName	字符串	否	集群名
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--ephemeral	boolean	否	是否临时实例
function NacosServiceDiscovery.registerInstance(
        domain,
        ip,
        port,
        namespaceId,
        weight,
        enabled,
        healthy,
        metadata,
        clusterName,
        serviceName,
        groupName,
        ephemeral)
    if domain == nil then
        error("nacos domain is not null")
    end
    if ip == nil or ip == '' then
        error("ip is not null")
    end

    if port == nil then
        error("port is not null")
    end

    if serviceName == nil or serviceName == '' then
        error("serviceName is not null")
    end

    if namespaceId == nil or namespaceId == '' then
        namespaceId = "public"
    end

    if weight == nil then
        weight = 1
    end
    if enabled == nil then
        enabled = true
    end
    if enabled == nil then
        enabled = true
    end
    if healthy == nil then
        healthy = true
    end
    if metadata == nil then
        metadata = ''
    end
    if clusterName == nil then
        clusterName = ''

    end
    if groupName == nil then
        groupName = ''
    end
    if ephemeral == nil then
        ephemeral = false

    end

    local url = domain .. instance .. '?ip=' .. tostring(ip) .. '&port=' .. tostring(port) .. '&namespaceId=' ..
            tostring(namespaceId) .. '&weight=' .. tostring(weight) .. '&enabled=' .. tostring(enabled) .. '&healthy=' .. tostring(healthy) .. '&clusterName=' ..
            tostring(clusterName) .. '&serviceName=' .. tostring(serviceName) .. '&groupName=' .. tostring(groupName) .. '&ephemeral=' .. tostring(ephemeral) .. '&metadata=' .. tostring(metadata)

    print("request url " .. url)
    local var = httpUtils.wb_postUrl(url)
    return var

end

function NacosServiceDiscovery.instanceList(
        domain,
        serviceName,
        groupName,
        namespaceId,
        clusters,
        healthyOnly
)


    if domain == nil then
        error("nacos domain is not null")
    end

    if serviceName == nil then
        error("nacos domain is not null")
    end

    if groupName == nil then
        groupName = ''
    end
    if namespaceId == nil then
        namespaceId = ''
    end
    if clusters == nil then
        clusters = ''
    end
    if healthyOnly == nil then
        healthyOnly = false
    end

    local url = domain .. instanceList .. '?serviceName=' .. tostring(serviceName) .. '&groupName=' .. tostring(groupName) .. '&namespaceId=' .. tostring(namespaceId) ..
            '&clusters=' .. tostring(clusters) .. '&healthyOnly=' .. tostring(healthyOnly)

    print("request url " .. url)
    local resp = httpUtils.wb_getUrl(url)

    return resp
end

--查询实例详情
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--ip	字符串	是	实例IP
--port	字符串	是	实例端口
--namespaceId	字符串	否	命名空间ID
--cluster	字符串	否	集群名称
--healthyOnly	boolean	否，默认为false	是否只返回健康实例
--ephemeral	boolean	否	是否临时实例
function NacosServiceDiscovery.queryDetail(
        domain,
        serviceName,
        groupName,
        ip,
        port,
        namespaceId,
        cluster,
        healthyOnly,
        ephemeral
)

    if domain == nil then
        error("nacos domain is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end
    if ip == nil then
        error("ip is not null")
    end
    if port == nil then
        error("port is not null")
    end

    if groupName == nil then
        groupName = 'DEFAULT_GROUP'
    end
    if namespaceId == nil then
        namespaceId = ''
    end
    if cluster == nil then
        cluster = ''
    end
    if healthyOnly == nil then
        healthyOnly = false
    end
    if ephemeral == nil then
        ephemeral = false
    end

    local url = domain .. instance .. "?serviceName=" .. tostring(serviceName) .. '&groupName=' .. tostring(groupName) .. "&ip="
            .. tostring(ip) .. '&port=' .. tostring(port) .. '&namespaceId=' .. tostring(namespaceId) .. '&cluster=' ..
            tostring(cluster) .. '&healthyOnly=' .. tostring(healthyOnly) .. '&ephemeral=' .. tostring(ephemeral)

    local resp = httpUtils.wb_getUrl(url)
    return resp
end



--发送实例心跳
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--ephemeral	boolean	否	是否临时实例
--beat	JSON格式字符串	是	实例心跳内容
function NacosServiceDiscovery.sendBeat(
        domain,
        serviceName,
        groupName,
        ephemeral,
        beat
)

    if domain == nil then
        error("nacos domain is not null")
    end
    if serviceName == nil then
        error("serviceName is not null")
    end
    if beat == nil then
        error("beat is not null")
    end

    if groupName == nil then
        groupName = 'DEFAULT_GROUP'
    end
    if ephemeral == nil then
        ephemeral = false
    end
    local url = domain .. instanceBeat .. '?serviceName=' .. tostring(serviceName) .. '&groupName=' .. tostring(groupName) .. '&ephemeral=' .. tostring(ephemeral) .. '&beat=' .. tostring(beat)
    print("request url " .. url)

    local resp = httpUtils.wb_putUrl(url)
    return resp
end

--发送实例心跳-带命名空间
--serviceName	字符串	是	服务名
--groupName	字符串	否	分组名
--namespaceId   字符串	是	命名空间ID
--ephemeral	boolean	否	是否临时实例
--beat	JSON格式字符串	是	实例心跳内容
function NacosServiceDiscovery.sendBeatWithNamespace(
    domain,
    serviceName,
    groupName,
    namespaceId,
    ephemeral,
    beat
)

if domain == nil then
    error("nacos domain is not null")
end
if serviceName == nil then
    error("serviceName is not null")
end
if beat == nil then
    error("beat is not null")
end
if namespaceId == nil then
    error("namespaceId is not null")
end

if groupName == nil then
    groupName = 'DEFAULT_GROUP'
end
if ephemeral == nil then
    ephemeral = false
end
local url = domain .. instanceBeat .. '?serviceName=' .. tostring(serviceName) .. '&groupName=' .. tostring(groupName) .. '&namespaceId=' .. tostring(namespaceId) .. '&ephemeral=' .. tostring(ephemeral) .. '&beat=' .. tostring(beat)
print("request url " .. url)

local resp = httpUtils.wb_putUrl(url)
return resp
end

return NacosServiceDiscovery
