(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['applications.template'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n			<li class=\"arrow ";
  if (stack1 = helpers.categoryCssClass) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.categoryCssClass; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\"><label>";
  if (stack1 = helpers.category) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.category; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</label>\r\n				<ul>\r\n					";
  stack1 = helpers.each.call(depth0, depth0.applicationList, {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n				</ul>\r\n			</li>\r\n			";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n						<li><a href=\"#";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a></li>\r\n					";
  return buffer;
  }

function program4(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n		<h3>";
  if (stack1 = helpers.category) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.category; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h3>\r\n		";
  stack1 = helpers.each.call(depth0, depth0.applicationList, {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n	";
  return buffer;
  }
function program5(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n			<div id=\"";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" class=\"ficha-aplicacion\">\r\n				<img src=";
  if (stack1 = helpers.image) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.image; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " alt=";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " />\r\n				<div><label>";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</label></div>\r\n				<div>\r\n					<span>";
  if (stack1 = helpers.description) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.description; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + ".</span>\r\n				</div>\r\n				<div>\r\n					<span>URL:</span>\r\n					<a href=";
  if (stack1 = helpers.homepage) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.homepage; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " target=\"_blank\">";
  if (stack1 = helpers.homepage) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.homepage; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\r\n				</div>\r\n			</div>\r\n			<div class=\"clear\"></div>\r\n		";
  return buffer;
  }

  buffer += "<aside id=\"applicationSidebar\">\r\n	<div id=\"menuwrapper\" class=\"absolutePosition\">\r\n		<ul>\r\n			";
  stack1 = helpers.each.call(depth0, depth0.categoryList, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n			<li id=\"lastIndex\"><a href=\"?ga=off\">";
  if (stack1 = helpers.moveUp) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.moveUp; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a></li>\r\n		</ul>\r\n	</div>\r\n</aside>\r\n\r\n<section id=\"main-content\">\r\n	<h2>";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h2>\r\n	<p>";
  if (stack1 = helpers.mainDescription) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.mainDescription; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + ".</p>\r\n\r\n	";
  stack1 = helpers.each.call(depth0, depth0.categoryList, {hash:{},inverse:self.noop,fn:self.program(4, program4, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n</section>\r\n";
  return buffer;
  });
})();