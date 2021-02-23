--Copyright (c) 2019, Kin
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--    * Neither the name of Auto Enter Key nor the
--      names of its contributors may be used to endorse or promote products
--      derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--DISCLAIMED. IN NO EVENT SHALL Chiaia BE LIABLE FOR ANY
--DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

_addon.name = 'iDrop'
_addon.version = '1.0'
_addon.author = 'Kin [Nocturnal Souls]'
_addon.commands = {'idrop',}

items = {4545,1179, 4538}

function main()
	bag = 0
    local invTable = windower.ffxi.get_bag_info(bag)
    local invItemCount = windower.ffxi.get_items(bag)
    n = 0
    while (n < invTable.max) do
        local itemInfo = windower.ffxi.get_items(0, n)
        local itemCount = itemInfo.count
        count = 1
        while (count <= table.getn(items)) do
            if (itemInfo.id == items[count]) then
                print("Found " ..itemInfo.id.." at " ..itemInfo.slot)
                windower.ffxi.drop_item(itemInfo.slot, 1)
            end
            count = count+1
        end
        n = n+1
    end
end
windower.register_event('load', main)
windower.register_event('add item', 0, main)