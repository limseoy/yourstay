$(function () { 
      $("#datetimepicker1").datetimepicker({format: 'L'});
      $("#datetimepicker2").datetimepicker({format: 'L'});
      $("#datetimepicker1").on("change.datetimepicker", function (e) { $('#datetimepicker2').datetimepicker('minDate', e.date); });
      $("#datetimepicker2").on("change.datetimepicker", function (e) { $('#datetimepicker1').datetimepicker('maxDate', e.date); }); 
   });
