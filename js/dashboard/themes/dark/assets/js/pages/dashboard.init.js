!
    function (e) {
        "use strict";
 
    var a = function ()
    { this.$realData = [] };
    a.prototype.createBarChart = function (e, a, r, o, t, i)
    {
        Morris.Bar({
            element: e,
            data: a,
            xkey: r,
            ykeys: o,
            labels: t,
            hideHover: "auto",
            resize: !0,
            gridLineColor: "#323a46",
            barSizeRatio: .2, gridTextColor: "#98a6ad",
            barColors: i
        })
    },
    a.prototype.createLineChart = function (e, a, r, o, t, i, l, n, s)
    {
       
        Morris.Line({
            element: e, data: a, xkey: r, ykeys: o, labels: t,
            fillOpacity: i, pointFillColors: l, pointStrokeColors: n,
            behaveLikeLine: !0, gridLineColor: "#323a46", hideHover: "auto",
            resize: !0, pointSize: 0, gridTextColor: "#98a6ad", lineColors: s,
            parseTime: false,
            resize: true,
            pointSize:3,
            xLabelAngle: 15
        })
        },
        a.prototype.createDonutChart = function (e, a, r)
        {
            Morris.Donut({
                element: e, data: a, resize: !0,
                colors: r, backgroundColor: "#323a46", labelColor: "#fff"
            })
        },
        a.prototype.init = function () {
     
        this.createBarChart("morris-bar-example2",
            [{ y: "2010", a: 75 }, { y: "2011", a: 42 }, { y: "2012", a: 75 }, { y: "2013", a: 38 }, { y: "2014", a: 19 }, { y: "2015", a: 93 }], "y", ["a"], ["Statistics"], ["#188ae2"]);

        this.createDonutChart("morris-donut-example", [{ label: "Download Sales", value: 12 }, { label: "In-Store Sales", value: 30 }, { label: "Mail-Order Sales", value: 20 }], ["#ff8acc", "#5b69bc", "#35b8e0"])
        },
        e.Dashboard1 = new a, e.Dashboard1.Constructor = a
    }(window.jQuery), function (e) { "use strict";window.jQuery.Dashboard1.init() }();

function DrawCharts() {
    $('div svg text').css({
        "font-family": "'Assistant' !important",
        "padding": "3%"
    }); DrawLine(); DrawRam(); DrawHdd(); DrawNet();};
function DrawLine() {
    var ItemArray = [];
    $.ajax({
        type: "POST",
        url: "Defaultt.aspx/GetDataCPUChart",
        contentType: "application/json; charset=utf-8",
        data: {},
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var datas = xml.find("Data");
            $(datas).each(function () {
                ItemArray.push({
                    a: $(this).find("L").text(),
                    y: $(this).find("T").text()
                });
            });
            $("#morris-line-example").empty();
            Morris.Line({
                element: "morris-line-example", data: ItemArray, xkey: "y", ykeys: ["a"], labels: ["CPU"],
                fillOpacity: ["0.9"], pointFillColors: ["#ffffff"], pointStrokeColors: ["#999999"],
                behaveLikeLine: !0, gridLineColor: "#323a46", hideHover: "auto",
                resize: !0, pointSize: 0, gridTextColor: "#000", lineColors: ["#f05050", "#188ae2"],
                parseTime: false,
                resize: true,
                pointSize: 3,
                xLabelAngle: 15
            });
          

          
        },
        error: function (xhr, status) {
            alert("An error occurred: " + status);
        }
    });
}



function DrawRam() { 
    var ItemArrayRam = []; RamMAxVal = "";
    $.ajax({
        type: "POST",
        url: "Defaultt.aspx/GetDataRamChart",
        contentType: "application/json; charset=utf-8",
        data: {},
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var datas = xml.find("Data");
            $(datas).each(function () {
                ItemArrayRam.push({
                    a: $(this).find("L").text(),
                    y: $(this).find("T").text()
                });
                RamMAxVal = $(this).find("M").text();
            });
          
            console.log(RamMAxVal);
            $("#morris-line-ram").empty();
            Morris.Line({
                element: "morris-line-ram", data: ItemArrayRam, xkey: "y", ykeys: ["a"], labels: ["Ram"],
                fillOpacity: ["0.9"], pointFillColors: ["#ffffff"], pointStrokeColors: ["#999999"],
                behaveLikeLine: !0, gridLineColor: "#323a46", hideHover: "auto",
                resize: !0, pointSize: 0, gridTextColor: "#000", lineColors: ["#ffbd4a", "#188ae2"],
                parseTime: false,
                ymax: RamMAxVal,
                resize: true,
                pointSize: 3,
                xLabelAngle: 15
            });



        },
        error: function (xhr, status) {
            alert("An error occurred: " + status);
        }
    });
}


