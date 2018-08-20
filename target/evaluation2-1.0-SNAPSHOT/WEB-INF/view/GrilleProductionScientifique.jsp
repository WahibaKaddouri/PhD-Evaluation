<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Grille: Production</title>
    <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/slick.grid.css" />" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/controls/slick.pager.css" />" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/css/smoothness/jquery-ui-1.8.16.custom.css" />" type="text/css"/>
    <link rel="stylesheet" href="/resources/SlackGrid/examples/examples.css" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/controls/slick.columnpicker.css" />" type="text/css"/>
    <style>
        .cell-title {
            font-weight: bold;
        }
        .cell-effort-driven {
            text-align: center;
        }
        .cell-selection {
            border-right-color: silver;
            border-right-style: solid;
            background: #f5f5f5;
            color: gray;
            text-align: right;
            font-size: 10px;
        }
        .slick-row.selected .cell-selection {
            background-color: transparent; /* show default selected row background */
        }
    </style>
</head>
<body>
<div style="position:relative">
    <div style="width:600px;">
        <div class="grid-header" style="width:100%">
            <label>Production Scientifique</label>
            <span style="float:right" class="ui-icon ui-icon-search" title="Toggle search panel"
                  onclick="toggleFilterRow()"></span>
        </div>
        <div id="myGrid" style="width:100%;height:500px;"></div>

        <div id="pager" style="width:100%;height:20px;"></div>
    </div>
    <div class="options-panel">
        <h2>Fiche du candidat:</h2>
        <ul>
            <li>Nom : <c:out value="${ens.nom}"></c:out></li>
            <li>Prenom: <c:out value="${ens.prenom}"></c:out></li>
            <li>Etablissement: <c:out value="${ens.id_etablissement}"></c:out></li>
            <li>Date d'obtention du doctorat: <c:out value="${ens.date_doctorat}"></c:out></li>
            <li>Date d'installation dans le grade: <c:out value="${ens.date_installation_grade}"></c:out></li>
        </ul>

        <h2>Cordonnees:</h2>
        <li>Num Tel. : <c:out value="${ens.num_tel}"></c:out></li>
        <li>Email: <c:out value="${ens.email}"></c:out></li>

        <h2>Liens utiles:</h2>
        <ul>
            <li><A href="" target="_sourcewindow"> Bibliotheque des publications universitaires</a></li>
        </ul>
    </div>

</div>

<div id="inlineFilterPanel" style="display:none;background:#dddddd;padding:3px;color:black;">
    Show tasks with title including <input type="text" id="txtSearch2">
    and % at least &nbsp;
    <div style="width:100px;display:inline-block;" id="pcSlider2"></div>
</div>

<script src="<c:url value="/resources/SlackGrid/lib/firebugx.js" />"></script>

<script src="<c:url value="/resources/SlackGrid/lib/jquery-1.7.min.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/lib/jquery-ui-1.8.16.custom.min.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/lib/jquery.event.drag-2.2.js" />"></script>

<script src="<c:url value="/resources/SlackGrid/slick.core.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/slick.formatters.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/slick.editors.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/plugins/slick.rowselectionmodel.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/slick.grid.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/slick.dataview.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/controls/slick.pager.js" />"></script>
<script src="<c:url value="/resources/SlackGrid/controls/slick.columnpicker.js" />"></script>

