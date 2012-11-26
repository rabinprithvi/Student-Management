$(document).ready(function(){

  $('#academics .pagination a').live('click',function () {
  	alert("hi")
      $.getScript(this.href);
      return false;
    }
  );
});