function DrawHdd() {
    var ItemArrayHdd = [];
    HddMAxVal = "";
    $.ajax({
        type: "POST",
        url: "Defaultt.aspx/GetDataHddChart",
        contentType: "application/json; charset=utf-8",
        data: {},
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var datas = xml.find("Data");
            $(datas).each(function () {
                ItemArrayHdd.push({
                    a: $(this).find("L").text(),
                    y: $(this).find("T").text()
                });
                HddMAxVal = $(this).find("M").text();
            });
         
            console.log(HddMAxVal);
            $("#morris-line-hdd").empty();
            Morris.Line({
                element: "morris-line-hdd", data: ItemArrayHdd, xkey: "y", ykeys: ["a"], labels: ["HDD"],
                fillOpacity: ["0.9"], pointFillColors: ["#ffffff"], pointStrokeColors: ["#999999"],
                behaveLikeLine: !0, gridLineColor: "#323a46", hideHover: "auto",
                resize: !0, pointSize: 0, gridTextColor: "#000", lineColors: ["#fe89cb", "#188ae2"],
                parseTime: false,
                ymax: HddMAxVal,
                resize: true,
                pointSize: 3,
                xLabelAngle: 15
            });



        },
        error: function (xhr, status) {
            alert("An error occurred: " + status);
        }
    });
}

function DrawNet() {
    
    var ItemArrayNet = []; var mention = "";
    $.ajax({
        type: "POST",
        url: "Defaultt.aspx/GetDataNetChart",
        contentType: "application/json; charset=utf-8",
        data: {},
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var datas = xml.find("Data");
            $(datas).each(function () {
                ItemArrayNet.push({
                    a: $(this).find("L").text(),
                    b: $(this).find("L1").text(),
                    y: $(this).find("T").text()
                });
                mention = $(this).find("M").text();
            });
            $("#morris-line-net").empty();
            $('#legend').html("");
            var chart =  Morris.Line({
                element: "morris-line-net", data: ItemArrayNet, xkey: "y", ykeys: ["a", "b"], labels: ["Qəbul edilən", "Göndərilən"],
                fillOpacity: ["0.9"], pointFillColors: ["#ffffff"], pointStrokeColors: ["#999999"],
                behaveLikeLine: !0, gridLineColor: "#323a46", hideHover: "auto",
                resize: !0, pointSize: 0, gridTextColor: "#000", lineColors: ["#10c369", "#188ae2"],
                parseTime: false,
                resize: true,
                pointSize: 3,
                xLabelAngle: 60,
                yLabelFormat: function (y) {
                    return y + mention;
                }
            });

            for (var i = 0; i < chart.options.labels.length; i++) {
                var legendItem = $('<span></span>').text(chart.options.labels[i]).prepend('<i>&nbsp;</i>');
                legendItem.find('i').css('backgroundColor', chart.options.lineColors[i]);
                $('#legend').append(legendItem);
            }

        },
        error: function (xhr, status) {
            alert("An error occurred: " + status);
        }
    });
}


function DrawINVChart() {

    var ItemArrayInv = [];
    var ItemArrayInvDonut = [];
    $.ajax({
        type: "POST",
        url: "invstatistic.aspx/GetDataINVChart",
        contentType: "application/json; charset=utf-8",
        data: {},
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var datas = xml.find("Data");
            $(datas).each(function () {
                ItemArrayInv.push({
                    a: $(this).find("X").text(),
                    y: $(this).find("Y").text()
                });
                ItemArrayInvDonut.push({
                    value: $(this).find("X").text(),
                    label: $(this).find("Y").text()
                });
            });
            $("#morris-bar-example").empty();

            Morris.Bar({
                element: "morris-bar-example", data: ItemArrayInv, xkey: "y", ykeys: ["a"], labels: ["Net"],
                hideHover: "auto",
                resize: !0,
                gridLineColor: "#323a46",
                barSizeRatio: .2, gridTextColor: "#98a6ad",
                barColors: ["#188ae2"],
                parseTime: false,
                resize: true,
                pointSize: 3,
                xLabelAngle: 15
            });
            $("#morris-donut-example").empty();
            var color_array = ["#3090C7", "#FFFFC2", "#E77471", "#FBBBB9", "#F52887", "#FFF8DC", '#E0F7FA',
                '#B2EBF2','#80DEEA','#4DD0E1','#26C6DA','#00BCD4','#00ACC1','#0097A7',
                '#00838F', '#006064', '#0BA462','#39B580','#67C69D',
                '#95D7BB', "#C38EC7", "#FFD801", "#7D0552",'#03658C', '#7CA69E', '#F2594A', '#F28C4B', '#7E6F6A', '#36AFB2', '#9c6db2', '#d24a67', '#89a958', '#00739a', '#BDBDBD'];
            window.donutChart = Morris.Donut({
                element: "morris-donut-example",
                resize: true,
                redraw: true,
                data: ItemArrayInvDonut,
                colors: color_array,
                backgroundColor: "#323a46", labelColor: "#000",
                formatter: function (x) { return x + "%" }
            });
            //browsersChart.options.data.forEach(function (label, i) {
            //    var legendItem = $('<span></span>').text(label['label']).prepend('<i>&nbsp;</i>');
            //    legendItem.find('i').css('backgroundColor', browsersChart.options.colors[i]);
            //    $('#legend').append(legendItem)
            //});
            window.donutChart.redraw();
        },
        error: function (xhr, status) {
            alert("An error occurred: " + status);
        }
    });
}

