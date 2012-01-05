var okcolor="#F3F3F3";
var errorcolor="#ff4e00"
var emailRe = "^([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$";
var emailReNL = "^(([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}((\r)?\n)?){1,5}$";
var phoneRe = "[\-0-9]{10,}";
var dateRe = "(19\\d\\d|2\\d\\d\\d)[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])";
var dateFRe = "(0[1-9]|1[012])/(0[1-9]|[12][0-9]|3[01])/(19\\d\\d|2\\d\\d\\d)";
var futureDateRe = "(2\\d\d\d)[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])";
var dateTimeRe = "(0[1-9]|1[012])/(0[1-9]|[12][0-9]|3[01])/(19\\d\\d|2\\d\\d\\d)\\s(0[1-9]|1[012]):([0-5][0-9])\\s(AM|PM)";

var hideTO;

function escapeRe(strIn){
	var strOut = strIn;
	strOut = strOut.replace(/\+/g,"\+");
	strOut = strOut.replace(/\$/g,"\$");
	strOut = strOut.replace(/\^/g,"\^");
	strOut = strOut.replace(/\*/g,"\*");
	strOut = strOut.replace(/\(/g,"\(");
	strOut = strOut.replace(/\)/g,"\)");
	strOut = strOut.replace(/\-/g,"\-");
	return strOut;
}
function max(el,length){
	if(el.value.length>length){
		el.value = el.value.substr(0,length);
	}
}
function addVal(id,pat,mes){
	if(pat=="checked"){
		$("input[name='"+id+"']:first").before('<input type="hidden" id="'+id+'" value="" />');
		$("input[name='"+id+"']").change(function(){
			if($("input[name='"+id+"']:checked").length>0){
				$("#"+id).val($("input[name='"+id+"']:checked").val());
			}
			else{
				$("#"+id).val("");
			}
		});
		$("#"+id).val($("input[name='"+id+"']:checked").val());
		pat=".+";
	}
	$("#"+id).attr("pattern",pat);
	$("#"+id).attr("message",mes);
}
function validateEl(el){
	var errorMessage="";
	var str="";
	var isgood=true;
	var errors = [];
	var pattern=el.getAttribute('pattern');
	var not=el.getAttribute('not');
	
	if(pattern!=null){
		var value=el.value;
		re=new RegExp(pattern,"g");
		var good=re.test(value);
		if(not!=null){
			if(value==not){
				good=false;	
			}
		}
		if(!good){
			$(el).addClass("error");
			isgood=false;
			var errMes=el.getAttribute('message');
			if(errMes!=null){
				errors.push(errMes);
				if($(el).attr("type")=="file"){
					$(el).val("");
				}
			}
		}
		else{
			$(el).removeClass("error");
		}
	}
	if(!isgood){
		//message("Please correct the following before proceeding:\r\n - "+errors.join("\r\n - "));
		return false;
	}
	else{
		//message("");
		return false;
	}
}
function validate(frm){
	var errorMessage="";
	var str="";
	var elements=frm.elements;
	var isgood=true;
	var errors = [];
	for(var i=0;i<elements.length;i++){
		var pattern=elements.item(i).getAttribute('pattern');
		var not=elements.item(i).getAttribute('not');
		var el = $(elements.item(i));
		if(pattern!=null){
			var value=elements.item(i).value;
			re=new RegExp(pattern,"g");
			var good=re.test(value);
			elements.item(i).rel="";
			if(not!=null){
				if(value==not){
					good=false;	
				}
			}
			if(!good){
				$(el).addClass("error");
				isgood=false;
				var errMes=elements.item(i).getAttribute('message');
				if(errMes!=null){
					errors.push(errMes);
				}
				if($(el).attr("type")=="file"){
					$(el).val("");
				}
			}
			else{
				$(el).removeClass("error");
			}
		}
	}
	if(!isgood){
		message("Please address the following before proceeding:\r\n - "+errors.join("\r\n - "));
		return false;
	}
	else{
		message("");
		return true;
	}
};
function message(saywhat){
	if(saywhat!=""){
		alert(saywhat);
	}
}
function emailOnly(el){
	if(/[^\+\-a-zA-Z0-9\._@\n]/.test(el.value)){
		el.value=el.value.replace(/[^\+\-a-zA-Z0-9\._@\r\n]/g,"")
	}
}
function only5(el){
	if(el.value.indexOf("\r\n")>-1){
		el.value = el.value.replace(/(\r\n){2,}/g,"\r\n");
		var ems = el.value.split("\r\n");
		if(ems.length>5){
			for(var i=ems.length;i>5;i--){
				ems.pop();
			}
		}
		$.each(ems,function(i,val){
			ems[i]=ems[i].replace(/\s/g,"");				
		});
		el.value=ems.join("\n");
		if(el.value.lastIndexOf("\n")==el.value.length-1){
			el.value = el.value.substr(0,el.value.length-1);

		}
		if(el.value.lastIndexOf("\n ")==el.value.length-2){
			el.value = el.value.substr(0,el.value.length-2);
		}
	}
	else if(el.value.indexOf("\n")>-1){
		el.value = el.value.replace(/\n{2,}/g,"\n");
		var ems = el.value.split("\n");
		if(ems.length>5){
			for(var i=ems.length;i>5;i--){
				ems.pop();
			}
		}
		$.each(ems,function(i,val){
			ems[i]=ems[i].replace(/\s/g,"");				
		});
		el.value=ems.join("\n");
		if(el.value.lastIndexOf("\n")==el.value.length-1){
			el.value = el.value.substr(0,el.value.length-1);
		}
		if(el.value.lastIndexOf("\n ")==el.value.length-2){
			el.value = el.value.substr(0,el.value.length-2);
		}
	}
}
function sar(el,strSearch,strReplace){
	var reSearch = new RegExp(strSearch,"g");
	if(reSearch.test(el.value)){
		el.value=el.value.replace(reSearch,strReplace)
	}
}
function $$(el){
	return document.getElementById(el);
}
function removeTags(el){
	if(/[<|>|=]/.test(el.value)){
		el.value=el.value.replace(/[<|>|=]/g,"")
	}
}
function limitLength(el,length){
	if(el.value.length>length){
		el.value=truncate(el.value,length);
	}
}
function truncate(val,length){
	if(val.length>length){
		return val.substring(0,length);
	}
	else{
		return val;
	}
}
String.prototype.trim = function(char) {
	return this.replace(new RegExp("^"+char+"+|"+char+"+$","g"),"");
}
function doFocus(){
	$(this).addClass("focus");
	if($(this).hasClass("error")){
		$(this).removeClass("error");
		$(this).addClass("haderror");
	}
}
function doBlur(){
	$(this).removeClass("focus");
	if($(this).hasClass("haderror")){
		$(this).removeClass("haderror");
		$(this).addClass("error");
	}
	validateEl(this);
}
function checkType(id,ext){
	var re = new RegExp("\."+ext+"$","gi");
	var good = re.test(id.value);
	if(!good && id.value!=""){
		id.value="";
		return false;
	}
	else{
		return true;	
	}
}
$.fn.clearForm = function() {
  return this.each(function() {
 var type = this.type, tag = this.tagName.toLowerCase();
 if (tag == 'form')
   return $(':input',this).clearForm();
 if (type == 'text' || type == 'password' || tag == 'textarea')
   this.value = '';
 else if (type == 'checkbox' || type == 'radio')
   this.checked = false;
 else if (tag == 'select')
   this.selectedIndex = -1;
  });
};

