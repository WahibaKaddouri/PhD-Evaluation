
/**
* Theme: SimpleAdmin Template
* Author: Coderthemes
* Morris Chart
*/

!function($) {
    "use strict";

    var MorrisCharts = function() {};

    //creates line chart
    MorrisCharts.prototype.createLineChart = function(element, data,type, ykeys, labels,unit,color,ymax,ymin) {
        Morris.Line({
          element: element,
          data: data,
            xkey:type,
            ykeys: ykeys,
            labels: labels,
            parseTime:false,
            hideHover:true,
            lineWidth:'6px',
            stacked: true,
            postUnits:unit,
            lineColors:color,
            ymin:ymax,
            ymax:ymin
        });
    },
    //creates area chart
    MorrisCharts.prototype.createAreaChart = function(element, pointSize, lineWidth, data, xkey, ykeys, labels, lineColors) {
        Morris.Area({
            element: element,
            pointSize: 0,
            lineWidth: 0,
            data: data,
            xkey: xkey,
            ykeys: ykeys,
            labels: labels,
            hideHover: 'auto',
            resize: true,
            gridLineColor: '#eef0f2',
            lineColors: lineColors
        });
    },
    //creates area chart with dotted
    MorrisCharts.prototype.createAreaChartDotted = function(element, pointSize, lineWidth, data, xkey, ykeys, labels, Pfillcolor, Pstockcolor, lineColors) {
        Morris.Area({
            element: element,
            pointSize: 3,
            lineWidth: 1,
            data: data,
            xkey: xkey,
            ykeys: ykeys,
            labels: labels,
            hideHover: 'auto',
            pointFillColors: Pfillcolor,
            pointStrokeColors: Pstockcolor,
            resize: true,
            smooth: false,
            gridLineColor: '#eef0f2',
            lineColors: lineColors
        });
    },
    //creates Bar chart
    MorrisCharts.prototype.createBarChart  = function(element, data, xkey, ykeys, labels, lineColors) {
        Morris.Bar({
            element: element,
            data: data,
            xkey: xkey,
            ykeys: ykeys,
            labels: labels,
            hideHover: 'auto',
            resize: true, //defaulted to true
            gridLineColor: '#eeeeee',
            barSizeRatio: 0.4,
            xLabelAngle: 35,
            barColors: lineColors
        });
    },
    //creates Stacked chart
    MorrisCharts.prototype.createStackedChart  = function(element, data, xkey, ykeys, labels, lineColors) {
        Morris.Bar({
            element: element,
            data: data,
            xkey: xkey,
            ykeys: ykeys,
            stacked: true,
            labels: labels,
            hideHover: 'auto',
            resize: true, //defaulted to true
            gridLineColor: '#eeeeee',
            barColors: lineColors
        });
    },
    //creates Donut chart
    MorrisCharts.prototype.createDonutChart = function(element, data, colors) {
        Morris.Donut({
            element: element,
            data: data,
            resize: true, //defaulted to true
            colors: colors
        });
    },
    MorrisCharts.prototype.init = function() {

        //create line chart
        var $data  = [

                {week:'Dimanche', "Taux de Sucre":'70'},
                {week:'Lundi', "Taux de Sucre":'75'},
                {week:'Mardi', "Taux de Sucre":'72'},
                {week:'Mercredi', "Taux de Sucre":'72'},
                {week:'Jeudi', "Taux de Sucre":'73'},
                {week:'Vendredi', "Taux de Sucre":'71'},
                {week:'Samedi', "Taux de Sucre":'71.5'}
            ];var $dataPoid  = [

                {year:'2011', "Poid":'60'},
                {year:'2012', "Poid":'62'},
                {year:'2013', "Poid":'61'},
                {year:'2014', "Poid":'63'},
                {year:'2015', "Poid":'65'},
                {year:'2016', "Poid":'68'},
                {year:'2017', "Poid":'66'}
            ];
        var $dataTemp  = [

                {week:'Dimanche', "Temperature":'37'},
                {week:'Lundi', "Temperature":'38'},
                {week:'Mardi', "Temperature":'37'},
                {week:'Mercredi', "Temperature":'40'},
                {week:'Jeudi', "Temperature":'38'},
                {week:'Vendredi', "Temperature":'37'},
                {week:'Samedi', "Temperature":'37'}
            ];var $dataTens  = [

                {week:'Dimanche', "Tension":'70'},
                {week:'Lundi', "Tension":'75'},
                {week:'Mardi', "Tension":'72'},
                {week:'Mercredi', "Tension":'72'},
                {week:'Jeudi', "Tension":'73'},
                {week:'Vendredi', "Tension":'71'},
                {week:'Samedi', "Tension":'71.5'}
            ];
        this.createLineChart('morris-line-example', $data,'week', ['Taux de Sucre'],['Taux de Sucre'],' mg',['#124587', "#bdbdbd"],'60','80');
        this.createLineChart('morris-line-example-poid', $dataPoid,'year', ['Poid'],['Poid'],' Kg',['#654879', "#ebeff2"],'55','85');
        this.createLineChart('morris-line-example-temp', $dataTemp,'week', ['Temperature'],['Temperature'],' °',['#458bc4', '#3db9dc'],'30','45');
        this.createLineChart('morris-line-example-tens', $dataTens,'week', ['Tension'],['Tension'],' ',['#43a6dd', "#bdbdbd"],'60','80');

        //creating area chart
        var $areaData = [
            { y: 'Dimanche', a: 10},
            { y: 'Lundi', a: 75},
            { y: 'Mardi', a: 50 },
            { y: 'Mercredi', a: 75},
            { y: 'Jeudi', a: 50},
            { y: 'Vendredi', a: 75},
            { y: 'Samedi', a: 90}
        ];
        this.createAreaChart('morris-area-example', 0, 0, $areaData, 'y', ['a', 'b'], ['Series A', 'Series B'], ['#43a6dd', "#bdbdbd"]);

        //creating area chart with dotted
        var $areaDotData = [
            { y: '2009', a: 10, b: 20 },
            { y: '2010', a: 75,  b: 65 },
            { y: '2011', a: 50,  b: 40 },
            { y: '2012', a: 75,  b: 65 },
            { y: '2013', a: 50,  b: 40 },
            { y: '2014', a: 75,  b: 65 },
            { y: '2015', a: 90, b: 60 }
        ];
        this.createAreaChartDotted('morris-area-with-dotted', 0, 0, $areaDotData, 'y', ['a', 'b'], ['Series A', 'Series B'],['#ffffff'],['#999999'], ['#626773', "#bdbdbd"]);

        //creating bar chart
        var $barData  = [
            { y: '2009', a: 100, b: 90 , c: 40 },
            { y: '2010', a: 75,  b: 65 , c: 20 },
            { y: '2011', a: 50,  b: 40 , c: 50 },
            { y: '2012', a: 75,  b: 65 , c: 95 },
            { y: '2013', a: 50,  b: 40 , c: 22 },
            { y: '2014', a: 75,  b: 65 , c: 56 },
            { y: '2015', a: 100, b: 90 , c: 60 }
        ];
        this.createBarChart('morris-bar-example', $barData, 'y', ['a', 'b', 'c'], ['Series A', 'Series B', 'Series C'], ['#458bc4', '#3db9dc', "#ebeff2"]);

        //creating Stacked chart
        var $stckedData  = [
            { y: '2005', a: 45, b: 180 },
            { y: '2006', a: 75,  b: 65 },
            { y: '2007', a: 100, b: 90 },
            { y: '2008', a: 75,  b: 65 },
            { y: '2009', a: 100, b: 90 },
            { y: '2010', a: 75,  b: 65 },
            { y: '2011', a: 50,  b: 40 },
            { y: '2012', a: 75,  b: 65 },
            { y: '2013', a: 50,  b: 40 },
            { y: '2014', a: 75,  b: 65 },
            { y: '2015', a: 100, b: 90 }
        ];
        this.createStackedChart('morris-bar-stacked', $stckedData, 'y', ['a', 'b'], ['Series A', 'Series B'], ['#458bc4', '#ebeff2']);

        //creating donut chart
        var $donutData = [
                {label: "Electricity", value: 12},
                {label: "Financial", value: 30},
                {label: "Markets", value: 20}
            ];
        this.createDonutChart('morris-donut-example', $donutData, ['#458bc4','#ebeff2', '#3db9dc']);
    },
    //init
    $.MorrisCharts = new MorrisCharts, $.MorrisCharts.Constructor = MorrisCharts
}(window.jQuery),

//initializing 
function($) {
    "use strict";
    $.MorrisCharts.init();
}(window.jQuery);