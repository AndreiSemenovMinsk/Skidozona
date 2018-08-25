<%@ page contentType="text/html;charset=utf-8" language="java" %>
<script type="text/javascript">
/**
 *
 */
 
 
 function resize_table(insert_id, table_id, cel_width)
 {
 		n = Math.floor( (myWidth-300) / cel_width);

 		t1 = document.getElementById(table_id);
 //console.log(table_id+ ' '+t1);
 		t2 = t1.cloneNode();/*document.createElement('TABLE');
 		t2.setAttribute('style', t1.getAttribute('style'));*/ //'width:100%;background-color:#fff9ff' border: 1px solid black;

 		for (i = 0; t1.getElementsByTagName('TD').length > 0; i++)
 		{
 		if (i % n == 0) { tr = document.createElement('TR');  t2.appendChild(tr);  }
 		//t1.getElementsByTagName('TD')[0].style = t1.getElementsByTagName('TD')[0].style
 		//'width:'+(100/n) + '%;height:200px;padding: 1px;border-bottom: 1px solid #ccbbaa;border-right: 1px solid #ccbbaa;';
 		tr.appendChild(t1.getElementsByTagName('TD')[0]);
 		}

 		t1.remove();
 		document.getElementById(insert_id).appendChild(t2);
 		t2.setAttribute('id', table_id);

 }

 function resize_menus ()
 {
 divs_menu = ['sport', 'electronica', 'krasota', 'odezda', 'auto', 'technika', 'hobby', 'eda'];
 for (var i = 0; i < divs_menu.length; i++)
 resize_table(divs_menu[i], 'table_'+divs_menu[i], 400);
 }

 window.onresize = function (){ resize_table('search', 't1', 200); }

 var bok_show = true;
 var bok_n = 10;
 
 var bok_timeout_id = setTimeout( "if(!bok_show) so_bok();", 1000);

 function so_bok()
 {                                  
 var bok = document.getElementById('bok');

 		if (!bok_show && bok_n < 10)
 			bok_n++;
 			else
 		if (bok_show && bok_n > 0)
 			bok_n--;		

 	bok.style.left = -Math.sin(Math.PI *bok_n/20)*15 +'%';
                     
 	if (bok_n == 0)
 		{
 		bok_show = false;
 		clearTimeout(bok_timeout_id);
 		bok_timeout_id = setTimeout( "if(!bok_show) so_bok();", 5000);
 		console.log(bok_timeout_id +' new ');
 		}
 		else if (bok_n == 10)
 			bok_show = true;
 		else
 			setTimeout( so_bok, 20);
 }

 function so_bok_down()
 {
 		clearTimeout(bok_timeout_id);
 		bok_timeout_id = setTimeout( "so_bok();", 5000);
 }
       setTimeout( "so_bok();", 500);

       window.onmousedown = function()
       {
                       setTimeout(hide_divs, 50);
       }


 var prev_id_show = false;
 var so_bok_trapiy = false;
 //var qr_req_bool = false;
 var registraciya = false;
 var qr_shower_bool = false;
 
 var prev_id = 'sport';
 

       function hide_divs()
       {
        		if (!prev_id_show) document.getElementById(prev_id).style.display='none';
        		if (!so_bok_trapiy && bok_n == 0) so_bok();
        		//if (!qr_req_bool)  document.getElementById('qr_req').style.display='none';
        		if (!registraciya)  document.getElementById('registraciya').style.display='none';
        		if (!qr_shower_bool)  document.getElementById('qr_shower').style.display='none';

        		prev_id_show = false;
        		so_bok_trapiy = false;
        	    //qr_req_bool = false;
        	    registraciya = false;
        	    qr_shower_bool = false;
       }


 var myWidth = 0, myHeight = 0, comp = true;


 
 var akcii_geo;
  // меню закладок
 id = 0;

 function update_akcii()
 {		
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=actions_all&comp='+comp);
 http.onreadystatechange =  searchMenu_akcii;
 http.send(null);
 }
 function searchMenu_akcii()
 {
 	if(http.readyState == 4)
 	{
 	resp = http.responseText;
 	    arr_resp  = resp.split('@');
 	    //console.log('searchMenu_akcii'+arr_resp);
 	    
 	   console.log('searchMenu_akcii arr_resp[0]' +arr_resp[0]);
 	   
 		document.getElementById('akcii').innerHTML = arr_resp[0];
 		
 		console.log('searchMenu_akcii arr_resp[1]' +arr_resp[1]);
 		
 		akcii_geo = arr_resp[1];
 		eval(arr_resp[1]);

 		 		len = document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes.length-1;
                  for (;len >= 0; len--)
                  {
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].id = len;
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].onmousedown = function()
                  		{
 		                 prev_act_s.setAttribute('style', 'background-color:white;');
 		                 document.getElementById('a'+this.id).setAttribute('style', 'background-color:red;');
 		                 prev_act_s = document.getElementById('a'+this.id);
 		                 };
                  }
                  resize_table('akcii', 'akc1', 400);
 	}
 }

 function bookmarks()
 {	
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=bookmarks_all&comp='+comp);
 http.onreadystatechange =  search_bookmarks;
 http.send(null);
 }

 var bookmarks_geo;

 function search_bookmarks()
 {
 	if(http.readyState == 4)
 	{
 	resp = http.responseText;
 	    arr_resp  = resp.split('@');
 	    //console.log('search_bookmarks'+arr_resp);
 	    
 	   console.log('search_bookmarks arr_resp[0]' +arr_resp[0]);
 	    
 		document.getElementById('bookmarks').innerHTML = arr_resp[0];
 		//document.getElementById('searchLike').style.display = 'none';
 		console.log('search_bookmarks arr_resp[1]' +arr_resp[1]);
 		
 		bookmarks_geo = arr_resp[1];
 		
 		//console.log('arr_resp[1]'+arr_resp[1]);
 		
 		eval(arr_resp[1]);

 		 		len = document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes.length-1;
                  for (;len >= 0; len--)
                  {
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].id = len;
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].onmousedown = function()
                  		{
 		                 prev_act_s.setAttribute('style', 'background-color:white;');
 		                 document.getElementById('a'+this.id).setAttribute('style', 'background-color:red;');
 		                 prev_act_s = document.getElementById('a'+this.id);
 		                 };
                  }
      update_akcii();
                 /// resize_table('bookmarks', 'zakl1', 400);
 	}
 }
          function basket()
 { 
        	 
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=basket_all&comp='+comp);
 http.onreadystatechange =  search_basket;
 http.send(null);
 }

 var basket_geo;

 function search_basket()
 {
 	if(http.readyState == 4)
 	{
 	 resp = http.responseText;
 	    arr_resp  = resp.split('@');
 	    //console.log('search_basket'+arr_resp);
 	   
 	    console.log('search_basket arr_resp[0]' +arr_resp[0]);
 	    
 		document.getElementById('basket').innerHTML = arr_resp[0];
 		
 		console.log('basket');
 		console.log(document.getElementById('basket'));
 		//document.getElementById('searchLike').style.display = 'none';
 		console.log('search_basket arr_resp[1]' +arr_resp[1]);
 		basket_geo = arr_resp[1];
 		eval(arr_resp[1]);

 		 		len = document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes.length-1;
                  for (;len >= 0; len--)
                  {
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].id = len;
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].onmousedown = function()
                  		{
 		                 prev_act_s.setAttribute('style', 'background-color:white;');
 		                 document.getElementById('a'+this.id).setAttribute('style', 'background-color:red;');
 		                 prev_act_s = document.getElementById('a'+this.id);
 		                 };
                  }

      setTimeout("bookmarks();",100);
                  resize_table('basket', 'korz1', 400);
 	}
}
 

 
 
