(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['aside.template'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div id=\"content-wrapper\">\n	<div class=\"inner clearfix\">\n		<aside id=\"sidebar\">\n			<a href=\"https://github.com/cesar-rgon/xfce-installer/archive/master.tar.gz\" class=\"button\">\n				<small>"
    + escapeExpression(((stack1 = ((stack1 = depth0.download),stack1 == null || stack1 === false ? stack1 : stack1.title)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</small>"
    + escapeExpression(((stack1 = ((stack1 = depth0.download),stack1 == null || stack1 === false ? stack1 : stack1.file)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n			</a>\n\n			<p class=\"repo-owner\">\n				<a href=\"https://github.com/cesar-rgon/xfce-installer\" target=\"_blank\">Xfce Installer</a>\n				";
  if (stack2 = helpers.maintained) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.maintained; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				<a href=\"https://github.com/cesar-rgon\" target=\"_blank\">C&eacute;sar Rodr&iacute;guez Gonz&aacute;lez</a>.\n			</p>\n\n			<p>\n				";
  if (stack2 = helpers.generated) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.generated; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				<a href=\"http://pages.github.com/\" target=\"_blank\">GitHub Pages</a>\n				";
  if (stack2 = helpers.theme) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.theme; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				<a href=\"http://twitter.com/jasonlong\" target=\"_blank\">Jason Long</a>.\n				";
  if (stack2 = helpers.design) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.design; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				<a href=\"https://github.com/irgstudio\" target=\"_blank\">Isidro Rodr&iacute;guez Gonz&aacute;lez</a>\n				";
  if (stack2 = helpers.and) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.and; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\n				<a href=\"https://github.com/cesar-rgon\" target=\"_blank\">C&eacute;sar Rodr&iacute;guez Gonz&aacute;lez</a>.\n			</p>\n\n			<a href=\"";
  if (stack2 = helpers.urlFacebook) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.urlFacebook; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\" target=\"_blank\">\n				<img src=\"../../images/template/facebook-logo.png\" class=\"icon\" alt=\"facebook\"/>\n			</a>\n		</aside>\n	</div>\n</div>\n";
  return buffer;
  });
})();