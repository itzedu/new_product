module.exports = function Route(app){
  app.post('/', function(req, res){
    console.log('POST INFO', req.body);
    app.io.broadcast("add_product", req.body);
    res.send("success");
  });
}