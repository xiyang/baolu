/*
Program Name: L10N (Localization) By JavaScript
Program URI: http://plugins.jquery.com/project/l10n-by-javascript
Description: This is a very useful script based on JavaScript and XML. You can use it to the localization of the webpage without refresh.

Copyright (c) 2008 Hpyer (coolhpy[at]yahoo.com)
Dual licensed under the MIT (MIT-LICENSE.txt)
and GPL (GPL-LICENSE.txt) licenses.
*/

(function($) {

	/*
	@desc	$.sprintf and $.vsprintf
	@since	1.2
	@access	public
	@usage	$.sprintf('Hello, %s! Test: %, %c, %u, %.3f, %d, %b, %o, %x, %X', 'everyone', 64, -3.141593, 3.141593, 30, 30, 30, 30, 30);
	*/
	if (!$.isFunction($.sprintf) || !$.isFunction($.vsprintf)) {
		var formats = {
			'%': function(val) {return '%';},
			'b': function(val) {return parseInt(val, 10).toString(2);},
			'c': function(val) {return String.fromCharCode(parseInt(val, 10));},
			'd': function(val) {return parseInt(val, 10) ? parseInt(val, 10) : 0;},
			'u': function(val) {return Math.abs(val);},
			'f': function(val, p) {return (p > -1) ? Math.round(parseFloat(val) * Math.pow(10, p)) / Math.pow(10, p): parseFloat(val);},
			'o': function(val) {return parseInt(val, 10).toString(8);},
			's': function(val) {return val;},
			'x': function(val) {return ('' + parseInt(val, 10).toString(16)).toLowerCase();},
			'X': function(val) {return ('' + parseInt(val, 10).toString(16)).toUpperCase();}
		};

		var re = /%(?:(\d+)?(?:\.(\d+))?|\(([^)]+)\))([%bcdufosxX])/g;

		var dispatch = function(data){
			if(data.length == 1 && typeof data[0] == 'object') {
				data = data[0];
				return function(match, w, p, lbl, fmt, off, str) {
					return formats[fmt](data[lbl]);
				};
			} else {
				var idx = 0;
				return function(match, w, p, lbl, fmt, off, str) {
					return formats[fmt](data[idx++], p);
				};
			}
		};

		$.extend({
			sprintf: function(format) {
				var argv = Array.apply(null, arguments).slice(1);
				return format.replace(re, dispatch(argv));
			},
			vsprintf: function(format, data) {
				return format.replace(re, dispatch(data));
			}
		});
	}

	$.extend({

		/*
		@desc	Pick all messages that was selected by jQuery.selector
		@access	public
		@param	map	opts
			string	html	[default: $('html').html()]	Source code
			string	selector	[default: '']	Refer to <a href="http://docs.jquery.com/Selectors" target="_blank">jQuery Selector</a>
			string	encode	[default: 'UTF-8']	Encode of XML file
			boolean	functions	[default: false]	Set TRUE to parse all functions. Include: __, _e, _n and _ne
		@usage	$.l10n_picker(options);
		*/
		l10n_picker: function(opts) {

			function do_push(words) {
				if (words && $.inArray(words, msgs) == -1) {
					msgs.push(words);
				}
			}

			function by_selector() {
				var msgid, none, single, plural, tag;
				$('<div>' + opts.html + '</div>').find(opts.selector).each(function() {
					msgid = this.getAttribute('msgid');
					if (!msgid) {
						if (tag == 'input' && (-1 != $.inArray(this.type.toLowerCase(), ['button', 'submit'])))
							msgid = this.value;
						else if (tag == 'img')
							msgid = this.alt;
						else
							msgid = this.innerHTML;
					}
					none = this.getAttribute('none');
					single = this.getAttribute('single');
					plural = this.getAttribute('plural');
					if (none && single && plural) {
						do_push(none);
						do_push(single);
						do_push(plural);
					} else {
						do_push(msgid);
					}

					if (this.getAttribute('title')) {
						msgid = this.getAttribute('msgid_title');
						if (!msgid) msgid = this.getAttribute('title');
						none = this.getAttribute('none_title');
						single = this.getAttribute('single_title');
						plural = this.getAttribute('plural_title');
						if (none && single && plural) {
							do_push(none);
							do_push(single);
							do_push(plural);
						} else {
							do_push(msgid);
						}
					}
				});
			}

			function by_functions() {
				$.each(['__', '_e', '_n', '_ne'], function(i, name) {
					var params = 1;
					if (i >= 2) params = 3;

					var reg = new RegExp(this + '\\(\\s*(\"|\')+[^\)]*\\1(,\s*.+)*\\s*\\)', 'g');
					var funcs = opts.html.match(reg);

					if (funcs && funcs.length > 0) {
						$.each(funcs, function() {
							var re = new RegExp('^' + name + '\\(|\\)$', 'g');
							var rs = this.replace(re, '');
							var arr = eval('([' + rs + '])');

							$.each(arr, function(j, words) {
								if (j < params) do_push(words);
							});
						});
					}
				});
			}

			function to_xml() {
				var str = '<?xml version="1.0" encoding="' + opts.encode + '"?>\n\n<messages>\n';
				$.each(msgs, function(){
					str += '\t<message>\n'
						+  '\t\t<msgid><![CDATA[' + this + ']]></msgid>\n'
						+  '\t\t<msgstr><![CDATA[]]></msgstr>\n'
						+  '\t</message>\n';
				});
				str += '</messages>';
				return str;
			}

			opts = $.extend({
				html: $('html').html(),
				selector: '',
				encode: 'UTF-8',
				functions: false
			}, opts);
			var msgs = [];

			by_selector();	// pick messages by selector

			if (opts.functions) by_functions();	// pick messages by functions

			return to_xml();
		},

		l10n: {
			/*
			@desc	Options
				string	dir	[default: './languages']	Path to the folder of language files
				string	lang	[default: 'en']	Current language
				string	before	[default: function(){}]	To do anything before translation
				string	after	[default: function(){}]	To do anything after translation
			@type	map
			@access	private
			*/
			opts: {
				dir: './languages',
				lang: 'auto',
				debug: false,
				before: function(){},
				after: function(){}
			},

			/*
			@desc	Store all messages that read from language file
			@type	map
			@access	private
			*/
			messages: [],

			/*
			@desc	Language of the language file
			@remove	1.2.2
			@type	string
			@access	private
			lang_msg: '',
			*/


			/*
			@desc	Translate the words (Translate directly)
			@access	public
			@param	string	words	Words need to be translate
			@param	string	id	The ID attribute of container
			@return string
			@usage	$.l10n.__('Words need to be translated');
			*/
			__: function(words, id) {
				if (typeof(id) == 'string') {
					$('#' + id).attr('msgid', words);
				}
				return this.translate(words);
			},

			/*
			@desc	Translate and output (Refer to $.l10n.__())
			@access	public
			@return void
			*/
			_e: function(words, id) {
				document.write(this.__(words, id));
			},

			/*
			@desc	Translate plural forms
			@since	1.2
			@access	public
			@param	string	none	number equal to 0
			@param	string	single	number equal to 1
			@param	string	plural	number greater than 1
			@param	string	number	number
			@param	string	id		The ID attribute of container
			@return string
			@usage	$.l10n._n('No message', 'One message', '%s messages', 3);
			*/
			_n: function(none, single, plural, number, id) {
				if (typeof(id) == 'string') {
					$('#' + id).attr('msgid', number).attr('none', none)
						.attr('single', single).attr('plural', plural);
				}

				var words;
				if (!number || number <= 0)
					words = none;
				else if (number == 1)
					words = single;
				else
					words = plural;

				return $.sprintf(this.translate(words), number);
			},

			/*
			@desc	Translate and output plural forms (Refer to $.l10n._n())
			@since	1.2
			@access	public
			@return void
			*/
			_ne: function(none, single, plural, number, id) {
				document.write(this._n(none, single, plural, number, id));
			},

			/*
			@desc	to show the error information
			@since	1.2.2
			@access	private
			@param	string	info	error information
			@return	boolean
			*/
			error: function(info) {
				if (this.opts.debug && typeof console != 'undefined') {
					console.log(info);
				}
			},

			/*
			@desc	Check whether to need to translate or not
			@remove	1.2.2
			@access	private
			@return	boolean
			check: function() {
			}
			*/

			/*
			@desc	Todo translate
			@since	1.2
			@access	private
			@param	string	words	Words need to be translate
			@return string
			*/
			translate: function(words) {
				if (this.opts.lang && this.messages[this.opts.lang] && this.messages[this.opts.lang][words]) {
					words = this.messages[this.opts.lang][words];
				}
				return words;
			},

			/*
			@desc	Load the language file
			@access	private
			@param	string	file	Filename of the language file
			@return void
			*/
			load: function() {
				var uri = this.opts.dir + '/' + this.opts.lang + '.xml';
				this.error('Loading language file...');
				$.ajax({
					url: uri,
					cache: false,
					async: false,
					success: $.l10n.callback,
					error: function() {$.l10n.error('Can not loading language: ' + $.l10n.opts.lang);}
				});
			},

			/*
			@desc	Read all messages from the language file
			@param	object	root	Root of XML document
			@access	private
			@return	void
			*/
			callback: function(root) {
				$.l10n.error('Loading completed');
				$.l10n.lang_msg = $.l10n.opts.lang;
				$.l10n.messages[$.l10n.opts.lang] = [];
				var msgs = $('message', root);
				if (msgs.size() == 0) {
					$.l10n.error('Invalid language file: ' + $.l10n.opts.lang);
					return false;
				}
				$.l10n.error('Parsing...');
				$.each(msgs, function(){
					var msgid, msgstr;
					msgid = $('msgid', this)[0].firstChild.nodeValue;
					msgstr = $('msgstr', this)[0].firstChild.nodeValue;
					if ($.browser.msie) {
						// work still with bugs under IE
						var res = msgid.match(/<(.+)>([^<]*)<\/\1>/g);
						if (res) {
							$.each(res, function() {
								var arr = /<(.+)>([^<]*)<\/\1>/g.exec(this);
								var tag = arr[1].toUpperCase();
								msgid = msgid.replace(new RegExp(arr[0], 'g'), '<'+ tag +'>'+ arr[2] +'</'+ tag +'>');
							});
						}
					}
					if (msgid && msgstr) {
						$.l10n.messages[$.l10n.opts.lang][msgid] = msgstr;
					}
				});
				$.l10n.error('Parsing completed');
			},

			/*
			@desc	Initialization options
			@access	public
			@param	map	opts	Refer to $.l10n.opts
			@return	void
			*/
			init: function(opts) {
				if (typeof opts == 'object') {
					$.extend(this.opts, opts);
					this.error('Options have been changed');
				}
				this.opts.lang = this.opts.lang.toLowerCase();
				if (this.opts.lang == 'auto') {
					this.opts.lang = (window.navigator.systemLanguage ? window.navigator.systemLanguage : window.navigator.language).toLowerCase();
				}
				if (this.opts.lang != '' && this.opts.lang != 'en' && !this.messages[this.opts.lang]) {
					this.load();
				}
			}

		}
	});

	$.fn.extend({
		/*
		@desc	Translate all messages that was selected by jQuery.selector (Translate indirectly)
		@access	public
		@param	map	opts	The same to $.l10n.opts
		@return	void
		@usage	$(selector).l10n();
		*/
		l10n: function(opts) {
			$.l10n.opts.before();
			$.l10n.init(opts);
			var msgid, words, none, single, plural, tag;
			this.each(function() {
				msgid = this.getAttribute('msgid');
				tag = this.tagName.toLowerCase();
				if (!msgid) {
					if (tag == 'input' && (-1 != $.inArray(this.type.toLowerCase(), ['button', 'submit'])))
						msgid = this.value;
					else if (tag == 'img')
						msgid = this.alt;
					else
						msgid = this.innerHTML;
				}
				none = this.getAttribute('none');
				single = this.getAttribute('single');
				plural = this.getAttribute('plural');
				if (none && single && plural) {
					words = $.l10n._n(none, single, plural, msgid);
				} else {
					words = $.l10n.__(msgid);
				}
				this.setAttribute('msgid', msgid);
				if (tag == 'input')
					this.value = words;
				else if (tag == 'img')
					this.alt = words;
				else
					this.innerHTML = words;

				if (this.getAttribute('title')) {
					msgid = this.getAttribute('msgid_title');
					if (!msgid) msgid = this.getAttribute('title');
					none = this.getAttribute('none_title');
					single = this.getAttribute('single_title');
					plural = this.getAttribute('plural_title');
					if (none && single && plural) {
						words = $.l10n._n(none, single, plural, msgid);
					} else {
						words = $.l10n.__(msgid);
					}
					this.setAttribute('msgid_title', msgid);
					this.title = words;
				}
			});
			$.l10n.opts.after();
		}
	});

})(jQuery);