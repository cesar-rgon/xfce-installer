(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['install.template'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n		<li>";
  if (stack1 = helpers.prerequisite) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.prerequisite; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += ".</li>\r\n	";
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\r\n		<img src=";
  if (stack1 = helpers.source) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.source; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " alt=";
  if (stack1 = helpers.description) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.description; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/>\r\n	";
  return buffer;
  }

  buffer += "<h2>";
  if (stack1 = helpers.prerequisites) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.prerequisites; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h2>\r\n<ul>\r\n	";
  stack1 = helpers.each.call(depth0, depth0.prerequisiteList, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n</ul><br />\r\n\r\n<h2>";
  if (stack1 = helpers.installation) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.installation; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h2>\r\n<div class=\"installation\">\r\n	<label>";
  if (stack1 = helpers.installationDescription) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.installationDescription; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</label>\r\n	<pre><code>$ wget https://github.com/cesar-rgon/xfce-installer/archive/master.tar.gz\r\n$ tar -xvf master.tar.gz\r\n$ cd xfce-installer-master\r\n$ sudo ./install.sh</code></pre>\r\n	\r\n	";
  stack1 = helpers.each.call(depth0, depth0.imageList, {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\r\n</div>\r\n";
  return buffer;
  });
})();