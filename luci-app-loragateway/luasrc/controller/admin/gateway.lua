--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008-2011 Jo-Philipp Wich <xm@subsignal.org>
Copyright 2014 Edwin Chen <edwin@dragino.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

module("luci.controller.admin.gateway", package.seeall)

function index()
	local uci = luci.model.uci.cursor()
	local string =string
	entry({"admin", "gateway"}, alias("admin", "gateway", "gateway"), _("Gateway"), 30).index = true
	entry({"admin", "gateway", "gateway"}, cbi("admin_gateway/gateway"), _("LoRaWan / GateWay"), 1)
	entry({"admin", "gateway", "iotserver"}, cbi("admin_gateway/iotserver"), _("IOT Server"), 2)
	entry({"admin", "gateway", "mqtt"}, cbi("admin_gateway/mqtt"), _("MQTT"), 3)
	entry({"admin", "gateway", "tcp_client"}, cbi("admin_gateway/tcp_client"), _("Tcp_Client"), 4)
    entry({"admin", "gateway", "lgwlog"}, template("admin_status/lgwlog"), _("Lora Log"), 20).leaf = true
    entry({"admin", "gateway", "lgwlog_action"}, post("lgwlog_action")).leaf = true
	
end

function lgwlog_action()
    luci.http.redirect(luci.dispatcher.build_url("admin/gateway/lgwlog"))
end