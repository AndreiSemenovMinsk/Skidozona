<%@ page contentType="text/html;charset=utf-8" language="java" %>
<script type="text/javascript">

function createObject() {
	var request_type;
	var browser = navigator.appName;
	if(browser == "Microsoft Internet Explorer"){
	request_type = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
	request_type = new XMLHttpRequest();
	}
	return request_type;
	}
	var http = createObject();
	/* -------------------------- */
	/*        SEARCH              */
	/* -------------------------- */
	                                  var id = 0;    // из qr
	                                  var id_shop = 1;

	function myplace(latleng)
	{         alert('http://localhost:8159/Eximer/Controller?command=myplace&latleng='+latleng);
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=myplace&latleng='+latleng);
	http.onreadystatechange =  searchMenu;
	http.send(null);
	}

	function na_odobrenie(id_product, id_actions, text)
	{          alert('http://localhost:8159/Eximer/Controller?command=na_odobrenie&id_actions='+id_actions+'&id_product='+id_product+'&id='+id+'&id_shop='+id_shop+'&text='+text);
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=na_odobrenie&id_actions='+id_actions+'&id_product='+id_product+'&id='+id+'&text='+text);
	http.onreadystatechange =  searchMenu;
	http.send(null);
	}
	
	function searchMenu()
	{
		if(http.readyState == 4)
		{                       alert(http.responseText);
			document.getElementById('na_odobrenie').innerHTML = http.responseText;
		}
	}

	function json_ajax()//imja, parol
	{          //&imja='+imja+'&parol='+parol
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=admin_shop');//&imja='+imja+'&parol='+parol
	http.onreadystatechange =  admin_shop_resp;
	http.send(null);
	}

	function admin_shop_resp()
	{
		if(http.readyState == 4)
		{                      
			resp = http.responseText.trim();
			alert(resp);
			arr_resp = resp.split('@');

			if (arr_resp[0] == 'tru')
			{                                    
			document.getElementById('products').getElementsByTagName('DIV')[0].innerHTML = arr_resp[1];
			document.getElementById('types').getElementsByTagName('DIV')[0].innerHTML = arr_resp[2];
			document.getElementById('actions').getElementsByTagName('DIV')[0].innerHTML = arr_resp[3];
			}

			sound();
		}
	}

	function product_actions(id_product)
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=product_actions&id_product='+id_product);
	http.onreadystatechange = product_actions_resp;
	http.send(null);
	}
	function product_actions_resp()
	{
		if(http.readyState == 4)
		{           
			if (arr_resp[0] == 'tru')
			{
				document.getElementById('product_actions').getElementsByTagName('DIV')[0].innerHTML = arr_resp[1];
				document.getElementById('actions_show').style.display='none';
			}
		}
	}
	function product_types(id_product)
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=product_actions&id_product='+id_product);
	http.onreadystatechange =  product_types_resp;
	http.send(null);
	}
	function product_types_resp()
	{
		if(http.readyState == 4)
		{          
			if (arr_resp[0] == 'tru')
			{
			document.getElementById('product_types').getElementsByTagName('DIV')[0].innerHTML = arr_resp[1];
			document.getElementById('types_show').style.display='none';
			}
		}
	}
	
	
	function start()
	{          
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=admin_shop');
	http.onreadystatechange =  admin_shop_resp;
	http.send(null);
	}

	//start();



	function add_product(name, text, tipy, categories)
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=add_product&categories='+categories+'&name='+name+'&text='+text+'&tipy='+tipy);
	http.onreadystatechange =  add;
	http.send(null);
	}
	
	function product_update_show(id_product)
	{
		var div = document.getElementById('product_update');
		var obj = document.getElementById('product'+id_product);
		div.style.display = 'block';
		div.getElemensByTagName('INPUT')[0].value = obj.getElemensByTagName('A')[0].innerHTML;
		div.getElemensByTagName('INPUT')[1].value = obj.getElemensByTagName('A')[1].innerHTML;
		div.getElemensByTagName('TEXTAREA')[0].value = obj.getElemensByTagName('A')[2].innerHTML;
	}
	
	function product_update(id_product, obj)
	{
		http.open('get', 'http://localhost:8159/Eximer/Controller?command=product_update&id_product='+id_product);
		http.onreadystatechange =  product_update_resp;
		http.send(null);
	}
	
	function product_update_resp()
	{
		
	}
	
	function update_product(rest, obj, id_product)  //id_product, name, categories, tipy, text, rest, big_text
	{                          
	console.log(obj.parentNode.parentNode.getElementsByTagName("FORM")[0]);
	
	if (obj.parentNode.parentNode.getElementsByTagName("FORM")[0].getElementsByTagName("INPUT")[0].value!="") 
		rest=obj.parentNode.parentNode.getElementsByTagName("FORM")[0].getElementsByTagName("INPUT")[0].value.substr(-4);
	
	console.log(obj.parentNode.parentNode.getElementsByClassName("select_actions")[0]);
			
	str_actions=""; 
	for (var i = 0; i < obj.parentNode.parentNode.getElementsByClassName("select_actions")[0].getElementsByTagName("P").length; i++) 
	   str_actions += obj.parentNode.parentNode.getElementsByClassName("select_actions")[0].getElementsByTagName("P")[i].getAttribute("id")+","; 
	
	str_actions = str_actions.slice(0,-1); 
	
	str_tipy=""; 
	
	console.log(obj.parentNode.parentNode.getElementsByClassName("select_tipy")[0]);
	
	for (i = 0; i < obj.parentNode.parentNode.getElementsByClassName("select_tipy")[0].getElementsByTagName("P").length; i++) 
		str_tipy += obj.parentNode.parentNode.getElementsByClassName("select_tipy")[0].getElementsByTagName("P")[i].getAttribute("id")+","; 
	
	str_tipy = str_tipy.slice(0,-1);  
	
			name = obj.parentNode.parentNode.getElementsByTagName("INPUT")[1].value;
			text = obj.parentNode.parentNode.getElementsByTagName("INPUT")[0].value; 
			big_text = obj.parentNode.parentNode.getElementsByTagName("TEXTAREA")[0].value;		
	
			console.log(obj.parentNode.parentNode.getElementsByTagName("FORM")[0].getElementsByTagName('INPUT')[0].value );
			
			if (obj.parentNode.parentNode.getElementsByTagName("FORM")[0].getElementsByTagName('INPUT')[0].value != '')
			obj.parentNode.parentNode.getElementsByTagName("FORM")[0].submit();
			
	
			console.log('http://localhost:8159/Eximer/Controller?command=update_product&categories='+
					str_actions+'&tipy='+str_tipy+'&name='+name+'&id_product='+id_product+'&text='+text+'&rest='+rest+'&big_text='+big_text);
			
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=update_product&actions='+
			str_actions+'&tipy='+tipy+'&categories='+categories+'&name='+name+'&id_product='+id_product+'&text='+text+'&rest='+rest+'&big_text='+big_text);

	http.onreadystatechange =  add;
	http.send(null);
	}
	function delete_product(id_product)
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=delete_product&id_product='+id_product);
	http.onreadystatechange =  add;
	http.send(null);
	}
	function add_actions()
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=add_actions&exp='+exp+'&publ='+publ);
	http.onreadystatechange =  add;
	http.send(null);
	}
	
	function add_product_action(id_product, id_actions)
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=add_product_action&id_product='+id_product+'&id_action='+id_action);
	http.onreadystatechange =  add;
	http.send(null);
	}
	function add_product_type(id_product, id_type)
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=add_product_type&id_product='+id_product+'&id_type='+id_type);
	http.onreadystatechange =  add;
	http.send(null);
	}
	
	
	
	function add()
	{
		if(http.readyState == 4)
		{           console.log(http.responseText);
		document.getElementById('add').innerHTML = http.responseText;
		}
	}

	function add_kategory (el)
	{
		for (i = 0 ; i < el.getElementsByTagName("OPTION").length; i++)
		{
		if (el.getElementsByTagName("OPTION")[i].value == el.value)
		val = el.getElementsByTagName("OPTION")[i].innerHTML;
		}

		p = document.createElement('p');
		a = document.createElement('a');
		p.innerHTML = val;
		a.innerHTML = "X";
		p.setAttribute('id', el.value);
		a.onmousedown = function () {this.parentNode.parentNode.removeChild(this.parentNode);}
		p.appendChild(a);
		el.parentNode.appendChild(p);
	}

	function add_tipy (el)
	{
		for (i = 0 ; i < el.getElementsByTagName("OPTION").length; i++)
		{
		if (el.getElementsByTagName("OPTION")[i].value == el.value)
		val = el.getElementsByTagName("OPTION")[i].innerHTML;
		}

		p = document.createElement('p');
		a = document.createElement('a');
		p.innerHTML = val;
		a.innerHTML = "X";
		p.setAttribute('id', el.value);
		a.onmousedown = function () {this.parentNode.parentNode.removeChild(this.parentNode);}
		p.appendChild(a);
		el.parentNode.appendChild(p);
	}


	
	  menu = document.getElementById('menu');

      for (i = 0; i < menu.getElementsByTagName('td').length; i++)
      {
            menu.getElementsByTagName('td')[i].onmouseover = function ()
            {
					//this.style.backgroundColor = "#4169E1";
					this.style.boxShadow = "4px 2px 6px 0px #ffff33";
            }
            menu.getElementsByTagName('td')[i].onmouseout = function ()
            {
					//this.style.backgroundColor = "";
					this.style.boxShadow = "2px 2px 6px 0px #333333";
            }
      }
