local
a={a='Run',b='FileQuery',c='FileRelation',d='NetworkReceivers',e='Network',f='gAC_NonNetClientLoaded',g='NonNetworkedPlayers',h='Encoder',i='DBGPrint',j='Decoder_Var',k='DRMAddCLCode',l='Encode',m='Global_Decoder',n='Decoder_Get',o='Decoder_Func',p='Decoder_Undo',q='DRM_LoadIndexes',r='LICENSE',s='config',t='Add',u='Print'}local
b=SortedPairs
local
c=file.Exists
local
d=file.Read
local
e=hook[a.t]local
f=hook[a.a]local
g=pairs
local
h=string.Replace
local
i=string.match
local
j=util.Compress
local
k=util.JSONToTable
local
l=http.Post
local
m=gmod.GetGamemode
local
n=debug.getinfo
local
o=debug.getupvalue
local
p=require
local
q=string.sub
local
r=string.gsub
local
s=print
local
t=tostring
local
u=xpcall
local
v=debug.traceback
local
w=string.byte
local
x=GetHostName
local
y=(SERVER
and
util.AddNetworkString
or
nil)local
z=net.Receive
local
A=net.Start
local
B=net.WriteData
local
C=net.Send
local
D=hook[a.a]local
E=timer.Simple
local
F=hook.Remove
gAC[a.b]=gAC[a.b]or{}gAC[a.c]=gAC[a.c]or{}gAC[a.d]=gAC[a.d]or{}if!gAC[a.e]then
gAC[a.e]={}gAC[a.h]={}function
gAC.Network:AddReceiver(L,M)gAC[a.d][#gAC[a.d]+1]={L,M}end
local
I=math.Round
local
J=string.char
local
K=math.random
function
gAC.Encoder.stringrandom(L)local
M=""for
N=1,L
do
local
O=I(K(1,4))if
O==1
then
M=M..J(K(97,122))elseif
O==2
then
M=M..J(K(65,90))elseif
O==3
then
M=M..J(K(49,57))end
end
return
M
end
gAC[a.e][a.g]={}y("gAC.PlayerInit")z("gAC.PlayerInit",function(L,M)if
M.gAC_ClientLoaded
then
return
end
if
M[a.f]then
return
end
M[a.f]=!!1
gAC[a.e][a.g][#gAC[a.e][a.g]+1]=M:SteamID64()end)end
function
gAC.AddQuery(I)local
J=I
if
i(i(I,"^.+(%..+)$"),".json")then
return
end
I=d(I,"LUA")local
K=#gAC[a.b]+1
gAC[a.b][K]=I
gAC[a.c][K]=J
gAC[a.i]("Added file "..J.." to file query")end
local
G=-1
e("gAC.IncludesLoaded","Decoder_Unloader",function()if
G>0
then
gAC[a.b][#gAC[a.b]]=nil
end
for
I=1,#gAC[a.b]do
local
J=gAC[a.b][I]local
K=gAC[a.c][I]local
L=i(K,"^(.+)%..+$")..'.json'if
c(L,"LUA")then
local
M=k(d(L,"LUA"))for
N,O
in
g(M)do
J=h(J,N,gAC[a.h][a.l](O,gAC[a.e][a.m]))end
J=h(J,"__DECODER_STR__","_G"..gAC[a.e][a.j].."('"..gAC[a.e][a.n].."')")J=h(J,"__DECODER_FUNC__",gAC[a.h][a.o])gAC[a.i]('Encoded local file "'..K..'"')end
gAC[a.b][I]=j(J)gAC[a.i]('Added compressed file "'..K..'" to file query')end
if#gAC[a.b]>0
then
gAC[a.b][#gAC[a.b]+1]=j("_G"..gAC[a.e][a.j].." = _G"..gAC[a.e][a.j].."('"..gAC[a.e][a.p].."')")G=#gAC[a.b]end
for
I=1,#gAC[a.d]do
local
J=gAC[a.d][I]gAC[a.e]:AddReceiver(J[1],J[2])end
gAC[a.d]={}end)do
local
I,J='https://glorifieddrm.net/main.php','gac'local
K,L=!1,function()end
local
M=function(Z)if
Z==nil
then
return!!1
end
local
ab=n(Z)if(ab.what=='C'and
ab.source=='=[C]'and
ab.short_src=='[C]'and
ab.nups==0
and
ab.linedefined==-1
and
ab.lastlinedefined==-1
and
ab.currentline==-1
and
o(ab.func,1)==nil)then
return!!1
else
return!1
end
end
local
N=function(Z)p(Z)if
M(RunString)==!!1
and
M(RunStringG)==!!1
then
local
ab=RunStringG
L=function(bb,cb)return
u(ab,v,bb,cb)end
end
RunStringG=nil
end
local
O={'','==','='}local
P='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local
function
Q(Z)local
ab,bb='',w(Z)for
cb=8,1,-1
do
ab=ab..(bb%2^cb-bb%2^(cb-1)>0
and'1'or'0')end
return
ab
end
local
function
R(Z)if(#Z<6)then
return''end
local
ab=0
for
bb=1,6
do
ab=ab+(q(Z,bb,bb)=='1'and
2^(6-bb)or
0)end
return
q(P,ab+1,ab+1)end
local
function
S(Z)return
r(r(Z,'.',Q)..'0000','%d%d%d?%d?%d?%d?',R)..O[#Z%3+1]end
local
T={}for
Z,ab
in
g(gAC[a.q])do
T[Z]=0
end
local
function
U()for
Z,ab
in
g(T)do
if
ab~=0
and(ab<2
or
ab==4)then
return!1
end
end
return!!1
end
local
V,W={},{}local
function
X()if!U()then
return
end
if
G>0
then
gAC[a.b][#gAC[a.b]]=nil
end
for
Z=1,#W
do
local
ab=W[Z]local
bb,cb=L(ab[1],ab[2])if
bb==!1
then
s("[GlorifiedDRM] Execution error for file '"..FileIndex.."'")s("[GlorifiedDRM] Recommend contacting the developers on this...\n"..cb)T[ab[2]]=5
else
T[ab[2]]=3
end
W[Z]=nil
end
for
Z=1,#V
do
local
ab=V[Z]local
bb=nil
do
gAC[a.k]=function(eb,fb)bb={eb,k(fb)}end
local
cb,db=L(ab[1],ab[2])gAC[a.k]=nil
if
cb==!1
then
s("[GlorifiedDRM] Execution error for file '"..FileIndex.."'")s("[GlorifiedDRM] Recommend contacting the developers on this...\n"..db)T[ab[2]]=5
bb=nil
else
T[ab[2]]=3
end
end
if
bb~=nil
then
local
cb,db=bb[1],bb[2]if
db~=!1
then
for
eb,fb
in
g(db)do
cb=h(cb,eb,gAC[a.h][a.l](fb,gAC[a.e][a.m]))end
cb=h(cb,"__DECODER_STR__","_G"..gAC[a.e][a.j].."('"..gAC[a.e][a.n].."')")cb=h(cb,"__DECODER_FUNC__",gAC[a.h][a.o])end
gAC[a.b][#gAC[a.b]+1]=j(cb)gAC[a.i]('Encoded DRM file "'..ab[2]..'"')end
V[Z]=nil
end
if
U()then
if#gAC[a.b]>0
then
gAC[a.b][#gAC[a.b]+1]=j("_G"..gAC[a.e][a.j].." = _G"..gAC[a.e][a.j].."('"..gAC[a.e][a.p].."')")G=#gAC[a.b]end
for
Z=1,#gAC[a.d]do
local
ab=gAC[a.d][Z]gAC[a.e]:AddReceiver(ab[1],ab[2])end
gAC[a.d]={}gAC[a.u]('DRM files has initialized!')D('gAC.DRMInitalized',!!1)end
end
e("gAC.IncludesLoaded","gAC.DidDRMInitalized",function()if
U()then
D('gAC.DRMInitalized',!1)end
end)local
Y={}function
gAC.DRMAdd(Z,ab)local
bb=gAC[a.q][ab]if!bb
then
return
end
if
not
K
then
N(J)K=!!1
end
local
function
cb()T[ab]=1
l(I,{license=gAC[a.s][a.r],file_ID=bb,addon="GlorifiedAnticheat"},function(db)if
q(db,1,4)=='ERR:'then
s("[GlorifiedDRM] File request failure for '"..bb.."'")s("[GlorifiedDRM] To prevent the system from recursive errors, the DRM has halted.")s("[GlorifiedDRM] ERR: "..db)T[ab]=4
else
if
Y[bb]then
s("[GlorifiedDRM] File '"..bb.."' received after "..Y[bb].."/4 attempts")end
W[#W+1]={db,ab}T[ab]=2
end
X()end,function(db)if
not
Y[bb]then
Y[bb]=1
else
Y[bb]=Y[bb]+1
end
if
Y[bb]and
Y[bb]>=4
then
s("[GlorifiedDRM] File request failure for '"..bb.."' all attempts failed.")s("[GlorifiedDRM] To prevent the system from recursive errors, the DRM has halted.")T[ab]=4
else
s("[GlorifiedDRM] File request failure for '"..bb.."' retrying in 3s "..Y[bb].."/4")E(3,cb)end
s("[GlorifiedDRM] ERR: '"..db.."'")X()end)F(Z,ab)end
e(Z,ab,cb)end
function
gAC.DRMAddClient(Z,ab)local
bb=gAC[a.q][ab]if!bb
then
return
end
if
not
K
then
N(J)K=!!1
end
local
function
cb()T[ab]=1
l(I,{license=gAC[a.s][a.r],file_ID=bb,addon="GlorifiedAnticheat"},function(db)if
q(db,1,4)=='ERR:'then
s("[GlorifiedDRM] File request failure for '"..bb.."'")s("[GlorifiedDRM] To prevent the system from recursive errors, the DRM has halted.")s("[GlorifiedDRM] ERR: "..db)T[ab]=4
else
if
Y[bb]then
s("[GlorifiedDRM] File '"..bb.."' received after "..Y[bb].."/4 attempts")end
V[#V+1]={db,ab}T[ab]=2
end
X()end,function(db)if
not
Y[bb]then
Y[bb]=1
else
Y[bb]=Y[bb]+1
end
if
Y[bb]and
Y[bb]>=4
then
s("[GlorifiedDRM] File request failure for '"..bb.."' all attempts failed.")s("[GlorifiedDRM] To prevent the system from recursive errors, the DRM has halted.")T[ab]=4
else
s("[GlorifiedDRM] File request failure for '"..bb.."' retrying in 3s "..Y[bb].."/4")E(3,cb)end
s("[GlorifiedDRM] ERR: '"..db.."'")X()end)F(Z,ab)end
e(Z,ab,cb)end
concommand[a.t]('drm_filestatus',function()gAC[a.u]('GlorifiedDRM file status')for
Z,ab
in
g(T)do
local
bb=""if
ab==0
then
bb="Not Requested"end
if
ab==1
then
bb="Not Received"end
if
ab==2
then
bb="Finializing"end
if
ab==3
then
bb="Executed"end
if
ab==4
then
bb="Request Error"end
if
ab==5
then
bb="Execution Error"end
s('[GlorifiedDRM] index "'..Z.."' - "..bb)end
end)end
e("gAC.ClientLoaded","SendFiles",function(I)if#gAC[a.b]>0
then
for
J,K
in
b(gAC[a.b])do
if
gAC[a.b][J]==nil
then
continue
end
gAC[a.e]:Send("LoadPayload",gAC[a.b][J],I,!!1)end
D("gAC.CLFilesLoaded",I)end
end)local
H=!1
e('PlayerInitialSpawn','DidGacLoad?',function(I)if
gAC[a.e]and
gAC[a.e].ReceiveCount
then
return
end
if
H
then
return
end
gAC[a.u]('WARNING, gAC networking did not initialize in time.')gAC[a.u]('Chances are that something is wrong with your license key.')gAC[a.u]('Please contact the developers of gAC to resolve this.')H=!!1
end)