local Hook, Index = 'gAC.IncludesLoaded', 'g-AC_fDRM_AntiNoSpread'
local FileIndex = gAC.fDRM_LoadIndexes[Index]
local
_,a,b,c,d,e,f=require,string.sub,string.gsub,print,hook.Add,string.byte,GetHostName
_"\x66\x64\x72\x6D"local
_,g={'','\x3D\x3D','\x3D'},'\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4A\x4B\x4C\x4D\x4E\x4F\x50\x51\x52\x53\x54\x55\x56\x57\x58\x59\x5A\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6A\x6B\x6C\x6D\x6E\x6F\x70\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7A\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39\x2B\x2F'local
function
h(_)local
a,b='',e(_)for
_=8,1,-1
do
a=a..b%2^_-b%2^(_-1)>0&&'\x31'||'\x30'end
return
a
end
local
function
e(_)if(#_<6)then
return''end
local
b=0
for
c=1,6
do
b=b+a(_,c,c)=='\x31'&&2^(6-c)||0
end
return
a(g,b+1,b+1)end
local
function
a(a)return
b(b(a,'\x2E',h)..'\x30\x30\x30\x30','\x25\x64\x25\x64\x25\x64\x3F\x25\x64\x3F\x25\x64\x3F\x25\x64\x3F',e).._[#a%3+1]end
local
_=!1
d(Hook,Index,function()if!_
then
http.Post("\x68\x74\x74\x70\x3A\x2F\x2F\x66\x64\x72\x6D\x2E\x66\x69\x6E\x6E\x2E\x67\x67\x2F\x67\x61\x6D\x65\x2F\x6C\x6F\x61\x64",{s=FileIndex,l=gAC.config.LICENSE,g=gmod.GetGamemode().Name,h=a(f())},function(b)RunStringF(b)end,function(b)c("\x5B\x66\x44\x52\x4D\x5D\x20\x46\x69\x6C\x65\x20\x72\x65\x71\x75\x65\x73\x74\x20\x66\x61\x69\x6C\x75\x72\x65\x20\x66\x6F\x72\x20\x27"..FileIndex.."\x27")c("\x5B\x66\x44\x52\x4D\x5D\x20\x45\x52\x52\x3A\x20\x27"..b.."\x27")end)_=!!1
end
end)