// $.getJSON('./Servidor/products.php', function(response){
//   var productos = response;
// });

$.getJSON('./Servidor/products.php', function(response){
  var productos = JSON.stringify(response.products);
  console.log(productos);
});