function get_cookie( cookie_name )
{
  var results = document.cookie.match ('(^|;) ?' + cookie_name + '=([^;]*)(;|$)');

  if (results)
    return unescape(results[2]);
  else
    return null;
}


function set_cookie(name, value, exp_y, exp_m, exp_d, path, domain, secure)
{
  var cookie_string = name + "=" + value;	//escape(value);

  if (exp_y)
  {
    var expires = new Date( exp_y, exp_m, exp_d );
    cookie_string += "; expires=" + expires.toGMTString();
  }

  if (path)
        cookie_string += "; path=" + escape( path );

  if (domain)
        cookie_string += "; domain=" + escape( domain );

  if (secure)
        cookie_string += "; secure";

  document.cookie = cookie_string;
}



classes =     ['menu',         'plitka',      'td_poshuk',    'table_poshuk',      'client_show',      'td_menu',        'table_menu',    'mid_text',     'bok',       'bok_menu',      'bok_tip',        'menu_target'];            //menu, plitka, td_poshuk, table_poshuk, client_show, td_menu, table_menu, mid_text, bok_menu,
classes_phone=['menu_phone','plitka_phone','td_poshuk_phone','table_poshuk_phone','client_show_phone','td_menu_phone','table_menu_phone','mid_text_phone','bok_phone','bok_menu_phone','bok_tip_phone', 'menu_target_phone'];