var photoPop = {
	id:'',
	wa_id:'',
	title:'',
	photo_date:'',
	image_number:'',
	extension:'',
	width:0,
	height:0
}
$(function(){
	$(".imagePop").click(
		function(){
			photoPop = {
				id:$(this).attr("id").replace(/pop/g,""),
				wa_id:$(this).attr("waid"),
				title:$(this).attr("title"),
				photo_date:$(this).attr("date"),
				image_number:$(this).attr("imagenumber"),
				extension:'',
				width:parseInt($(this).attr("w")),
				height:parseInt($(this).attr("h"))
			};
			if($("#blanket").length==0){
				$("body").append('<div id="blanket"></div>');
			}
			if($("#podContainer").length!=0){
				$("#podContainer").remove();
			}
			$("body").append(''
				+'	<div id="podContainer" style="width:'+(photoPop.width+40)+'px;">'
				+'		<div class="margin">'
				+'			<div class="close">close</div>'
				+'			<div class="image" style="height:'+(photoPop.height)+'px"><img src="/media/images/photo_archive/'+photoPop.id+(photoPop.id.indexOf(".")==-1?".jpg":"")+'" alt="'+photoPop.title+'" /></div>'
				+'			<h2>'+photoPop.title+'</h2>'
				+'			<div class="info">'
				+(photoPop.photo_date=='' || photoPop.photo_date==undefined?'':'<div class="date">Date: '+photoPop.photo_date+'</div>')
				+(photoPop.wa_id=='' || photoPop.wa_id==undefined || photoPop.wa_id.toString()=="0"?'':'<div class="imageNumber">Image Number: '+photoPop.image_number+'</div>')
				+'			</div>'
				+'			<div class="moreInfo">'
				+(photoPop.wa_id=='' || photoPop.wa_id==undefined || photoPop.wa_id.toString()=="0"?"":'<a class="closePop" href="/photo_archive/search_the_photo_collection.php?search=id&id='+photoPop.wa_id+'&q='+photoPop.image_number+'#search">More information about this photo</a>*<br />')
				+'				<a class="closePop" href="/photo_archive/search_the_photo_collection.php?#search">Search the  Photo Archive</a>*'
				+'			</div>'
				+'			<div class="clear"></div>'
				+'			<div class="explain">* You will be prompted to agree  to our Terms & Conditions, which describes how images may be used for educational, public and private use.</div>'
				+'		</div>'
				+'	</div>'
			);
			$("#podContainer a.closePop").click(
				function(){
					$("#blanket").hide();
					$("#podContainer").hide();
				}
			);
			$("#podContainer").css("margin-left",-((photoPop.width/2)+20)+"px");
			centerPOD();
			showPOD();
			$("#podContainer .close, #blanket").click(
				function(){
					hidePOD();
				}
			);
			return false;
		}
	);
	$(window).resize(centerPOD);
});
function centerPOD(){
	$("#podContainer").css("top",Math.max(0,( $(document).scrollTop()+ ($(window).height()-$("#podContainer").height())/2) ));
}
function showPOD(){
	$("#blanket").fadeIn();
	$("#podContainer").fadeIn();
}
function hidePOD(){
	$("#blanket").fadeOut();
	$("#podContainer").fadeOut();
}
function scrollTween(x){
	$('html,body').animate({scrollTop: x}, 500);
}
function hideForms(){
	clearTimeout(hideTO);
	$(".popup .thanks").hide();
	$(".popup .form").show();
	$(".popup").hide();
}