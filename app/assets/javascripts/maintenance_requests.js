$(function(){
  $(".tablesorter-blue").tablesorter({ sortList: [1,0] });

  $("thead .headerSortDown").on("click", function(){
  	$(this).toggleClass("headerSortDown");
  	$(this).toggleClass("headerSortUp");
  });

  $("thead .headerSortUp").on("click", function(){
  		$(this).toggleClass("headerSortUp");
  		$(this).toggleClass("headerSortDown");
  });
});