console.log('myWidth' +myWidth +'myHeight'+ myHeight);

function screen_adj()
{
if (myWidth < myHeight)
{          console.log('phone'+document.getElementsByClassName('table_poshuk').length);
    for (var i = 0; i < classes.length; i++)
       for (;document.getElementsByClassName(classes[i]).length > 0;)
       {
       document.getElementsByClassName(classes[i])[0].className = classes_phone[i];
       }

        divs_hide = ['vhod', 'magazinam', 'menu'];
        divs_show = [ 'bok_menu_menu', 'bok_menu_map', 'bok_menu_filtr']; //'menu_phone',

       console.log('hide');

        for (var i = 0; i < divs_hide.length; i++)
        document.getElementById(divs_hide[i]).style.display = 'none';

console.log('show');

        for (var i = 0; i < divs_show.length; i++)
        document.getElementById(divs_show[i]).style.display = 'block';
}
	 else
{

}
}
setTimeout(screen_adj,1000);




function approve()
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=approve&sessionId='+get_cookie("session_id"));
http.onreadystatechange =  searchMenu_approve;
http.send(null);
}
function approved(id_product)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=approved&id_product='+id_product+'&sessionId='+get_cookie("session_id"));
http.onreadystatechange =  searchMenu;
http.send(null);
}
function refuse(id_product)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=refuse&id_product='+id_product+'&sessionId='+get_cookie("session_id"));
http.onreadystatechange =  searchMenu;
http.send(null);
}

function sarafan_login(id_product_buyer, login_druga)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=sarafan_login&login='+login+'&sessionId='+get_cookie("session_id")+
		'&id_product_buyer='+id_product_buyer);
http.onreadystatechange =  searchMenu;
http.send(null);
}


function local_leng(leng)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=local_leng&leng='+leng);
http.onreadystatechange =  local_leng_resp;
http.send(null);
}

function local_leng_resp()
{
	if(http.readyState == 4)
	{
		document.location.reload(true);
	}
}
var arr_akc_geo, arr_korz_geo, arr_zakl_geo;



function strelka(text, obj)
{
	if (obj.innerHTML.charCodeAt(obj.innerHTML.length-1) == '9660')
	{
		obj.innerHTML = text+'&#9650;';
		obj.parentNode.getElementsByTagName('P')[1].style.display = 'block';
	}
	else
	if (obj.innerHTML.charCodeAt(obj.innerHTML.length-1) == '9650')
	{
	   	obj.innerHTML = text+'&#9660;';
	   	obj.parentNode.getElementsByTagName('P')[1].style.display = 'none';
	}
}











panel = document.getElementById('panel'); 
searchRes = document.getElementById('searchRes'); 
hidden_pages = document.getElementById('hidden_pages'); 

/*    new    function search(cur_page) // эмуляция вызова на сервере
{
console.log(' search searchRes');
console.log(searchRes);
var arr = 133;

var new_page = document.createElement('DIV');

for (var i = cur_page *10, j = 0; i < (cur_page- -1) *10 && i < arr; i++, j++)
{
p = document.createElement('P');
p.innerHTML = i;
new_page.appendChild(p);
}

new_page.className = 'page'+cur_page;

//hidden_pages.appendChild(new_page );
searchRes.removeChild( searchRes.firstChild ); //new
searchRes.appendChild(new_page );  //new

return j;
}   new */
/*  new
function place_page()
{
hidden_pages.appendChild(   searchRes.removeChild( searchRes.firstChild )   ); 

searchRes.appendChild( hidden_pages.removeChild( hidden_pages.getElementsByClassName('page'+cur_page)[0]) );  
}    new */
var cur_page = 1;
var max_page = 1;
var last_page = 1000000000;

