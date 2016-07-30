$(document).ready(function() {
  google.charts.load('current', {packages:["orgchart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('string', 'Big');
    data.addColumn('string', 'Extra');

    // For each orgchart box, provide the name, manager, and tooltip to show.
    data.addRows($("#tree").data('org'));

    // Create the chart.
    var chart = new google.visualization.OrgChart(document.getElementById('tree'));
    // Draw the chart, setting the allowHtml option to true for the tooltips.
    chart.draw(data, {allowCollapse:true});
  }
});