//////////////////////////////////////////////////


        function update_shops()
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=update_shops');
http.onreadystatechange =  update_shops_resp;
http.send(null);
}
function update_shops_resp()
{
	if(http.readyState == 4)
	{                              // alert('update_shops_resp' + http.responseText);
	document.getElementById('add').innerHTML = http.responseText;
	}
}



       var hide_divs_to;

 window.onmousedown = function()
      {
          hide_divs_to = setTimeout(hide_divs, 50);
      }


var registraciya = false;

      function hide_divs()
      {
       		if (!registraciya)  document.getElementById('registraciya').style.display='none';
            clearTimeout(hide_divs_to);
       		registraciya = false;
      	//qr_req
      }
/////////////////////////////////////////////////////////

function PlaySound(soundObj) {
  var sound = document.getElementById(soundObj);
  alert(sound);
  sound.play();
}
var sound_to, sound_len = 0;

function sound()   // запускается из-под json_ajax
{
clearTimeout(sound_to);
sound_to = setTimeout(sound, 60000);
http.open('get', 'http://localhost:8159/Eximer/Controller?command=sound');
http.onreadystatechange =  search_sound;
http.send(null);
}

function search_sound()
{
	if(http.readyState == 4)
	{
		resp = http.responseText;
		document.getElementById('sound').innerHTML = resp;

		if (sound_len != document.getElementById('sound').getElementsByTagName('TR').length)
		{
		sound_len = document.getElementById('sound').getElementsByTagName('TR').length;
		PlaySound('sound1');
		sound_korz();
		}
	}
}
   /*
function sound_korz()   // запускается из-под json_ajax
{
clearTimeout(sound_to);
sound_to = setTimeout(sound_korz, 61000);
http.open('get', 'http://test1.ru/include_android.php?key=shop&key_tip_operazii=sound_korz');
http.onreadystatechange =  search_sound_korz;
http.send(null);
}

function search_sound_korz()
{
	if(http.readyState == 4)
	{
		resp = http.responseText;
		document.getElementById('sound_korz').innerHTML = resp;

		if (sound_len != document.getElementById('sound_korz').getElementsByTagName('TR').length)
		{
		sound_len = document.getElementById('sound_korz').getElementsByTagName('TR').length;
		PlaySound('sound1');
		}
	}
}   */

function remove_sound(tel)
{                            alert('remove_sound'+tel);
http.open('get', 'http://localhost:8159/Eximer/Controller?command=remove_sound&tel='+tel);
http.onreadystatechange =  search_sound;
http.send(null);
}

function approve_sound(id_product_buyer)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=approve_sound&id_product_buyer='+id_product_buyer);
http.onreadystatechange =  search_sound;   // мы объединяем эти функции
http.send(null);
}

////////////////////////////////////////////////////
   var myWidth = 0, myHeight = 0;

if( typeof( window.innerWidth ) == 'number' )
{ //Non-IE
  myWidth = window.innerWidth;
  myHeight = window.innerHeight;
}
else
if( document.documentElement && ( document.documentElement.clientWidth ||
document.documentElement.clientHeight ) )
{//IE 6+ in 'standards compliant mode'
 myWidth = document.documentElement.clientWidth;
 myHeight = document.documentElement.clientHeight;
}
////////////////////////////////////////////////////
</script>