//v97 (c) 2008-2014 33Across Inc. All Rights Reserved

Tynt=window.Tynt||[];
if(typeof Tynt.TCL=="undefined"){(function(){var ea=function(){function I(a){var b=I.options;a=b.parser[b.strictMode?"strict":"loose"].exec(a);for(var c={},e=14;e--;)c[b.key[e]]=a[e]||"";c[b.q.name]={};c[b.key[12]].replace(b.q.parser,function(h,f,d){if(f)c[b.q.name][f]=d});return c}I.options={strictMode:false,key:["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],q:{name:"queryKey",parser:/(?:^|&)([^&=]*)=?([^&]*)/g},parser:{strict:/^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
loose:/^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/}};var g=document,p=g.body,o=g.documentElement,V=eval("/*@cc_on!@*/false"),J=function(a,b){for(var c="",e=0;e<b;e++)c+=a;return c},v=J("a",50),s=(Tynt.e||"")+"ic.tynt.com",W=(Tynt.e||"")+"de.tynt.com/deb/",K=s+"/b/s",C=function(a){return a.replace(/^\s+|\s+$/g,"")},D=function(a,b){for(var c in a)if(a.hasOwnProperty(c))b[c]=
a[c]},L=function(a){for(var b={},c=a.length,e=[],h=0;h<c;h++)if(!b[a[h]]){b[a[h]]=true;e.push(a[h])}return e},M;M=window.addEventListener?function(a,b,c){a.addEventListener(b,c,false)}:function(a,b,c){a.attachEvent("on"+b,c)};var X=function(a,b){var c=location.hostname.split("."),e,h=2;do{e=c.slice(c.length-h,c.length).join(".");e=a+";path=/;domain=."+e+";"+b;g.cookie=e;h++}while(g.cookie.indexOf(a)==-1&&h<=c.length);if(g.cookie.indexOf(a)==-1){e=a+";path=/;"+b;g.cookie=e}},N=function(a){g.readyState==
"complete"?a():M(window,"load",function(){setTimeout(function(){if(typeof g.readyState=="undefined"&&!V)g.readyState="complete";a()},10)})},m=function(a,b){var c=[],e=function(h,f){var d="http://"+h.replace("id="+v,"id="+L(Tynt).join("~"));if(d.indexOf(s+"/b/p?")>-1&&typeof Tynt.b=="string")d+="&b="+Tynt.b;var i=new Image(1,1);if(f)i.onerror=f;i.src=d};m=function(h,f){c.push([h,f])};N(function(){m=e;for(var h=0;h<c.length;h++)m(c[h][0],c[h][1]);c=null});m(a,b)},O=function(a){var b=[],c="",e;for(e in a)if(a.hasOwnProperty(e)){b.push(c,
e,"=",a[e]);c="&"}return b.join("")},Q=function(a){for(var b=0,c=a.length<100?a.length:100,e=0;e<c;e++)b+=a.charCodeAt(e);a=Math.floor(Math.random()*3844);c=Math.abs((new Date).getTime()-12281184E5);return P(c,7)+P((b+a)%3844,2)},R=function(a){if(a<62)return"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".charAt(this);else{var b=Math.floor(a/62);a=a-b*62;return b>=62?R(b)+"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".charAt(a):"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".charAt(b)+
"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".charAt(a)}},P=function(a,b){var c=R(a);return J("0",b-c.length)+c},S=C((g.title||location.hostname).toString()).replace(RegExp(location.hash,"g"),""),Y=function(){for(var a=g.getElementsByTagName("link"),b=0;b<a.length;b++)if(a[b].getAttribute("rel")&&a[b].getAttribute("rel").match("canonical")&&a[b].getAttribute("href")){a=a[b].getAttribute("href");b=location.protocol+"//"+location.host+location.pathname;var c=g.getElementsByTagName("base")[0];
if(c)if(c=c.getAttribute("href"))b=c;if(!a.match(/^http/)){if(a.charAt(0)=="/"){c=b.indexOf("/",9);if(c>-1)b=b.slice(0,c)}else{c=b.lastIndexOf("/");if(c>9)b=b.slice(0,c+1);else b+="/"}a=b+a}return a}return""},t=function(a){return a.replace(/^https?:\/\//,"")},Z=function(a,b){for(var c=b+"=",e=a.split(";"),h=0;h<e.length;h++){for(var f=e[h];f.charAt(0)==" ";)f=f.substring(1,f.length);if(f.indexOf(c)===0)return f.substring(c.length,f.length)}return null},$=function(){var a=Z(g.cookie,"tracertraffic"),
b=encodeURIComponent(t(Y())),c=g.location.hash;c=/tynt=/.test(c)?c.match(/tynt=?([^?&$#]*)/)[1]:false;var e=s+"/b/p?id="+v+(a?"&et="+a:"")+(c?"&a="+c:"")+"&ts="+(new Date).getTime(),h=e+(b?"&cu="+b:""),f=h+(g.referrer?"&r="+encodeURIComponent(t(g.referrer)):"");a=f+"&t="+encodeURIComponent(S);m(a,function(){m(f,function(){m(h,function(){m(e)})})})},aa=function(){N(function(){var a={async:"async",src:"http://"+[W,"v2?id=",L(Tynt).join("~"),"&r=",encodeURIComponent(t(g.referrer))].join("")},b=g.createElement("script");
D(a,b);D(void 0,b.style);a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(b,a)})},w=function(){var a=[];return function(b){for(var c=a.length-1;c>=0;c--)if(a[c]==b)return false;a.unshift(b);a.length>3&&a.pop();return true}},ba=w(),ca=w(),da=function(){var a,b=function(){window.removeEventListener("blur",b,false);E(a);return true};return function(c){a=c.target||c.srcElement;window.removeEventListener("blur",b,false);if(a.nodeName=="IMG"&&a.parentNode.nodeName!="A"){window.addEventListener("blur",
b,false);setTimeout(function(){g.removeEventListener("blur",b,false)},1E4)}return true}}(),T=function(a){E(a.target||a.srcElement,true)},y,U=function(a){a=a.target||a.srcElement;y=a.nodeName=="IMG"?a:null},F=function(){var a=function(d){return typeof d.pageX=="number"?{x:d.pageX-(o.scrollLeft?o.scrollLeft:p.scrollLeft),y:d.pageY-(o.scrollTop?o.scrollTop:p.scrollTop)}:{x:d.clientX,y:d.clientY}},b=function(d){d=a(d);return d.x<=0||d.y<=0||d.x>=p.clientWidth||d.y>=p.clientHeight},c=function(d){d=a(d);
return d.x<=0||d.y<=0||d.x>=o.clientWidth||d.y>=o.clientHeight},e=function(d){return d.target.nodeName=="#document"},h=function(d){d=a(d);return d.x<=4||d.y<=4||d.x>=o.clientWidth-4||d.y>=o.clientHeight-4},f=function(d){f=navigator.userAgent.match("MSIE")?!g.compatMode||g.compatMode.indexOf("CSS")==-1?b:c:navigator.userAgent.match("Firefox")?e:h;f(d)};return function(d){if(y&&f(d)){E(y);y=null}return true}}();Tynt.ci=function(){var a;return function(b,c){a=c||a;var e=K+["?ci=",b,"&id=",v,"&g=",a,
"&r=",encodeURIComponent(t(g.referrer)),"&ts=",(new Date).getTime()].join("");m(e)}}();Tynt.st=function(){var a;return function(b,c,e){a=e||a;b=K+["?",encodeURIComponent(b),"=",encodeURIComponent(c),"&id=",v,"&g=",a,"&r=",encodeURIComponent(t(g.referrer)),"&href=",encodeURIComponent(t(g.location.href)),"&ts=",(new Date).getTime()].join("");m(b)}}();if(Tynt.c)w=function(){};else{Tynt.c=true;Tynt.m=Tynt.m||[];Tynt.n=Tynt.n||[];w=function(){var a=true,b,c=function(e,h){var f;f=(f=C(h))?f.split(/\s+/i).length:
0;var d={id:v,wc:f,c:h,f:a?1:0,t:S};D(e,d);a=false;f=d.trace_type;delete d.trace_type;var i=d.g;delete d.g;for(var j=[],k=["id","wc","f","w","h","t","c"],n=0;n<k.length;n++){var x=k[n],q=d[x];q&&j.push([x,encodeURIComponent(q).replace(/\'/g,"%27")]);delete d[x]}for(var l in d)if(d.hasOwnProperty(l))(k=d[l])&&j.push([l,encodeURIComponent(k).replace(/\'/g,"%27")]);l=[];n=2048-(("http://"+s+"/a/t/x#?").length+(3+i.length)+5);x=j.length;var u=q=0,r=0,G,z,H,A,B=0;for(l[B]={g:i,tp:null};q<x&&l.length<35;){G=
j[q][0];d=j[q][1];H=G.length+2;z=n-H-u;if(z>0){k=d.substring(r,r+z);A=k.slice(-2).indexOf("%");if(A>-1){k=d.substring(r,r+z-2+A);u+=A+2}u+=k.length+H;r+=k.length;l[B][G]=k}else u=n;if(u>=n){l[++B]={g:i,p:B};u=0}if(r>=d.length){q++;r=0}}l[0].tp=l.length;m(s+"/b/t/"+f+"?"+O(l[0]));for(i=1;i<l.length;i++)m(s+"/b/x/"+f+"?"+O(l[i]))};if(window.addEventListener){navigator.userAgent.match(/Firefox\/2\b/)||p.addEventListener("copy",T,false);window.addEventListener("mousedown",U,false);window.addEventListener("dragleave",
F,false);window.addEventListener("dragexit",F,false);g.addEventListener("contextmenu",da,false)}else{p.attachEvent("oncopy",T);g.getElementsByTagName("html")[0].attachEvent("ondragleave",F);p.attachEvent("onmousedown",U)}if(g.cookie.indexOf("tracertraffic=")!==-1)if(!g.referrer||g.referrer.indexOf(location.host)==-1)X("tracertraffic=0","expires=Thu, 01 Jan 1970 00:00:00 GMT");$();aa();return function(e,h){if(!g.getElementById("tyntSh")){var f,d,i;if(h)if(!g.selection||!g.selection.createRange){d=
getSelection();i=d.rangeCount>0&&d.getRangeAt(0);f=d.toString()}else{d=g.selection.createRange();i=d.duplicate();f=d.text}var j=e.src;if(j&&!f&&ca(j)){d={trace_type:3,g:Q(j),w:e.width,h:e.height};for(i=0;i<Tynt.n.length;i++)Tynt.n[i](d,j);c(d,j)}else if(f&&C(f).length&&e.nodeName!="TEXTAREA"&&e.nodeName!="INPUT"){j=ba(f);d={trace_type:1};if(j)b=Q(f);d.g=b;for(var k=true,n=0;n<Tynt.m.length;n++)k=k&&Tynt.m[n](d,f,i,j);j&&k&&c(d,f)}}}}}if(!(/tracer=test|tracer=no_tracing|disableTracer=/.test(location.href)||
/disableTracer=y/.test(g.cookie)))var E=w()};Tynt.TCL=function(){document.body?ea():setTimeout(Tynt.TCL,300)}})();Tynt.TCL()};
