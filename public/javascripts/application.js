$(document).ready(function() {
  $(".active_project_select").change(function () {
    window.location = 'projects/' +  $(".active_project_select option:selected").val() + '/set_active'
  });
});
