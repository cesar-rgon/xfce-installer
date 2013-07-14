(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['index.template'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n			<img src=";
  if (stack1 = helpers.imagePath) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.imagePath; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " />\r\n		";
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n		<li>";
  if (stack1 = helpers.feature) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.feature; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ".</li>\r\n	";
  return buffer;
  }

function program5(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n		<li>";
  if (stack1 = helpers.benefit) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.benefit; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ".</li>\r\n	";
  return buffer;
  }

  buffer += "<div id=\"sliderFrame\">\r\n	<div id=\"ribbon\"></div>\r\n	<div id=\"slider\">\r\n		";
  stack1 = helpers.each.call(depth0, depth0.imageSlider, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n	</div>\r\n</div>\r\n\r\n<br /><br />\r\n<h2>";
  if (stack1 = helpers.introduction) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.introduction; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h2>\r\n<p>";
  if (stack1 = helpers.presentation) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.presentation; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ".</p>\r\n\r\n<h4>";
  if (stack1 = helpers.features) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.features; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h4>\r\n<ul>\r\n	";
  stack1 = helpers.each.call(depth0, depth0.featureList, {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n</ul>\r\n\r\n<h4>";
  if (stack1 = helpers.benefits) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.benefits; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h4>\r\n<ul>\r\n	";
  stack1 = helpers.each.call(depth0, depth0.benefitList, {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n</ul>\r\n";
  return buffer;
  });
})();