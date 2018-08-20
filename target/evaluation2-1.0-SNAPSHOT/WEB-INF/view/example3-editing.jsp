<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>SlickGrid example 3: Editing</title>
  <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/slick.grid.css" />" type="text/css"/>
  <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/css/smoothness/jquery-ui-1.8.16.custom.css"/>" type="text/css"/>
  <link rel="stylesheet" href="<c:url value="/resources/SlackGrid/examples/examples.css"/>" type="text/css"/>
  <style>
    .cell-title {
      font-weight: bold;
    }

    .cell-effort-driven {
      text-align: center;
    }
  </style>
</head>
<body>
<div style="position:relative">
  <div style="width:600px;">
    <div id="myGrid" style="width:100%;height:500px;"></div>
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

<script src="<c:url value="/resources/SlackGrid/lib/firebugx.js"/>"></script>

<script src="<c:url value="/resources/SlackGrid/lib/jquery-1.7.min.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/lib/jquery-ui-1.8.16.custom.min.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/lib/jquery.event.drag-2.2.js"/>"></script>

<script src="<c:url value="/resources/SlackGrid/slick.core.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/plugins/slick.cellrangedecorator.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/plugins/slick.cellrangeselector.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/plugins/slick.cellselectionmodel.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/slick.formatters.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/slick.editors.js"/>"></script>
<script src="<c:url value="/resources/SlackGrid/slick.grid.js"/>"></script>

<script>
  function requiredFieldValidator(value) {
    if (value == null || value == undefined || !value.length) {
      return {valid: false, msg: "This is a required field"};
    } else {
      return {valid: true, msg: null};
    }
  }

  var grid;
  var dataView;
  var data = [];
  var columns = [
      {id: "sousVar", name: "Sous variable", field: "sousVar", width: 100, editor: Slick.Editors.Text},
    {id: "variable", name: "Variable", field: "variable", width: 120, cssClass: "cell-title", editor: Slick.Editors.Text, validator: requiredFieldValidator},
    {id: "bareme", name: "Bareme", field: "bareme", editor: Slick.Editors.Text},
      {id: "note", name: "Notation", field: "note", editor: Slick.Editors.Text},
    {id: "%", name: "% ", field: "percentComplete", width: 80, resizable: false, formatter: Slick.Formatters.PercentCompleteBar, editor: Slick.Editors.PercentComplete},
      {id: "jury1", name: "Vote jury 1", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "effortDriven", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox},
    {id: "jury2", name: "Vote jury 2", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "effortDriven", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox},
      {id: "jury3", name: "Vote jury 3", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "effortDriven", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox},
      {id: "jury4", name: "Vote jury 4", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "effortDriven", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox}
  ];
  var options = {
    editable: true,
    enableAddRow: true,
    enableCellNavigation: true,
    asyncEditorLoading: false,
    autoEdit: false
  };

  $(function () {
      for (var i = 0; i < 2; i++) {
          var d = (data[i] = {});
          d["sousVar"] = "A.1. Annee d'enseignement en premier cycle";
          d["variable"] = "A. Activites pedagogiques";
          d["bareme"] = "1/ annee";
          d["note"] = "20";
          d["percentComplete"] = Math.round(Math.random() * 100);
          d["jury1"] = (i % 5 == 0);
          d["jury2"] = (i % 5 == 0);
          d["jury3"] = (i % 5 == 0);
      }




    grid = new Slick.Grid("#myGrid", data, columns, options);

    grid.setSelectionModel(new Slick.CellSelectionModel());

    grid.onAddNewRow.subscribe(function (e, args) {
      var item = args.item;
      grid.invalidateRow(data.length);
      data.push(item);
      grid.updateRowCount();
      grid.render();
    });
  })
</script>


</body>

<br>
<br>
<button onclick="">Sauvegader</button>
&nbsp;
<button onclick="">Imprimer</button>
</html>
