"use strict";(self.webpackChunknpwd_nui=self.webpackChunknpwd_nui||[]).push([[9071],{65610:function(e,t,n){var r=this&&this.__createBinding||(Object.create?function(e,t,n,r){void 0===r&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){void 0===r&&(r=n),e[r]=t[n]}),u=this&&this.__exportStar||function(e,t){for(var n in e)"default"===n||Object.prototype.hasOwnProperty.call(t,n)||r(t,e,n)};Object.defineProperty(t,"__esModule",{value:!0}),u(n(1738),t),u(n(1145),t),u(n(82034),t),u(n(87422),t),u(n(11937),t),u(n(59735),t),u(n(55550),t),u(n(10316),t)},59735:function(e,t,n){Object.defineProperty(t,"__esModule",{value:!0}),t.NuiContext=void 0;var r=n(92950);t.NuiContext=r.createContext(null)},82034:function(e,t,n){Object.defineProperty(t,"__esModule",{value:!0}),t.useNuiCallback=void 0;var r=n(92950),u=n(59735),o=n(10316),i=n(1738);t.useNuiCallback=function(e,t,n,a){var c=r.useContext(u.NuiContext),s=c.sendAbortable,l=c.callbackTimeout,f=r.useRef(),d=r.useRef(),v=r.useRef(o.eventNameFactory(e,t)),p=r.useRef(t),b=r.useRef(e),h=r.useState(!1),y=h[0],w=h[1],m=r.useState(!1),N=m[0],_=m[1],k=r.useState(null),C=k[0],g=k[1],E=r.useState(null),x=E[0],P=E[1],O=r.useCallback((function(e){N&&(d.current&&clearTimeout(d.current),y||(P(e),g(null),_(!1),null==n||n(e)))}),[n,y,N]),j=r.useCallback((function(e){d.current&&clearTimeout(d.current),g(e),P(null),_(!1),null==a||a(e)}),[a]);return i.useNuiEvent(b.current,p.current+"Success",O),i.useNuiEvent(b.current,p.current+"Error",j),[r.useCallback((function(e,t){_((function(n){if(!n){w(!1),g(null),P(null),f.current=s(p.current,e);var r=t||{timeout:l},u=!1!==r.timeout&&(r.timeout||l);return u&&(clearTimeout(d.current),d.current=setTimeout((function(){w(!0),j(new Error('fivem-nui-react-lib: "'+v.current+'" event callback timed out after '+u+" milliseconds")),f.current&&f.current.abort(),d.current=void 0,f.current=void 0}),u)),!0}return n}))}),[]),{loading:N,response:x,error:C}]}},1738:function(e,t,n){Object.defineProperty(t,"__esModule",{value:!0}),t.useNuiEvent=void 0;var r=n(92950),u=n(10316);t.useNuiEvent=function(e,t,n){var o=r.useRef();r.useEffect((function(){o.current=n}),[n]),r.useEffect((function(){var n=u.eventNameFactory(e,t),r=function(e){if(o.current&&o.current.call){var t=e.data;o.current(t)}};return function(e,t,n){e.addEventListener(t,n)}(window,n,r),function(){return window.removeEventListener(n,r)}}),[e,t])}},1145:function(e,t,n){Object.defineProperty(t,"__esModule",{value:!0}),t.useNuiEventCallback=void 0;var r=n(92950),u=n(59735),o=n(10316),i=n(1738);t.useNuiEventCallback=function(e,t,n,a){console.warn("@ useNuiEventCallback is deprecated, please use useNuiCallback instead");var c=r.useContext(u.NuiContext),s=c.sendAbortable,l=c.callbackTimeout,f=r.useRef(),d=r.useRef(),v=r.useRef(o.eventNameFactory(e,t)),p=r.useRef(t),b=r.useRef(e),h=r.useState(!1),y=h[0],w=h[1],m=r.useState(!1),N=m[0],_=m[1],k=r.useState(null),C=k[0],g=k[1],E=r.useState(null),x=E[0],P=E[1],O=r.useCallback((function(e){N&&(d.current&&clearTimeout(d.current),y||(P(e),g(null),_(!1),null==n||n(e)))}),[n,y,N]),j=r.useCallback((function(e){d.current&&clearTimeout(d.current),g(e),P(null),_(!1),null==a||a(e)}),[a]);return r.useEffect((function(){N&&!d.current&&(clearTimeout(d.current),d.current=setTimeout((function(){w(!0),j(new Error('fivem-nui-react-lib: "'+v.current+'" event callback timed out after '+l+" milliseconds")),f.current&&f.current.abort(),d.current=void 0,f.current=void 0}),1e4))}),[N,j]),i.useNuiEvent(b.current,p.current+"Success",O),i.useNuiEvent(b.current,p.current+"Error",j),[r.useCallback((function(e){_((function(t){return t||(f.current=s(p.current,e),!0)}))}),[]),{loading:N,response:x,error:C}]}},87422:function(e,t,n){Object.defineProperty(t,"__esModule",{value:!0}),t.useNuiRequest=void 0;var r=n(92950),u=n(59735);t.useNuiRequest=function(){var e=r.useContext(u.NuiContext);if(!e)throw new Error("fivem-nui-react-lib: useNuiRequest must be used inside NuiProvider passing the `resource` prop");var t=e.send,n=e.sendAbortable;return r.useMemo((function(){return{send:t,sendAbortable:n}}),[t,n])}},55550:function(e,t,n){var r=this&&this.__assign||function(){return r=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var u in t=arguments[n])Object.prototype.hasOwnProperty.call(t,u)&&(e[u]=t[u]);return e},r.apply(this,arguments)},u=this&&this.__awaiter||function(e,t,n,r){return new(n||(n=Promise))((function(u,o){function i(e){try{c(r.next(e))}catch(e){o(e)}}function a(e){try{c(r.throw(e))}catch(e){o(e)}}function c(e){var t;e.done?u(e.value):(t=e.value,t instanceof n?t:new n((function(e){e(t)}))).then(i,a)}c((r=r.apply(e,t||[])).next())}))},o=this&&this.__generator||function(e,t){var n,r,u,o,i={label:0,sent:function(){if(1&u[0])throw u[1];return u[1]},trys:[],ops:[]};return o={next:a(0),throw:a(1),return:a(2)},"function"==typeof Symbol&&(o[Symbol.iterator]=function(){return this}),o;function a(o){return function(a){return function(o){if(n)throw new TypeError("Generator is already executing.");for(;i;)try{if(n=1,r&&(u=2&o[0]?r.return:o[0]?r.throw||((u=r.return)&&u.call(r),0):r.next)&&!(u=u.call(r,o[1])).done)return u;switch(r=0,u&&(o=[2&o[0],u.value]),o[0]){case 0:case 1:u=o;break;case 4:return i.label++,{value:o[1],done:!1};case 5:i.label++,r=o[1],o=[0];continue;case 7:o=i.ops.pop(),i.trys.pop();continue;default:if(!((u=(u=i.trys).length>0&&u[u.length-1])||6!==o[0]&&2!==o[0])){i=0;continue}if(3===o[0]&&(!u||o[1]>u[0]&&o[1]<u[3])){i.label=o[1];break}if(6===o[0]&&i.label<u[1]){i.label=u[1],u=o;break}if(u&&i.label<u[2]){i.label=u[2],i.ops.push(o);break}u[2]&&i.ops.pop(),i.trys.pop();continue}o=t.call(e,i)}catch(e){o=[6,e],r=0}finally{n=u=0}if(5&o[0])throw o[1];return{value:o[0]?o[1]:void 0,done:!0}}([o,a])}}};Object.defineProperty(t,"__esModule",{value:!0}),t.NuiProvider=void 0;var i=n(85893),a=n(92950),c=n(59735),s=n(10316);function l(e,t){var n=new AbortController,u=n.signal;return{abort:function(){return n.abort()},promise:fetch(e,r(r({},t),{signal:u}))}}function f(e,t,n){return["https://"+e+"/"+t,{method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(n)}]}t.NuiProvider=function(e){var t=e.resource,n=e.children,d=e.timeout,v=a.useRef(t||""),p=a.useRef(d||1e4),b=function(e){var t=e.data,n=t.app,r=t.method,u=t.data;n&&r&&window.dispatchEvent(new MessageEvent(s.eventNameFactory(n,r),{data:u}))};a.useEffect((function(){return window.addEventListener("message",b),function(){return window.removeEventListener("message",b)}}),[]);var h=a.useCallback((function(e,t){return void 0===t&&(t={}),u(void 0,void 0,void 0,(function(){return o(this,(function(n){return[2,fetch.apply(void 0,f(v.current,e,t))]}))}))}),[]),y=a.useCallback((function(e,t){return void 0===t&&(t={}),l.apply(void 0,f(v.current,e,t))}),[]);return i.jsx(c.NuiContext.Provider,r({value:{send:h,sendAbortable:y,resource:v.current,callbackTimeout:p.current}},{children:n}),void 0)}},11937:function(e,t,n){var r=this&&this.__assign||function(){return r=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var u in t=arguments[n])Object.prototype.hasOwnProperty.call(t,u)&&(e[u]=t[u]);return e},r.apply(this,arguments)},u=this&&this.__awaiter||function(e,t,n,r){return new(n||(n=Promise))((function(u,o){function i(e){try{c(r.next(e))}catch(e){o(e)}}function a(e){try{c(r.throw(e))}catch(e){o(e)}}function c(e){var t;e.done?u(e.value):(t=e.value,t instanceof n?t:new n((function(e){e(t)}))).then(i,a)}c((r=r.apply(e,t||[])).next())}))},o=this&&this.__generator||function(e,t){var n,r,u,o,i={label:0,sent:function(){if(1&u[0])throw u[1];return u[1]},trys:[],ops:[]};return o={next:a(0),throw:a(1),return:a(2)},"function"==typeof Symbol&&(o[Symbol.iterator]=function(){return this}),o;function a(o){return function(a){return function(o){if(n)throw new TypeError("Generator is already executing.");for(;i;)try{if(n=1,r&&(u=2&o[0]?r.return:o[0]?r.throw||((u=r.return)&&u.call(r),0):r.next)&&!(u=u.call(r,o[1])).done)return u;switch(r=0,u&&(o=[2&o[0],u.value]),o[0]){case 0:case 1:u=o;break;case 4:return i.label++,{value:o[1],done:!1};case 5:i.label++,r=o[1],o=[0];continue;case 7:o=i.ops.pop(),i.trys.pop();continue;default:if(!((u=(u=i.trys).length>0&&u[u.length-1])||6!==o[0]&&2!==o[0])){i=0;continue}if(3===o[0]&&(!u||o[1]>u[0]&&o[1]<u[3])){i.label=o[1];break}if(6===o[0]&&i.label<u[1]){i.label=u[1],u=o;break}if(u&&i.label<u[2]){i.label=u[2],i.ops.push(o);break}u[2]&&i.ops.pop(),i.trys.pop();continue}o=t.call(e,i)}catch(e){o=[6,e],r=0}finally{n=u=0}if(5&o[0])throw o[1];return{value:o[0]?o[1]:void 0,done:!0}}([o,a])}}};Object.defineProperty(t,"__esModule",{value:!0}),t.NuiServiceProvider=void 0;var i=n(85893),a=n(92950),c=n(59735),s=n(10316);function l(e,t){var n=new AbortController,u=n.signal;return{abort:function(){return n.abort()},promise:fetch(e,r(r({},t),{signal:u}))}}function f(e,t,n){return["https://"+e+"/"+t,{method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(n)}]}t.NuiServiceProvider=function(e){var t=e.resource,n=e.children,d=e.timeout;console.warn("@ NuiServiceProvider is deprecated, please use NuiProvider instead");var v=a.useRef(),p=function(e){var t=e.data,n=t.app,r=t.method,u=t.data;n&&r&&window.dispatchEvent(new MessageEvent(s.eventNameFactory(n,r),{data:u}))};a.useEffect((function(){return window.addEventListener("message",p),function(){return window.removeEventListener("message",p)}}),[]);var b=a.useCallback((function(e,n){return void 0===n&&(n={}),u(void 0,void 0,void 0,(function(){return o(this,(function(r){return[2,fetch.apply(void 0,f(t,e,n))]}))}))}),[]),h=a.useCallback((function(e,n){return void 0===n&&(n={}),l.apply(void 0,f(t,e,n))}),[]);return i.jsx(c.NuiContext.Provider,r({value:{resource:v.current,send:b,sendAbortable:h,callbackTimeout:d||1e4}},{children:n}),void 0)}},10316:function(e,t){Object.defineProperty(t,"__esModule",{value:!0}),t.eventNameFactory=void 0,t.eventNameFactory=function(e,t){return e+":"+t}}}]);