function change_page(page)
{
cur_page = page;

//place_page();

if (cur_page==1)
{
panel.getElementsByTagName('TD')[0].className='no_arrow';
panel.getElementsByTagName('TD')[0].onmousedown = '';
} 
else
{
panel.getElementsByTagName('TD')[0].className='arrow';
panel.getElementsByTagName('TD')[0].onmousedown = function(){ prev_page();};
}
if (cur_page == last_page) 
{
td_last = panel.getElementsByTagName('TD').length -1;
panel.getElementsByTagName('TD')[td_last].className='no_arrow';
panel.getElementsByTagName('TD')[td_last].onmousedown = '';
}
else 
{
td_last = panel.getElementsByTagName('TD').length -1;
panel.getElementsByTagName('TD')[td_last].className='arrow';
panel.getElementsByTagName('TD')[td_last].onmousedown = function(){ next_page();};
}
if (cur_page >= 10)
{
 for (var i = 5; i < 10; i++)
 {
    panel.getElementsByTagName('TD')[i- -1].innerHTML = ( cur_page -10 - -i- -1);
    panel.getElementsByTagName('TD')[i- -1].page = ( cur_page -10 - -i- -1);
 }
}
else 
if (max_page >= 10)
{
for (var i = 5; i < 10; i++)
 {
    panel.getElementsByTagName('TD')[i- -1].innerHTML = i- -1;
    panel.getElementsByTagName('TD')[i- -1].page = i- -1;
 }
}
goods_length = search(cur_page); // new
}
function  prev_page()
{
cur_page--; // если станет 1, значит и так отключится ссылка на вызов функции и не сработает
//place_page(); new

if (cur_page==1)
{
panel.getElementsByTagName('TD')[0].className='no_arrow';
panel.getElementsByTagName('TD')[0].onmousedown = '';
} 

console.log('prev_page cur_page'+cur_page+' max_page'+max_page);

if (cur_page == max_page-1)
{
td_last = panel.getElementsByTagName('TD').length -1;
panel.getElementsByTagName('TD')[td_last].className='arrow';
panel.getElementsByTagName('TD')[td_last].onmousedown = function(){ next_page();};
}

if (cur_page >= 10)
{
 for (var i = 5; i < 10; i++)
 {
    panel.getElementsByTagName('TD')[i- -1].innerHTML = ( cur_page -10 - -i- -1);
    panel.getElementsByTagName('TD')[i- -1].page = ( cur_page -10 - -i- -1);
 }
}

goods_length = search(cur_page); // new
} 

function next_page()
{
cur_page++; // пока остатки для вывода есть -сработает 

console.log('next_page cur_page'+cur_page+' max_page'+max_page);

if (cur_page==2)
{
panel.getElementsByTagName('TD')[0].className='arrow';
panel.getElementsByTagName('TD')[0].onmousedown = function(){ prev_page();};
}

//if (cur_page > max_page) new
//{  new
goods_length = search(cur_page);

if (goods_length < 10)
last_page = cur_page;

max_page = cur_page;


if (cur_page <= 10)
{
td_last = panel.getElementsByTagName('TD').length -1;
td = document.createElement('TD');
td.innerHTML = cur_page;
td.page = cur_page;
td.onmousedown = function(){  change_page(this.page); }
panel.getElementsByTagName('TD')[td_last].parentNode.insertBefore(td, panel.getElementsByTagName('TD')[td_last]);
}

//}  new

if (cur_page > 10)
{
 for (var i = 5; i < 10; i++)
 {
    panel.getElementsByTagName('TD')[i- -1].innerHTML = ( cur_page -10 - -i- -1);
    panel.getElementsByTagName('TD')[i- -1].page = ( cur_page -10 - -i- -1);
 }
}

if (cur_page == last_page) 
{
td_last = panel.getElementsByTagName('TD').length -1;
panel.getElementsByTagName('TD')[td_last].className='no_arrow';
panel.getElementsByTagName('TD')[td_last].onmousedown = '';
}
}

td_last = panel.getElementsByTagName('TD').length -1;
panel.getElementsByTagName('TD')[td_last].className='arrow';
panel.getElementsByTagName('TD')[td_last].onmousedown = function(){ next_page();};

//search(1);

alert('searchRes' + searchRes.innerHTML);
//searchRes.appendChild( hidden_pages.removeChild( hidden_pages.getElementsByClassName('page'+cur_page)[0]) ); new

panel.getElementsByTagName('TD')[1].page = 1;

</script>  