<script>
    var dataView;
    var grid;
    var data = [];

    var d1 = {"id": "1", "nom":"C-1 Publications internationales (article)", "formule":"5 pts /art",
        "bareme":"5", "info_supp": "0", "pointSousVar": "0"};
    var d2 = {"id": "2", "nom":"C-1 Publications internationales (ouvrage)", "formule":"5 pts/ouv",
        "bareme":"5", "info_supp": "0", "pointSousVar": "0"};
    var d3 = {"id": "3", "nom":"C-1 Publications internationales (acte et proceding)", "formule":" 4pts/ape",
        "bareme":"4", "info_supp": "0", "pointSousVar": "0"};
    var d4 = {"id": "4", "nom":"C-2 publications nationales (article)", "formule":"4 pts/art",
        "bareme":"4", "info_supp": "0", "pointSousVar": "0"};
    var d5 = {"id": "5", "nom":"C-2 publications nationales(ouvrage)", "formule":"3pts/ouv",
        "bareme":"3", "info_supp": "0", "pointSousVar": "0"};
    var d6 = {"id": "6", "nom":"C-2 publications nationales (acte et proceding)", "formule":"3pts/ape",
        "bareme":"3", "info_supp": "0", "pointSousVar": "0"};
    var d7 = {"id": "7", "nom":"C-3 Communication : internationales", "formule":"2 pts",
        "bareme":"2", "info_supp": "0", "pointSousVar": "0"};
    var d8 = {"id": "8", "nom":"C-3 Communication : nationale", "formule":"1pts",
        "bareme":"1", "info_supp": "0", "pointSousVar": "0"};
    var d9 = {"id": "9", "nom":"C-4 Responsable ou membre d'un projet de recherche (CL)", "formule":"4 pts",
        "bareme":"4", "info_supp": "0", "pointSousVar": "0"};
    var d10 = {"id": "10", "nom":"C-4 Responsable ou membre d'un projet de recherche (CE)", "formule":"3pts",
        "bareme":"3", "info_supp": "0", "pointSousVar": "0"};
    var d11 = {"id": "11", "nom":"C-4 Responsable ou membre d'un projet de recherche (ME)", "formule":"2pts",
        "bareme":"2", "info_supp": "0", "pointSousVar": "0"};
    var d12 = {"id": "12", "nom":"C-5 Animation scientifique", "formule":" 3pts",
        "bareme":"3", "info_supp": "0", "pointSousVar": "0"};
    data.push(d1);
    data.push(d2);
    data.push(d3);
    data.push(d4);
    data.push(d5);
    data.push(d6);
    data.push(d7);
    data.push(d8);
    data.push(d9);
    data.push(d10);
    data.push(d11);
    data.push(d12);
    //data = JSON.stringify({'data':data});
    var columns = [

        {id: "nom", name: "Nom", field: "nom", width: 120, minWidth: 120, cssClass: "cell-title", editor: Slick.Editors.Text, validator: requiredFieldValidator, sortable: false},
        {id: "formule", name: "Formule", field: "formule", editor: Slick.Editors.Text, sortable: false},
        {id: "bareme", name: "Bareme", field: "bareme", editor: Slick.Editors.Integer, sortable: true},
        {id: "info_supp", name: "Information Supp.", field: "info_supp", editor: Slick.Editors.Text, sortable: false},
        {id: "pointSousVar", name: "Points obtenus", field: "pointSousVar", editor: Slick.Editors.Integer, sortable: true},

    ];
    var options = {
        editable: true,
        enableAddRow: true,
        enableCellNavigation: true,
        asyncEditorLoading: true,
        forceFitColumns: false,
        topPanelHeight: 25
    };
    var sortcol = "title";
    var sortdir = 1;
    var percentCompleteThreshold = 0;
    var searchString = "";
    function requiredFieldValidator(value) {
        if (value == null || value == undefined || !value.length) {
            return {valid: false, msg: "This is a required field"};
        }
        else {
            return {valid: true, msg: null};
        }
    }
    function myFilter(item, args) {
        if (item["percentComplete"] < args.percentCompleteThreshold) {
            return false;
        }
        if (args.searchString != "" && item["title"].indexOf(args.searchString) == -1) {
            return false;
        }
        return true;
    }
    function percentCompleteSort(a, b) {
        return a["percentComplete"] - b["percentComplete"];
    }
    function comparer(a, b) {
        var x = a[sortcol], y = b[sortcol];
        return (x == y ? 0 : (x > y ? 1 : -1));
    }
    function toggleFilterRow() {
        grid.setTopPanelVisibility(!grid.getOptions().showTopPanel);
    }
    $(".grid-header .ui-icon")
        .addClass("ui-state-default ui-corner-all")
        .mouseover(function (e) {
            $(e.target).addClass("ui-state-hover")
        })
        .mouseout(function (e) {
            $(e.target).removeClass("ui-state-hover")
        });

    dataView = new Slick.Data.DataView({ inlineFilters: true });
    grid = new Slick.Grid("#myGrid", dataView, columns, options);
    grid.setSelectionModel(new Slick.RowSelectionModel());
    var pager = new Slick.Controls.Pager(dataView, grid, $("#pager"));
    var columnpicker = new Slick.Controls.ColumnPicker(columns, grid, options);
    // move the filter panel defined in a hidden div into grid top panel
    $("#inlineFilterPanel")
        .appendTo(grid.getTopPanel())
        .show();
    grid.onCellChange.subscribe(function (e, args) {
        args.item.pointSousVar = args.item.bareme * args.item.info_supp;
        dataView.updateItem(args.item.id, args.item);
    });
    grid.onAddNewRow.subscribe(function (e, args) {
        var item = {"id": (Math.round(Math.random() * 10000))};
        $.extend(item, args.item);
        dataView.addItem(item);
    });
    grid.onKeyDown.subscribe(function (e) {
        // select all rows on ctrl-a
        if (e.which != 65 || !e.ctrlKey) {
            return false;
        }
        var rows = [];
        for (var i = 0; i < dataView.getLength(); i++) {
            rows.push(i);
        }
        grid.setSelectedRows(rows);
        e.preventDefault();
    });
    grid.onSort.subscribe(function (e, args) {
        sortdir = args.sortAsc ? 1 : -1;
        sortcol = args.sortCol.field;
        if ($.browser.msie && $.browser.version <= 8) {
            // using temporary Object.prototype.toString override
            // more limited and does lexicographic sort only by default, but can be much faster
            var percentCompleteValueFn = function () {
                var val = this["percentComplete"];
                if (val < 10) {
                    return "00" + val;
                } else if (val < 100) {
                    return "0" + val;
                } else {
                    return val;
                }
            };
            // use numeric sort of % and lexicographic for everything else
            dataView.fastSort((sortcol == "percentComplete") ? percentCompleteValueFn : sortcol, args.sortAsc);
        } else {
            // using native sort with comparer
            // preferred method but can be very slow in IE with huge datasets
            dataView.sort(comparer, args.sortAsc);
        }
    });
    // wire up model events to drive the grid
    dataView.onRowCountChanged.subscribe(function (e, args) {
        grid.updateRowCount();
        grid.render();
    });
    dataView.onRowsChanged.subscribe(function (e, args) {
        grid.invalidateRows(args.rows);
        grid.render();
    });
    dataView.onPagingInfoChanged.subscribe(function (e, pagingInfo) {
        var isLastPage = pagingInfo.pageNum == pagingInfo.totalPages - 1;
        var enableAddRow = isLastPage || pagingInfo.pageSize == 0;
        var options = grid.getOptions();
        if (options.enableAddRow != enableAddRow) {
            grid.setOptions({enableAddRow: enableAddRow});
        }
    });
    var h_runfilters = null;
    // wire up the slider to apply the filter to the model
    $("#pcSlider,#pcSlider2").slider({
        "range": "min",
        "slide": function (event, ui) {
            Slick.GlobalEditorLock.cancelCurrentEdit();
            if (percentCompleteThreshold != ui.value) {
                window.clearTimeout(h_runfilters);
                h_runfilters = window.setTimeout(updateFilter, 10);
                percentCompleteThreshold = ui.value;
            }
        }
    });
    // wire up the search textbox to apply the filter to the model
    $("#txtSearch,#txtSearch2").keyup(function (e) {
        Slick.GlobalEditorLock.cancelCurrentEdit();
        // clear on Esc
        if (e.which == 27) {
            this.value = "";
        }
        searchString = this.value;
        updateFilter();
    });
    function updateFilter() {
        dataView.setFilterArgs({
            percentCompleteThreshold: percentCompleteThreshold,
            searchString: searchString
        });
        dataView.refresh();
    }
    $("#btnSelectRows").click(function () {
        if (!Slick.GlobalEditorLock.commitCurrentEdit()) {
            return;
        }
        var rows = [];
        for (var i = 0; i < 10 && i < dataView.getLength(); i++) {
            rows.push(i);
        }
        grid.setSelectedRows(rows);
    });
    $("#BtnSave1").click(function () {
        $.ajax({
            type : 'POST',
            contentType: "application/json; charset=utf-8",
            url : '/CUN/Evaluation/${ens.getId()}',
            dataType : "json",
            data : JSON.stringify(data),
            success : function(data) {
                console.log("SUCCESS");
            },
            error : function(e) {
                console.log("ERROR: ", e);
            },
            done : function(e) {
                console.log("DONE");
            }
        });

    })
    // initialize the model after all the events have been hooked up
    dataView.beginUpdate();
    dataView.setItems(data);
    dataView.setFilterArgs({
        percentCompleteThreshold: percentCompleteThreshold,
        searchString: searchString
    });
    dataView.setFilter(myFilter);
    dataView.endUpdate();
    // if you don't want the items that are not visible (due to being filtered out
    // or being on a different page) to stay selected, pass 'false' to the second arg
    dataView.syncGridSelection(grid, true);
    $("#gridContainer").resizable();
    $(document).ready(function () {
        $(function() {
            $("form").submit(
                function() {
                    //  var myJsonString = JSON.stringify(data);
                    //  var dataString = $("input[name='data']").val(myJsonString);
                    $.ajax({
                        type : 'POST',
                        contentType: "application/json; charset=utf-8",
                        url : '/CUN/Evaluation/ProductionScientifiques/${ens.getId()}',
                        dataType : "json",
                        data : JSON.stringify(data),
                        success : function(data) {
                            console.log("SUCCESS");
                        },
                        error : function(e) {
                            console.log("ERROR: ", e);
                        },
                        done : function(e) {
                            console.log("DONE");
                        }
                    });
                }
            );
        });
    })


</script>
<br>
<br>
<br>
<form action="?" method="POST">
    <input type="submit" value="Sauvegarder">
    <input type="hidden" name="data" id ="merde" value="">
</form>
</body>
</html>