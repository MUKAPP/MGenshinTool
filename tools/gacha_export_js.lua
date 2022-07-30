local ExcelJSUrl="file://"..activity.getLuaDir("tools/exceljs.min.js")
local FileSaverUrl="file://"..activity.getLuaDir("tools/FileSaver.min.js")

--print(ExcelJSUrl)

return[=[
var x=document.getElementsByClassName("mihoyo_landscape");
for (var i = 0; i<x.length;i++) {
    x[i].style.display="none";
};

var thisNode = document.getElementById( "mihoyo_landscape" );

if ( thisNode != null && thisNode.parentElement != null ) {undefined
    thisNode.parentElement.removeChild( thisNode );
};

lua.execute("1|准备中…");
(async function () {
    //替换指定传入参数的值
    //win为某窗体,paramName为参数,paramValue为新值,forceAdding为不存在该参数时是否也指定
    function replaceParamVal(win, paramName, paramValue, forceAdding) {
        var search = win.location.search + "";
        if (!search) {
            //没有任何查询参数,则直接附加
            return forceAdding ?
                win.location + "?" + paramName + "=" + paramValue :
                win.location + "";
        } else {
            var q = (win.location + "").split("?")[0];
            var list = search.replace("?", "").split("&");
            var hasIn = false;
            for (var i = 0; i < list.length; i++) {
                var listI = list[i];
                if (
                    listI.split("=")[0].toLowerCase() == paramName.toLowerCase()
                ) {
                    //指定参数
                    q = q + (i == 0 ? "?" : "&");
                    hasIn = true;

                    if (listI.indexOf("=") == -1) {
                        //形式:"参数"
                        q = q + listI + "=" + paramValue;
                    } else if (!listI.split("=")[1].length) {
                        //形式："参数="
                        q = q + listI + paramValue;
                    } else {
                        //形式:"参数=值"
                        q = q + paramName + "=" + paramValue;
                    }
                } else {
                    //其它参数
                    q = q + (i == 0 ? "?" : "&");
                    q = q + listI;
                }
            }

            if (!hasIn && forceAdding) {
                //不存在,但必须要添加时
                q = q + "&" + paramName + "=" + paramValue;
            }

            return q;
        }
    }
    // 强制使用zh-cn
    //window.history.pushState('Object', 'Title', replaceParamVal(window.parent,'lang','zh-cn',true)+"#/log");
    const zhsearch = replaceParamVal(window.parent, "lang", "zh-cn", true);
    // constant
    // library from cdn
    //const ExcelJSUrl = "https://pan.mukapp.top/exceljs.min.js";
    //const FileSaverUrl = "https://pan.mukapp.top/FileSaver.min.js";
    const ExcelJSUrl = ""
    const FileSaverUrl = ""
    // mihoyo api 兼容外服
    apiDomain = 'https://hk4e-api.mihoyo.com'
    if (window.location.host.includes('webstatic-sea') || window.location.host.includes('hk4e-api-os')) {
        apiDomain = 'https://hk4e-api-os.hoyoverse.com'
      } else {
        apiDomain = 'https://hk4e-api.mihoyo.com'
    }
    //const GachaTypesUrl = `${apiDomain}/event/gacha_info/api/getConfigList${location.search}`;
    //const GachaLogBaseUrl = `${apiDomain}/event/gacha_info/api/getGachaLog${location.search}`;
    const GachaTypesUrl = `${apiDomain}/event/gacha_info/api/getConfigList?${
        zhsearch.split("?")[1]
    }`;
    const GachaLogBaseUrl = `${apiDomain}/event/gacha_info/api/getGachaLog?${
        zhsearch.split("?")[1]
    }`;

    // function
    function loadScript(src) {
        return new Promise((resolve, reject) => {
            if (document.querySelector(`script[src="${src}"]`)) {
                resolve();
            }
            const s = document.createElement("script");
            s.src = src;
            s.onload = resolve;
            s.onerror = reject;
            document.body.append(s);
        });
    }

    function sleep(second) {
        return new Promise((r) => setTimeout(() => r(), second * 1000));
    }

    function getGachaLog(key, page, end_id) {
        return fetch(
                GachaLogBaseUrl +
                `&gacha_type=${key}` +
                `&page=${page}` +
                `&size=${20}` +
                `&end_id=${end_id}`
            )
            .then((res) => res.json())
            .then((data) => data);
    }

    async function getGachaLogs(name, key) {
        let page = 1,
            data = [],
            res = [];
        let end_id = "0";
        let list = [];
        do {
            console.log(`正在获取${name}第${page}页`);
            lua.execute(`1|正在获取${name}第${page}页`);
            res = await getGachaLog(key, page, end_id);
            await sleep(0.3);
            end_id = res.data.list.length > 0 ? res.data.list[res.data.list.length - 1].id : 0;
            list = res.data.list;
            data.push(...list);
            page += 1;
        } while (list.length > 0);
        return data;
    }

    function pad(num) {
        return `${num}`.padStart(2, "0");
    }

    function getTimeString() {
        const d = new Date();
        const YYYY = d.getFullYear();
        const MM = pad(d.getMonth() + 1);
        const DD = pad(d.getDate());
        const HH = pad(d.getHours());
        const mm = pad(d.getMinutes());
        const ss = pad(d.getSeconds());
        return `${YYYY}${MM}${DD}_${HH}${mm}${ss}`;
    }

    // processing
    //console.log("start load script");
    //lua.execute("1|正在加载JS(1/2)");
    //await loadScript(ExcelJSUrl);
    //console.log("load exceljs success");
    //lua.execute("1|正在加载JS(2/2)");
    //await loadScript(FileSaverUrl);
    //console.log("load filesaver success");
    // const data = await fetch(ItemDataUrl).then((res) => res.json());
    // console.log("获取物品列表成功");
    lua.execute("1|开始获取抽卡活动类型…");
    const gachaTypes = await fetch(GachaTypesUrl)
        .then((res) => res.json())
        .then((data) => data.data.gacha_type_list);
    console.log("获取抽卡活动类型成功");
    lua.execute("1|获取抽卡活动类型成功");

    console.log("开始获取抽卡记录");
    lua.execute("1|开始获取抽卡记录");
    const workbook = new ExcelJS.Workbook();

	var packJson = {};
	var packJson2 = [];

    for (const type of gachaTypes) {
        const sheet = workbook.addWorksheet(type.name, {
            views: [{
                state: "frozen",
                ySplit: 1
            }],
        });
        sheet.columns = [{
                header: "时间",
                key: "time",
                width: 24
            },
            {
                header: "名称",
                key: "name",
                width: 14
            },
            {
                header: "类别",
                key: "type",
                width: 8
            },
            {
                header: "星级",
                key: "rank",
                width: 8
            },
            {
                header: "总次数",
                key: "idx",
                width: 8
            },
            {
                header: "保底内",
                key: "pdx",
                width: 8
            },
        ];
        // get gacha logs
        var packJson2a=await getGachaLogs(type.name, type.key)
        packJson2.push.apply(packJson2,packJson2a)
        const logs = (packJson2a).map((item) => {
            return [
                item.time,
                item.name,
                item.item_type,
                parseInt(item.rank_type),
            ];
        });
        logs.reverse();
        idx = 0;
        pdx = 0;
        for (log of logs) {
            idx += 1;
            pdx += 1;
            log.push(idx, pdx);
            if (log[3] === 5) {
                pdx = 0;
            }
        }
        // console.log(logs);
		packJson[type.key] = {
			'name': type.name,
			'content': logs
		};
        sheet.addRows(logs);
        // set xlsx hearer style
        ["A", "B", "C", "D", "E", "F"].forEach((v) => {
            sheet.getCell(`${v}1`).border = {
                top: {
                    style: "thin",
                    color: {
                        argb: "ffc4c2bf"
                    }
                },
                left: {
                    style: "thin",
                    color: {
                        argb: "ffc4c2bf"
                    }
                },
                bottom: {
                    style: "thin",
                    color: {
                        argb: "ffc4c2bf"
                    }
                },
                right: {
                    style: "thin",
                    color: {
                        argb: "ffc4c2bf"
                    }
                },
            };
            sheet.getCell(`${v}1`).fill = {
                type: "pattern",
                pattern: "solid",
                fgColor: {
                    argb: "ffdbd7d3"
                },
            };
            sheet.getCell(`${v}1`).font = {
                name: "微软雅黑",
                color: {
                    argb: "ff757575"
                },
                bold: true,
            };
        });
        // set xlsx cell style
        logs.forEach((v, i) => {
            ["A", "B", "C", "D", "E", "F"].forEach((c) => {
                sheet.getCell(`${c}${i + 2}`).border = {
                    top: {
                        style: "thin",
                        color: {
                            argb: "ffc4c2bf"
                        }
                    },
                    left: {
                        style: "thin",
                        color: {
                            argb: "ffc4c2bf"
                        }
                    },
                    bottom: {
                        style: "thin",
                        color: {
                            argb: "ffc4c2bf"
                        }
                    },
                    right: {
                        style: "thin",
                        color: {
                            argb: "ffc4c2bf"
                        }
                    },
                };
                sheet.getCell(`${c}${i + 2}`).fill = {
                    type: "pattern",
                    pattern: "solid",
                    fgColor: {
                        argb: "ffebebeb"
                    },
                };
                // rare rank background color
                const rankColor = {
                    3: "ff8e8e8e",
                    4: "ffa256e1",
                    5: "ffbd6932",
                };
                sheet.getCell(`${c}${i + 2}`).font = {
                    name: "微软雅黑",
                    color: {
                        argb: rankColor[v[3]]
                    },
                    bold: v[3] != "3",
                };
            });
        });
    }
    console.log("获取抽卡记录结束");
    lua.execute("1|获取抽卡记录结束");
	var packJsonStr = JSON.stringify(packJson);
	var packJsonStr2 = JSON.stringify(packJson2);

    console.log("正在导出");
    lua.execute("1|正在导出");

    const buffer = await workbook.xlsx.writeBuffer();
    const timestamp = getTimeString();
 
    //lua.execute(buffer);

	console.log(packJsonStr);
    lua.execute('2|'+packJsonStr);
    lua.execute('5|'+packJsonStr2);

    saveAs(
        new Blob([buffer], {
            type: "application/octet-stream"
        }),
        `原神抽卡记录导出_${timestamp}.xlsx`
    );

    lua.execute('3|ok');

})();
]=]
