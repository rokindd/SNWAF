local filea = io.open("D:/WAF/1.log","r")
local fileb = io.open("D:/WAF/2.log","a")
local host = {}
local count = {}
local content = filea:read()
while content do
----------------------------------------------------------------------
----------------------------------------------------------------------	
	local i,j = string.find(content,"\t.-\t")
	local hosta = string.sub(content,i+1,j-1)
	if #host == 0 then
		count[1] = 1
		host[1] = hosta
	else
		for k,hostb in ipairs(host) do
			if string.find(hosta,hostb) then
				count[k] = count[k] + 1
				break;
			elseif k == #host then
				count[#host+1] = 1
				host[#host+1] = hosta
				break;
			end	
		end
	end	
----------------------------------------------------------------------
----------------------------------------------------------------------	
	content = filea:read()
end
local n = 1
while n <= #host do
	fileb:write(host[n],"\t",count[n])
	fileb:write("\n")
	n = n + 1
end	
io.close(filea)
io.close(fileb)